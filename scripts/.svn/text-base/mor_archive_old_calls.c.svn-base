// Author:        Ricardas Stoma
// Company:       Kolmisoft
// Year:          2012
// About:         Script moves old calls from 'calls' to 'calls_old' table

#define _XOPEN_SOURCE 700

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <signal.h>
#include <ctype.h>
#include <stdarg.h>
#include <mysql/mysql.h>
#include <mysql/errmsg.h>
#include <time.h>
#include <sys/stat.h>
#include <math.h>
#include <sys/time.h>

#define DB_FROM          "calls"
#define DB_TO            "calls_old"
#define LOG_FILE         "/var/log/mor/mor_archive_old_calls.log"
#define SKIPPED_CALLS    "/tmp/mor_skipped_calls.sql"
#define IDS_BUFFER_SIZE  BATCH_SIZE*20 + 256
#define DATA_INFILE_PATH "/tmp/" DB_TO ".txt"
#define SQL_LIMIT        1000
#define BATCH_SIZE       250

#define DATE_FORMAT      "%Y-%m-%d %H:%M:%S"
#define CONFPATH         "/var/lib/asterisk/agi-bin/mor.conf"
#define PROCESSLOCK      1
#define PROGRESS_TIMER   1

// VARIABLES

// SQL variables
char sql_file_buffer[2048]     = { 0 };
char sql_delete_statement[64]  = "DELETE FROM " DB_FROM " WHERE id IN (";
char sql_count_statement[64]   = "SELECT COUNT(id) FROM " DB_FROM " WHERE id IN (";
char buffer[4096]              = { 0 };
long long int total_calls      = 0;
long long int transfered_calls = 0;

// call ids stored in array for future deletion
char ids_buffer[IDS_BUFFER_SIZE] = { 0 };
char check_ids_buffer[IDS_BUFFER_SIZE] = { 0 };
long long int  ids[SQL_LIMIT]    = { 0 };

// list of column names
char colnames[4096] = { 0 };
int  colnames_count = 0;

// calculating time
struct timeval t0, t1;
time_t t, tt;
suseconds_t ut0, ut1;

// task variables
int task_id        = 0;
int time_limit_h   = 0;
int time_limit_m   = 0;
int task_failed    = 0;
int forced_stop    = 0;
int finished       = 1;
int time_started_h = 0;
int time_started_m = 0;

long long int time_limit_seconds = 0;

// mysql
MYSQL *mysql;
MYSQL_RES *result;
MYSQL_ROW row;

// database config
typedef struct conf_struct {
    char host[64];
    char database[64];
    char username[64];
    char password[64];
} conf_t;

// default values
conf_t conf = { "", "", "", "" };

// log variables
struct timeval _t0, _t1;
time_t _t, _tt;
suseconds_t _ut0, _ut1;

char log_buffer[1024] = { 0 };

int DEBUG_PROGRESS = 0;

// FUNCTION DECLARATIONS

int m2_task_get();
int m2_task_lock();
int m2_task_unlock(int status);
int m2_task_finish();
int m2_task_partial_finish();

void *set_timer();
void  my_strcat(char *str1, char *str2);
int   delete_calls_from_database(int calls);
int   get_calls_from_database(FILE *infile, int *calls, int *done, int older_than);
void  error_handle();

void m2_get_current_time();
void m2_init_counter();
int  m2_log(char *msg);
int  m2_get_conf(conf_t *conf);
int  m2_mysql_connect(const char *host, const char *user, const char *pass, const char *db, unsigned int port, const char *socket, unsigned long cflag);
int my_mysql_query(MYSQL *mysql, char *query, int fetch);

// MAIN FUNCTION

