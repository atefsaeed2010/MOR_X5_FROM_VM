# removing the mark that DB is updated from script
DELETE FROM conflines WHERE name = 'DB_Update_From_Script';
# DATA
UPDATE currencies SET name = 'ZMW' WHERE name = 'ZMK';
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ('call_tracing_usage', 'call_tracing_usage', 'Functions', 'accountant');
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ('provider', 'Provider', 'Active_Calls', 'accountant');
UPDATE conflines SET value = '25' WHERE value = '10' AND name = 'Backup_disk_space';
UPDATE conflines SET value = 150 WHERE name = 'mor_mapped_db_version';
INSERT IGNORE INTO conflines (name, value) SELECT 'mor_mapped_db_version', '150' FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'mor_mapped_db_version');
INSERT IGNORE INTO conflines (name, value) SELECT 'AST_18', '1' FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'AST_18');
update conflines set value = 0 where name = 'google_checkout_google_checkout_enabled';
INSERT IGNORE INTO conflines (name,value) SELECT 'Max_PDF_pages', 100 FROM DUAL WHERE (SELECT COUNT(*) FROM conflines WHERE name = 'Max_PDF_pages') = 0;
UPDATE conflines SET value = 'MOR X5' WHERE value = 'MOR X4';
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '247','<b>247 - Dead Provider skipped</b><br/>Provider used to terminate the call was disabled by MOR because it was unreachable.<br/>Functionality which disables provider can be disabled/enabled by option "Periodic check" in Provider settings, SIP Specific section.' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '247');
UPDATE hangupcausecodes SET description='<b>247 - Dead Provider skipped</b><br/>Provider used to terminate the call was disabled by MOR because it was unreachable.<br/>Functionality which disables provider can be disabled/enabled by option "Periodic check" in Provider settings, SIP Specific section.' WHERE code = '247';
INSERT INTO conflines (name, value) SELECT 'Invoice_email_notice_admin', 1 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Invoice_email_notice_admin' and owner_id = 0);
INSERT INTO conflines (name, value) SELECT 'Invoice_email_notice_manager', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Invoice_email_notice_manager' and owner_id = 0);
INSERT INTO conflines (name, value) SELECT 'How_often_to_send_email_notice', 5 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'How_often_to_send_email_notice' and owner_id = 0);
INSERT INTO conflines (name, value) SELECT 'Hide_active_calls_longer_than', 4 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Hide_active_calls_longer_than' and owner_id = 0);
UPDATE hangupcausecodes SET description = REPLACE(description, '<b>236 Callback ', '<b>236 - Callback ') WHERE code = 236;
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '300','300 - Not authenticated (accountcode = 0)' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '300');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '301','301 - Originator not found' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '301');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '302','302 - Global Call Limit reached' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '302');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '303','303 - Originator Capacity reached' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '303');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '304','304 - CPS Limit reached' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '304');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '305','305 - Source (CallerID) not accepted by regexp' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '305');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '306','306 - Originator Balance Limit reached (Balance Min)' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '306');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '307','307 - Originator Rate not found' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '307');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '308','308 - Dial Peer not found' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '308');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '309','309 - No Dial Peer is available by regexp' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '309');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '310','310 - Suitable Terminator not found' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '310');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '311','311 - User is blocked' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '311');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '312','312 - Caller cancelled the call (CANCEL)' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '312');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '313','313 - User call limit reached' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '313');
UPDATE translations SET active = 1 WHERE name = 'Czech';
DELETE FROM acc_rights WHERE name = 'webphone_acc';
DELETE FROM acc_rights WHERE name = 'webphone_res';
DELETE FROM devicecodecs WHERE device_id IN (SELECT id FROM devices WHERE device_type = 'FAX');
INSERT INTO devicecodecs (device_id, codec_id, priority) (SELECT id, 1, 0 FROM devices WHERE device_type = "FAX");
INSERT INTO devicecodecs (device_id, codec_id, priority) (SELECT id, 2, 0 FROM devices WHERE device_type = "FAX");
UPDATE conflines SET value = 80 WHERE value = 50 AND name = 'GUI_HDD_utilisation' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'GUI_CPU_General_load' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 4 AND name = 'GUI_CPU_Loadstats' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'GUI_CPU_Ruby_process' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'GUI_CPU_asterisk_process' and owner_id = 0;
UPDATE conflines SET value = 80 WHERE value = 50 AND name = 'DB_HDD_utilisation' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'DB_CPU_General_load' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 4 AND name = 'DB_CPU_Loadstats' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'DB_CPU_MySQL_process' and owner_id = 0;
UPDATE conflines SET value = 0 WHERE value = 90 AND name = 'DB_CPU_asterisk_process' and owner_id = 0;
INSERT IGNORE INTO emails (name, subject, date_created, template, body, format, owner_id) SELECT 'warning_balance_email_local', 'Low Balance Warning', NOW(), 1, 'User <%= full_name %> will run out of balance soon.\n\nCurrent balance: <%= balance %> EUR', 'html', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM emails WHERE name = 'warning_balance_email_local');
UPDATE hangupcausecodes SET description = '<b>224 - Provider skipped because his rate is higher than users rate.</b><br>System saves system owner from taking loss from such call when self cost is higher when sell price.<br>Call Tracing is best tool to troubleshoot this problem. For more info consult online manual at wiki.kolmisoft.com<br>' WHERE code = 224 AND description = '<b>224 - Provider skipped because his rate is higher then users rate.</b><br>System saves system owner from taking loss from such call when self cost is higher when sell price.<br>Call Tracing is best tool to troubleshoot this problem. For more info consult online manual at wiki.kolmisoft.com<br>';
UPDATE emails SET body = 'Balance: <%= balance %> <%= currency %>' WHERE name = 'warning_balance_email' AND body = 'Balance: <%=balance %>';
UPDATE emails SET body = 'User <%= full_name %> will run out of balance soon.\n\nCurrent balance: <%= balance %> <%= currency %>' WHERE name = 'warning_balance_email_local' AND body = 'User <%= full_name %> will run out of balance soon.\n\nCurrent balance: <%= balance %> EUR';
# nasty fix for annoying problem during upgrade
UPDATE servers SET gui = 1, db = 1, core = 1 WHERE gui = 0 AND db = 0 AND core = 0; 
# ^^^^^^ WRITE ABOVE THIS LINE ^^^^^
# marking that DB is updated from script
INSERT INTO conflines (name, value) VALUES ('DB_Update_From_Script', 1);
