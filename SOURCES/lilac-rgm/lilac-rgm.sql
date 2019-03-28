-- RGM Lilac database dump
-- Generated with lilac_dumper.sh on Thu Mar 28 14:26:34 CET 2019 from env-test-sam-linux server
-- cmdline: lilac_dumper.sh -d /tmp/test.sql -c
--
-- Copyright SCC 2019

DROP TABLE IF EXISTS `autodiscovery_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autodiscovery_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `osvendor` varchar(255) DEFAULT NULL,
  `osfamily` varchar(255) DEFAULT NULL,
  `osgen` varchar(255) DEFAULT NULL,
  `host_template` int(11) NOT NULL,
  `proposed_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autodiscovery_device_FI_1` (`job_id`),
  KEY `autodiscovery_device_FI_2` (`host_template`),
  KEY `autodiscovery_device_FI_3` (`proposed_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='AutoDiscovery Found Device';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `autodiscovery_device_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autodiscovery_device_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `protocol` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `extrainfo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autodiscovery_device_service_FI_1` (`device_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='AutoDiscovery Found Service';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `autodiscovery_device_template_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autodiscovery_device_template_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `host_template` int(11) NOT NULL,
  `percent` float NOT NULL,
  `complexity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autodiscovery_device_template_match_FI_1` (`device_id`),
  KEY `autodiscovery_device_template_match_FI_2` (`host_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='AutoDiscovery Device Matched Template';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `autodiscovery_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autodiscovery_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `status_change_time` datetime DEFAULT NULL,
  `stats` text NOT NULL,
  `cmd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='AutoDiscovery Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `autodiscovery_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autodiscovery_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autodiscovery_log_entry_FI_1` (`job`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Export Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `export_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `status_change_time` datetime DEFAULT NULL,
  `stats` text NOT NULL,
  `cmd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Export Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `export_job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  `parent_type` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL,
  `user` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Actions history for differential export job';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `export_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `export_log_entry_FI_1` (`job`)
) ENGINE=MyISAM AUTO_INCREMENT=1414 DEFAULT CHARSET=utf8 COMMENT='Export Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `import_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `status_change_time` datetime DEFAULT NULL,
  `stats` text NOT NULL,
  `cmd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Import Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `import_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_log_entry_FI_1` (`job`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Import Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COMMENT='Language based labels';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lilac_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lilac_configuration` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Lilac Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_broker_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_broker_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Event Broker Modules';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_cgi_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_cgi_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physical_html_path` varchar(255) DEFAULT NULL,
  `url_html_path` varchar(255) DEFAULT NULL,
  `use_authentication` tinyint(4) DEFAULT NULL,
  `default_user_name` varchar(255) DEFAULT NULL,
  `authorized_for_system_information` varchar(2048) DEFAULT NULL,
  `authorized_for_system_commands` varchar(2048) DEFAULT NULL,
  `authorized_for_configuration_information` varchar(2048) DEFAULT NULL,
  `authorized_for_all_hosts` varchar(2048) DEFAULT NULL,
  `authorized_for_all_host_commands` varchar(2048) DEFAULT NULL,
  `authorized_for_all_services` varchar(2048) DEFAULT NULL,
  `authorized_for_all_service_commands` varchar(2048) DEFAULT NULL,
  `lock_author_names` tinyint(4) DEFAULT NULL,
  `statusmap_background_image` varchar(255) DEFAULT NULL,
  `default_statusmap_layout` tinyint(4) DEFAULT NULL,
  `statuswrl_include` varchar(255) DEFAULT NULL,
  `default_statuswrl_layout` tinyint(4) DEFAULT NULL,
  `refresh_rate` int(11) DEFAULT NULL,
  `host_unreachable_sound` varchar(255) DEFAULT NULL,
  `host_down_sound` varchar(255) DEFAULT NULL,
  `service_critical_sound` varchar(255) DEFAULT NULL,
  `service_warning_sound` varchar(255) DEFAULT NULL,
  `service_unknown_sound` varchar(255) DEFAULT NULL,
  `ping_syntax` varchar(255) DEFAULT NULL,
  `escape_html_tags` tinyint(4) DEFAULT NULL,
  `notes_url_target` varchar(255) DEFAULT NULL,
  `action_url_target` varchar(255) DEFAULT NULL,
  `enable_splunk_integration` tinyint(4) DEFAULT NULL,
  `splunk_url` varchar(255) DEFAULT NULL,
  `authorized_for_read_only` varchar(255) DEFAULT NULL,
  `color_transparency_index_r` int(11) DEFAULT NULL,
  `color_transparency_index_g` int(11) DEFAULT NULL,
  `color_transparency_index_b` int(11) DEFAULT NULL,
  `result_limit` int(11) DEFAULT NULL,
  `nagios_check_command` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CGI Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `line` text NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=960 DEFAULT CHARSET=utf8 COMMENT='Nagios Command';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pager` varchar(255) DEFAULT NULL,
  `host_notifications_enabled` tinyint(4) NOT NULL,
  `service_notifications_enabled` tinyint(4) NOT NULL,
  `host_notification_period` int(11) DEFAULT NULL,
  `service_notification_period` int(11) DEFAULT NULL,
  `host_notification_on_down` tinyint(4) NOT NULL,
  `host_notification_on_unreachable` tinyint(4) NOT NULL,
  `host_notification_on_recovery` tinyint(4) NOT NULL,
  `host_notification_on_flapping` tinyint(4) NOT NULL,
  `host_notification_on_scheduled_downtime` tinyint(4) NOT NULL,
  `service_notification_on_warning` tinyint(4) NOT NULL,
  `service_notification_on_unknown` tinyint(4) NOT NULL,
  `service_notification_on_critical` tinyint(4) NOT NULL,
  `service_notification_on_recovery` tinyint(4) NOT NULL,
  `service_notification_on_flapping` tinyint(4) NOT NULL,
  `can_submit_commands` tinyint(4) NOT NULL,
  `retain_status_information` tinyint(4) NOT NULL,
  `retain_nonstatus_information` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_contact_FI_1` (`host_notification_period`),
  KEY `nagios_contact_FI_2` (`service_notification_period`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_contact_address_FI_1` (`contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Contact Address';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact_custom_object_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_custom_object_var` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nagios_contact_custom_object_var_U_1` (`contact`,`var_name`),
  KEY `nagios_contact_custom_object_var_I_1` (`contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Custom Object Variables for Contact';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `contactgroup` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_contact_group_member_FI_1` (`contact`),
  KEY `nagios_contact_group_member_FI_2` (`contactgroup`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Member of a Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_contact_notification_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_notification_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `command` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_contact_notification_command_FI_1` (`contact_id`),
  KEY `nagios_contact_notification_command_FI_2` (`command`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Notification Command for a Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_template` int(11) DEFAULT NULL,
  `host` int(11) DEFAULT NULL,
  `service_template` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `hostgroup` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `execution_failure_criteria_up` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_down` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_unreachable` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_pending` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_ok` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_warning` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_unknown` tinyint(4) DEFAULT NULL,
  `execution_failure_criteria_critical` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_ok` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_warning` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_unknown` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_critical` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_pending` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_up` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_down` tinyint(4) DEFAULT NULL,
  `notification_failure_criteria_unreachable` tinyint(4) DEFAULT NULL,
  `inherits_parent` tinyint(4) DEFAULT NULL,
  `dependency_period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_dependency_FI_1` (`host_template`),
  KEY `nagios_dependency_FI_2` (`host`),
  KEY `nagios_dependency_FI_3` (`service_template`),
  KEY `nagios_dependency_FI_4` (`service`),
  KEY `nagios_dependency_FI_5` (`hostgroup`),
  KEY `nagios_dependency_FI_6` (`dependency_period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Dependency';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_dependency_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_dependency_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency` int(11) DEFAULT NULL,
  `target_host` int(11) DEFAULT NULL,
  `target_service` int(11) DEFAULT NULL,
  `target_hostgroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_dependency_target_FI_1` (`dependency`),
  KEY `nagios_dependency_target_FI_2` (`target_host`),
  KEY `nagios_dependency_target_FI_3` (`target_service`),
  KEY `nagios_dependency_target_FI_4` (`target_hostgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Targets for a Dependency';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_escalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `host_template` int(11) DEFAULT NULL,
  `host` int(11) DEFAULT NULL,
  `hostgroup` int(11) DEFAULT NULL,
  `service_template` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `first_notification` int(11) DEFAULT NULL,
  `last_notification` int(11) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `escalation_period` int(11) DEFAULT NULL,
  `escalation_options_up` tinyint(4) DEFAULT NULL,
  `escalation_options_down` tinyint(4) DEFAULT NULL,
  `escalation_options_unreachable` tinyint(4) DEFAULT NULL,
  `escalation_options_ok` tinyint(4) DEFAULT NULL,
  `escalation_options_warning` tinyint(4) DEFAULT NULL,
  `escalation_options_unknown` tinyint(4) DEFAULT NULL,
  `escalation_options_critical` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_escalation_FI_1` (`host_template`),
  KEY `nagios_escalation_FI_2` (`host`),
  KEY `nagios_escalation_FI_3` (`service_template`),
  KEY `nagios_escalation_FI_4` (`service`),
  KEY `nagios_escalation_FI_5` (`hostgroup`),
  KEY `nagios_escalation_FI_6` (`escalation_period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_escalation_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_escalation_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation` int(11) NOT NULL,
  `contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_escalation_contact_FI_1` (`escalation`),
  KEY `nagios_escalation_contact_FI_2` (`contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contact Group for Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_escalation_contactgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_escalation_contactgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation` int(11) NOT NULL,
  `contactgroup` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_escalation_contactgroup_FI_1` (`escalation`),
  KEY `nagios_escalation_contactgroup_FI_2` (`contactgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contact Group for Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `initial_state` varchar(1) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `check_command` int(11) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `first_notification_delay` int(11) DEFAULT NULL,
  `maximum_check_attempts` int(11) DEFAULT NULL,
  `check_interval` int(11) DEFAULT NULL,
  `passive_checks_enabled` tinyint(4) DEFAULT NULL,
  `check_period` int(11) DEFAULT NULL,
  `obsess_over_host` tinyint(4) DEFAULT NULL,
  `check_freshness` tinyint(4) DEFAULT NULL,
  `freshness_threshold` int(11) DEFAULT NULL,
  `active_checks_enabled` tinyint(4) DEFAULT NULL,
  `checks_enabled` tinyint(4) DEFAULT NULL,
  `event_handler` int(11) DEFAULT NULL,
  `event_handler_enabled` tinyint(4) DEFAULT NULL,
  `low_flap_threshold` int(11) DEFAULT NULL,
  `high_flap_threshold` int(11) DEFAULT NULL,
  `flap_detection_enabled` tinyint(4) DEFAULT NULL,
  `process_perf_data` tinyint(4) DEFAULT NULL,
  `retain_status_information` tinyint(4) DEFAULT NULL,
  `retain_nonstatus_information` tinyint(4) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `notification_period` int(11) DEFAULT NULL,
  `notifications_enabled` tinyint(4) DEFAULT NULL,
  `notification_on_down` tinyint(4) DEFAULT NULL,
  `notification_on_unreachable` tinyint(4) DEFAULT NULL,
  `notification_on_recovery` tinyint(4) DEFAULT NULL,
  `notification_on_flapping` tinyint(4) DEFAULT NULL,
  `notification_on_scheduled_downtime` tinyint(4) DEFAULT NULL,
  `stalking_on_up` tinyint(4) DEFAULT NULL,
  `stalking_on_down` tinyint(4) DEFAULT NULL,
  `stalking_on_unreachable` tinyint(4) DEFAULT NULL,
  `failure_prediction_enabled` tinyint(4) DEFAULT NULL,
  `flap_detection_on_up` tinyint(4) DEFAULT NULL,
  `flap_detection_on_down` tinyint(4) DEFAULT NULL,
  `flap_detection_on_unreachable` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `icon_image_alt` varchar(255) DEFAULT NULL,
  `vrml_image` varchar(255) DEFAULT NULL,
  `statusmap_image` varchar(255) DEFAULT NULL,
  `two_d_coords` varchar(255) DEFAULT NULL,
  `three_d_coords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_FI_1` (`check_command`),
  KEY `nagios_host_FI_2` (`event_handler`),
  KEY `nagios_host_FI_3` (`check_period`),
  KEY `nagios_host_FI_4` (`notification_period`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Nagios Host';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_check_command_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_check_command_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` int(11) DEFAULT NULL,
  `host_template` int(11) DEFAULT NULL,
  `parameter` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_check_command_parameter_FI_1` (`host`),
  KEY `nagios_host_check_command_parameter_FI_2` (`host_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Parameter for Host Check Command';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_contact_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_contact_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` int(11) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_contact_member_FI_1` (`host`),
  KEY `nagios_host_contact_member_FI_2` (`template`),
  KEY `nagios_host_contact_member_FI_3` (`contact`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Contacts which belong to host templates or hosts';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_contactgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_contactgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` int(11) DEFAULT NULL,
  `host_template` int(11) DEFAULT NULL,
  `contactgroup` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_contactgroup_FI_1` (`host`),
  KEY `nagios_host_contactgroup_FI_2` (`host_template`),
  KEY `nagios_host_contactgroup_FI_3` (`contactgroup`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Contact Group for Host';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_custom_object_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_custom_object_var` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` int(11) DEFAULT NULL,
  `host_template` int(11) DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nagios_host_custom_object_var_U_1` (`host`,`var_name`),
  UNIQUE KEY `nagios_host_custom_object_var_U_2` (`host_template`,`var_name`),
  KEY `nagios_host_custom_object_var_I_1` (`host`),
  KEY `nagios_host_custom_object_var_I_2` (`host_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Custom Object Variables for Host';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_host` int(11) DEFAULT NULL,
  `child_host_template` int(11) DEFAULT NULL,
  `parent_host` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_parent_FI_1` (`child_host`),
  KEY `nagios_host_parent_FI_2` (`parent_host`),
  KEY `nagios_host_parent_FI_3` (`child_host_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Additional Host Parent Relationship';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `initial_state` varchar(1) DEFAULT NULL,
  `check_command` int(11) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `first_notification_delay` int(11) DEFAULT NULL,
  `maximum_check_attempts` int(11) DEFAULT NULL,
  `check_interval` int(11) DEFAULT NULL,
  `passive_checks_enabled` tinyint(4) DEFAULT NULL,
  `check_period` int(11) DEFAULT NULL,
  `obsess_over_host` tinyint(4) DEFAULT NULL,
  `check_freshness` tinyint(4) DEFAULT NULL,
  `freshness_threshold` int(11) DEFAULT NULL,
  `active_checks_enabled` tinyint(4) DEFAULT NULL,
  `checks_enabled` tinyint(4) DEFAULT NULL,
  `event_handler` int(11) DEFAULT NULL,
  `event_handler_enabled` tinyint(4) DEFAULT NULL,
  `low_flap_threshold` int(11) DEFAULT NULL,
  `high_flap_threshold` int(11) DEFAULT NULL,
  `flap_detection_enabled` tinyint(4) DEFAULT NULL,
  `process_perf_data` tinyint(4) DEFAULT NULL,
  `retain_status_information` tinyint(4) DEFAULT NULL,
  `retain_nonstatus_information` tinyint(4) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `notification_period` int(11) DEFAULT NULL,
  `notifications_enabled` tinyint(4) DEFAULT NULL,
  `notification_on_down` tinyint(4) DEFAULT NULL,
  `notification_on_unreachable` tinyint(4) DEFAULT NULL,
  `notification_on_recovery` tinyint(4) DEFAULT NULL,
  `notification_on_flapping` tinyint(4) DEFAULT NULL,
  `notification_on_scheduled_downtime` tinyint(4) DEFAULT NULL,
  `stalking_on_up` tinyint(4) DEFAULT NULL,
  `stalking_on_down` tinyint(4) DEFAULT NULL,
  `stalking_on_unreachable` tinyint(4) DEFAULT NULL,
  `failure_prediction_enabled` tinyint(4) DEFAULT NULL,
  `flap_detection_on_up` tinyint(4) DEFAULT NULL,
  `flap_detection_on_down` tinyint(4) DEFAULT NULL,
  `flap_detection_on_unreachable` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `icon_image_alt` varchar(255) DEFAULT NULL,
  `vrml_image` varchar(255) DEFAULT NULL,
  `statusmap_image` varchar(255) DEFAULT NULL,
  `two_d_coords` varchar(255) DEFAULT NULL,
  `three_d_coords` varchar(255) DEFAULT NULL,
  `autodiscovery_address_filter` varchar(255) DEFAULT NULL,
  `autodiscovery_hostname_filter` varchar(255) DEFAULT NULL,
  `autodiscovery_os_family_filter` varchar(255) DEFAULT NULL,
  `autodiscovery_os_generation_filter` varchar(255) DEFAULT NULL,
  `autodiscovery_os_vendor_filter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_template_FI_1` (`check_command`),
  KEY `nagios_host_template_FI_2` (`event_handler`),
  KEY `nagios_host_template_FI_3` (`check_period`),
  KEY `nagios_host_template_FI_4` (`notification_period`)
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='Nagios Host Template';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_template_autodiscovery_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_template_autodiscovery_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_template` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `extra_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_template_autodiscovery_service_FI_1` (`host_template`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_host_template_inheritance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_host_template_inheritance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_host` int(11) DEFAULT NULL,
  `source_template` int(11) DEFAULT NULL,
  `target_template` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_host_template_inheritance_FI_1` (`source_host`),
  KEY `nagios_host_template_inheritance_FI_2` (`source_template`),
  KEY `nagios_host_template_inheritance_FI_3` (`target_template`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Nagios Host Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_hostgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_hostgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='Nagios Hostgroup';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_hostgroup_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_hostgroup_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` int(11) DEFAULT NULL,
  `host_template` int(11) DEFAULT NULL,
  `hostgroup` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_hostgroup_membership_FI_1` (`host`),
  KEY `nagios_hostgroup_membership_FI_2` (`host_template`),
  KEY `nagios_hostgroup_membership_FI_3` (`hostgroup`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Hostgroup Membership for Host';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_main_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_main_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_dir` varchar(255) DEFAULT NULL,
  `log_file` varchar(255) DEFAULT NULL,
  `temp_file` varchar(255) DEFAULT NULL,
  `status_file` varchar(255) DEFAULT NULL,
  `status_update_interval` int(11) DEFAULT NULL,
  `nagios_user` varchar(255) DEFAULT NULL,
  `nagios_group` varchar(255) DEFAULT NULL,
  `enable_notifications` tinyint(4) DEFAULT NULL,
  `execute_service_checks` tinyint(4) DEFAULT NULL,
  `accept_passive_service_checks` tinyint(4) DEFAULT NULL,
  `enable_event_handlers` tinyint(4) DEFAULT NULL,
  `log_rotation_method` char(1) DEFAULT NULL,
  `log_archive_path` varchar(255) DEFAULT NULL,
  `check_external_commands` tinyint(4) DEFAULT NULL,
  `command_check_interval` varchar(255) DEFAULT NULL,
  `command_file` varchar(255) DEFAULT NULL,
  `lock_file` varchar(255) DEFAULT NULL,
  `retain_state_information` tinyint(4) DEFAULT NULL,
  `state_retention_file` varchar(255) DEFAULT NULL,
  `retention_update_interval` int(11) DEFAULT NULL,
  `use_retained_program_state` tinyint(4) DEFAULT NULL,
  `use_syslog` tinyint(4) DEFAULT NULL,
  `log_notifications` tinyint(4) DEFAULT NULL,
  `log_service_retries` tinyint(4) DEFAULT NULL,
  `log_host_retries` tinyint(4) DEFAULT NULL,
  `log_event_handlers` tinyint(4) DEFAULT NULL,
  `log_initial_states` tinyint(4) DEFAULT NULL,
  `log_external_commands` tinyint(4) DEFAULT NULL,
  `log_passive_checks` tinyint(4) DEFAULT NULL,
  `global_host_event_handler` int(11) DEFAULT NULL,
  `global_service_event_handler` int(11) DEFAULT NULL,
  `external_command_buffer_slots` int(11) DEFAULT NULL,
  `sleep_time` float DEFAULT NULL,
  `service_interleave_factor` char(1) DEFAULT NULL,
  `max_concurrent_checks` int(11) DEFAULT NULL,
  `service_reaper_frequency` int(11) DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `use_aggressive_host_checking` tinyint(4) DEFAULT NULL,
  `enable_flap_detection` tinyint(4) DEFAULT NULL,
  `low_service_flap_threshold` float DEFAULT NULL,
  `high_service_flap_threshold` float DEFAULT NULL,
  `low_host_flap_threshold` float DEFAULT NULL,
  `high_host_flap_threshold` float DEFAULT NULL,
  `soft_state_dependencies` tinyint(4) DEFAULT NULL,
  `service_check_timeout` int(11) DEFAULT NULL,
  `host_check_timeout` int(11) DEFAULT NULL,
  `event_handler_timeout` int(11) DEFAULT NULL,
  `notification_timeout` int(11) DEFAULT NULL,
  `ocsp_timeout` int(11) DEFAULT NULL,
  `ohcp_timeout` int(11) DEFAULT NULL,
  `perfdata_timeout` int(11) DEFAULT NULL,
  `obsess_over_services` tinyint(4) DEFAULT NULL,
  `ocsp_command` int(11) DEFAULT NULL,
  `process_performance_data` tinyint(4) DEFAULT NULL,
  `check_for_orphaned_services` tinyint(4) DEFAULT NULL,
  `check_service_freshness` tinyint(4) DEFAULT NULL,
  `freshness_check_interval` int(11) DEFAULT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `illegal_object_name_chars` varchar(255) DEFAULT NULL,
  `illegal_macro_output_chars` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_pager` varchar(255) DEFAULT NULL,
  `execute_host_checks` tinyint(4) DEFAULT NULL,
  `service_inter_check_delay_method` varchar(255) DEFAULT NULL,
  `use_retained_scheduling_info` tinyint(4) DEFAULT NULL,
  `accept_passive_host_checks` tinyint(4) DEFAULT NULL,
  `max_service_check_spread` int(11) DEFAULT NULL,
  `host_inter_check_delay_method` varchar(255) DEFAULT NULL,
  `max_host_check_spread` int(11) DEFAULT NULL,
  `auto_reschedule_checks` tinyint(4) DEFAULT NULL,
  `auto_rescheduling_interval` int(11) DEFAULT NULL,
  `auto_rescheduling_window` int(11) DEFAULT NULL,
  `ochp_timeout` int(11) DEFAULT NULL,
  `obsess_over_hosts` tinyint(4) DEFAULT NULL,
  `ochp_command` int(11) DEFAULT NULL,
  `check_host_freshness` tinyint(4) DEFAULT NULL,
  `host_freshness_check_interval` int(11) DEFAULT NULL,
  `service_freshness_check_interval` int(11) DEFAULT NULL,
  `use_regexp_matching` tinyint(4) DEFAULT NULL,
  `use_true_regexp_matching` tinyint(4) DEFAULT NULL,
  `event_broker_options` varchar(255) DEFAULT NULL,
  `daemon_dumps_core` tinyint(4) DEFAULT NULL,
  `host_perfdata_command` int(11) DEFAULT NULL,
  `service_perfdata_command` int(11) DEFAULT NULL,
  `host_perfdata_file` varchar(255) DEFAULT NULL,
  `host_perfdata_file_template` varchar(500) DEFAULT NULL,
  `service_perfdata_file` varchar(255) DEFAULT NULL,
  `service_perfdata_file_template` varchar(500) DEFAULT NULL,
  `host_perfdata_file_mode` char(1) DEFAULT NULL,
  `service_perfdata_file_mode` char(1) DEFAULT NULL,
  `host_perfdata_file_processing_command` int(11) DEFAULT NULL,
  `service_perfdata_file_processing_command` int(11) DEFAULT NULL,
  `host_perfdata_file_processing_interval` int(11) DEFAULT NULL,
  `service_perfdata_file_processing_interval` int(11) DEFAULT NULL,
  `object_cache_file` varchar(255) DEFAULT NULL,
  `precached_object_file` varchar(255) DEFAULT NULL,
  `retained_host_attribute_mask` int(11) DEFAULT NULL,
  `retained_service_attribute_mask` int(11) DEFAULT NULL,
  `retained_process_host_attribute_mask` int(11) DEFAULT NULL,
  `retained_process_service_attribute_mask` int(11) DEFAULT NULL,
  `retained_contact_host_attribute_mask` int(11) DEFAULT NULL,
  `retained_contact_service_attribute_mask` int(11) DEFAULT NULL,
  `check_result_reaper_frequency` int(11) DEFAULT NULL,
  `max_check_result_reaper_time` int(11) DEFAULT NULL,
  `check_result_path` varchar(255) DEFAULT NULL,
  `max_check_result_file_age` int(11) DEFAULT NULL,
  `translate_passive_host_checks` tinyint(4) DEFAULT NULL,
  `passive_host_checks_are_soft` tinyint(4) DEFAULT NULL,
  `enable_predictive_host_dependency_checks` tinyint(4) DEFAULT NULL,
  `enable_predictive_service_dependency_checks` tinyint(4) DEFAULT NULL,
  `cached_host_check_horizon` int(11) DEFAULT NULL,
  `cached_service_check_horizon` int(11) DEFAULT NULL,
  `use_large_installation_tweaks` tinyint(4) DEFAULT NULL,
  `free_child_process_memory` tinyint(4) DEFAULT NULL,
  `child_processes_fork_twice` tinyint(4) DEFAULT NULL,
  `enable_environment_macros` tinyint(4) DEFAULT NULL,
  `additional_freshness_latency` int(11) DEFAULT NULL,
  `enable_embedded_perl` tinyint(4) DEFAULT NULL,
  `use_embedded_perl_implicitly` tinyint(4) DEFAULT NULL,
  `p1_file` varchar(255) DEFAULT NULL,
  `use_timezone` varchar(255) DEFAULT NULL,
  `debug_file` varchar(255) DEFAULT NULL,
  `debug_level` int(11) DEFAULT NULL,
  `debug_verbosity` int(11) DEFAULT NULL,
  `max_debug_file_size` int(11) DEFAULT NULL,
  `temp_path` varchar(255) NOT NULL,
  `check_for_updates` tinyint(4) NOT NULL,
  `check_for_orphaned_hosts` tinyint(4) NOT NULL,
  `bare_update_check` tinyint(4) NOT NULL,
  `log_current_states` tinyint(4) DEFAULT NULL,
  `check_workers` int(11) DEFAULT NULL,
  `query_socket` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_main_configuration_FI_1` (`ocsp_command`),
  KEY `nagios_main_configuration_FI_2` (`ochp_command`),
  KEY `nagios_main_configuration_FI_3` (`host_perfdata_command`),
  KEY `nagios_main_configuration_FI_4` (`service_perfdata_command`),
  KEY `nagios_main_configuration_FI_5` (`host_perfdata_file_processing_command`),
  KEY `nagios_main_configuration_FI_6` (`service_perfdata_file_processing_command`),
  KEY `nagios_main_configuration_FI_7` (`global_service_event_handler`),
  KEY `nagios_main_configuration_FI_8` (`global_host_event_handler`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Nagios Main Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1` varchar(255) DEFAULT NULL,
  `user2` varchar(255) DEFAULT NULL,
  `user3` varchar(255) DEFAULT NULL,
  `user4` varchar(255) DEFAULT NULL,
  `user5` varchar(255) DEFAULT NULL,
  `user6` varchar(255) DEFAULT NULL,
  `user7` varchar(255) DEFAULT NULL,
  `user8` varchar(255) DEFAULT NULL,
  `user9` varchar(255) DEFAULT NULL,
  `user10` varchar(255) DEFAULT NULL,
  `user11` varchar(255) DEFAULT NULL,
  `user12` varchar(255) DEFAULT NULL,
  `user13` varchar(255) DEFAULT NULL,
  `user14` varchar(255) DEFAULT NULL,
  `user15` varchar(255) DEFAULT NULL,
  `user16` varchar(255) DEFAULT NULL,
  `user17` varchar(255) DEFAULT NULL,
  `user18` varchar(255) DEFAULT NULL,
  `user19` varchar(255) DEFAULT NULL,
  `user20` varchar(255) DEFAULT NULL,
  `user21` varchar(255) DEFAULT NULL,
  `user22` varchar(255) DEFAULT NULL,
  `user23` varchar(255) DEFAULT NULL,
  `user24` varchar(255) DEFAULT NULL,
  `user25` varchar(255) DEFAULT NULL,
  `user26` varchar(255) DEFAULT NULL,
  `user27` varchar(255) DEFAULT NULL,
  `user28` varchar(255) DEFAULT NULL,
  `user29` varchar(255) DEFAULT NULL,
  `user30` varchar(255) DEFAULT NULL,
  `user31` varchar(255) DEFAULT NULL,
  `user32` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Nagios Resource';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `host` int(11) DEFAULT NULL,
  `host_template` int(11) DEFAULT NULL,
  `hostgroup` int(11) DEFAULT NULL,
  `initial_state` varchar(1) DEFAULT NULL,
  `is_volatile` tinyint(4) DEFAULT NULL,
  `check_command` int(11) DEFAULT NULL,
  `maximum_check_attempts` int(11) DEFAULT NULL,
  `normal_check_interval` int(11) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `first_notification_delay` int(11) DEFAULT NULL,
  `active_checks_enabled` tinyint(4) DEFAULT NULL,
  `passive_checks_enabled` tinyint(4) DEFAULT NULL,
  `check_period` int(11) DEFAULT NULL,
  `parallelize_check` tinyint(4) DEFAULT NULL,
  `obsess_over_service` tinyint(4) DEFAULT NULL,
  `check_freshness` tinyint(4) DEFAULT NULL,
  `freshness_threshold` int(11) DEFAULT NULL,
  `event_handler` int(11) DEFAULT NULL,
  `event_handler_enabled` tinyint(4) DEFAULT NULL,
  `low_flap_threshold` int(11) DEFAULT NULL,
  `high_flap_threshold` int(11) DEFAULT NULL,
  `flap_detection_enabled` tinyint(4) DEFAULT NULL,
  `flap_detection_on_ok` tinyint(4) DEFAULT NULL,
  `flap_detection_on_warning` tinyint(4) DEFAULT NULL,
  `flap_detection_on_critical` tinyint(4) DEFAULT NULL,
  `flap_detection_on_unknown` tinyint(4) DEFAULT NULL,
  `process_perf_data` tinyint(4) DEFAULT NULL,
  `retain_status_information` tinyint(4) DEFAULT NULL,
  `retain_nonstatus_information` tinyint(4) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `notification_period` int(11) DEFAULT NULL,
  `notification_on_warning` tinyint(4) DEFAULT NULL,
  `notification_on_unknown` tinyint(4) DEFAULT NULL,
  `notification_on_critical` tinyint(4) DEFAULT NULL,
  `notification_on_recovery` tinyint(4) DEFAULT NULL,
  `notification_on_flapping` tinyint(4) DEFAULT NULL,
  `notification_on_scheduled_downtime` tinyint(4) DEFAULT NULL,
  `notifications_enabled` tinyint(4) DEFAULT NULL,
  `stalking_on_ok` tinyint(4) DEFAULT NULL,
  `stalking_on_warning` tinyint(4) DEFAULT NULL,
  `stalking_on_unknown` tinyint(4) DEFAULT NULL,
  `stalking_on_critical` tinyint(4) DEFAULT NULL,
  `failure_prediction_enabled` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `icon_image_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_FI_1` (`host`),
  KEY `nagios_service_FI_2` (`host_template`),
  KEY `nagios_service_FI_3` (`hostgroup`),
  KEY `nagios_service_FI_4` (`check_command`),
  KEY `nagios_service_FI_5` (`event_handler`),
  KEY `nagios_service_FI_6` (`check_period`),
  KEY `nagios_service_FI_7` (`notification_period`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Nagios Service';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_check_command_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_check_command_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_check_command_parameter_FI_1` (`service`),
  KEY `nagios_service_check_command_parameter_FI_2` (`template`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Parameter for check command for service or service template';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_contact_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_contact_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `contact_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_contact_group_member_FI_1` (`service`),
  KEY `nagios_service_contact_group_member_FI_2` (`template`),
  KEY `nagios_service_contact_group_member_FI_3` (`contact_group`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_contact_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_contact_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_contact_member_FI_1` (`service`),
  KEY `nagios_service_contact_member_FI_2` (`template`),
  KEY `nagios_service_contact_member_FI_3` (`contact`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Contacts which belong to service templates or services';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_custom_object_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_custom_object_var` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `service_template` int(11) DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nagios_service_custom_object_var_U_1` (`service`,`var_name`),
  UNIQUE KEY `nagios_service_custom_object_var_U_2` (`service_template`,`var_name`),
  KEY `nagios_service_custom_object_var_I_1` (`service`),
  KEY `nagios_service_custom_object_var_I_2` (`service_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Custom Object Variables for Service';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `service_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_group_member_FI_1` (`service`),
  KEY `nagios_service_group_member_FI_2` (`template`),
  KEY `nagios_service_group_member_FI_3` (`service_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `initial_state` varchar(1) DEFAULT NULL,
  `is_volatile` tinyint(4) DEFAULT NULL,
  `check_command` int(11) DEFAULT NULL,
  `maximum_check_attempts` int(11) DEFAULT NULL,
  `normal_check_interval` int(11) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `first_notification_delay` int(11) DEFAULT NULL,
  `active_checks_enabled` tinyint(4) DEFAULT NULL,
  `passive_checks_enabled` tinyint(4) DEFAULT NULL,
  `check_period` int(11) DEFAULT NULL,
  `parallelize_check` tinyint(4) DEFAULT NULL,
  `obsess_over_service` tinyint(4) DEFAULT NULL,
  `check_freshness` tinyint(4) DEFAULT NULL,
  `freshness_threshold` int(11) DEFAULT NULL,
  `event_handler` int(11) DEFAULT NULL,
  `event_handler_enabled` tinyint(4) DEFAULT NULL,
  `low_flap_threshold` int(11) DEFAULT NULL,
  `high_flap_threshold` int(11) DEFAULT NULL,
  `flap_detection_enabled` tinyint(4) DEFAULT NULL,
  `flap_detection_on_ok` tinyint(4) DEFAULT NULL,
  `flap_detection_on_warning` tinyint(4) DEFAULT NULL,
  `flap_detection_on_critical` tinyint(4) DEFAULT NULL,
  `flap_detection_on_unknown` tinyint(4) DEFAULT NULL,
  `process_perf_data` tinyint(4) DEFAULT NULL,
  `retain_status_information` tinyint(4) DEFAULT NULL,
  `retain_nonstatus_information` tinyint(4) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `notification_period` int(11) DEFAULT NULL,
  `notification_on_warning` tinyint(4) DEFAULT NULL,
  `notification_on_unknown` tinyint(4) DEFAULT NULL,
  `notification_on_critical` tinyint(4) DEFAULT NULL,
  `notification_on_recovery` tinyint(4) DEFAULT NULL,
  `notification_on_flapping` tinyint(4) DEFAULT NULL,
  `notification_on_scheduled_downtime` tinyint(4) DEFAULT NULL,
  `notifications_enabled` tinyint(4) DEFAULT NULL,
  `stalking_on_ok` tinyint(4) DEFAULT NULL,
  `stalking_on_warning` tinyint(4) DEFAULT NULL,
  `stalking_on_unknown` tinyint(4) DEFAULT NULL,
  `stalking_on_critical` tinyint(4) DEFAULT NULL,
  `failure_prediction_enabled` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_url` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `icon_image_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_template_FI_1` (`check_command`),
  KEY `nagios_service_template_FI_2` (`event_handler`),
  KEY `nagios_service_template_FI_3` (`check_period`),
  KEY `nagios_service_template_FI_4` (`notification_period`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Nagios Service Template';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_service_template_inheritance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_service_template_inheritance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_service` int(11) DEFAULT NULL,
  `source_template` int(11) DEFAULT NULL,
  `target_template` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_service_template_inheritance_FI_1` (`source_service`),
  KEY `nagios_service_template_inheritance_FI_2` (`source_template`),
  KEY `nagios_service_template_inheritance_FI_3` (`target_template`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Nagios service Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_timeperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_timeperiod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Nagios Timeperiods';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_timeperiod_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_timeperiod_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_id` int(11) DEFAULT NULL,
  `entry` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_timeperiod_entry_FI_1` (`timeperiod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Time Period Entries';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nagios_timeperiod_exclude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_timeperiod_exclude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_id` int(11) DEFAULT NULL,
  `excluded_timeperiod` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_timeperiod_exclude_FI_1` (`timeperiod_id`),
  KEY `nagios_timeperiod_exclude_FI_2` (`excluded_timeperiod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time Period Excludes';
/*!40101 SET character_set_client = @saved_cs_client */;