int main(int argc, char *argv[]) {

    long long int calls_old_total1 = 0;
    long long int calls_old_total2 = 0;
    // long long int calls_total1 = 0;
    // long long int calls_total2 = 0;
    int calls = 0;
    int older_than = 0;
    int done = 0;
    char datetime[20] = { 0 };
    pthread_attr_t tattr;
    pthread_attr_init(&tattr);
    pthread_attr_setdetachstate(&tattr, PTHREAD_CREATE_DETACHED);
    pthread_t timer;

    // mark task as failed on segmentation fault
    struct sigaction sa;
    memset(&sa, 0, sizeof(struct sigaction));
    sigemptyset(&sa.sa_mask);
    sa.sa_sigaction = error_handle;
    sa.sa_flags     = SA_SIGINFO;
    sigaction(SIGSEGV, &sa, NULL);
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);
    atexit(error_handle);

    // allow only one instance of script
    if (PROCESSLOCK) {
        char buffer[128] = { 0 };

        FILE *pipe = popen("ps -ef | grep -v grep | grep mor_archive_old_calls | wc -l", "r");
        fgets(buffer, 64, pipe);

        if(atoi(buffer) > 1) {
            printf("[m2_archive_old_calls] Script locked!\n");
            exit(1);
        }

        fclose(pipe);
    }

    // check if debug is ON
    if (argc > 1) {
        if(strcmp(argv[1], "--debug") == 0) {
            DEBUG_PROGRESS = 1;
        }
    }

    // mark/take start time
    m2_init_counter();

    // starting the script
    m2_log("Starting M2 Cron Archive Old Calls script");

    // print start time
    m2_get_current_time(datetime);
    sprintf(buffer, "Start time: %s", datetime);
    m2_log(buffer);

    struct tm tmm;
    strptime(datetime, DATE_FORMAT, &tmm);

    time_started_h = tmm.tm_hour;
    time_started_m = tmm.tm_min;

    m2_log("Getting database configuration");

    // get DB configuration
    if (m2_get_conf(&conf)) {
        return 1;
    }

    m2_log("Connecting to database");

    // connect to DB
    if (m2_mysql_connect(conf.host, conf.username, conf.password, conf.database, 0, NULL, 0) == 1) {
        return 1;
    }

    if (m2_task_get()) {
        return 1;
    }

    task_failed = 1;

    m2_log("Reading conflines");

    // get Move_to_old_calls_older_than value
    if (my_mysql_query(&mysql[0], "SELECT value FROM conflines WHERE name='Move_to_old_calls_older_than'", 1)) {
        return 1;
    }

    // check if we get result
    if (row[0]) {
        older_than = atoi(row[0]);
    } else {
        m2_log("Move_to_old_calls_older_than is not set");
        return 1;
    }

    // nothing to do
    if (older_than == 0) {
        m2_log("Move_to_old_calls_older_than is 0");
        return 0;
    }

    mysql_free_result(result);

    if(time_limit_h <= 24 || time_limit_h >= -1) {

    } else {
        m2_log("Time limit must be between -1 and 24");
        return 1;
    }

    if (time_limit_m <= 59 || time_limit_m >= -1) {

    } else {
        m2_log("Time limit must be between -1 and 59");
        return 1;
    }

    // if expected to finish time is higher than time limit, adjust expected_to_finish
    // convert time limit to second
    // (archive_till - archive_at) * 360
    if (time_started_h <= time_limit_h) {
        time_limit_seconds = (time_limit_h * 3600 + time_limit_m * 60) - (time_started_h * 3600 + time_started_m * 60);
    } else {
        time_limit_seconds = 24*3600 - (time_started_h * 3600 + time_started_m * 60) + (time_limit_h * 3600 + time_limit_m * 60);
    }

    // get collumn names from calls table that match calls_old table columns
    if (my_mysql_query(&mysql[0], "SELECT column_name FROM information_schema.columns WHERE table_name='" DB_FROM "' and column_name in (SELECT column_name FROM information_schema.columns WHERE table_name='" DB_TO "')", 0)) {
        return 1;
    }

    // construct string from column names like 'id,calldate,dst....'
    while (( row = mysql_fetch_row(result)) != NULL ) {
        strcat(colnames, row[0]);
        strcat(colnames, ",");
        colnames_count++;
    }
    colnames[strlen(colnames) - 1] = 0;

    if (DEBUG_PROGRESS) {
        sprintf(buffer, "LOAD DATA LOCAL INFILE '" DATA_INFILE_PATH "' INTO TABLE " DB_TO " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n' (%s);", colnames);
        printf("%s\n", buffer);
        exit(0);
    }

    mysql_free_result(result);

    sprintf(buffer, "SELECT count(id) FROM " DB_FROM " WHERE calldate < DATE_SUB(NOW(), INTERVAL %d DAY)", older_than);

    if (my_mysql_query(&mysql[0], buffer, 1)) {
        return 1;
    }

    total_calls = atoi(row[0]);

    if (total_calls == 0) {
        task_failed = 0;
        m2_log("No calls to be transferred");
        m2_task_finish();
        return 0;
    }

    mysql_free_result(result);

    sprintf(buffer, "Moving calls that are older than %d days", older_than);
    m2_log(buffer);

    sprintf(buffer, "%lld calls will be archived", total_calls);
    m2_log(buffer);

    m2_log("Starting transfer...");

    // count calls from calls_old table
    if (my_mysql_query(&mysql[0], "SELECT count(id) FROM calls_old", 1)) {
        return 1;
    }

    if (row[0]) calls_old_total1 = atoll(row[0]);

    mysql_free_result(result);

    // mark as 'IN PROGRESS'
    m2_task_lock();

    gettimeofday(&t0, NULL);
    t=t0.tv_sec;
    ut0=t0.tv_usec;

    pthread_create(&timer, &tattr, set_timer, NULL);

    while (done == 0 && forced_stop == 0) {

        // delete old file
        unlink(DATA_INFILE_PATH);

        // MySQL DATA INFILE
        FILE *infile = fopen(DATA_INFILE_PATH, "w");

        if (infile == NULL) {
            fprintf(stderr, "Cannot open: " DATA_INFILE_PATH "\n");
            m2_log("Cannot create: " DATA_INFILE_PATH);
            return 1;
        }

        // default state is 'done'
        done = 1;
        // reset calls
        calls = 0;

        // get calls from database and prepare data to be imported to another database
        if (get_calls_from_database(infile, &calls, &done, older_than)) return 1;

        fclose(infile);

        if (done) {
            // remove data file
            unlink(DATA_INFILE_PATH);
            // job is done
            break;
        }

        // insert calls using data infile
        sprintf(buffer, "LOAD DATA LOCAL INFILE '" DATA_INFILE_PATH "' INTO TABLE " DB_TO " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (%s);", colnames);
        if (mysql_query(&mysql[0], buffer)) {
            char buffer[1024] = "";
            sprintf(buffer, "%s", mysql_error(&mysql[0]));
            m2_log(buffer);
            return 1;
        }

        // get the number of skipped records

        char skipped_buffer[512] = "";
        int skipped_calls = 0;
        char tmp_buffer[128] = "";

        strcpy(skipped_buffer, mysql_info(&mysql[0]));

        if (strstr(skipped_buffer, "Skipped")) {
            int i = 0;
            char *poz = strstr(skipped_buffer, "Skipped") + 9;
            int min = 128;
            if (strlen(poz) < 128) min = strlen(poz);
            for (i = 0; i < min; i++) {
                if (isdigit(poz[i])) {
                    tmp_buffer[i] = poz[i];
                } else {
                    break;
                }
            }
        }

        skipped_calls = atoi(tmp_buffer);

        // count calls from calls_old table and calculate difference
        if (my_mysql_query(&mysql[0], "SELECT count(id) FROM " DB_TO, 1)) {
            return 1;
        }
        if (row[0]) calls_old_total2 = atoll(row[0]);
        mysql_free_result(result);

        int calls_diff = SQL_LIMIT;

        if (calls < SQL_LIMIT) {
            calls_diff = calls;
        }

        if (calls_old_total2 - calls_old_total1 != calls_diff) {
            char buffer[1024] = "";
            sprintf(buffer, "Some records could not be inserted into database. Check " SKIPPED_CALLS " query. Calls before insert: %lld, calls after insert: %lld, tried to insert calls: %d, skipped calls: %d", calls_old_total1, calls_old_total2, calls, skipped_calls);
            m2_log(buffer);
            sprintf(buffer, "echo '\n-- %s\n' >> " SKIPPED_CALLS " && cat " DATA_INFILE_PATH " >> " SKIPPED_CALLS, datetime);
            FILE *tmp = popen(buffer, "r");
            if (tmp == NULL) {
                m2_log("Failed to: cat " DATA_INFILE_PATH " >> " SKIPPED_CALLS);
                return 1;
            }
            if ((calls_old_total2 + skipped_calls) - calls_old_total1 != calls_diff) {
                m2_log("Aborting script...");
                return 1;
            }
            pclose(tmp);
        }

        calls_old_total1 = calls_old_total2;

        // remove temporary data file
        unlink(DATA_INFILE_PATH);

        // this checking doest work!!!
        // sometimes number of calls changes between these two 'select count'
        // and script thinks that some call have not been deleted
        // we should check if calls are deleted by id

        // // count calls from calls table before delete
        // char sql_buffer[2048] = "";
        // sprintf(sql_buffer, "SELECT count(id) FROM " DB_FROM " WHERE calldate < DATE_SUB(NOW(), INTERVAL %d DAY)", older_than);
        // if (my_mysql_query(&mysql[0], sql_buffer, 1)) {
        //     return 1;
        // }
        // if (row[0]) calls_total1 = atoll(row[0]);
        // mysql_free_result(result);

        // delete calls from database
        if (delete_calls_from_database(calls)) return 1;

        // // count calls from calls table after delete
        // sprintf(sql_buffer, "SELECT count(id) FROM " DB_FROM " WHERE calldate < DATE_SUB(NOW(), INTERVAL %d DAY)", older_than);
        // if (my_mysql_query(&mysql[0], sql_buffer, 1)) {
        //     return 1;
        // }
        // if (row[0]) calls_total2 = atoll(row[0]);
        // mysql_free_result(result);

        // if ((calls_total1 - calls_total2) != calls_diff) {
        //     char buffer[1024] = "";
        //     sprintf(buffer, "Some records could not be deleted from calls table. Calls before delete: %lld, calls after delete: %lld, tried to delete calls: %d", calls_total1, calls_total2, calls);
        //     m2_log(buffer);
        //     exit(1);
        // }

        transfered_calls = transfered_calls + calls;
    }

    // terminate timer
    pthread_cancel(timer);
    pthread_attr_destroy(&tattr);

    if (finished && forced_stop == 0) m2_task_finish();
    if (finished && forced_stop == 1) m2_task_partial_finish();

    mysql_close(&mysql[0]);

    task_failed = 0;

    return 0;
}

