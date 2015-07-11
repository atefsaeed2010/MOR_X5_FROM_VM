
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int task_failed = 0;

// Task variables

int user_id = -1;        // -1 means all users, > -1 == users.id
char date_from[30] = "";
char date_till[30] = "";
double ghost_time = 0;
char ghost_time_str[128] = "";
int include_reseller_users = 0;
char include_reseller_users_str[128] = "";

// Rerating variables

char buffer[4096] = "";
char update_query[BUFFER_SIZE] = "";

char update_query_beginning[256] = "INSERT INTO calls (id,user_price,user_rate,user_billsec,reseller_price,reseller_rate,reseller_billsec) VALUES ";
char update_query_ending[512] = "ON DUPLICATE KEY UPDATE id=VALUES(id),user_price=VALUES(user_price),user_rate=VALUES(user_rate),user_billsec=VALUES(user_billsec),reseller_price=VALUES(reseller_price),reseller_rate=VALUES(reseller_rate),reseller_billsec=VALUES(reseller_billsec);";

double new_user_price = 0;
double old_user_price = 0;
double user_delta_price = 0;

double new_reseller_price = 0;
double old_reseller_price = 0;
double reseller_delta_price = 0;

long long int user_diff = 0;
long long int reseller_diff = 0;

long long int old_user_billsec = 0;
long long int new_user_billsec = 0;

long long int old_reseller_billsec = 0;
long long int new_reseller_billsec = 0;

unsigned long long int last_call_id = 0;
int rerate_batches = 0;
long long int total_calls = 0;        // total number of calls fetched from database
long long int rerated_calls = 0;      // number of calls rerated
long long int updated = 0;            // number of calls updated

int user_is_reseller = 0;
int user_belongs_to_reseller = 0;
int core_count = 2;
int batch_counter = 0;
int waiting = 0;                      // number of threads running
int first_iteration = 1;

// semaphores
int get_rate_details_sem = 0;
int update_cdr_sem = 0;

// advanced rates for user

struct advanced_rate {
    int from;
    int duration;
    int artype;
    int round;
    double price;
};

// Call data list

typedef struct call_data_struct {
    long long int call_id;
    int location_id;
    char calldate[20];
    char prefix[256];
    char dst[256];
    char localized_dst[256];
    int real_billsec;

    double user_price;
    double user_new_price;
    double user_rate;
    double exchange_rate;
    int user_id;
    int user_billsec;
    int user_new_billsec;;
    int user_tariff;
    int user_tariff_type;
    int user_grace_time;

    double reseller_price;
    double reseller_new_price;
    double reseller_rate;
    double reseller_exchange_rate;
    int reseller_id;
    int reseller_billsec;
    int reseller_new_billsec;;
    int reseller_tariff;
    int reseller_tariff_type;
    int reseller_grace_time;

    // user wholesale data

    double user_rate_ws;
    int user_increment_ws;
    int user_min_time_ws;
    double user_connection_fee_ws;
    int user_total_arates;
    double user_total_event_price;
    int user_custom_rates;

    // user retail data

    double user_max_arate;
    struct advanced_rate user_arates[50];

    // reseller wholesale data

    double reseller_rate_ws;
    int reseller_increment_ws;
    int reseller_min_time_ws;
    double reseller_connection_fee_ws;
    int reseller_total_arates;
    double reseller_total_event_price;
    int reseller_custom_rates;

    // reseller retail data

    double reseller_max_arate;
    struct advanced_rate reseller_arates[50];

    struct call_data_struct *next;
} call_data;

call_data* call_data_start = NULL;

typedef struct lrules_struct {
    int location_id;
    int minlen;
    int maxlen;
    char cut[32];
    char add[32];
    int tariff_id;
    int tariff_type;
    struct lrules_struct *next;
} lrules_t;

typedef struct lrules_ret_struct {
    int tariff_id;
    int tariff_type;
} lrules_ret_t;

lrules_t lrules[50000];
int lrules_count = 0;

// pthread arguments

typedef struct pt_args_struct {
    char *buffer;
    int user_cached_rate_index;
    int reseller_cached_rate_index;
    call_data *data;
} pt_args_t;

/* Time vars */

struct tm tm;
struct timeval t0, t1;
time_t t, tt;
suseconds_t ut0, ut1;

struct timeval _t0, _t1;
time_t _t, _tt;
suseconds_t _ut0, _ut1;
char datetime[100];

// cached rates

typedef struct cached_rates_struct {
    int tariff_id;
    char prefix[32];
    double rate_ws;
    int increment_ws;
    int min_time_ws;
    double connection_fee_ws;
    int total_arates;
    double total_event_price;
    double max_arate;
    struct advanced_rate arates[50];
} cached_rates_t;

cached_rates_t *cached_rates = NULL;
long long int cached_rates_count = 0;

// user balance

typedef struct user_balance_struct {
    int user_id;
    double old_price;
    double new_price;
    double diff_price;
} user_balance_t;

user_balance_t *user_balance = NULL;
int user_balance_count = 0;

/* DEBUG */

int DEBUG_RERATE = 0; // 0 - rerate, but do not update database; 1 - rerate and update database
