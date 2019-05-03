USE mysql;
UPDATE `mysql`.`proc` p SET definer = 'rgminternal@localhost' WHERE definer='@';

USE lilac;

-- CALL create_update_lilac_user_from_rgmweb('roger', 'Roger Rabbit', 'rrabbit@acme.com');
-- CALL delete_lilac_user_from_rgmweb('roger');
-- CALL create_update_lilac_group_from_rgmweb('all', 'all nagios contacts');
-- CALL delete_lilac_group_from_rgmweb('all');

DELIMITER //
    
DROP PROCEDURE IF EXISTS `create_update_lilac_user_from_rgmweb` //
CREATE PROCEDURE create_update_lilac_user_from_rgmweb (
    IN username VARCHAR(64),
    IN fullname VARCHAR(64),
    IN email VARCHAR(64)
)
COMMENT 'create or update a Nagios contact with default group and notification commands'
BEGIN
    DECLARE default_groupid INT;        -- default Nagios Contact Group to apply to user
    DECLARE notify_host_command INT;    -- default host notifier command
    DECLARE notify_service_command INT; -- default service notifier command
    DECLARE userid INT;
    
    --
    -- retrieve default Nagios Contact Group from lilac_configuration table
    --
   	SET default_groupid = (SELECT `value` FROM lilac_configuration WHERE `key` = 'rgm_user_default_group_id');
    IF default_groupid IS NULL THEN
		SET default_groupid = 2;
        INSERT INTO lilac_configuration (`key`, `value`) VALUES ('rgm_user_default_group_id', '2');
	END IF;
    --
    -- retrieve default host notifier command from lilac_configuration table
    --
	SET notify_host_command = (SELECT `value` FROM lilac_configuration WHERE `key` = 'rgm_user_default_notify_host_command');
    IF notify_host_command IS NULL THEN
		SET notify_host_command = 1;
        INSERT INTO lilac_configuration (`key`, `value`) VALUES ('rgm_user_default_notify_host_command', '1');
	END IF;
    --
    -- retrieve default service notifier command from lilac_configuration table
    --
	SET notify_service_command = (SELECT `value` FROM lilac_configuration WHERE `key` = 'rgm_user_default_notify_service_command');
    IF notify_service_command IS NULL THEN
		SET notify_service_command = 2;
        INSERT INTO lilac_configuration (`key`, `value`) VALUES ('rgm_user_default_notify_service_command', '2');
	END IF;
    
    -- 
    -- insert or update user
    --
    SET userid = (SELECT id FROM nagios_contact WHERE name = username);
    IF userid IS NULL THEN
        INSERT INTO nagios_contact SET
            name = username,
            alias = fullname,
            email = email,
            host_notifications_enabled = 1,
            service_notifications_enabled = 1,
            host_notification_period = 1,
            service_notification_period = 1,
            host_notification_on_down = 1,
            host_notification_on_unreachable = 1,
            host_notification_on_recovery = 1,
            host_notification_on_flapping = 1,
            host_notification_on_scheduled_downtime = 1,
            service_notification_on_warning = 1,
            service_notification_on_unknown = 1,
            service_notification_on_critical = 1,
            service_notification_on_recovery = 1,
            service_notification_on_flapping = 1,
            can_submit_commands = 1,
            retain_status_information = 1,
            retain_nonstatus_information = 1;
        SET userid = (SELECT id FROM nagios_contact WHERE name = username);
    ELSE
        IF fullname IS NOT NULL THEN UPDATE nagios_contact SET alias = fullname WHERE id = userid; END IF;
        IF email IS NOT NULL THEN UPDATE nagios_contact SET email = email WHERE id = userid; END IF;
    END IF;
  
    --
    -- affect notifier commands to user if needed
    --
    IF (SELECT id FROM nagios_contact_notification_command WHERE type = 'host' AND contact_id = userid AND command = notify_host_command) IS NULL THEN
        INSERT INTO nagios_contact_notification_command (contact_id, command,type) VALUES (userid, notify_host_command, 'host');
    END IF;
    IF (SELECT id FROM nagios_contact_notification_command WHERE type = 'service' AND contact_id = userid AND command = notify_service_command) IS NULL THEN
        INSERT INTO nagios_contact_notification_command (contact_id, command,type) VALUES (userid, notify_service_command, 'service');
    END IF;

    --
    -- affect default group to user if needed
    --
    IF (SELECT id FROM nagios_contact_group_member WHERE contact = userid AND contactgroup = default_groupid) IS NULL THEN
        INSERT INTO nagios_contact_group_member (contact, contactgroup) VALUES (userid, default_groupid);
    END IF;
END;
//


DROP PROCEDURE IF EXISTS `delete_lilac_user_from_rgmweb` //
CREATE PROCEDURE delete_lilac_user_from_rgmweb (
    IN username VARCHAR(64)
)
COMMENT 'Delete a Nagios contact and its related group and notification commands'
BEGIN
    DECLARE userid INT;
    --
    -- if an ID is found for the requested username:
    -- suppress it from groups, notification, and contact tables
    --
    SET userid = (SELECT id FROM nagios_contact WHERE name = username);
    IF userid IS NOT NULL THEN
        DELETE FROM nagios_contact_group_member WHERE contact = userid;
        DELETE FROM nagios_contact_notification_command WHERE contact_id = userid;
        DELETE FROM nagios_contact WHERE id = userid;
    END IF;
END;
//

    
DROP PROCEDURE IF EXISTS `create_update_lilac_group_from_rgmweb` //
CREATE PROCEDURE create_update_lilac_group_from_rgmweb (
    IN groupname VARCHAR(64),
    IN groupdesc VARCHAR(64)
)
COMMENT 'create or update a Nagios contact group'
BEGIN
    DECLARE groupid INT;
    
    IF (SELECT id FROM nagios_contact_group WHERE `name` = groupname) IS NULL THEN
		INSERT INTO nagios_contact_group (`name`, alias) VALUES (groupname, groupdesc);
	ELSE
		UPDATE nagios_contact_group SET alias = groupdesc WHERE `name` = groupname;
    END IF;
END;
//


DROP PROCEDURE IF EXISTS `delete_lilac_group_from_rgmweb` //
CREATE PROCEDURE delete_lilac_group_from_rgmweb (
    IN groupname VARCHAR(64)
)
COMMENT 'Delete a Nagios contact group and its related user associations'
BEGIN
    DECLARE groupid INT;
    SET groupid = (SELECT id FROM nagios_contact_group WHERE `name` = groupname);
    IF groupid IS NOT NULL THEN
        DELETE FROM nagios_contact_group_member WHERE contactgroup = groupid;
        DELETE FROM nagios_contact_group WHERE id = groupid;
        DELETE FROM nagios_escalation_contactgroup WHERE contactgroup = groupid;
        DELETE FROM nagios_host_contactgroup WHERE contactgroup = groupid;
        DELETE FROM nagios_service_contact_group_member WHERE contact_group = groupid;
    END IF;
END;
//