int get_calls_from_database(FILE *infile, int *calls, int *done, int older_than) {
    int i = 0;

    // get calls that are older than X days
    sprintf(buffer, "SELECT %s FROM " DB_FROM " WHERE calldate < DATE_SUB(NOW(), INTERVAL %d DAY) LIMIT %d", colnames, older_than, SQL_LIMIT);

    if (my_mysql_query(&mysql[0], buffer, 0)) {
        return 1;
    }

    // format sql data file
    while (( row = mysql_fetch_row(result)) != NULL ) {
        *done = 0;
        // get each field
        for(i = 0; i < colnames_count; i++) {
            if(row[i]) {
                my_strcat(sql_file_buffer, row[i]);
            } else {
                my_strcat(sql_file_buffer, "NULL");
            }
        }
        sql_file_buffer[strlen(sql_file_buffer) - 1] = 0;
        // write to data infile
        fprintf(infile, "%s\n", sql_file_buffer);
        // reset buffer
        *sql_file_buffer = 0;
        // save ids
        ids[*calls] = atoll(row[0]);
        *calls = *calls + 1;
    }

    mysql_free_result(result);

    return 0;
}

int delete_calls_from_database(int calls) {

    int i = 0;
    int batch_counter = 0;
    // initialize ids_buffer
    strcpy(ids_buffer, sql_delete_statement);
    strcpy(check_ids_buffer, sql_count_statement);
    long long int check_calls = 0;

    // delete from calls table
    for (i = 0; i < calls; i++) {
        sprintf(buffer, "%lld,", ids[i]);
        strcat(ids_buffer, buffer);
        strcat(check_ids_buffer, buffer);
        batch_counter++;

        // batch is full, send query
        if (batch_counter == BATCH_SIZE) {

            ids_buffer[strlen(ids_buffer) - 1] = 0;
            check_ids_buffer[strlen(check_ids_buffer) - 1] = 0;
            strcat(ids_buffer, ");");
            strcat(check_ids_buffer, ");");

            if (mysql_query(&mysql[0], ids_buffer)) {
                char buffer[1024] = "";
                sprintf(buffer, "%s", mysql_error(&mysql[0]));
                m2_log(buffer);
                return 1;
            }

            // check if calls with those ids are delete
            if (my_mysql_query(&mysql[0], check_ids_buffer, 1)) {
                return 1;
            }
            check_calls = -1;
            if (row[0]) check_calls = atoll(row[0]);
            mysql_free_result(result);

            if (check_calls == -1) {
                m2_log("Can't determine if calls where deleted correctly");
                m2_log(check_ids_buffer);
                return 1;
            } else if (check_calls) {
                char tmp_buffer[2048] = "";
                sprintf(tmp_buffer, "Tried to delete %d calls, but there are still %lld calls left. Check why some calls where not deleted.", BATCH_SIZE, check_calls);
                m2_log(tmp_buffer);
                m2_log(check_ids_buffer);
                return 1;
            }

            *ids_buffer = 0;
            *check_ids_buffer = 0;
            strcpy(ids_buffer, sql_delete_statement);
            strcpy(check_ids_buffer, sql_count_statement);
            batch_counter = 0;
        }
    }

    // if batch is not full, send query anyway
    if (strlen(ids_buffer) > strlen(sql_delete_statement)) {
        ids_buffer[strlen(ids_buffer) - 1] = 0;
        strcat(ids_buffer, ")");
        if(mysql_query(&mysql[0], ids_buffer)) {
            fprintf(stderr, "%s", mysql_error(&mysql[0]));
            return 1;
        }
    }

    return 0;
}

