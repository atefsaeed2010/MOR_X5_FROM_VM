ALTER TABLE cs_invoices ADD tax_id int(11) default NULL COMMENT 'Tax for invoice';
ALTER TABLE cs_invoices ADD balance_with_tax float default 0 COMMENT 'Balance with tax for invoice';
ALTER TABLE cards ADD name VARCHAR(255) default '' COMMENT 'Name of card';
ALTER TABLE locationrules ADD did_id int(11) COMMENT 'Route to DID';
ALTER TABLE dialplans ADD COLUMN `data9` varchar(255) default NULL;
ALTER TABLE dialplans ADD COLUMN `data10` varchar(255) default NULL;
ALTER TABLE dialplans ADD COLUMN `data11` varchar(255) default NULL;
ALTER TABLE dialplans ADD COLUMN `data12` varchar(255) default NULL;
ALTER TABLE cardgroups ADD solo_pinless TINYINT(1) default 0;
ALTER TABLE devices ADD use_ani_for_cli TINYINT(1) default 0;
CREATE TABLE `ringgroups` (`id` int(11) NOT NULL auto_increment, `name` varchar(255) NOT NULL,`comment` BLOB,`timeout` INTEGER,`options` varchar(255),`strategy` ENUM ('ringall', 'hunt', 'memoryhunt', 'ringall-prim', 'hunt-prim','memoryhunt-prim', 'firstavailable', 'firstnotonphone') DEFAULT 'ringall' NOT NULL,  `cid_prefix` varchar(255),  `did_id` int(11),  `user_id` int(11) DEFAULT 0 NOT NULL,  `created_at` datetime NOT NULL,  `updated_at` datetime NOT NULL,  PRIMARY KEY  (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ringgroups_devices` (`id` int(11) NOT NULL auto_increment,  `ringgroup_id` int(11) NOT NULL,  `device_id` int(11) NOT NULL,  `priority` INTEGER,  `created_at` datetime NOT NULL,  `updated_at` datetime NOT NULL,  PRIMARY KEY  (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE cardgroups ADD disable_voucher TINYINT(1) default 0;
ALTER TABLE devices ADD calleridpres ENUM ('allowed_not_screened', 'allowed_passed_screen', 'allowed_failed_screen', 'allowed', 'prohib_not_screened', 'prohib_passed_screen', 'prohib_failed_screen', 'prohib', 'unavailable') DEFAULT NULL;
ALTER TABLE dids ADD reseller_comment varchar(255) default NULL;
CREATE INDEX number_unique ON cards(number);
ALTER TABLE cron_settings ADD provider_target_id INT(11) NOT NULL ;
ALTER TABLE cron_settings ADD provider_to_target_id INT(11) NOT NULL ;
CREATE TABLE `common_use_providers` (`id` INT NOT NULL AUTO_INCREMENT , `provider_id` INT NOT NULL , `reseller_id` INT NOT NULL , `tariff_id` INT NOT NULL , PRIMARY KEY ( `id` )) ENGINE = InnoDB;
ALTER TABLE lcrs ADD first_provider_percent_limit FLOAT DEFAULT 0 NOT NULL ;
ALTER TABLE devices ADD change_failed_code_to INT(11) DEFAULT 0 NOT NULL ;
ALTER TABLE devices ADD reg_status varchar(50) default NULL;
ALTER TABLE devices ADD INDEX server_id_index(server_id);    
ALTER TABLE users ADD spy_device_id INT default 0 COMMENT 'ChanSpy device ID';
ALTER TABLE devices ADD max_timeout INT default 0;
ALTER TABLE dids ADD cid_name_prefix varchar(30) default NULL;
ALTER TABLE locationrules ADD device_id int(11) COMMENT 'Change call owner';
ALTER TABLE devices MODIFY language VARCHAR(10) DEFAULT NULL;
CREATE INDEX rate_index ON aratedetails(rate_id);
ALTER TABLE devices ADD forward_did_id INT default 0;
ALTER TABLE services ADD selfcost_price double NOT NULL DEFAULT '0';
ALTER TABLE users ADD time_zone INT default 0 COMMENT 'Time zone number';
ALTER TABLE cards ADD user_id INT default -1 COMMENT 'User ID'; 
ALTER TABLE activecalls ADD lega_codec varchar(20) default NULL;
ALTER TABLE activecalls ADD legb_codec varchar(20) default NULL;
ALTER TABLE activecalls ADD pdd float default NULL;
ALTER TABLE monitorings ADD COLUMN monitoring_type ENUM('bellow','above') NOT NULL DEFAULT 'above' COMMENT 'drop - take actions when amount drops bellow specified value, above - take actions when amount is above specified value';
ALTER TABLE users ADD COLUMN minimal_charge INT(11) NOT NULL DEFAULT 0 COMMENT '0 means that there is no minimal chrage set/enabled, in this case it wouldnt be logical to set it to 0. By default minimal charge is disabled, hence default value is 0. NOT NULL is set because so that there wouldnt be any ambiguity between NULL and 0 values.';
ALTER TABLE users ADD COLUMN minimal_charge_start_at DATETIME DEFAULT NULL COMMENT 'minimal charge date does not have any sence if minimal charge option is disabled, so this value can be NULL and by default it is NULL, because minimal charge is disabled by default';
ALTER TABLE monitorings ADD owner_id INT default 0 COMMENT 'Owner ID, user class';
ALTER TABLE didrates ADD COLUMN `daytype` enum('','FD','WD') default '';
CREATE TABLE `credit_notes` (`id` int(11) NOT NULL AUTO_INCREMENT,`issue_date` DATETIME NOT NULL COMMENT 'date when credit note was issued, can not be NULL because of obvious reasons. And default value is not set, so that no one could insert row with issue date as null',`number` VARCHAR(255) NOT NULL COMMENT 'same as invoices.number, obviuosly to long. is it realy necesary?',`comment` TEXT COMMENT 'by default comment is created without any comment, hence default value is null',`price` DOUBLE NOT NULL COMMENT 'Price can not be null. Floating point data types should not be used for storing currencies, but since mor uses it anyways use DOUBLE',`price_with_vat` DOUBLE NOT NULL COMMENT 'Same as with price',`tax_id` INT(11) DEFAULT NULL COMMENT 'Stores tax that was applied the moment credit note was created',`status` ENUM('paid','unpaid') NOT NULL DEFAULT 'unpaid' COMMENT 'Note may be paid or unpaid, when creating note by default it is unpaid',`pay_date` DATETIME DEFAULT NULL COMMENT 'Date when note was paid, should be null while note is not paid',`user_id` INT(10) UNSIGNED NOT NULL COMMENT 'note has a relationship one-to-many with user, so it can not be null or negative. Maybe INT is a bit to much(range is 0 to 429496729), but user.id is INT too',`payment_id` INT(10) UNSIGNED DEFAULT NULL COMMENT 'when note is paid payment should be created and payment-note should have one-to-one relationship, but while it is not paid there should be no relationship between note and payment, so it might be null. considerations why UNSIGNED INT was chosen same as with user_id', PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE credit_notes MODIFY number VARCHAR(255);
ALTER TABLE voicemail_boxes ADD UNIQUE (device_id);
ALTER TABLE aratedetails ADD COLUMN `ghost_percent` FLOAT default NULL;
ALTER TABLE ratedetails ADD COLUMN `ghost_percent` FLOAT default NULL;
ALTER TABLE cc_gmps MODIFY COLUMN percent FLOAT NOT NULL DEFAULT 100;
DELETE rights.*  FROM rights WHERE id IN (select * from (SELECT id FROM rights GROUP BY controller, action having count(*) > 1) as tt);
DELETE role_rights.*  FROM role_rights WHERE id IN (select * from (SELECT id FROM role_rights GROUP BY role_id, right_id having count(*) > 1) as tt);
ALTER TABLE lcrs ADD COLUMN failover_provider_id INT NULL DEFAULT NULL;
ALTER TABLE directions MODIFY COLUMN code VARCHAR(20) NOT NULL;
ALTER TABLE destinations MODIFY COLUMN prefix VARCHAR(50) NOT NULL;
ALTER TABLE rates ADD COLUMN `ghost_min_perc` FLOAT default NULL;
ALTER TABLE aratedetails DROP COLUMN  `ghost_percent`;
ALTER TABLE ratedetails DROP COLUMN  `ghost_percent`;
ALTER TABLE users MODIFY COLUMN time_zone float default 0;
ALTER TABLE monitorings MODIFY monitoring_type enum('bellow', 'above', 'simultaneous') NOT NULL DEFAULT 'above';
UPDATE emails SET body = CONCAT(body, '\n<%= call_list %>') WHERE name = 'monitoring_activation' AND body NOT LIKE '%call_list%';
ALTER TABLE devices ADD COLUMN anti_resale_auto_answer TINYINT DEFAULT 0 NOT NULL;
ALTER TABLE monitorings MODIFY monitoring_type enum('bellow', 'above', 'simultaneous') NOT NULL DEFAULT 'above';
ALTER TABLE devices ADD COLUMN qf_tell_balance TINYINT NOT NULL DEFAULT 0;
ALTER TABLE devices ADD COLUMN qf_tell_time TINYINT NOT NULL DEFAULT 0;
ALTER TABLE lcrs ADD COLUMN no_failover TINYINT NOT NULL DEFAULT 1;
CREATE TABLE `call_details` (`id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `call_id` bigint(20) DEFAULT NULL, `pdd` double DEFAULT NULL, `la_ip` int(11) DEFAULT NULL, `la_local_ip` int(11) DEFAULT NULL, `la_codec` int(11) DEFAULT NULL, `la_rtt` double DEFAULT NULL, `la_r` int(11) DEFAULT NULL, `la_mos` double DEFAULT NULL, `la_rxcount` int(11) DEFAULT NULL, `la_lp` int(11) DEFAULT NULL, `la_rxjitter` double DEFAULT NULL, `la_r_r` int(11) DEFAULT NULL, `la_r_mos` double DEFAULT NULL, `la_tx_count` int(11) DEFAULT NULL, `la_rlp` int(11) DEFAULT NULL, `la_txjitter` double DEFAULT NULL, `la_t_r` int(11) DEFAULT NULL, `la_t_mos` double DEFAULT NULL, `lb_ip` int(11) DEFAULT NULL, `lb_local_ip` int(11) DEFAULT NULL, `lb_codec` tinyint(4) DEFAULT NULL, `lb_rtt` double DEFAULT NULL, `lb_r` int(11) DEFAULT NULL, `lb_mos` double DEFAULT NULL, `lb_rxcount` int(11) DEFAULT NULL, `lb_lp` int(11) DEFAULT NULL, `lb_rxjitter` double DEFAULT NULL, `lb_r_r` int(11) DEFAULT NULL, `lb_r_mos` double DEFAULT NULL, `lb_txcount` int(11) DEFAULT NULL, `lb_rlp` int(11) DEFAULT NULL, `lb_txjitter` double DEFAULT NULL, `lb_t_r` int(11) DEFAULT NULL, `lb_t_mos` double DEFAULT NULL, INDEX call_id_index (call_id), PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE providers ADD COLUMN balance DOUBLE DEFAULT 0 NOT NULL;
ALTER TABLE devices ADD COLUMN time_limit_per_day INT NOT NULL DEFAULT 0;
update emails set body = 'Monitoring details:\n\nType: <%=monitoring_type%>\nBalance: <%=monitoring_amount%>\nBlock: <%=monitoring_block%>\n\nAffected users:\n\n<%=monitoring_users%>\n<%= call_list %>' where name = 'monitoring_activation';
ALTER TABLE `lcrproviders` ADD INDEX `active_lcr_prov` ( `active` , `lcr_id` , `provider_id` );
ALTER TABLE activecalls ENGINE=MEMORY;
ALTER TABLE `activecalls` ADD INDEX `prov_index` ( `provider_id` );
ALTER TABLE devices ADD COLUMN control_callerid_by_cids TINYINT NOT NULL DEFAULT 0;
ALTER TABLE `callerids` ADD INDEX `cli_device_id` ( `cli` , `device_id` );
ALTER TABLE dids ADD COLUMN tonezone VARCHAR(5) DEFAULT NULL;
ALTER TABLE devices ADD COLUMN callerid_advanced_control TINYINT NOT NULL DEFAULT 0;
ALTER TABLE cards MODIFY COLUMN number VARCHAR(255) DEFAULT NULL;
ALTER TABLE cards MODIFY COLUMN pin VARCHAR(255) DEFAULT NULL;
ALTER TABLE cards ADD COLUMN hidden TINYINT NOT NULL DEFAULT 0;
INSERT IGNORE INTO currencies (name, full_name, active) SELECT 'GEL', 'Georgian lari', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM currencies WHERE name = 'GEL');
ALTER TABLE lcrs MODIFY COLUMN no_failover tinyint NOT NULL DEFAULT 0;
UPDATE lcrs LEFT JOIN providers ON (lcrs.failover_provider_id = providers.id) SET lcrs.failover_provider_id = NULL WHERE providers.id IS NULL;
ALTER TABLE lcrs MODIFY COLUMN failover_provider_id BIGINT DEFAULT NULL;
ALTER TABLE lcrs ADD INDEX failover_provider_index (failover_provider_id);
ALTER TABLE `lcrs` ADD CONSTRAINT `failover_provider` FOREIGN KEY(`failover_provider_id`) REFERENCES `providers`(`id`);
ALTER TABLE cards ADD call_count INT default 0;
ALTER TABLE dids ADD call_count INT default 0;
ALTER TABLE cardgroups ADD COLUMN hidden TINYINT NOT NULL DEFAULT 0;
DELETE lcrproviders FROM lcrproviders LEFT JOIN lcrs ON(lcrs.id = lcrproviders.lcr_id) WHERE lcrs.id IS NULL;
ALTER TABLE lcrproviders ADD CONSTRAINT lcrproviders_ibfk FOREIGN KEY (lcr_id) REFERENCES lcrs(id);
ALTER TABLE extlines MODIFY COLUMN appdata varchar(255);
ALTER TABLE groups AUTO_INCREMENT = 1;
ALTER TABLE flatrate_data ADD COLUMN seconds INT NOT NULL DEFAULT 0;
ALTER TABLE devices ADD COLUMN transport enum('udp','tcp','udp,tcp','tcp,udp') DEFAULT 'udp';
ALTER TABLE servers ADD COLUMN version VARCHAR(30) DEFAULT NULL;
ALTER TABLE servers ADD COLUMN uptime VARCHAR(50) DEFAULT NULL;
CREATE TABLE IF NOT EXISTS `devicerules` (  `id` int(11) NOT NULL auto_increment, `device_id` int(11) NOT NULL, `name` varchar(255) default NULL, `enabled` tinyint(4) NOT NULL default '1', `cut` varchar(255) default NULL, `add` varchar(255) default NULL,  `minlen` int(11) NOT NULL default '1', `maxlen` int(11) NOT NULL default '100', `pr_type` enum('dst','src') default 'dst', PRIMARY KEY  (`id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE devices MODIFY COLUMN control_callerid_by_cids int(11) DEFAULT NULL;
alter table devices add column subscribemwi enum('yes','no') DEFAULT NULL;
update devices set subscribemwi = ABS(enable_mwi -1) + 1;
ALTER TABLE `adnumbers` ADD `uniqueid` VARCHAR( 30 ) NULL ;
ALTER TABLE recordings ADD INDEX ( visible_to_user ) ;
ALTER TABLE recordings ADD INDEX ( src_device_id ) ;
CREATE INDEX uniqueidindex ON recordings (uniqueid(6));
## SQL sentences goes to the top ^^^^^ from this line
# make sure you press ENTER (to end line) after last SQL sentence!
# also whole SQL sentence should go into one line
# ------------ DO NOT WRITE NOTHING PAST THIS LINE ---------------
