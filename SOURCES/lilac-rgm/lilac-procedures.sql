
-- CALL create_lilac_user_from_rgmweb('roger', 'Roger Rabbit', 'rrabbit@acme.com');
-- CALL delete_lilac_user_from_rgmweb('roger');

USE lilac;
DELIMITER //
DROP PROCEDURE IF EXISTS `create_update_lilac_user_from_rgmweb` //
CREATE PROCEDURE create_update_lilac_user_from_rgmweb (
    IN username VARCHAR(64),
    IN fullname VARCHAR(64),
    IN email VARCHAR(64)
)
COMMENT 'create or update a Nagios contact with default group and notification commands'
BEGIN
    DECLARE defgroupid INT;             -- default Nagios Contact Group to apply to user
    DECLARE notify_host_command INT;    -- default host notifier command
    DECLARE notify_service_command INT; -- default service notifier command
    DECLARE userid INT;
    
    SET defgroupid = 2;				-- everybody group
    SET notify_host_command = 1;    -- event-brower-host command
    SET notify_service_command = 2;	-- event-brower-service command
    SET AUTOCOMMIT = 1;
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
    IF (SELECT id FROM nagios_contact_group_member WHERE contact = userid AND contactgroup = defgroupid) IS NULL THEN
        INSERT INTO nagios_contact_group_member (contact, contactgroup) VALUES (userid, defgroupid);
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
    SET userid = (SELECT id FROM nagios_contact WHERE name = username);
    IF userid IS NOT NULL THEN
        DELETE FROM nagios_contact_group_member WHERE contact = userid;
        DELETE FROM nagios_contact_notification_command WHERE contact_id = userid;
        DELETE FROM nagios_contact WHERE id = userid;
    END IF;
END;
//