int m2_task_get() {

    sprintf(buffer,"SELECT id, data1 FROM `background_tasks` WHERE task_id = 2 AND status = 1 ORDER BY created_at LIMIT 1;");

    if (mysql_query(&mysql[2], buffer)) {
        sprintf(buffer, "MySQL error: %s", mysql_error(&mysql[2]));
        m2_log(buffer);
        return 1;
    } else { // query succeeded, process any data returned by it

        result = mysql_store_result(&mysql[2]);
        if (result) {  // there are rows

            while ((row = mysql_fetch_row(result))) {
                if (row[0]) task_id = atoi(row[0]);
                if (row[1]) {
                    char buffer[64] = "";
                    strncpy(buffer, row[1], 2);
                    time_limit_h = atoi(buffer);
                    strncpy(buffer, row[1] + 3, 2);
                    time_limit_m = atoi(buffer);
                }
            }

            mysql_free_result(result);
        }
    }

    if (task_id) {
        sprintf(buffer, "Task retrieved - id: %i, time limit hour: %i, time limit minute: %i", task_id, time_limit_h, time_limit_m);
        m2_log(buffer);
        return 0;
    } else {
        m2_log("Task not found");
        return 1;
    }

    return 0;
}

int m2_task_finish() {
    sprintf(buffer, "UPDATE background_tasks SET status = 3, finished_at = NOW(), percent_completed = 100 WHERE id = %i;", task_id);
    mysql_query(&mysql[2], buffer);
    m2_log("Task finished");
    m2_task_unlock(3);
    return 0;
}

