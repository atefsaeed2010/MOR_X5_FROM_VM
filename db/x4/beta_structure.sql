ALTER TABLE providers ADD COLUMN balance_limit decimal(30,15) default 0;
ALTER TABLE devices ADD COLUMN proxy_port int(11) NOT NULL DEFAULT 0;
CREATE TABLE IF NOT EXISTS mohs (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, moh_name varchar(255), comment varchar(255), ivr_voice_id varchar(255), random ENUM('yes','no') default 'yes');
CREATE TABLE IF NOT EXISTS queues (  id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,  name VARCHAR(128),  extension VARCHAR(30),  server_id int default 1,  strategy ENUM('ringall', 'roundrobin', 'leastrecent', 'fewestcalls', 'random', 'rrmemory', 'wrandom', 'linear', 'rrordered') default 'ringall',  weight INT default 0,  autofill ENUM ('yes', 'no') default 'yes',  ringinuse  ENUM ('yes', 'no') default 'no',  failover_action ENUM('hangup','extension','did','device') DEFAULT 'hangup',  failover_data VARCHAR(128),  cid_name_prefix VARCHAR(30),  reportholdtime ENUM ('yes', 'no') default 'no',  announce INT default 0,  memberdelay INT default 0,  timeout INT default 30,  retry INT default 5,  wrapuptime INT default 0,  allow_callee_hangup   ENUM ('yes', 'no') default 'no',  maxlen INT default 0,  join_announcement INT default 0,  ringing_instead_of_moh ENUM ('yes', 'no') default 'no',  moh_id INT default 0,  ring_at_once  ENUM ('yes', 'no') default 'no',  joinempty VARCHAR(128) default "penalty,paused,invalid",  leavewhenempty VARCHAR(128) default "penalty,paused,invalid",  allow_caller_hangup  ENUM ('yes', 'no') default 'no',  context INT default 0,  max_wait_time INT default 300,   announce_frequency INT default 90,  min_announce_frequency  INT default 15,  announce_position ENUM('yes', 'no', 'limit', 'more') default 'yes',  announce_position_limit INT default 5,  announce_holdtime ENUM('yes', 'no', 'once') default 'once',  announce_round_seconds INT default 0,  periodic_announce_frequency INT default 60,  random_periodic_announce ENUM ('yes', 'no') default 'no',  relative_periodic_announce ENUM ('yes', 'no') default 'no',  servicelevel INT default 0,  penaltymemberslimit INT default 0,  autopause ENUM ('yes', 'no', 'all') default 'no',  setinterface ENUM ('yes', 'no') default 'no',  setqueueentryvar ENUM ('yes', 'no') default 'no',  setqueuevar ENUM ('yes', 'no') default 'no',  membermacro VARCHAR(255) DEFAULT NULL,  membergosub VARCHAR(255) DEFAULT NULL,  monitor_format ENUM ('gsm', 'wav', 'wav49'),  monitor_type ENUM ('MixMonitor', 'Monitor') default 'MixMonitor',  eventwhencalled ENUM ('yes','no','vars') default 'no',  eventmemberstatus ENUM ('yes', 'no') default 'no',  timeoutrestart ENUM ('yes', 'no') default 'no',  queue_youarenext INT default 0,  queue_thereare INT default 0,  queue_callswaiting  INT default 0,  queue_holdtime INT default 0,  queue_minutes INT default 0,  queue_seconds INT default 0,  queue_thankyou INT default 0,  queue_lessthan INT default 0,  queue_reporthold INT default 0,  timeoutpriority ENUM ('app','conf') default 'app'  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS queue_agents (  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  agent_name varchar(40),  queue_id INT,  device_id INT(11),  penalty INT(11),  paused INT(11)  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS queue_periodic_announcements (  id  INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  queue_id INT,  ivr_sound_files_id INT,  priority INT  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `cards` CHANGE `first_use` `first_use` DATETIME NULL DEFAULT NULL; 
ALTER TABLE `cards` CHANGE `daily_charge_paid_till` `daily_charge_paid_till` DATETIME NULL DEFAULT NULL;
CREATE UNIQUE INDEX uniqueidindex ON adnumbers (uniqueid);
ALTER TABLE devices MODIFY t38pt_udptl enum('no', 'yes', 'yes, fec', 'yes, redundancy', 'yes, none') default 'no';
ALTER TABLE devices ADD COLUMN cps_call_limit INT NOT NULL DEFAULT 0;
ALTER TABLE devices ADD COLUMN cps_period INT NOT NULL DEFAULT 0;
CREATE TABLE IF NOT EXISTS `bl_src_new_score` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_src_new_score_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `bl_dst_new_score` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_dst_new_score_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `bl_ip_new_score` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_ip_new_score_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `bl_src_scoring` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_src_scoring_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;	
CREATE TABLE IF NOT EXISTS `bl_dst_scoring` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_dst_scoring_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `bl_ip_scoring` (`id` int(11) NOT NULL AUTO_INCREMENT, `value` varchar(100) NOT NULL, `score` int(4) NOT NULL, PRIMARY KEY (`id`), KEY `bl_ip_scoring_index` (`value`(10))) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
ALTER TABLE users ADD COLUMN blacklist_enabled enum('yes', 'no', 'global') NOT NULL DEFAULT 'global';
ALTER TABLE users ADD COLUMN blacklist_lcr int NOT NULL default -1;
ALTER TABLE users ADD COLUMN routing_threshold INT NOT NULL DEFAULT -1;
ALTER TABLE directions ADD COLUMN iso31661code VARCHAR(3) NOT NULL DEFAULT '000';
ALTER TABLE providers ADD COLUMN cps_call_limit INT NOT NULL DEFAULT 0;
ALTER TABLE providers ADD COLUMN cps_period INT NOT NULL DEFAULT 0;
UPDATE addresses SET email = null WHERE email = ""; CREATE TEMPORARY TABLE temp_table AS (select email FROM addresses GROUP BY email HAVING count(*) > 1); UPDATE addresses INNER JOIN temp_table ON (addresses.email = temp_table.email) SET addresses.email = CONCAT(addresses.email,'_',addresses.id); DROP TABLE temp_table; CREATE UNIQUE INDEX unique_email ON addresses (email);
DROP table IF EXISTS sessions;
CREATE TABLE IF NOT EXISTS lcr_timeperiods (id int(11) NOT NULL auto_increment,name varchar(255) DEFAULT NULL,start_hour int(11) DEFAULT NULL,end_hour int(11) DEFAULT NULL,start_minute int(11) DEFAULT NULL,end_minute int(11) DEFAULT NULL,start_weekday varchar(3) default NULL,end_weekday varchar(3) default NULL,start_day int(11) default NULL,end_day int(11) default NULL,start_month int(11) default NULL,end_month int(11) default NULL,main_lcr_id int(11) NOT NULL,lcr_id int(11) default 0 NOT NULL,active int(1) default 0 NOT NULL,PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
ALTER TABLE queue_agents ADD COLUMN priority INT DEFAULT 0;
CREATE TABLE IF NOT EXISTS `background_tasks` (`id` bigint(20) NOT NULL auto_increment, `owner_id` int(11) NOT NULL, `user_id` int(11) NOT NULL, `task_id` int(11) NOT NULL, `status` enum('WAITING','IN PROGRESS','DONE','FAILED') NOT NULL,`percent_completed` float NOT NULL default '0',`created_at` datetime default NULL,`started_at` datetime default NULL,`updated_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,`expected_to_finish_at` datetime default NULL,`finished_at` datetime default NULL,`failed_at` datetime default NULL,`last_error` varchar(255) default NULL,`to_do_times` int(11) default NULL,`attempts` int(11) default NULL,`data1` varchar(255) default NULL,`data2` varchar(255) default NULL,`data3` varchar(255) default NULL,`data4` varchar(255) default NULL,`data5` varchar(255) default NULL, `data6` varchar(255) default NULL, PRIMARY KEY  (`id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
CREATE TABLE IF NOT EXISTS `calls_old` (   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,   `calldate` timestamp NULL DEFAULT NULL,   `date` date DEFAULT NULL,   `clid` varchar(80) NOT NULL,   `src` varchar(80) NOT NULL,   `dst` varchar(80) NOT NULL,   `channel` varchar(80) NOT NULL,   `duration` int(11) NOT NULL DEFAULT '0',   `billsec` int(11) NOT NULL DEFAULT '0',   `disposition` enum('FAILED','NO ANSWER','BUSY','ANSWERED') DEFAULT NULL,   `accountcode` varchar(20) NOT NULL,   `uniqueid` varchar(32) NOT NULL,   `src_device_id` int(11) NOT NULL DEFAULT '0',   `dst_device_id` int(11) NOT NULL DEFAULT '0',   `processed` tinyint(4) NOT NULL DEFAULT '0',   `did_price` decimal(30,15) DEFAULT '0.000000000000000',   `card_id` int(11) DEFAULT NULL,   `provider_id` int(11) DEFAULT NULL,   `provider_rate` decimal(30,15) DEFAULT '0.000000000000000',   `provider_billsec` int(11) DEFAULT NULL,   `provider_price` decimal(30,15) DEFAULT '0.000000000000000',   `user_id` int(11) DEFAULT NULL,   `user_rate` decimal(30,15) DEFAULT '0.000000000000000',   `user_billsec` int(11) DEFAULT NULL,   `user_price` decimal(30,15) DEFAULT '0.000000000000000',   `reseller_id` int(11) DEFAULT NULL,   `reseller_rate` decimal(30,15) DEFAULT '0.000000000000000',   `reseller_billsec` int(11) DEFAULT NULL,   `reseller_price` decimal(30,15) DEFAULT '0.000000000000000',   `partner_id` int(11) DEFAULT NULL,   `partner_rate` decimal(30,15) DEFAULT '0.000000000000000',   `partner_billsec` int(11) DEFAULT NULL,   `partner_price` decimal(30,15) DEFAULT '0.000000000000000',   `prefix` varchar(50) DEFAULT NULL,   `server_id` int(11) DEFAULT '1',   `hangupcause` int(11) DEFAULT NULL,   `callertype` enum('Local','Outside') DEFAULT NULL,   `useragent` varchar(255) DEFAULT NULL,   `did_inc_price` decimal(30,15) DEFAULT '0.000000000000000',   `did_prov_price` decimal(30,15) DEFAULT '0.000000000000000',   `localized_dst` varchar(50) DEFAULT NULL,   `did_provider_id` int(11) DEFAULT '0',   `did_id` int(11) DEFAULT NULL,   `originator_ip` varchar(20) DEFAULT '',   `terminator_ip` varchar(20) DEFAULT '',   `real_duration` decimal(30,15) DEFAULT '0.000000000000000',   `real_billsec` decimal(30,15) DEFAULT '0.000000000000000',   `did_billsec` int(11) DEFAULT '0' COMMENT 'billsec for incoming call',   `dst_user_id` int(11) DEFAULT NULL COMMENT 'users id which receives call',   PRIMARY KEY (`id`),   UNIQUE KEY `id` (`id`),   KEY `src_device_id` (`src_device_id`),   KEY `dst_device_id` (`dst_device_id`),   KEY `src` (`src`,`disposition`),   KEY `provider_id` (`provider_id`) USING BTREE,   KEY `card_id` (`card_id`) USING BTREE,   KEY `disposition` (`disposition`) USING BTREE,   KEY `user_id_index` (`user_id`),   KEY `hgcause` (`hangupcause`),   KEY `resellerid` (`reseller_id`),   KEY `dst_user_id_index` (`dst_user_id`),   KEY `did_id` (`did_id`),   KEY `uniqueidindex` (`uniqueid`(6)),   KEY `calldateindex` (`calldate`),   KEY `dateindex` (`date`) ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
alter table users drop column c2c_service_active;
alter table users drop column c2c_call_price;
ALTER TABLE call_details MODIFY recvip INT UNSIGNED DEFAULT NULL;
ALTER TABLE call_details MODIFY peerip INT UNSIGNED DEFAULT NULL;
ALTER TABLE devices MODIFY COLUMN canreinvite ENUM('yes', 'no', 'nonat', 'update', 'update,nonat') DEFAULT 'no';
ALTER TABLE servers ADD COLUMN gui TINYINT default 0;
ALTER TABLE servers ADD COLUMN db TINYINT default 0;
ALTER TABLE servers ADD COLUMN core TINYINT default 0;
ALTER TABLE bl_src_scoring ADD updated_at TIMESTAMP NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE bl_dst_scoring ADD updated_at TIMESTAMP NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE bl_ip_scoring ADD updated_at TIMESTAMP NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE providers ADD COLUMN alive TINYINT default 1;
ALTER TABLE providers ADD COLUMN periodic_check TINYINT default 0;
CREATE TABLE IF NOT EXISTS acc_permissions (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, acc_group_id INT NOT NULL, name VARCHAR(100) NOT NULL, nice_name VARCHAR(100) NOT NULL, value TINYINT NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `server_loadstats` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`server_id` INT NOT NULL COMMENT '->servers.id',`datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,`hdd_util` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',`cpu_general_load` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',`cpu_mysql_load` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',`cpu_ruby_load` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',`cpu_asterisk_load` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',`cpu_loadstats1` DECIMAL( 8, 4 ) NOT NULL DEFAULT '0',PRIMARY KEY ( `id` ) ,INDEX ( `server_id` ),INDEX (`datetime`)) ENGINE = InnoDB;
ALTER TABLE servers ADD COLUMN gui TINYINT default 0;
ALTER TABLE servers ADD COLUMN db TINYINT default 0;
ALTER TABLE servers ADD COLUMN core TINYINT default 0;
ALTER TABLE servers ADD COLUMN load_ok TINYINT default 1;
ALTER TABLE activecalls ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `sms_campaigns` (  `id` int(11) NOT NULL AUTO_INCREMENT,  `name` varchar(255) DEFAULT NULL,  `campaign_type` varchar(255) DEFAULT 'basic',  `status` varchar(255) DEFAULT NULL,  `run_time` datetime DEFAULT NULL,  `start_time` time DEFAULT NULL,  `stop_time` time DEFAULT NULL,  `max_retries` int(11) DEFAULT '0',  `retry_time` int(11) DEFAULT '120',  `wait_time` int(11) DEFAULT '30',  `user_id` int(11) DEFAULT NULL,  `device_id` int(11) DEFAULT NULL,  `callerid` varchar(100) DEFAULT '',  `owner_id` int(11) DEFAULT '0' COMMENT 'Owner id of compaigns',  PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `sms_adactions` (  `id` int(11) NOT NULL AUTO_INCREMENT,  `priority` int(11) DEFAULT NULL,  `action` varchar(255) DEFAULT NULL,  `data` varchar(255) DEFAULT NULL,  `sms_campaign_id` int(11) DEFAULT NULL,  `data2` varchar(50) DEFAULT NULL,  `data3` varchar(50) DEFAULT NULL,  PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `sms_adnumbers` (  `id` int(11) NOT NULL AUTO_INCREMENT,  `number` varchar(255) DEFAULT NULL,  `status` varchar(255) DEFAULT 'new',  `sms_campaign_id` int(11) DEFAULT NULL,  `executed_time` datetime DEFAULT NULL,  `completed_time` datetime DEFAULT NULL,  `channel` varchar(255) DEFAULT NULL,  `uniqueid` varchar(30) DEFAULT NULL,  `user_id` int(11) DEFAULT '0' COMMENT 'Owner id of adnumbers',  PRIMARY KEY (`id`),  KEY `ad1` (`status`,`sms_campaign_id`) USING BTREE,  KEY `number_index` (`number`),  KEY `campaign_id_index` (`sms_campaign_id`)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
ALTER TABLE providers ADD COLUMN active TINYINT DEFAULT 1;
ALTER TABLE `devices` add `timerb` INT( 11 ) NULL DEFAULT '6400' ;
ALTER TABLE `devices` CHANGE `timerb` `timerb` INT( 11 ) NULL DEFAULT '6400' ;
ALTER TABLE ivrs ADD COLUMN all_users_can_use TINYINT default 0;
CREATE TABLE IF NOT EXISTS `alerts` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`status` ENUM( 'enabled', 'disabled' ) NOT NULL DEFAULT 'enabled',`alert_type` ENUM('asr', 'acd', 'pdd', 'ttc', 'billsec_sum', 'calls_total', 'calls_answered', 'calls_not_answered' ) NOT NULL DEFAULT 'asr',`alert_count_type` ENUM( 'ABS HOUR' ) NOT NULL DEFAULT 'ABS HOUR',`check_type` ENUM( 'user', 'provider', 'device', 'destination', 'destination_group' ) NOT NULL DEFAULT 'user',`check_data` VARCHAR( 50 ) NULL ,`value_at_alert` DECIMAL( 8, 4 ) UNSIGNED NULL ,`alert_if_less` DECIMAL( 8, 4 ) UNSIGNED NULL ,`alert_if_more` DECIMAL( 8, 4 ) UNSIGNED NULL ,`alert_raised_at` timestamp NULL DEFAULT NULL,`value_at_clear` DECIMAL( 8, 4 ) UNSIGNED NULL ,`clear_if_less` DECIMAL( 8, 4 ) UNSIGNED NULL ,`clear_if_more` DECIMAL( 8, 4 ) UNSIGNED NULL ,`alert_cleared_at` timestamp NULL DEFAULT NULL,`ignore_if_calls_less` INT UNSIGNED NOT NULL DEFAULT '0',`ignore_if_calls_more` INT UNSIGNED NOT NULL DEFAULT '0',`action_alert_email` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_alert_sms` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_alert_disable_object` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_alert_change_lcr_id` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '->lcrs.id',`action_clear_email` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_clear_sms` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_clear_enable_object` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_clear_restore_original_lcr` TINYINT UNSIGNED NOT NULL DEFAULT '0',`action_clear_change_lcr_id` INT NOT NULL DEFAULT '0' COMMENT '->lcrs.id (-1 to restore original)',`before_alert_original_lcr_id` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '->lcrs.id',`alert_groups_id` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '->alert_groups.id',`comment` VARCHAR( 250 ) NULL ,PRIMARY KEY ( `id` )) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `alert_schedules` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`name` VARCHAR( 100 ) NOT NULL ,`status` ENUM( 'enabled', 'disabled' ) NOT NULL DEFAULT 'enabled',`comment` VARCHAR( 250 ) NULL ,PRIMARY KEY ( `id` )) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `alert_schedule_periods` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`alert_schedule_id` BIGINT UNSIGNED NOT NULL COMMENT '->alert_shedules.id',`day_type` ENUM( 'all days', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' ) NOT NULL DEFAULT 'all days',`status` ENUM( 'ON', 'OFF' ) NOT NULL DEFAULT 'ON',`start` TIME NOT NULL DEFAULT '00:00:00',`end` TIME NOT NULL DEFAULT '23:59:59',PRIMARY KEY ( `id` )) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `alert_contacts` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`name` VARCHAR( 100 ) NOT NULL ,`status` ENUM( 'enabled', 'disabled' ) NOT NULL DEFAULT 'enabled',`timezone` TINYINT NOT NULL DEFAULT '0',`email` VARCHAR( 100 ) NULL ,`max_emails_per_hour` INT UNSIGNED NOT NULL DEFAULT '0',`emails_this_hour` INT UNSIGNED NOT NULL DEFAULT '0',`max_emails_per_day` INT UNSIGNED NOT NULL DEFAULT '0',`emails_this_day` INT UNSIGNED NOT NULL DEFAULT '0',`phone_number` VARCHAR( 50 ) NULL ,`max_sms_per_hour` INT UNSIGNED NOT NULL DEFAULT '0',`sms_this_hour` INT UNSIGNED NOT NULL DEFAULT '0',`max_sms_per_day` INT UNSIGNED NOT NULL DEFAULT '0',`sms_this_day` INT UNSIGNED NOT NULL DEFAULT '0',`comment` VARCHAR( 250 ) NULL ,PRIMARY KEY ( `id` )) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `alert_groups` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`name` VARCHAR( 100 ) NOT NULL ,`status` ENUM( 'enabled', 'disabled' ) NOT NULL DEFAULT 'enabled',`email_schedule_id` BIGINT UNSIGNED NOT NULL COMMENT '-> alerts_schedules.id',`max_emails_per_month` INT UNSIGNED NOT NULL DEFAULT '0',`emails_this_month` INT UNSIGNED NOT NULL DEFAULT '0',`sms_schedule_id` BIGINT UNSIGNED NOT NULL COMMENT '-> alerts_schedules.id',`max_sms_per_month` INT UNSIGNED NOT NULL DEFAULT '0',`sms_this_month` INT UNSIGNED NOT NULL DEFAULT '0',`comment` VARCHAR( 250 ) NULL ,PRIMARY KEY ( `id` )) ENGINE = InnoDB ;
CREATE TABLE IF NOT EXISTS `alert_contact_groups` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,`alert_contact_id` BIGINT UNSIGNED NOT NULL COMMENT '->alert_contacts.id',`alert_group_id` BIGINT UNSIGNED NOT NULL COMMENT '->alert_groups.id',PRIMARY KEY ( `id` )) ENGINE = InnoDB ;
ALTER TABLE alerts MODIFY value_at_alert decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts MODIFY alert_if_less decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts MODIFY alert_if_more decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts MODIFY value_at_clear decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts MODIFY clear_if_less decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts MODIFY clear_if_more decimal(12,2) unsigned DEFAULT NULL;
ALTER TABLE alerts ADD COLUMN count_period INT UNSIGNED NOT NULL DEFAULT 60;
ALTER TABLE alerts MODIFY alert_type ENUM('asr', 'acd', 'pdd', 'ttc', 'billsec_sum', 'calls_total', 'calls_answered', 'calls_not_answered', 'price_sum', 'sim_calls') NOT NULL DEFAULT 'asr';
ALTER TABLE cardgroups CHANGE pin_length pin_length INT(11) NOT NULL DEFAULT 6;
ALTER TABLE providers MODIFY periodic_check TINYINT default 0;
ALTER TABLE alerts MODIFY alert_count_type ENUM('ABS');
ALTER TABLE alerts ADD COLUMN disable_clear TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE subscriptions ADD COLUMN no_expire TINYINT DEFAULT 0;
CREATE TABLE IF NOT EXISTS `number_pools` (`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(50) DEFAULT NULL, `comment` varchar(250) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `numbers` (`id` int(11) NOT NULL AUTO_INCREMENT, `number` varchar(255) DEFAULT NULL, `number_pool_id` int(11) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
ALTER TABLE devices ADD COLUMN callerid_number_pool_id int(11) DEFAULT 0;
ALTER TABLE cards ADD COLUMN active TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE alerts ADD COLUMN owner_id int(11) default 0;
ALTER TABLE cards ADD COLUMN batch_number varchar(255) DEFAULT '';
CREATE INDEX batchnumberindex ON cards (batch_number);
ALTER TABLE alerts ADD COLUMN clear_after INT(10) unsigned default 0;
ALTER TABLE numbers CONVERT TO CHARACTER SET utf8;
ALTER TABLE number_pools CONVERT TO CHARACTER SET utf8;
ALTER TABLE alerts ADD COLUMN enable_provider_in_lcr tinyint(3) unsigned NOT NULL default 0;
ALTER TABLE alerts ADD COLUMN disable_provider_in_lcr tinyint(3) unsigned NOT NULL default 0;
ALTER TABLE dids ADD COLUMN owner_tariff_id int(11) NOT NULL DEFAULT 0;
ALTER TABLE acc_permissions CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_dst_new_score CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_dst_scoring CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_ip_new_score CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_ip_scoring CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_src_new_score CONVERT TO CHARACTER SET utf8;
ALTER TABLE bl_src_scoring CONVERT TO CHARACTER SET utf8;
CREATE TABLE IF NOT EXISTS `blanks` (`id` INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR(255), `date` DATETIME, `description` TEXT, `value1` INT, `value2` DECIMAL(8,4), `value3` ENUM('yes', 'no') DEFAULT 'no') ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS active_calls_data (   id INT(11) AUTO_INCREMENT,   time timestamp,   count INT(10),   PRIMARY KEY(id),   INDEX USING BTREE(time) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS pbx_pools (id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255), comment TEXT, owner_id INT(11)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE users ADD COLUMN pbx_pool_id int(11) NOT NULL DEFAULT 0;
ALTER TABLE devices MODIFY timerb INT(11) DEFAULT NULL;
UPDATE devices SET timerb=NULL; 
ALTER TABLE devices MODIFY transport enum('udp','tcp','udp,tcp','tcp,udp','tls') default 'udp';
ALTER TABLE cron_settings ADD COLUMN inv_from SMALLINT DEFAULT NULL;
ALTER TABLE cron_settings ADD COLUMN inv_till SMALLINT DEFAULT NULL;
ALTER TABLE cron_settings ADD COLUMN inv_issue_day SMALLINT DEFAULT NULL;
ALTER TABLE cron_settings ADD COLUMN inv_send_after TINYINT DEFAULT NULL;
ALTER TABLE rates ADD COLUMN effective_from DATETIME DEFAULT NULL;
CREATE TABLE IF NOT EXISTS `routing_groups` (`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(100) NOT NULL, `comment` varchar(255) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
CREATE TABLE IF NOT EXISTS `rgroup_dpeers` (`id` int UNSIGNED NOT NULL AUTO_INCREMENT, `routing_group_id` INT UNSIGNED NOT NULL, `dial_peer_id` INT UNSIGNED NOT NULL, `dial_peer_priority` INT UNSIGNED NOT NULL DEFAULT 1, PRIMARY KEY (`id`), INDEX `rgroup_dpeer_index` (`routing_group_id` ASC, `dial_peer_id` ASC)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
ALTER TABLE users ADD COLUMN hide_non_answered_calls TINYINT NOT NULL DEFAULT 0;
ALTER TABLE devices ADD COLUMN op TINYINT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN op_active TINYINT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN op_tech_prefix VARCHAR(50) NOT NULL DEFAULT '',ADD COLUMN op_routing_algorithm ENUM('lcr','quality','profit','weight','percent') NOT NULL DEFAULT 'lcr',ADD COLUMN op_routing_group_id INT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN op_tariff_id INT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN op_capacity INT UNSIGNED NOT NULL DEFAULT 500,ADD COLUMN op_src_regexp VARCHAR(255) NOT NULL DEFAULT '',ADD COLUMN op_src_deny_regexp VARCHAR(255) NOT NULL DEFAULT '',ADD COLUMN tp TINYINT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN tp_active TINYINT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN tp_tech_prefix VARCHAR(50) NOT NULL DEFAULT '',ADD COLUMN tp_tariff_id INT UNSIGNED NOT NULL DEFAULT 0,ADD COLUMN tp_capacity INT UNSIGNED NOT NULL DEFAULT 500,ADD COLUMN tp_src_regexp VARCHAR(255) NOT NULL DEFAULT '',ADD COLUMN tp_src_deny_regexp VARCHAR(255) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS dpeer_tpoints (id INT UNSIGNED NOT NULL AUTO_INCREMENT,dial_peer_id INT UNSIGNED NOT NULL,device_id INT UNSIGNED NOT NULL,tp_percent INT UNSIGNED NOT NULL DEFAULT 100,tp_weight INT UNSIGNED NOT NULL DEFAULT 1,PRIMARY KEY (id),INDEX dial_peer_index USING BTREE (dial_peer_id ASC))ENGINE = InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS dial_peers (id INT UNSIGNED NOT NULL AUTO_INCREMENT,    active TINYINT UNSIGNED NOT NULL DEFAULT 1,    name VARCHAR(100) NOT NULL,    comment VARCHAR(255) NOT NULL,    dst_regexp VARCHAR(255) NOT NULL,    dst_deny_regexp VARCHAR(255) NOT NULL,    src_regexp VARCHAR(255) NOT NULL,    src_deny_regexp VARCHAR(255) NOT NULL,    weight INT UNSIGNED NOT NULL DEFAULT 1,    stop_hunting TINYINT UNSIGNED NOT NULL DEFAULT 1,    delta_price DECIMAL(8,4) NOT NULL DEFAULT 0,    tp_priority ENUM('weight','percent') NOT NULL DEFAULT 'weight',    PRIMARY KEY (id)) ENGINE = InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE alerts MODIFY disable_provider_in_lcr INT(11) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE callerids DROP FOREIGN KEY device_id;
ALTER TABLE users  ADD COLUMN balance_min DECIMAL(10,4) DEFAULT 0;
ALTER TABLE users  ADD COLUMN balance_max DECIMAL(10,4) DEFAULT 0;
ALTER TABLE `dids` CHANGE `id` `id` BIGINT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE blanks ADD balance decimal(30,15) NOT NULL DEFAULT '0.0000';
ALTER TABLE alerts ADD COLUMN clear_on_date DATETIME DEFAULT NULL;
CREATE TABLE IF NOT EXISTS `aggregates` (`id` int(11) unsigned NOT NULL AUTO_INCREMENT,`uniqueid` bigint(11) unsigned NOT NULL DEFAULT 0, `direction` varchar(255) DEFAULT NULL, `destination` varchar(255) DEFAULT NULL, `prefix` varchar(255) DEFAULT NULL, `terminator_id` int(11) DEFAULT NULL, `user_id` int(11) DEFAULT NULL, `reseller_id` int(11) DEFAULT NULL, `time_period_id` int(11) NOT NULL DEFAULT 0, `user_billed` decimal(30,15) DEFAULT '0.000000000000000', `user_billed_with_tax` decimal(30,15) DEFAULT '0.000000000000000', `terminator_billed` decimal(30,15) DEFAULT '0.000000000000000', `user_billed_billsec` int(11) NOT NULL DEFAULT '0', `terminator_billed_billsec` int(11) NOT NULL DEFAULT '0', `billsec` int(11) NOT NULL DEFAULT '0', `real_billsec` decimal(30,15) DEFAULT '0.000000000000000',`answered_calls` int(11) NOT NULL DEFAULT '0', `total_calls` int(11) NOT NULL DEFAULT '0', `total_calls_for_user` int(11) NOT NULL DEFAULT '0', `variation` int(11) NOT NULL, PRIMARY KEY (`id`), UNIQUE KEY `id` (`id`),UNIQUE KEY `uniqueid` (`uniqueid`), KEY `time_period_id_index` (`time_period_id`), KEY `user_id_index` (`user_id`), KEY `terminator_id_index` (`terminator_id`), KEY `reseller_id_index` (`reseller_id`), KEY `variation_index` (`variation`), KEY `prefix_index` (`prefix`(4)), KEY `direction_index` (`direction`), KEY `destination_index` (`destination`(6)) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `time_periods` (`id` int(11) unsigned NOT NULL AUTO_INCREMENT,`from_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', `period_type` enum('hour', 'day', 'month', 'year'), PRIMARY KEY (`id`), KEY `from_date_index` (`from_date`),UNIQUE KEY `id` (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
ALTER TABLE users ADD column routing_threshold_2 INT(11) NOT NULL DEFAULT -1;
ALTER TABLE users ADD column blacklist_lcr_2 INT(11) NOT NULL DEFAULT -1;
ALTER TABLE users ADD column routing_threshold_3 INT(11) NOT NULL DEFAULT -1;
ALTER TABLE users ADD column blacklist_lcr_3 INT(11) NOT NULL DEFAULT -1;
CREATE TABLE IF NOT EXISTS `timezones` (`id` int(11) NOT NULL AUTO_INCREMENT, `zone` varchar(100) NOT NULL UNIQUE, `offset` int(11) NOT NULL, PRIMARY KEY (`id`), KEY `zone_index` (`zone`(4))) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
ALTER TABLE `dids` ADD COLUMN `external_server` VARCHAR(50);
ALTER TABLE numbers ADD INDEX ( number , number_pool_id );
ALTER TABLE devices ADD COLUMN custom_sip_header VARCHAR(255) DEFAULT NULL;
ALTER TABLE `conflines` ADD INDEX ( `name` ( 10 ) , `owner_id` );
ALTER TABLE dialplans ADD COLUMN data13 VARCHAR(255) DEFAULT NULL;
## SQL sentences goes to the top ^^^^^ from this line
# make sure you press ENTER (to end line) after last SQL sentence!
# also whole SQL sentence should go into one line
# marking that DB is updated from script
