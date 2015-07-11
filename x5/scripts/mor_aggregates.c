// Author:        Ricardas Stoma
// Company:       Kolmisoft
// Year:          2013
// About:         Script periodically aggregates cdr data


#define SCRIPT_VERSION     "1.3"
#define SCRIPT_NAME        "mor_aggregates"
#define AGGREGATE_PERIOD   10                       // aggregate every X seconds

#include "crc64.c"
#include "mor_functions.c"
#include "mor_aggregates.h"
#include "mor_aggregates_functions.c"

// indicates if hour/day/month changed
int current_hour = -1, last_hour = -1;
int current_day = -1, last_day = -1;
int current_month = -1, last_month = -1;

// indicates if script started for the first time this session
// on the first iteration, we need to aggregate missing data for this hour
int first_run = 1;

int get_calls_data(int mode);
uint64_t get_last_call_id();
int get_last_time_periods();
void get_current_call_time_period(int index);
void add_cached_time_period();

// MAIN FUNCTION

int main(int argc, char *argv[]) {

    // error file
    FILE *tmp_errorfile = fopen(LOG_PATH, "a+");

    if (tmp_errorfile == NULL) {
        fprintf(stderr, "Cannot open log file " LOG_PATH);
        return 1;
    }

    if (mor_check_process_lock()) exit(1);

    fclose(tmp_errorfile);

    // Our process ID and Session ID
    pid_t pid, sid;

    // Fork off the parent process
    pid = fork();
    if (pid < 0) {
        exit(1);
    }

    // If we got a good PID, then we can exit the parent process.
    if (pid > 0) {
        exit(0);
    }

    // Change the file mode mask
    umask(0);

    // Create a new SID for the child process
    sid = setsid();
    if (sid < 0) {
        // Log the failure
        exit(EXIT_FAILURE);
    }

    // Change the current working directory
    if ((chdir("/")) < 0) {
        // Log the failure
        exit(EXIT_FAILURE);
    }

    // Close out the standard file descriptors
    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);

    // create threads as 'detached' because we don't need to wait for them
    pthread_attr_t tattr;
    pthread_attr_init(&tattr);
    pthread_attr_setdetachstate(&tattr, PTHREAD_CREATE_JOINABLE);

    // we don't care about thread id, so all threads will be initialized to this thread id
    // every aggregate variation will be done in a thread
    pthread_t thread[VARIATIONS];

    // starting sript
    mor_init("Starting MOR Aggregates script\n");

    // get last call_id
    // we will get calls starting from this id
    last_call_id = get_last_call_id();
    mor_log("Last call_id: %" PRIu64 "\n", last_call_id);

    // get period id for this hour
    if ((time_period_hour_id =  mor_get_time_period_id(1, -1, NULL)) == 0) {
        mor_log("Hour time period id = 0\n");
        exit(1);
    }

    // get period id for this day
    if ((time_period_day_id =  mor_get_time_period_id(2, -1, NULL)) == 0) {
        mor_log("Day time period id = 0\n");
        exit(1);
    }

    // get period id for this month
    if ((time_period_month_id =  mor_get_time_period_id(3, -1, NULL)) == 0) {
        mor_log("Month time period id = 0\n");
        exit(1);
    }

    if (get_last_time_periods()) exit(1);

    // last_hour = current_hour, because script just started
    // same for day/month
    // these variables will show us when hour/day/month changes
    last_hour = mor_aggregate_get_current_date(NULL, 1);
    last_day = mor_aggregate_get_current_date(NULL, 2);
    last_month = mor_aggregate_get_current_date(NULL, 3);

    // initialize mysql buffers
    memset(insert_update_values_query, 0, INSERT_UPDATE_BUFFER_SIZE);
    sprintf(insert_update_query, INSERT_UPDATE_BEGINNING_SQL);

    while (1) {

        // get current hour (0-23), day (1-31), month (1-12)
        current_month = mor_aggregate_get_current_date(NULL, 3);
        current_day = mor_aggregate_get_current_date(NULL, 2);
        current_hour = mor_aggregate_get_current_date(NULL, 1);

        // check if current hour changed
        // some actions need to be performed when hour changes
        if (current_hour != last_hour) {

            // mark 'hour' record as finished (set mm:ss 59:59)
            mor_mark_finished_time_period();

            // get period id for this hour
            if ((time_period_hour_id =  mor_get_time_period_id(1, -1, NULL)) == 0) {
                mor_log("Hour time period id = 0\n");
                exit(1);
            }

            if (current_day != last_day) {
                // get period id for this day
                if ((time_period_day_id =  mor_get_time_period_id(2, -1, NULL)) == 0) {
                    mor_log("Day time period id = 0\n");
                    exit(1);
                }
            }

            if (current_month != last_month) {
                // get period id for this month
                if ((time_period_month_id =  mor_get_time_period_id(3, -1, NULL)) == 0) {
                    mor_log("Month time period id = 0\n");
                    exit(1);
                }
            }

            // add new time_period date to cached time_period dates
            add_cached_time_period();

            // get calls in special mode
            // when hour changes, we gel calls that are in both previous hour and this hour
            // but we only need to get calls that are in the previous hour
            // to achieve this, we use this special mode (0)
            if (get_calls_data(0)) exit(1);

        } else {

            // hour did not change, so will get only calls in this hour
            // we use normal mode (1) in this case
            if (get_calls_data(1)) exit(1);

        }

        // aggergate calls only if we have some
        if (calls_data_count) {

            // counter and also type of aggregate
            int i = 1;

            // i = 1   aggregate by originator
            // i = 2   aggregate by terminator
            // i = 3   aggregate by direction
            // i = 4   aggregate by originator and terminator
            // i = 5   aggregate by originator and direction
            // i = 6   aggregate by terminator and direction
            // i = 7   aggregate by direction and destination
            // i = 8   aggregate by originator and terminator and direction
            // i = 9   aggregate by originator and direction and destination
            // i = 10  aggregate by terminator and direction and destination
            // i = 11  aggregate by originator and terminator and direction and destination

            for (i = 1; i <= VARIATIONS; i++) {

                // calculation will be done by multiple cores
                thread_args_t *targs_originator = malloc(sizeof(thread_args_t));
                targs_originator->calls = malloc(calls_data_count * sizeof(calls_data_t));
                targs_originator->count = calls_data_count;
                targs_originator->type = i;
                memcpy(targs_originator->calls, calls_data, calls_data_count * sizeof(calls_data_t));
                pthread_create(&thread[i - 1], &tattr, mor_aggregate, (void *)targs_originator);

            }

            for (i = 0; i < VARIATIONS; i++) {
                // join threads (this will wait for all thread to finish work and then execution will proceed)
                pthread_join(thread[i], NULL);
            }

            // lock thread because other aggregate threads might be running
            pthread_mutex_lock(&mutex);
            mor_update_aggregated_data();
            batch_count = 0;
            pthread_mutex_unlock(&mutex);

        }

        last_hour = current_hour;
        last_day = current_day;
        last_month = current_month;

        // aggregate every X seconds
        sleep(AGGREGATE_PERIOD);

    }

    // close mysql connection
    mysql_close(&mysql);
    mysql_library_end();
    // free memory
    if (calls_data) free(calls_data);

    return 0;

}