int m2_task_partial_finish() {
    sprintf(buffer, "UPDATE background_tasks SET status = 3, finished_at = NOW() WHERE id = %i;", task_id);
    mysql_query(&mysql[2], buffer);
    m2_log("Task finished");
    m2_task_unlock(3);
    return 0;
}


int m2_task_lock() {
    sprintf(buffer, "UPDATE background_tasks SET status = 2, started_at = NOW(), percent_completed = 0 WHERE id = %i;", task_id);
    mysql_query(&mysql[2], buffer);
    m2_log("Task locked");
    return 0;
}

/*
    Function to unlock task (change status)

    Status:

    1 - WAITING
    2 - IN PROGRESS
    3 - DONE
    4 - FAILED
*/

int m2_task_unlock(int status) {
    sprintf(buffer,"UPDATE background_tasks SET status = %i WHERE id = %i", status, task_id);
    mysql_query(&mysql[2], buffer);
    m2_log("Task unlocked");
    return 0;
}

void calculate_expected_time(char *datetime, int seconds) {

    time_t t;
    struct tm tmp;
    char tmp_str[100];

    t = time(NULL) + seconds;
    localtime_r(&t, &tmp);

    strftime(tmp_str, sizeof(tmp_str), DATE_FORMAT, &tmp);
    strcpy(datetime, tmp_str);

}