/*

    ############  FUNCTIONS #######################################################

*/


/*
    Get calls from database
*/


int get_calls_data(int mode) {

    MYSQL_RES *result;
    MYSQL_ROW row;
    char query[2048] = "";
    char special_mode_sql[256] = "";
    char get_calls_from[256] = "";

    // re-initialize calls
    calls_data = realloc(calls_data, sizeof(calls_data_t));
    memset(calls_data, 0, sizeof(calls_data_t));
    calls_data_count = 0;
    strcpy(last_calldate, "");
    char last_uid[64] = "";

    // this is special mode so we need to get calls for last seconds of previous hour
    if (mode == 0) {
        sprintf(special_mode_sql, " AND calldate < DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 HOUR), '%%Y-%%m-%%d %%H:59:59')");
    }

    if (first_run) {
        sprintf(get_calls_from, "calls.calldate > '%s'", aggregate_stopped_at);
        first_run = 0;
    } else {
        sprintf(get_calls_from, "calls.id > %" PRIu64, last_call_id);
    }

    sprintf(query, "SELECT * FROM (SELECT calls.id AS 'callid', calls.user_id, user_billsec, user_price + did_inc_price, terminator_id, provider_billsec, provider_price + did_prov_price, billsec, real_billsec, hangupcause, calls.prefix, "
                   "destinations.destinationgroup_id, destinationgroups.name, destinations.id, destinations.name as 'dname', activecalls.id as 'acid', calls.uniqueid, calls.calldate, "
                   "IF(taxes.compound_tax is not null, IF(taxes.compound_tax = 1, (((((user_price+did_inc_price)/100*(tax1_value+100))/100*IF(tax2_enabled = 1,tax2_value+100,100))/100*IF(tax3_enabled = 1,tax3_value+100,100))/100*IF(tax4_enabled = 1,tax4_value+100,100)),((user_price+did_inc_price) )/100*(tax1_value+IF(tax2_enabled = 1,tax2_value,0)+IF(tax3_enabled = 1,tax3_value,0)+IF(tax4_enabled = 1,tax4_value,0)+100)),(user_price+did_inc_price)) AS 'price_with_tax', "
                   "src_device.user_id AS 'src_user_id', calls.dst_user_id "
                   "FROM calls "
                   "LEFT JOIN providers ON providers.id = calls.provider_id "
                   "LEFT JOIN destinations ON destinations.prefix = calls.prefix "
                   "LEFT JOIN destinationgroups ON destinations.destinationgroup_id = destinationgroups.id "
                   "LEFT JOIN activecalls ON calls.uniqueid = activecalls.uniqueid "
                   "LEFT JOIN users ON users.id = calls.user_id "
                   "LEFT JOIN taxes ON taxes.id = users.tax_id "
                   "LEFT JOIN devices AS src_device ON src_device.id = calls.src_device_id "
                   "WHERE %s%s) AS A ORDER BY A.uniqueid, A.callid DESC", get_calls_from, special_mode_sql);

    // lock thread because aggregate threads might be running
    pthread_mutex_lock(&mutex);

    if (mor_mysql_query(query)) {
        mor_mysql_reconnect();
        pthread_mutex_unlock(&mutex);
        return 0;
    }

    // get results
    result = mysql_store_result(&mysql);
    pthread_mutex_unlock(&mutex);

    // fill this node
    while ((row = mysql_fetch_row(result)) != NULL) {

        int src_user_aggregate = 0;
        int dst_user_aggregate = 0;
        int src_user_aggregated = 0;
        int dst_user_aggregated = 0;

        src_user_aggregate_label:
        dst_user_aggregate_label:

        if (src_user_aggregate) {
            src_user_aggregated = 1;
        }

        if (dst_user_aggregate) {
            dst_user_aggregated = 1;
        }

        calls_data = realloc(calls_data, (calls_data_count + 1) * sizeof(calls_data_t));
        memset(&calls_data[calls_data_count], 0, sizeof(calls_data_t));

        if (row[1]) calls_data[calls_data_count].user_id = atoi(row[1]); else calls_data[calls_data_count].user_id = 0;
        if (row[2]) calls_data[calls_data_count].user_billsec = atol(row[2]); else calls_data[calls_data_count].user_billsec = 0;
        if (row[3]) calls_data[calls_data_count].user_price = atof(row[3]); else calls_data[calls_data_count].user_price = 0;
        if (row[4]) calls_data[calls_data_count].terminator_id = atoi(row[4]); else calls_data[calls_data_count].terminator_id = 0;
        if (row[5]) calls_data[calls_data_count].terminator_billsec = atol(row[5]); else calls_data[calls_data_count].terminator_billsec = 0;
        if (row[6]) calls_data[calls_data_count].terminator_price = atof(row[6]); else calls_data[calls_data_count].terminator_price = 0;
        if (row[7]) calls_data[calls_data_count].billsec = atol(row[7]); else calls_data[calls_data_count].billsec = 0;
        if (row[8]) calls_data[calls_data_count].real_billsec = atof(row[8]); else calls_data[calls_data_count].real_billsec = 0;
        if (row[9] && (atoi(row[9]) == 16)) calls_data[calls_data_count].answered = 1; else calls_data[calls_data_count].answered = 0;
        if (row[10]) strcpy(calls_data[calls_data_count].prefix, row[10]); else strcpy(calls_data[calls_data_count].prefix, "");
        if (row[11]) calls_data[calls_data_count].direction_id = atoi(row[11]); else calls_data[calls_data_count].direction_id = 0;
        if (row[12]) strcpy(calls_data[calls_data_count].direction_name, row[12]); else strcpy(calls_data[calls_data_count].direction_name, "");
        if (row[13]) calls_data[calls_data_count].destination_id = atoi(row[13]); else calls_data[calls_data_count].destination_id = 0;
        if (row[14]) strcpy(calls_data[calls_data_count].destination, row[14]); else strcpy(calls_data[calls_data_count].destination, "");
        if (row[15]) calls_data[calls_data_count].activecalls = 1; else calls_data[calls_data_count].activecalls = 0;
        if (row[16]) strcpy(calls_data[calls_data_count].uniqueid, row[16]); else strcpy(calls_data[calls_data_count].uniqueid, "");
        if (row[17]) {
            strcpy(calls_data[calls_data_count].calldate, row[17]);
            if (( mor_compare_date(row[17])) == -1) {
                get_current_call_time_period(calls_data_count);
            }
        }
        if (row[18]) calls_data[calls_data_count].user_price_with_tax = atof(row[18]); else calls_data[calls_data_count].user_price_with_tax = 0;
        if (row[19]) calls_data[calls_data_count].src_user_id = atoi(row[19]); else calls_data[calls_data_count].src_user_id = 0;
        if (row[20]) calls_data[calls_data_count].dst_user_id = atoi(row[20]); else calls_data[calls_data_count].dst_user_id = 0;

        if (src_user_aggregate) calls_data[calls_data_count].user_id = calls_data[calls_data_count].src_user_id;
        if (dst_user_aggregate) calls_data[calls_data_count].user_id = calls_data[calls_data_count].dst_user_id;

        // sometimes names have ' symbol and this brakes mysql querys like this: 'this is some string's example', so we need to escape like this: 'this is some string\'s example'
        mor_escape_string(calls_data[calls_data_count].destination, '\'');
        mor_escape_string(calls_data[calls_data_count].direction_name, '\'');

        // user call is the last attempt
        // for example if user calls though 4 providers (3 failed and 1 succeeded), then only the last call is considered as user's call
        // all these 4 calls will have the same uniqueid, but different cdrs
        // because calls are ordered by uniqueid and id, last call with the same uniqueid will be user's call
        // so we are checking current and last uniqueid, if they change, it means last uniqueid was 'the last of all the same uniqueids' and this is our 'users call'
        calls_data[calls_data_count].user_call = 0;
        if (strcmp(last_uid, calls_data[calls_data_count].uniqueid) != 0) {
            if (calls_data_count) {
                if (!calls_data[calls_data_count - 1].activecalls) {
                    calls_data[calls_data_count - 1].user_call = 1;
                }
            }
        }

        // save last uniqueid
        strcpy(last_uid, calls_data[calls_data_count].uniqueid);

        calls_data_count++;
        if (row[0]) if (atoll(row[0]) > last_call_id) last_call_id = atoll(row[0]);

        if (src_user_aggregated != 1 && calls_data[calls_data_count - 1].src_user_id > 0 && calls_data[calls_data_count - 1].src_user_id != calls_data[calls_data_count - 1].user_id) {
            src_user_aggregate = 1;
            goto src_user_aggregate_label;
        } else {
            src_user_aggregate = 0;
        }

        if (dst_user_aggregated != 1 && calls_data[calls_data_count - 1].dst_user_id > 0 && calls_data[calls_data_count - 1].dst_user_id != calls_data[calls_data_count - 1].user_id) {
            dst_user_aggregate = 1;
            goto dst_user_aggregate_label;
        } else {
            dst_user_aggregate = 0;
        }

    }

    // don't forget to mark last call as 'user call'
    if (calls_data_count) {
        if (!calls_data[calls_data_count - 1].activecalls) calls_data[calls_data_count - 1].user_call = 1;
    }

    mysql_free_result(result);

    if (strlen(last_calldate)) {
        sprintf(query, "UPDATE time_periods SET from_date = '%s' WHERE id = %" PRIu64, last_calldate, time_period_hour_id);
        // lock thread because aggregate threads might be running
        pthread_mutex_lock(&mutex);
        if (mor_mysql_query(query)) {
            mor_mysql_reconnect();
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        pthread_mutex_unlock(&mutex);
    }

    return 0;

}


/*
    Get last call id from calls table
*/


uint64_t get_last_call_id() {

    MYSQL_RES *result;
    MYSQL_ROW row;
    uint64_t last_call_id = 0;

    // we need last ID to get only new calls at every call update
    // lets say last call id is 1542 then next time we will get calls that have id > 1542
    if (mor_mysql_query("SELECT MAX(id) FROM calls")) {
        return 0;
    }

    // get results
    result = mysql_store_result(&mysql);
    if (result) {
        if (mysql_num_rows(result)) {
            row = mysql_fetch_row(result);
            if (row[0]) last_call_id = atoll(row[0]);
        }
    }

    mysql_free_result(result);

    return last_call_id;

}


/*
    Get last N number of time periods
*/


int get_last_time_periods() {

    MYSQL_RES *result;
    MYSQL_ROW row;

    char query[1024] = "";

    sprintf(query, "SELECT from_date, id FROM time_periods WHERE period_type = 'hour' ORDER BY from_date DESC LIMIT %d", CACHED_TIME_PERIODS_COUNT);

    // get last N number of periods
    if (mor_mysql_query(query)) {
        return 1;
    }

    // get results
    result = mysql_store_result(&mysql);
    if (result) {
        if (mysql_num_rows(result)) {
            while (( row = mysql_fetch_row(result) )) {
                if (row[0]) strcpy(cached_time_periods[cached_time_periods_count].from_date, row[0]);
                if (row[1]) cached_time_periods[cached_time_periods_count].hour_id = atoll(row[1]);
                cached_time_periods_count++;
            }
        }
    }

    mysql_free_result(result);

    if (cached_time_periods_count == 0) {
        mor_log("cached_time_periods_count is 0. Aborting...\n");
        return 1;
    }

    int i = 0;

    mor_log("Last time periods:\n");

    // get day period ids
    for (i = 0; i < cached_time_periods_count; i++) {

        // get period id for this day
        if ((cached_time_periods[i].day_id =  mor_get_time_period_id(2, -1, cached_time_periods[i].from_date)) == 0) {
            mor_log("Day time period id = 0\n");
            exit(1);
        }

        // get period id for this month
        if ((cached_time_periods[i].month_id =  mor_get_time_period_id(3, -1, cached_time_periods[i].from_date)) == 0) {
            mor_log("Month time period id = 0\n");
            exit(1);
        }

        mor_log("Date: %s, hour_id, %" PRIu64 ", day_id: %" PRIu64 ", month_id: %" PRIu64 "\n", cached_time_periods[i].from_date, cached_time_periods[i].hour_id, cached_time_periods[i].day_id, cached_time_periods[i].month_id);

    }

    return 0;

}

void get_current_call_time_period(int index) {

    int i;
    char calldate[20] = "";

    strcpy(calldate, calls_data[index].calldate);

    calls_data[index].time_period_hour_id = 0;
    calls_data[index].time_period_day_id = 0;
    calls_data[index].time_period_month_id = 0;
    strcpy(calldate + 14, "00:00");

    for (i = 0; i < cached_time_periods_count; i++) {

        cached_time_periods[i].from_date[14] = '0';
        cached_time_periods[i].from_date[15] = '0';
        cached_time_periods[i].from_date[17] = '0';
        cached_time_periods[i].from_date[18] = '0';

        if (strcmp(calldate, cached_time_periods[i].from_date) == 0) {
            calls_data[index].time_period_hour_id = cached_time_periods[i].hour_id;
            calls_data[index].time_period_day_id = cached_time_periods[i].day_id;
            calls_data[index].time_period_month_id = cached_time_periods[i].month_id;
            break;
        }

    }

    if (!calls_data[index].time_period_hour_id) {

        mor_log("Date %s not found in cached time_periods. Will try to fetch from database.\n", calls_data[index].calldate);

        // get period id for this hour
        if ((calls_data[index].time_period_hour_id =  mor_get_time_period_id(1, -1, calls_data[index].calldate)) == 0) {
            mor_log("Hour time period id = 0\n");
            exit(1);
        }

        // get period id for this day
        if ((calls_data[index].time_period_day_id =  mor_get_time_period_id(2, -1, calls_data[index].calldate)) == 0) {
            mor_log("Day time period id = 0\n");
            exit(1);
        }

        // get period id for this month
        if ((calls_data[index].time_period_month_id =  mor_get_time_period_id(3, -1, calls_data[index].calldate)) == 0) {
            mor_log("Month time period id = 0\n");
            exit(1);
        }

    }

    mor_log("Cached time_period for date <%s> hour_id: %" PRIu64 ", day_id: %" PRIu64 ", month_id: %" PRIu64 "\n", calls_data[index].calldate, calls_data[index].time_period_hour_id, calls_data[index].time_period_day_id, calls_data[index].time_period_month_id);

}

void add_cached_time_period() {

    int i;
    char current_date[20] = "";
    mor_get_current_date(current_date);
    strcpy(current_date + 14, "00:00");

    if (cached_time_periods_count == CACHED_TIME_PERIODS_COUNT) {
        for (i = 0; i < cached_time_periods_count - 1; i++) {
            cached_time_periods[i].hour_id = cached_time_periods[i + 1].hour_id;
            cached_time_periods[i].day_id = cached_time_periods[i + 1].day_id;
            cached_time_periods[i].month_id = cached_time_periods[i + 1].month_id;
            strcpy(cached_time_periods[i].from_date, cached_time_periods[i + 1].from_date);
        }

        cached_time_periods[cached_time_periods_count - 1].hour_id = time_period_hour_id;
        cached_time_periods[cached_time_periods_count - 1].day_id = time_period_day_id;
        cached_time_periods[cached_time_periods_count - 1].month_id = time_period_month_id;
        strcpy(cached_time_periods[cached_time_periods_count - 1].from_date, current_date);
    } else {
        strcpy(cached_time_periods[cached_time_periods_count].from_date, current_date);
        cached_time_periods[cached_time_periods_count].hour_id = time_period_hour_id;
        cached_time_periods[cached_time_periods_count].day_id = time_period_day_id;
        cached_time_periods[cached_time_periods_count].month_id = time_period_month_id;
        cached_time_periods_count++;
    }

    mor_log("Cached time_periods:\n");
    for (i = 0; i < cached_time_periods_count; i++) {
        mor_log("Date: %s, hour_id: %" PRIu64 ", day_id: %" PRIu64 ", month_id: %" PRIu64 "\n", cached_time_periods[i].from_date, cached_time_periods[i].hour_id, cached_time_periods[i].day_id, cached_time_periods[i].month_id);
    }

}