void check_time_limit() {
    char datetime[20]           = { 0 };
    char time_limit_buffer1[10] = { 0 };
    char time_limit_buffer2[10] = { 0 };
    int i = 0;
    int stop_h = 1;
    int stop_m = 1;

    if (time_limit_h > -1) {

        if (time_limit_h < 10) {
            sprintf(time_limit_buffer1, "0%d", time_limit_h);
        } else {
            sprintf(time_limit_buffer1, "%d", time_limit_h);
        }

        if (time_limit_m < 10) {
            sprintf(time_limit_buffer2, "0%d", time_limit_m);
        } else {
            sprintf(time_limit_buffer2, "%d", time_limit_m);
        }

        m2_get_current_time(datetime);

        for (i = 0; i < 2; i++) {
            if (datetime[i + 11] != time_limit_buffer1[i]) stop_h = 0;
        }

        for (i = 0; i < 2; i++) {
            if (datetime[i + 14] != time_limit_buffer2[i]) stop_m = 0;
        }

        if (stop_h && stop_m) forced_stop = 1;

    }
}

int is_date(char *date) {

    int i = 0;

    if (strlen(date) != 19) return 0;

    for (i = 0; i < 19; i++) {
        if (i == 4 || i == 7 || i == 10 || i == 13 || i == 16) continue;
        if (date[i] > '9' || date[i] < '0') {
            return 0;
        }
    }

    return 1;
}

void *set_timer() {

    long long int counter   = 0;
    long long int time_left = 0;
    double calls_per_sec    = 0;
    double progress_percent = 0;
    char datetime[20]       = { 0 };
    char progress_buffer[1024] = "";

    if (DEBUG_PROGRESS && total_calls > 0) {
        printf("--------------------------------------------------------------------------------\n");
        printf("     Progress    | Completed | Calls per sec | Time left | Expected to finish at\n");
        printf("--------------------------------------------------------------------------------\n");
    }

    while (1) {
        sleep(PROGRESS_TIMER);
        counter++;

        if (transfered_calls > 0) {
            progress_percent = (double)((double)transfered_calls/total_calls)*100;
            calls_per_sec = (double)transfered_calls/counter;
            time_left = ceil((double)(total_calls - transfered_calls) / calls_per_sec);
        } else {
            progress_percent = 0;
            calls_per_sec = 0;
            time_left = 9999;
        }

        if (time_limit_seconds < time_left) {
            calculate_expected_time(datetime, time_limit_seconds);
        } else {
            calculate_expected_time(datetime, time_left);
        }

        if (!is_date(datetime)) {
            strcpy(datetime, "0000-00-00 00:00:00");
        }

        sprintf(progress_buffer,"UPDATE background_tasks SET percent_completed = %.3f, expected_to_finish_at = '%s' WHERE id = %i;", progress_percent, datetime, task_id);
        if (mysql_query(&mysql[1], progress_buffer)) {
            m2_log(progress_buffer);
        }

        if (DEBUG_PROGRESS) printf(" %07lld/%07lld | %6.2f %%  |  %9.2f    | %4lld sec  |  %s\n", transfered_calls, total_calls, progress_percent, calls_per_sec, time_left, datetime);

        // check if we should stop this script due to time limit
        check_time_limit();

        time_limit_seconds -= 1;
        if (time_limit_seconds < 0) time_limit_seconds = 0;
    }

    pthread_exit(NULL);
}

void my_strcat(char *str1, char *str2) {
    strcat(str1, "\"");
    strcat(str1, str2);
    strcat(str1, "\"");
    strcat(str1, ",");
}

void error_handle() {
    static int marked = 0;

    if (marked == 0) {
        if(task_failed) {
            if (!DEBUG_PROGRESS) m2_task_unlock(4);
            m2_log("Task failed");
        }
        marked = 1;
    }

    forced_stop = 1;
    finished = 0;
}

void m2_get_current_time(char *datetime) {
    time_t t;
    struct tm tmp;
    char tmp_str[100];

    t = time(NULL);
    localtime_r(&t, &tmp);

    strftime(tmp_str, sizeof(tmp_str), DATE_FORMAT, &tmp);
    strcpy(datetime, tmp_str);
}

// Function which marks when code starts to calculate time from

void m2_init_counter() {
    gettimeofday(&_t0, NULL);
    _t = _t0.tv_sec;
    _ut0 = _t0.tv_usec;
}

// Log to file function

int m2_log(char *msg) {

    FILE *file;

    gettimeofday(&_t1, NULL);
    _tt = _t1.tv_sec;
    _ut1 = _t1.tv_usec;

    file = fopen(LOG_FILE, "a+");

    if (file == NULL) {
        printf("Cannot open log file\n");
        exit(1);
    }

    if (_ut0 > _ut1) {
        _ut1 += 1000000;
        _tt -= 1;
    }

    float duration = (int)(_tt-_t) + (float)(_ut1-_ut0)/1000000;

    fprintf(file, "%.6f - %s\n", duration, msg);
    fclose(file);

    gettimeofday(&_t0, NULL);
    _t = _t0.tv_sec;
    _ut0 = _t0.tv_usec;

    return 0;
}

// Reads data from config file

int m2_get_conf(conf_t *conf) {
    char var[32];
    char val[32];

    // parse database configuration
    FILE *file = fopen(CONFPATH, "r");

    if (file == NULL) {
        m2_log("Cannot open MOR configuration file " CONFPATH);
        return 1;
    }

    while (fscanf(file, "%s = %s", var, val) != EOF) {
        if(strcmp(var, "host") == 0) strcpy(conf->host, val);
        if(strcmp(var, "db") == 0) strcpy(conf->database, val);
        if(strcmp(var, "user") == 0) strcpy(conf->username, val);
        if(strcmp(var, "secret") == 0) strcpy(conf->password, val);
    }

    fclose(file);

    return 0;
}

// connects to MySQL DB

int m2_mysql_connect(const char *host, const char *user, const char *pass, const char *db, unsigned int port, const char *socket, unsigned long cflag) {
    int i;

    mysql = malloc(sizeof(MYSQL)*3);

    for (i = 0; i < 3; i++) {

        if (!mysql_init(&mysql[i])) {
            sprintf(log_buffer, "%s", mysql_error(&mysql[i]));
            m2_log(log_buffer);
            return 1;
        }

        if (!mysql_real_connect(&mysql[i], host, user, pass, db, port, NULL, 0)) {
            sprintf(log_buffer, "%s", mysql_error(&mysql[i]));
            m2_log(log_buffer);
            return 1;
        }
    }

    return 0;
}

int my_mysql_query(MYSQL *mysql, char *query, int fetch) {

    if (mysql_query(mysql, query)) {
        sprintf(log_buffer, "MySQL error: %s\n", mysql_error(mysql));
        m2_log(log_buffer);
        m2_log(query);
        return 1;
    }

    result = mysql_store_result(mysql);

    if (result == NULL) {
        sprintf(log_buffer, "mysql_store_result error: %s\n", mysql_error(mysql));
        m2_log(log_buffer);
        return 1;
    }

    if (fetch) {
        if((row = mysql_fetch_row(result)) == NULL) {
            sprintf(log_buffer, "MySQL returned an empty result set\n");
            m2_log(log_buffer);
            return 1;
        }
    }

    return 0;
}

