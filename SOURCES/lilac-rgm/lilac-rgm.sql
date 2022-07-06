-- RGM Lilac database dump
-- Generated with lilac_dumper.sh on mer. juil.  6 10:42:52 CEST 2022 from RGM server
-- cmdline: lilac_dumper.sh -c -r -d /root/lilacdump06072022.sql
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Export Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `export_job` VALUES (1,'Nagios Export','Generates Nagios 3 compatible configuration files (full export)','O:12:\"ExportConfig\":2:{s:24:\"\0ExportConfig\0configVars\";a:5:{s:15:\"backup_existing\";b:1;s:15:\"preflight_check\";b:1;s:14:\"restart_nagios\";b:1;s:11:\"nagios_path\";s:60:\"/srv/rgm/nagios/bin/nagios -v /tmp/lilac-export-1/nagios.cfg\";s:15:\"restart_command\";s:43:\"/usr/bin/sudo /bin/systemctl restart nagios\";}s:25:\"\0ExportConfig\0engineClass\";s:18:\"NagiosExportEngine\";}','2022-05-13 16:59:29','2022-05-13 16:59:30','Complete',4,'2022-05-13 16:59:30','O:11:\"ImportStats\":2:{s:18:\"\0ImportStats\0stats\";a:0:{}s:16:\"\0ImportStats\0job\";N;}','start');
INSERT INTO `export_job` VALUES (2,'Incremental Nagios Export','Generates Nagios 3/4 compatible configuration files (incremental export)','O:12:\"ExportConfig\":2:{s:24:\"\0ExportConfig\0configVars\";a:9:{s:12:\"export_debug\";b:0;s:11:\"export_diff\";b:1;s:10:\"export_dep\";b:1;s:10:\"export_esc\";b:0;s:15:\"backup_existing\";b:1;s:15:\"preflight_check\";b:1;s:14:\"restart_nagios\";b:1;s:11:\"nagios_path\";s:60:\"/srv/rgm/nagios/bin/nagios -v /tmp/lilac-export-2/nagios.cfg\";s:15:\"restart_command\";s:43:\"/usr/bin/sudo /bin/systemctl restart nagios\";}s:25:\"\0ExportConfig\0engineClass\";s:18:\"NagiosExportEngine\";}','2020-07-10 14:49:03','2020-07-10 14:49:06','Complete',4,'2020-07-10 14:49:06','O:11:\"ImportStats\":2:{s:18:\"\0ImportStats\0stats\";a:0:{}s:16:\"\0ImportStats\0job\";N;}','start');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Export Job Entry';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Language based labels';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `label` VALUES (1,'nagios_cgi_desc','physical_html_path','This is the physical path where the HTML files for Nagios are kept on your workstation or server. Nagios assumes that the documentation and images files (used by the CGIs) are stored in subdirectories called docs/ and images/, respectively.');
INSERT INTO `label` VALUES (2,'nagios_cgi_desc','url_html_path','If, when accessing Nagios via a web browser, you point to an URL like http://www.myhost.com/nagios, this value should be /nagios. Basically, its the path portion of the URL that is used to access the Nagios HTML pages.');
INSERT INTO `label` VALUES (3,'nagios_cgi_desc','use_authentication','This option controls whether or not the CGIs will use the authentication and authorization functionality when determining what information and commands users have access to. I would strongly suggest that you use the authentication functionality for the CGIs. If you decide not to use authentication, make sure to remove the command CGI to prevent unauthorized users from issuing commands to Nagios. The CGI will not issue commands to Nagios if authentication is disabled, but I would suggest removing it altogether just to be on the safe side.');
INSERT INTO `label` VALUES (4,'nagios_cgi_desc','default_user_name','Setting this variable will define a default username that can access the CGIs. This allows people within a secure domain (i.e., behind a firewall) to access the CGIs without necessarily having to authenticate to the web server. You may want to use this to avoid having to use basic authentication if you are not using a secure server, as basic authentication transmits passwords in clear text over the Internet.<br />\r\n<br />\r\n<b>Important:</b> Do not define a default username unless you are running a secure web server and are sure that everyone who has access to the CGIs has been authenticated in some manner! If you define this variable, anyone who has not authenticated to the web server will inherit all rights you assign to this user! ');
INSERT INTO `label` VALUES (5,'nagios_cgi_desc','authorized_for_system_information','This is a comma-delimited list of names of authenticated users who can view system/process information in the extended information CGI. Users in this list are not automatically authorized to issue system/process commands. If you want users to be able to issue system/process commands as well, you must add them to the authorized_for_system_commands variable.');
INSERT INTO `label` VALUES (6,'nagios_cgi_desc','authorized_for_system_commands','This is a comma-delimited list of names of authenticated users who can issue system/process commands via the command CGI. Users in this list are not automatically authorized to view system/process information. If you want users to be able to view system/process information as well, you must add them to the authorized_for_system_information variable. ');
INSERT INTO `label` VALUES (7,'nagios_cgi_desc','authorized_for_configuration_information','This is a comma-delimited list of names of authenticated users who can view configuration information in the configuration CGI. Users in this list can view information on all configured hosts, host groups, services, contacts, contact groups, time periods, and commands.');
INSERT INTO `label` VALUES (8,'nagios_cgi_desc','authorized_for_all_hosts','This is a comma-delimited list of names of authenticated users who can view status and configuration information for all hosts. Users in this list are also automatically authorized to view information for all services. Users in this list are not automatically authorized to issue commands for all hosts or services. If you want users able to issue commands for all hosts and services as well, you must add them to the authorized_for_all_host_commands variable.');
INSERT INTO `label` VALUES (9,'nagios_cgi_desc','authorized_for_all_host_commands','This is a comma-delimited list of names of authenticated users who can issue commands for all hosts via the command CGI. Users in this list are also automatically authorized to issue commands for all services. Users in this list are not automatically authorized to view status or configuration information for all hosts or services. If you want users able to view status and configuration information for all hosts and services as well, you must add them to the authorized_for_all_hosts variable.');
INSERT INTO `label` VALUES (10,'nagios_cgi_desc','authorized_for_all_services','This is a comma-delimited list of names of authenticated users who can view status and configuration information for all services. Users in this list are not automatically authorized to view information for all hosts. Users in this list are not automatically authorized to issue commands for all services. If you want users able to issue commands for all services as well, you must add them to the authorized_for_all_service_commands variable.');
INSERT INTO `label` VALUES (11,'nagios_cgi_desc','authorized_for_all_service_commands','This is a comma-delimited list of names of authenticated users who can issue commands for all services via the command CGI. Users in this list are not automatically authorized to issue commands for all hosts. Users in this list are not automatically authorized to view status or configuration information for all hosts. If you want users able to view status and configuration information for all services as well, you must add them to the authorized_for_all_services variable.');
INSERT INTO `label` VALUES (12,'nagios_cgi_desc','statusmap_background_image','This option allows you to specify an image to be used as a background in the statusmap CGI. It is assumed that the image resides in the HTML images path (i.e. /usr/local/nagios/share/images). This path is automatically determined by appending \"/images\" to the path specified by the physical_html_path directive. Note: The image file can be in GIF, JPEG, PNG, or GD2 format. However, GD2 format (preferably in uncompressed format) is recommended, as it will reduce the CPU load when the CGI generates the map image.');
INSERT INTO `label` VALUES (13,'nagios_cgi_desc','default_statusmap_layout','This option allows you to specify the default layout method used by the statusmap CGI.');
INSERT INTO `label` VALUES (14,'nagios_cgi_desc','statuswrl_include','This option allows you to include your own objects in the generated VRML world. It is assumed that the file resides in the path specified by the physical_html_path directive. Note: This file must be a fully qualified VRML world (i.e. you can view it by itself in a VRML browser).');
INSERT INTO `label` VALUES (15,'nagios_cgi_desc','default_statuswrl_layout','This option allows you to specify the default layout method used by the statuswrl CGI.');
INSERT INTO `label` VALUES (16,'nagios_cgi_desc','refresh_rate','This option allows you to specify the number of seconds between page refreshes for the status, statusmap, and extinfo CGIs.');
INSERT INTO `label` VALUES (17,'nagios_cgi_desc','host_unreachable_sound','These options allow you to specify an audio file that should be played in your browser if there are problems when you are viewing the status CGI. If there are problems, the audio file for the most critical type of problem will be played. The most critical type of problem is on or more unreachable hosts, while the least critical is one or more services in an unknown state (see the order in the example above). Audio files are assumed to be in the media/ subdirectory in your HTML directory (i.e. /usr/local/nagios/share/media).');
INSERT INTO `label` VALUES (18,'nagios_cgi_desc','ping_syntax','This option determines what syntax should be used when attempting to ping a host from the WAP interface (using the statuswml CGI. You must include the full path to the ping binary, along with all required options. The $HOSTADDRESS$ macro is substituted with the address of the host before the command is executed.');
INSERT INTO `label` VALUES (19,'nagios_cgi_desc','escape_html_tags','This option determines whether or not HTML tags in host and service (plugin) output is escaped in the CGIs. If you enable this option, your plugin output will not be able to contain clickable hyperlinks. ');
INSERT INTO `label` VALUES (20,'nagios_cgi_desc','lock_author_names','This option allows you to restrict users from changing the author name when submitting comments, acknowledgements, and scheduled downtime from the web interface. If this option is enabled, users will be unable to change the author name associated with the command request. ');
INSERT INTO `label` VALUES (21,'nagios_cgi_desc','notes_url_target','This option determines the name of the frame target that notes URLs should be displayed in. Valid options include _blank, _self, _top, _parent, or any other valid target name. ');
INSERT INTO `label` VALUES (22,'nagios_cgi_desc','action_url_target','This option determines the name of the frame target that action URLs should be displayed in. Valid options include _blank, _self, _top, _parent, or any other valid target name. ');
INSERT INTO `label` VALUES (23,'nagios_cgi_desc','enable_splunk_integration','This option determines whether integration functionality with Splunk is enabled in the web interface. If enabled, you\'ll be presented with \"Splunk It\" links in various places in the CGIs (log file, alert history, host/service detail, etc). Useful if you\'re trying to research why a particular problem occurred.');
INSERT INTO `label` VALUES (24,'nagios_cgi_desc','splunk_url','This option is used to define the base URL to your Splunk interface. This URL is used by the CGIs when creating links if the enable_splunk_integration option is enabled. ');
INSERT INTO `label` VALUES (25,'nagios_commands_desc','command_name','This directive is the short name used to identify the command. It is referenced in contact, host, and service definitions, among other places.');
INSERT INTO `label` VALUES (26,'nagios_commands_desc','command_line','This directive is used to define what is actually executed by Nagios when the command is used for service or host checks, notifications, or event handlers. Before the command line is executed, all valid macros are replaced with their respective values. See the documentation on macros for determining when you can use different macros. Note that the command line is not surrounded in quotes. Also, if you want to pass a dollar sign ($) on the command line, you have to escape it with another dollar sign.');
INSERT INTO `label` VALUES (27,'nagios_commands_desc','command_desc','This is a description of the command.');
INSERT INTO `label` VALUES (28,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.');
INSERT INTO `label` VALUES (29,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.');
INSERT INTO `label` VALUES (30,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.');
INSERT INTO `label` VALUES (31,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.');
INSERT INTO `label` VALUES (32,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.');
INSERT INTO `label` VALUES (33,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.');
INSERT INTO `label` VALUES (34,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.');
INSERT INTO `label` VALUES (35,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.');
INSERT INTO `label` VALUES (36,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.');
INSERT INTO `label` VALUES (37,'nagios_contacts_desc','contact_name','This directive is used to define a short name used to identify the contact. It is referenced in contact group definitions. Under the right circumstances, the $CONTACTNAME$ macro will contain this value.');
INSERT INTO `label` VALUES (38,'nagios_contacts_desc','alias','This directive is used to define a longer name or description for the contact. Under the rights circumstances, the $CONTACTALIAS$ macro will contain this value.');
INSERT INTO `label` VALUES (39,'nagios_contacts_desc','host_notification_period','This directive is used to specify the short name of the time period during which the contact can be notified about host problems or recoveries. You can think of this as an \"on call\" time for host notifications for the contact. Read the documentation on time periods for more information on how this works and potential problems that may result from improper use.');
INSERT INTO `label` VALUES (40,'nagios_contacts_desc','service_notification_period','This directive is used to specify the short name of the time period during which the contact can be notified about service problems or recoveries. You can think of this as an \"on call\" time for service notifications for the contact. Read the documentation on time periods for more information on how this works and potential problems that may result from improper use.');
INSERT INTO `label` VALUES (41,'nagios_contacts_desc','host_notification_commands','This directive is used to define a list of the short names of the commands used to notify the contact of a host problem or recovery. Multiple notification commands should be separated by commas. All notification commands are executed when the contact needs to be notified. The maximum amount of time that a notification command can run is controlled by the notification_timeout option.');
INSERT INTO `label` VALUES (42,'nagios_contacts_desc','host_notification_options','This directive is used to define the host states for which notifications can be sent out to this contact.');
INSERT INTO `label` VALUES (43,'nagios_contacts_desc','service_notification_options','This directive is used to define the service states for which notifications can be sent out to this contact.');
INSERT INTO `label` VALUES (44,'nagios_contacts_desc','service_notification_commands','This directive is used to define a list of the short names of the commands used to notify the contact of a service problem or recovery. Multiple notification commands should be separated by commas. All notification commands are executed when the contact needs to be notified. The maximum amount of time that a notification command can run is controlled by the notification_timeout option.');
INSERT INTO `label` VALUES (45,'nagios_contacts_desc','email','This directive is used to define an email address for the contact. Depending on how you configure your notification commands, it can be used to send out an alert email to the contact. Under the right circumstances, the $CONTACTEMAIL$ macro will contain this value.');
INSERT INTO `label` VALUES (46,'nagios_contacts_desc','pager','This directive is used to define a pager number for the contact. It can also be an email address to a pager gateway (i.e. pagejoe@pagenet.com). Depending on how you configure your notification commands, it can be used to send out an alert page to the contact. Under the right circumstances, the $CONTACTPAGER$ macro will contact this value.');
INSERT INTO `label` VALUES (47,'nagios_contacts_desc','address','Address directives are used to define additional \"addresses\" for the contact. These addresses can be anything - cell phone numbers, instant messaging addresses, etc. Depending on how you configure your notification commands, they can be used to send out an alert o the contact. Up to six addresses can be defined using these directives (address1 through address6). The $CONTACTADDRESSx$ macro will contain this value.');
INSERT INTO `label` VALUES (48,'nagios_dependency_desc','inherits_parent','This directive indicates whether or not the dependency inherits dependencies of the host that is being depended upon (also referred to as the master host). In other words, if the master host is dependent upon other hosts and any one of those dependencies fail, this dependency will also fail.');
INSERT INTO `label` VALUES (49,'nagios_dependency_desc','host_execution_failure_criteria','This directive is used to specify the criteria that determine when the dependent host should not be actively checked. If the master host is in one of the failure states we specify, the dependent host will not be actively checked. Valid options are a combination of one or more of the following (multiple options are seperated with commas): o = fail on an UP state, d = fail on a DOWN state, u = fail on an UNREACHABLE state, and p = fail on a pending state (e.g. the host has not yet been checked). If you specify n (none) as an option, the execution dependency will never fail and the dependent host will always be actively checked (if other conditions allow for it to be). Example: If you specify u,d in this field, the dependent host will not be actively checked if the master host is in either an UNREACHABLE or DOWN state.');
INSERT INTO `label` VALUES (50,'nagios_dependency_desc','service_execution_failure_criteria','	This directive is used to specify the criteria that determine when the dependent service should not be actively checked. If the master service is in one of the failure states we specify, the dependent service will not be actively checked. Valid options are a combination of one or more of the following (multiple options are seperated with commas): o = fail on an OK state, w = fail on a WARNING state, u = fail on an UNKNOWN state, c = fail on a CRITICAL state, and p = fail on a pending state (e.g. the service has not yet been checked). If you specify n (none) as an option, the execution dependency will never fail and checks of the dependent service will always be actively checked (if other conditions allow for it to be). Example: If you specify o,c,u in this field, the dependent service will not be actively checked if the master service is in either an OK, a CRITICAL, or an UNKNOWN state.');
INSERT INTO `label` VALUES (51,'nagios_dependency_desc','service_notification_failure_criteria','This directive is used to define the criteria that determine when notifications for the dependent service should not be sent out. If the master service is in one of the failure states we specify, notifications for the dependent service will not be sent to contacts. Valid options are a combination of one or more of the following: o = fail on an OK state, w = fail on a WARNING state, u = fail on an UNKNOWN state, c = fail on a CRITICAL state, and p = fail on a pending state (e.g. the service has not yet been checked). If you specify n (none) as an option, the notification dependency will never fail and notifications for the dependent service will always be sent out. Example: If you specify w in this field, the notifications for the dependent service will not be sent out if the master service is in a WARNING state.');
INSERT INTO `label` VALUES (52,'nagios_dependency_desc','host_notification_failure_criteria','This directive is used to define the criteria that determine when notifications for the dependent host should not be sent out. If the master host is in one of the failure states we specify, notifications for the dependent host will not be sent to contacts. Valid options are a combination of one or more of the following: o = fail on an UP state, d = fail on a DOWN state, u = fail on an UNREACHABLE state, and p = fail on a pending state (e.g. the host has not yet been checked). If you specify n (none) as an option, the notification dependency will never fail and notifications for the dependent host will always be sent out. Example: If you specify d in this field, the notifications for the dependent host will not be sent out if the master host is in a DOWN state.');
INSERT INTO `label` VALUES (53,'nagios_escalations_desc','escalation_description','A description of the escalation.');
INSERT INTO `label` VALUES (54,'nagios_escalations_desc','first_notification','This directive is a number that identifies the first notification for which this escalation is effective. For instance, if you set this value to 3, this escalation will only be used if the host is down or unreachable long enough for a third notification to go out.');
INSERT INTO `label` VALUES (55,'nagios_escalations_desc','last_notification','This directive is a number that identifies the last notification for which this escalation is effective. For instance, if you set this value to 5, this escalation will not be used if more than five notifications are sent out for the host. Setting this value to 0 means to keep using this escalation entry forever (no matter how many notifications go out).');
INSERT INTO `label` VALUES (56,'nagios_escalations_desc','escalation_period','This directive is used to specify the short name of the time period during which this escalation is valid. If this directive is not specified, the escalation is considered to be valid during all times.');
INSERT INTO `label` VALUES (57,'nagios_escalations_desc','escalation_options','This directive is used to define the criteria that determine when this host escalation is used. The escalation is used only if the host is in one of the states specified in this directive. If this directive is not specified in a host escalation, the escalation is considered to be valid during all host states. Valid options are a combination of one or more of the following: r = escalate on an UP (recovery) state, d = escalate on a DOWN state, and u = escalate on an UNREACHABLE state. Example: If you specify d in this field, the escalation will only be used if the host is in a DOWN state.');
INSERT INTO `label` VALUES (58,'nagios_escalations_desc','notification_interval','This directive is used to determine the interval at which notifications should be made while this escalation is valid. If you specify a value of 0 for the interval, Nagios will send the first notification when this escalation definition is valid, but will then prevent any more problem notifications from being sent out for the host. Notifications are sent out again until the host recovers. This is useful if you want to stop having notifications sent out after a certain amount of time. Note: If multiple escalation entries for a host overlap for one or more notification ranges, the smallest notification interval from all escalation entries is used');
INSERT INTO `label` VALUES (59,'nagios_hostgroups_desc','hostgroup_name','This directive is used to define a short name used to identify the host group.');
INSERT INTO `label` VALUES (60,'nagios_hostgroups_desc','alias','This directive is used to define is a longer name or description used to identify the host group. It is provided in order to allow you to more easily identify a particular host group.');
INSERT INTO `label` VALUES (61,'nagios_hostgroups_desc','members','This is a list of the short names of hosts that should be included in this group. Multiple host names should be separated by commas.');
INSERT INTO `label` VALUES (62,'nagios_hostgroups_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with any of the hosts in this host group. Multiple contact groups should be separated by commas.');
INSERT INTO `label` VALUES (63,'nagios_hosts_desc','host_name','This directive is used to define a short name used to identify the host. It is used in host group and service definitions to reference this particular host. Hosts can have multiple services (which are monitored) associated with them. When used properly, the $HOSTNAME$ macro will contain this short name.');
INSERT INTO `label` VALUES (64,'nagios_hosts_desc','alias','This directive is used to define a longer name or description used to identify the host. It is provided in order to allow you to more easily identify a particular host. When used properly, the $HOSTALIAS$ macro will contain this alias/description.');
INSERT INTO `label` VALUES (65,'nagios_hosts_desc','address','This directive is used to define the address of the host. Normally, this is an IP address, although it could really be anything you want (so long as it can be used to check the status of the host). You can use a FQDN to identify the host instead of an IP address, but if DNS services are not availble this could cause problems. When used properly, the $HOSTADDRESS$ macro will contain this address. Note: If you do not specify an address directive in a host definition, the name of the host will be used as its address. A word of caution about doing this, however - if DNS fails, most of your service checks will fail because the plugins will be unable to resolve the host name.');
INSERT INTO `label` VALUES (66,'nagios_hosts_desc','check_command','This directive is used to specify the short name of the command that should be used to check if the host is up or down. Typically, this command would try and ping the host to see if it is \"alive\". The command must return a status of OK (0) or Nagios will assume the host is down. If you leave this argument blank, the host will not be checked - Nagios will always assume the host is up. This is useful if you are monitoring printers or other devices that are frequently turned off. The maximum amount of time that the notification command can run is controlled by the host_check_timeout option.');
INSERT INTO `label` VALUES (67,'nagios_hosts_desc','max_check_attempts','This directive is used to define the number of times that Nagios will retry the host check command if it returns any state other than an OK state. Setting this value to 1 will cause Nagios to generate an alert without retrying the host check again. Note: If you do not want to check the status of the host, you must still set this to a minimum value of 1. To bypass the host check, just leave the check_command option blank.');
INSERT INTO `label` VALUES (68,'nagios_hosts_desc','checks_enabled','This directive is used to determine whether or not checks of this host are enabled.');
INSERT INTO `label` VALUES (69,'nagios_hosts_desc','event_handler','This directive is used to specify the short name of the command that should be run whenever a change in the state of the host is detected (i.e. whenever it goes down or recovers). Read the documentation on event handlers for a more detailed explanation of how to write scripts for handling events. The maximum amount of time that the event handler command can run is controlled by the event_handler_timeout option.');
INSERT INTO `label` VALUES (70,'nagios_hosts_desc','event_handler_enabled','This directive is used to determine whether or not the event handler for this host is enabled. Values: 0 = disable host event handler, 1 = enable host event handler.');
INSERT INTO `label` VALUES (71,'nagios_hosts_desc','low_flap_threshold','This directive is used to specify the low state change threshold used in flap detection for this host. If you set this directive to a value of 0, the program-wide value specified by the low_host_flap_threshold directive will be used.');
INSERT INTO `label` VALUES (72,'nagios_hosts_desc','high_flap_threshold','This directive is used to specify the high state change threshold used in flap detection for this host. If you set this directive to a value of 0, the program-wide value specified by the high_host_flap_threshold directive will be used.');
INSERT INTO `label` VALUES (73,'nagios_hosts_desc','flap_detection_enabled','This directive is used to determine whether or not flap detection is enabled for this host.');
INSERT INTO `label` VALUES (74,'nagios_hosts_desc','process_perf_data','This directive is used to determine whether or not the processing of performance data is enabled for this host.');
INSERT INTO `label` VALUES (75,'nagios_hosts_desc','retain_status_information','This directive is used to determine whether or not status-related information about the host is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive. ');
INSERT INTO `label` VALUES (76,'nagios_hosts_desc','retain_nonstatus_information','This directive is used to determine whether or not non-status information about the host is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.');
INSERT INTO `label` VALUES (77,'nagios_hosts_desc','notification_interval','This directive is used to define the number of \"time units\" to wait before re-notifying a contact that this server is still down or unreachable. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. If you set this value to 0, Nagios will not re-notify contacts about problems for this host - only one problem notification will be sent out.');
INSERT INTO `label` VALUES (78,'nagios_hosts_desc','notification_period','This directive is used to specify the short name of the time period during which notifications of events for this host can be sent out to contacts. If a host goes down, becomes unreachable, or recoveries during a time which is not covered by the time period, no notifications will be sent out.');
INSERT INTO `label` VALUES (79,'nagios_hosts_desc','notification_options','This directive is used to determine when notifications for the host should be sent out. Valid options are a combination of one or more of the following: d = send notifications on a DOWN state, u = send notifications on an UNREACHABLE state, and r = send notifications on recoveries (OK state). If you specify n (none) as an option, no host notifications will be sent out. Example: If you specify d,r in this field, notifications will only be sent out when the host goes DOWN and when it recovers from a DOWN state.');
INSERT INTO `label` VALUES (80,'nagios_hosts_desc','notifications_enabled','This directive is used to determine whether or not notifications for this host are enabled.');
INSERT INTO `label` VALUES (81,'nagios_hosts_desc','stalking_options','This directive determines which host states \"stalking\" is enabled for.');
INSERT INTO `label` VALUES (82,'nagios_hosts_desc','check_interval','<b>NOTE:</b> Do NOT enable regularly scheduled checks of a host unless you absolutely need to! Host checks are already performed on-demand when necessary, so there are few times when regularly scheduled checks would be needed. Regularly scheduled host checks can negatively impact performance - see the performance tuning tips for more information. This directive is used to define the number of \"time units\" between regularly scheduled checks of the host. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes.');
INSERT INTO `label` VALUES (83,'nagios_hosts_desc','active_checks_enabled','This directive is used to determine whether or not active checks (either regularly scheduled or on-demand) of this host are enabled.');
INSERT INTO `label` VALUES (84,'nagios_hosts_desc','passive_checks_enabled','This directive is used to determine whether or not passive checks are enabled for this host.');
INSERT INTO `label` VALUES (85,'nagios_hosts_desc','obsess_over_host','This directive determines whether or not checks for the host will be \"obsessed\" over using the ochp_command.');
INSERT INTO `label` VALUES (86,'nagios_hosts_desc','check_freshness','This directive is used to determine whether or not freshness checks are enabled for this host.');
INSERT INTO `label` VALUES (87,'nagios_hosts_desc','freshness_threshold','This directive is used to specify the freshness threshold (in seconds) for this host. If you set this directive to a value of 0, Nagios will determine a freshness threshold to use automatically.');
INSERT INTO `label` VALUES (88,'nagios_hosts_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with this host. Multiple contact groups should be separated by commas.');
INSERT INTO `label` VALUES (89,'nagios_hosts_extended_info_desc','notes','This directive is used to define an optional string of notes pertaining to the host. If you specify a note here, you will see the it in the extended information CGI (when you are viewing information about the specified host).');
INSERT INTO `label` VALUES (90,'nagios_hosts_extended_info_desc','notes_url','This variable is used to define an optional URL that can be used to provide more information about the host. If you specify an URL, you will see a link that says \"Extra Host Notes\" in the extended information CGI (when you are viewing information about the specified host). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/). This can be very useful if you want to make detailed information on the host, emergency contact methods, etc. available to other support staff.');
INSERT INTO `label` VALUES (91,'nagios_hosts_extended_info_desc','action_url','	This directive is used to define an optional URL that can be used to provide more actions to be performed on the host. If you specify an URL, you will see a link that says \"Extra Host Actions\" in the extended information CGI (when you are viewing information about the specified host). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/).');
INSERT INTO `label` VALUES (92,'nagios_hosts_extended_info_desc','icon_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be displayed in the status and extended information CGIs. The image will look best if it is 40x40 pixels in size. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).');
INSERT INTO `label` VALUES (93,'nagios_hosts_extended_info_desc','icon_image_alt','This variable is used to define an optional string that is used in the ALT tag of the image specified by the <icon_image> argument. The ALT tag is used in the status, extended information and statusmap CGIs.');
INSERT INTO `label` VALUES (94,'nagios_hosts_extended_info_desc','vrml_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be used as the texture map for the specified host in the statuswrl CGI. Unlike the image you use for the <icon_image> variable, this one should probably not have any transparency. If it does, the host object will look a bit wierd. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).');
INSERT INTO `label` VALUES (95,'nagios_hosts_extended_info_desc','statusmap_image','This variable is used to define the name of an image that should be associated with this host in the statusmap CGI. You can specify a JPEG, PNG, and GIF image if you want, although I would strongly suggest using a GD2 format image, as other image formats will result in a lot of wasted CPU time when the statusmap image is generated. GD2 images can be created from PNG images by using the pngtogd2 utility supplied with Thomas Boutell\'s gd library. The GD2 images should be created in uncompressed format in order to minimize CPU load when the statusmap CGI is generating the network map image. The image will look best if it is 40x40 pixels in size. You can leave these option blank if you are not using the statusmap CGI. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).');
INSERT INTO `label` VALUES (96,'nagios_hosts_extended_info_desc','two_d_coords','This variable is used to define coordinates to use when drawing the host in the statusmap CGI. Coordinates should be given in positive integers, as the correspond to physical pixels in the generated image. The origin for drawing (0,0) is in the upper left hand corner of the image and extends in the positive x direction (to the right) along the top of the image and in the positive y direction (down) along the left hand side of the image. For reference, the size of the icons drawn is usually about 40x40 pixels (text takes a little extra space). The coordinates you specify here are for the upper left hand corner of the host icon that is drawn. Note: Don\'t worry about what the maximum x and y coordinates that you can use are. The CGI will automatically calculate the maximum dimensions of the image it creates based on the largest x and y coordinates you specify.');
INSERT INTO `label` VALUES (97,'nagios_hosts_extended_info_desc','three_d_coords','This variable is used to define coordinates to use when drawing the host in the statuswrl CGI. Coordinates can be positive or negative real numbers. The origin for drawing is (0.0,0.0,0.0). For reference, the size of the host cubes drawn is 0.5 units on each side (text takes a little more space). The coordinates you specify here are used as the center of the host cube.');
INSERT INTO `label` VALUES (98,'nagios_main_desc','config_dir','This is the location on the filesystem where you would like your nagios configuration files to be stored.  The webserver user MUST have write access to this directory and the files within.');
INSERT INTO `label` VALUES (99,'nagios_main_desc','log_file','This variable specifies where Nagios should create its main log file. This should be the first variable that you define in your configuration file, as Nagios will try to write errors that it finds in the rest of your configuration data to this file. If you have log rotation enabled, this file will automatically be rotated every hour, day, week, or month.');
INSERT INTO `label` VALUES (100,'nagios_main_desc','temp_file','This is a temporary file that Nagios periodically creates to use when updating comment data, status data, etc. The file is deleted when it is no longer needed.');
INSERT INTO `label` VALUES (101,'nagios_main_desc','status_file','This is the file that Nagios uses to store the current status of all monitored services. The status of all hosts associated with the service you monitor are also recorded here. This file is used by the CGIs so that current monitoring status can be reported via a web interface. The CGIs must have read access to this file in order to function properly. This file is deleted every time Nagios stops and recreated when it starts.');
INSERT INTO `label` VALUES (102,'nagios_main_desc','status_update_interval','This setting determines how often (in seconds) that Nagios will update status data in the status file. The minimum update interval is five seconds. If you have disabled aggregated status updates (with the aggregate_status_updates option), this option has no effect.');
INSERT INTO `label` VALUES (103,'nagios_main_desc','nagios_user','This is used to set the effective user that the Nagios process should run as. After initial program startup and before starting to monitor anything, Nagios will drop its effective privileges and run as this user. You may specify either a username or a UID. ');
INSERT INTO `label` VALUES (104,'nagios_main_desc','nagios_group','This is used to set the effective group that the Nagios process should run as. After initial program startup and before starting to monitor anything, Nagios will drop its effective privileges and run as this group. You may specify either a groupname or a GID.');
INSERT INTO `label` VALUES (105,'nagios_main_desc','enable_notifications','This option determines whether or not Nagios will send out notifications when it initially (re)starts. If this option is disabled, Nagios will not send out notifications for any host or service. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (106,'nagios_main_desc','execute_service_checks','This option determines whether or not Nagios will execute service checks when it initially (re)starts. If this option is disabled, Nagios will not actively execute any service checks and will remain in a sort of \"sleep\" mode (it can still accept passive checks unless you\'ve disabled them). This option is most often used when configuring backup monitoring servers, as described in the documentation on redundancy, or when setting up a distributed monitoring environment. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (107,'nagios_main_desc','accept_passive_service_checks','This option determines whether or not Nagios will accept passive service checks when it initially (re)starts. If this option is disabled, Nagios will not accept any passive service checks. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (108,'nagios_main_desc','enable_event_handlers','This option determines whether or not Nagios will run event handlers when it initially (re)starts. If this option is disabled, Nagios will not run any host or service event handlers. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (109,'nagios_main_desc','log_rotation_method','This is the rotation method that you would like Nagios to use for your log file.');
INSERT INTO `label` VALUES (110,'nagios_main_desc','log_archive_path','This is the directory where Nagios should place log files that have been rotated. This option is ignored if you choose to not use the log rotation functionality.');
INSERT INTO `label` VALUES (111,'nagios_main_desc','check_external_commands','This option determines whether or not Nagios will check the command file for internal commands it should execute. This option must be enabled if you plan on using the command CGI to issue commands via the web interface. Third party programs can also issue commands to Nagios by writing to the command file, provided proper rights to the file have been granted.');
INSERT INTO `label` VALUES (112,'nagios_main_desc','external_command_buffer_slots','This setting is used to tweak the number of items or \'slots\' that the Nagios daemon should allocate to the buffer that holds incoming external commands before they are processed.  As external commands are processed by the daemon, they are removed from the buffer');
INSERT INTO `label` VALUES (113,'nagios_main_desc','command_check_interval','If you specify a number with an \"s\" appended to it (i.e. 30s), this is the number of seconds to wait between external command checks. If you leave off the \"s\", this is the number of \"time units\" to wait between external command checks. Unless you\'ve changed the interval_length value (as defined below) from the default value of 60, this number will mean minutes.<br />\r\n<b>Note:</b> By setting this value to -1, Nagios will check for external commands as often as possible. Each time Nagios checks for external commands it will read and process all commands present in the command file before continuing on with its other duties.');
INSERT INTO `label` VALUES (114,'nagios_main_desc','command_file','This is the file that Nagios will check for external commands to process. The command CGI writes commands to this file. Other third party programs can write to this file if proper file permissions have been granted as outline in here. The external command file is implemented as a named pipe (FIFO), which is created when Nagios starts and removed when it shuts down. If the file exists when Nagios starts, the Nagios process will terminate with an error message.');
INSERT INTO `label` VALUES (115,'nagios_main_desc','lock_file','This option specifies the location of the lock file that Nagios should create when it runs as a daemon (when started with the -d command line argument). This file contains the process id (PID) number of the running Nagios process.');
INSERT INTO `label` VALUES (116,'nagios_main_desc','retain_state_information','This option determines whether or not Nagios will retain state information for hosts and services between program restarts. If you enable this option, you should supply a value for the state_retention_file variable. When enabled, Nagios will save all state information for hosts and service before it shuts down (or restarts) and will read in previously saved state information when it starts up again.');
INSERT INTO `label` VALUES (117,'nagios_main_desc','state_retention_file','This is the file that Nagios will use for storing service and host state information before it shuts down. When Nagios is restarted it will use the information stored in this file for setting the initial states of services and hosts before it starts monitoring anything. This file is deleted after Nagios reads in initial state information when it (re)starts. In order to make Nagios retain state information between program restarts, you must enable the retain_state_information option.');
INSERT INTO `label` VALUES (118,'nagios_main_desc','retention_update_interval','This setting determines how often (in minutes) that Nagios will automatically save retention data during normal operation. If you set this value to 0, Nagios will not save retention data at regular intervals, but it will still save retention data before shutting down or restarting. If you have disabled state retention (with the retain_state_information option), this option has no effect.');
INSERT INTO `label` VALUES (119,'nagios_main_desc','use_retained_program_state','This setting determines whether or not Nagios will set various program-wide state variables based on the values saved in the retention file. Some of these program-wide state variables that are normally saved across program restarts if state retention is enabled include the enable_notifications, enable_flap_detection, enable_event_handlers, execute_service_checks, and accept_passive_service_checks options. If you do not have state retention enabled, this option has no effect.');
INSERT INTO `label` VALUES (120,'nagios_main_desc','use_syslog','This variable determines whether messages are logged to the syslog facility on your local host.');
INSERT INTO `label` VALUES (121,'nagios_main_desc','log_notifications','This variable determines whether or not notification messages are logged. If you have a lot of contacts or regular service failures your log file will grow relatively quickly. Use this option to keep contact notifications from being logged.');
INSERT INTO `label` VALUES (122,'nagios_main_desc','log_service_retries','This variable determines whether or not service check retries are logged. Service check retries occur when a service check results in a non-OK state, but you have configured Nagios to retry the service more than once before responding to the error. Services in this situation are considered to be in \"soft\" states. Logging service check retries is mostly useful when attempting to debug Nagios or test out service event handlers.');
INSERT INTO `label` VALUES (123,'nagios_main_desc','log_host_retries','This variable determines whether or not host check retries are logged. Logging host check retries is mostly useful when attempting to debug Nagios or test out host event handlers.');
INSERT INTO `label` VALUES (124,'nagios_main_desc','log_event_handlers','This variable determines whether or not service and host event handlers are logged. Event handlers are optional commands that can be run whenever a service or hosts changes state. Logging event handlers is most useful when debugging Nagios or first trying out your event handler scripts.');
INSERT INTO `label` VALUES (125,'nagios_main_desc','log_initial_states','This variable determines whether or not Nagios will force all initial host and service states to be logged, even if they result in an OK state. Initial service and host states are normally only logged when there is a problem on the first check. Enabling this option is useful if you are using an application that scans the log file to determine long-term state statistics for services and hosts.');
INSERT INTO `label` VALUES (126,'nagios_main_desc','log_external_commands','This variable determines whether or not Nagios will log external commands that it receives from the external command file. Note: This option does not control whether or not passive service checks (which are a type of external command) get logged. To enable or disable logging of passive checks, use the log_passive_service_checks option.');
INSERT INTO `label` VALUES (127,'nagios_main_desc','log_passive_service_checks','This variable determines whether or not Nagios will log passive service checks that it receives from the external command file. If you are setting up a distributed monitoring environment or plan on handling a large number of passive checks on a regular basis, you may wish to disable this option so your log file doesn\'t get too large.');
INSERT INTO `label` VALUES (128,'nagios_main_desc','global_host_event_handler','This option allows you to specify a host event handler command that is to be run for every host state change. The global event handler is executed immediately prior to the event handler that you have optionally specified in each host definition. The command argument is the short name of a command that you define in your object configuration file. The maximum amount of time that this command can run is controlled by the event_handler_timeout option.');
INSERT INTO `label` VALUES (129,'nagios_main_desc','global_service_event_handler','This option allows you to specify a service event handler command that is to be run for every service state change. The global event handler is executed immediately prior to the event handler that you have optionally specified in each service definition. The command argument is the short name of a command that you define in your object configuration file. The maximum amount of time that this command can run is controlled by the event_handler_timeout option');
INSERT INTO `label` VALUES (130,'nagios_main_desc','sleep_time','This is the number of seconds that Nagios will sleep before checking to see if the next service check in the scheduling queue should be executed. Note that Nagios will only sleep after it \"catches up\" with queued service checks that have fallen behind.');
INSERT INTO `label` VALUES (131,'nagios_main_desc','inter_check_delay_method','This option allows you to control how service checks are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all services out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended unless you are testing the service check parallelization functionality. Using no delay will cause all service checks to be scheduled for execution at the same time. This means that you will generally have large CPU spikes when the services are all executed in parallel. Values are as follows:<br />\r\n* n = Don\'t use any delay - schedule all service checks to run immediately (i.e. at the same time!)<br />\r\n* d = Use a \"dumb\" delay of 1 second between service checks<br />\r\n* s = Use a \"smart\" delay calculation to spread service checks out evenly (default)<br />* x.xx = Use a user-supplied inter-check delay of x.xx seconds');
INSERT INTO `label` VALUES (132,'nagios_main_desc','max_concurrent_checks','This option allows you to specify the maximum number of service checks that can be run in parallel at any given time. Specifying a value of 1 for this variable essentially prevents any service checks from being parallelized. Specifying a value of 0 (the default) does not place any restrictions on the number of concurrent checks. You\'ll have to modify this value based on the system resources you have available on the machine that runs Nagios, as it directly affects the maximum load that will be imposed on the system (processor utilization, memory, etc.).');
INSERT INTO `label` VALUES (133,'nagios_main_desc','service_reaper_frequency','This option allows you to control the frequency in seconds of service \"reaper\" events. \"Reaper\" events process the results from parallelized service checks that have finished executing. These events consitute the core of the monitoring logic in Nagios.');
INSERT INTO `label` VALUES (134,'nagios_main_desc','interval_length','This is the number of seconds per \"unit interval\" used for timing in the scheduling queue, re-notifications, etc. \"Units intervals\" are used in the host configuration file to determine how often to run a service check, how often of re-notify a contact, etc.');
INSERT INTO `label` VALUES (135,'nagios_main_desc','service_interleave_factor','This variable determines how service checks are interleaved. Interleaving allows for a more even distribution of service checks, reduced load on remote hosts, and faster overall detection of host problems. With the introduction of service check parallelization, remote hosts could get bombarded with checks if interleaving was not implemented. This could cause the service checks to fail or return incorrect results if the remote host was overloaded with processing other service check requests. Setting this value to 1 is equivalent to not interleaving the service checks (this is how versions of Nagios previous to 0.0.5 worked). Set this value to s (smart) for automatic calculation of the interleave factor unless you have a specific reason to change it. The best way to understand how interleaving works is to watch the status CGI (detailed view) when Nagios is just starting. You should see that the service check results are spread out as they begin to appear.<br />\r\n* x = A number greater than or equal to 1 that specifies the interleave factor to use. An interleave factor of 1 is equivalent to not interleaving the service checks.<br />\r\n* s = Use a \"smart\" interleave factor calculation (default)<br />');
INSERT INTO `label` VALUES (136,'nagios_main_desc','use_agressive_host_checking','Nagios tries to be smart about how and when it checks the status of hosts. In general, disabling this option will allow Nagios to make some smarter decisions and check hosts a bit faster. Enabling this option will increase the amount of time required to check hosts, but may improve reliability a bit. Unless you have problems with Nagios not recognizing that a host recovered, I would suggest not enabling this option.');
INSERT INTO `label` VALUES (137,'nagios_main_desc','enable_flap_detection','This option determines whether or not Nagios will try and detect hosts and services that are \"flapping\". Flapping occurs when a host or service changes between states too frequently, resulting in a barrage of notifications being sent out. When Nagios detects that a host or service is flapping, it will temporarily suppress notifications for that host/service until it stops flapping. Flap detection is very experimental at this point, so use this feature with caution! Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (138,'nagios_main_desc','low_service_flap_threshold','This option is used to set the low threshold for detection of service flapping.');
INSERT INTO `label` VALUES (139,'nagios_main_desc','high_service_flap_threshold','This option is used to set the low threshold for detection of service flapping.');
INSERT INTO `label` VALUES (140,'nagios_main_desc','low_host_flap_threshold','This option is used to set the low threshold for detection of host flapping.');
INSERT INTO `label` VALUES (141,'nagios_main_desc','high_host_flap_threshold','This option is used to set the low threshold for detection of host flapping.');
INSERT INTO `label` VALUES (142,'nagios_main_desc','soft_state_dependencies','This option determines whether or not Nagios will use soft service state information when checking service dependencies. Normally Nagios will only use the latest hard service state when checking dependencies. If you want it to use the latest state (regardless of whether its a soft or hard state type), enable this option.');
INSERT INTO `label` VALUES (143,'nagios_main_desc','service_check_timeout','This is the maximum number of seconds that Nagios will allow service checks to run. If checks exceed this limit, they are killed and a CRITICAL state is returned. A timeout error will also be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off plugins which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each service check normally finishes executing within this time limit. If a service check runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. ');
INSERT INTO `label` VALUES (144,'nagios_main_desc','host_check_timeout','This is the maximum number of seconds that Nagios will allow host checks to run. If checks exceed this limit, they are killed and a CRITICAL state is returned and the host will be assumed to be DOWN. A timeout error will also be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off plugins which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each host check normally finishes executing within this time limit. If a host check runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. ');
INSERT INTO `label` VALUES (145,'nagios_main_desc','event_handler_timeout','This is the maximum number of seconds that Nagios will allow event handlers to be run. If an event handler exceeds this time limit it will be killed and a warning will be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off commands which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each event handler command normally finishes executing within this time limit. If an event handler runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. ');
INSERT INTO `label` VALUES (146,'nagios_main_desc','notification_timeout','This is the maximum number of seconds that Nagios will allow notification commands to be run. If a notification command exceeds this time limit it will be killed and a warning will be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off commands which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each notification command finishes executing within this time limit. If a notification command runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. ');
INSERT INTO `label` VALUES (147,'nagios_main_desc','ocsp_timeout','This is the maximum number of seconds that Nagios will allow an obsessive compulsive service processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.');
INSERT INTO `label` VALUES (148,'nagios_main_desc','perfdata_timeout','This is the maximum number of seconds that Nagios will allow a host performance data processor command or service performance data processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.');
INSERT INTO `label` VALUES (149,'nagios_main_desc','obsess_over_services','This value determines whether or not Nagios will \"obsess\" over service checks results and run the obsessive compulsive service processor command you define. I know - funny name, but it was all I could think of. This option is useful for performing distributed monitoring. If you\'re not doing distributed monitoring, don\'t enable this option.');
INSERT INTO `label` VALUES (150,'nagios_main_desc','ocsp_command','This option allows you to specify a command to be run after every service check, which can be useful in distributed monitoring. This command is executed after any event handler or notification commands. The command argument is the short name of a command definition that you define in your host configuration file. The maximum amount of time that this command can run is controlled by the ocsp_timeout option.');
INSERT INTO `label` VALUES (151,'nagios_main_desc','process_performance_data','This value determines whether or not Nagios will process host and service check performance data.');
INSERT INTO `label` VALUES (152,'nagios_main_desc','host_perfdata_command','This is the command that will be run to process host performance data.');
INSERT INTO `label` VALUES (153,'nagios_main_desc','service_perfdata_command','This is the command that will be run to process service performance data.');
INSERT INTO `label` VALUES (154,'nagios_main_desc','check_for_orphaned_services','This option allows you to enable or disable checks for orphaned service checks. Orphaned service checks are checks which ahve been executed and have been removed from the event queue, but have not had any results reported in a long time. Since no results have come back in for the service, it is not rescheduled in the event queue. This can cause service checks to stop being executed. Normally it is very rare for this to happen - it might happen if an external user or process killed off the process that was being used to execute a service check. If this option is enabled and Nagios finds that results for a particular service check have not come back, it will log an error message and reschedule the service check. If you start seeing service checks that never seem to get rescheduled, enable this option and see if you notice any log messages about orphaned services.');
INSERT INTO `label` VALUES (155,'nagios_main_desc','check_service_freshness','This option determines whether or not Nagios will periodically check the \"freshness\" of service checks. Enabling this option is useful for helping to ensure that passive service checks are received in a timely manner.');
INSERT INTO `label` VALUES (156,'nagios_main_desc','freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of service check results. If you have disabled service freshness checking (with the check_service_freshness option), this option has no effect.');
INSERT INTO `label` VALUES (157,'nagios_main_desc','date_format','This option allows you to specify what kind of date/time format Nagios should use in the web interface and date/time macros.');
INSERT INTO `label` VALUES (158,'nagios_main_desc','illegal_object_name_chars','This option allows you to specify illegal characters that cannot be used in host names, service descriptions, or names of other object types.');
INSERT INTO `label` VALUES (159,'nagios_main_desc','illegal_macro_output_chars','This option allows you to specify illegal characters that should be stripped from macros before being used in notifications, event handlers, and other commands. This DOES NOT affect macros used in service or host check commands. You can choose to not strip out the characters shown in the example above, but I recommend you do not do this. Some of these characters are interpreted by the shell (i.e. the backtick) and can lead to security problems. The following macros are stripped of the characters you specify: $OUTPUT$, $PERFDATA$ ');
INSERT INTO `label` VALUES (160,'nagios_main_desc','admin_email','This is the email address for the administrator of the local machine (i.e. the one that Nagios is running on). This value can be used in notification commands by using the $ADMINEMAIL$ macro.');
INSERT INTO `label` VALUES (161,'nagios_main_desc','admin_pager','This is the pager number (or pager email gateway) for the administrator of the local machine (i.e. the one that Nagios is running on). The pager number/address can be used in notification commands by using the $ADMINPAGER$ macro.');
INSERT INTO `label` VALUES (162,'nagios_main_desc','use_retained_scheduling_info','This setting determines whether or not Nagios will retain scheduling info (next check times) for hosts and services when it restarts. If you are adding a large number (or percentage) of hosts and services, I would recommend disabling this option when you first restart Nagios, as it can adversely skew the spread of initial checks.');
INSERT INTO `label` VALUES (163,'nagios_main_desc','accept_passive_host_checks','This option determines whether or not Nagios will accept passive host checks when it initially (re)starts. If this option is disabled, Nagios will not accept any passive host checks. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (164,'nagios_main_desc','execute_host_checks','This option determines whether or not Nagios will execute on-demand and regularly scheduled host checks when it initially (re)starts. If this option is disabled, Nagios will not actively execute any host checks, although it can still accept passive host checks unless you\'ve disabled them). This option is most often used when configuring backup monitoring servers, as described in the documentation on redundancy, or when setting up a distributed monitoring environment. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.');
INSERT INTO `label` VALUES (165,'nagios_main_desc','object_cache_file','This directive is used to specify a file in which a cached copy of object definitions should be stored. The cache file is (re)created every time Nagios is (re)started and is used by the CGIs. It is intended to speed up config file caching in the CGIs and allow you to edit the source object config files while Nagios is running without affecting the output displayed in the CGIs.');
INSERT INTO `label` VALUES (166,'nagios_main_desc','precached_object_file','This directive is used to specify a file in which\n	a pre-processed, pre-cached copy of object definitions should be stored.\n	This file can be used to drastically improve startup times in large/complex\n	Nagios installations.');
INSERT INTO `label` VALUES (167,'nagios_main_desc','retained_host_attribute_mask','These options determine which host \n	 attributes are NOT retained across program restarts. The values for\n	these options are a bitwise AND of values specified by the \"MODATTR_\"\n	definitions in the include/common.h source code file. By default, all host\n	attributes are retained.');
INSERT INTO `label` VALUES (168,'nagios_main_desc','retained_service_attribute_mask','These options determine which service \n	 attributes are NOT retained across program restarts. The values for\n	these options are a bitwise AND of values specified by the \"MODATTR_\"\n	definitions in the include/common.h source code file. By default, all service\n	attributes are retained.');
INSERT INTO `label` VALUES (169,'nagios_main_desc','retained_process_host_attribute_mask','These options determine which\n	process attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service process attributes\n	that can be changed. For example, host checks can be disabled at the program\n	level, while service checks are still enabled. The values for these options\n	are a bitwise AND of values specified by the \"MODATTR_\" definitions in the\n	include/common.h source code file. By default, all process attributes are\n	retained. ');
INSERT INTO `label` VALUES (170,'nagios_main_desc','retained_process_service_attribute_mask','These options determine which\n	process attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service process attributes\n	that can be changed. For example, host checks can be disabled at the program\n	level, while service checks are still enabled. The values for these options\n	are a bitwise AND of values specified by the \"MODATTR_\" definitions in the\n	include/common.h source code file. By default, all process attributes are\n	retained. ');
INSERT INTO `label` VALUES (171,'nagios_main_desc','retained_contact_host_attribute_mask','These options determine which\n	contact attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service contact attributes\n	that can be changed. The values for these options are a bitwise AND of\n	values specified by the \"MODATTR_\" definitions in the include/common.h\n	source code file. By default, all process attributes are retained. ');
INSERT INTO `label` VALUES (172,'nagios_main_desc','retained_contact_service_attribute_mask','These options determine which\n	contact attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service contact attributes\n	that can be changed. The values for these options are a bitwise AND of\n	values specified by the \"MODATTR_\" definitions in the include/common.h\n	source code file. By default, all process attributes are retained. ');
INSERT INTO `label` VALUES (173,'nagios_main_desc','check_result_reaper_frequency','This option allows you to control the\n	frequency in seconds of check result \"reaper\" events. \"Reaper\" events\n	process the results from host and service checks that have finished\n	executing. These events consitute the core of the monitoring logic in\n	Nagios. ');
INSERT INTO `label` VALUES (174,'nagios_main_desc','max_check_result_reaper_time','This option allows you to control the\n	maximum amount of time in seconds that host and service check result\n	\"reaper\" events are allowed to run. \"Reaper\" events process the results from\n	host and service checks that have finished executing. If there are a lot of\n	results to process, reaper events may take a long time to finish, which\n	might delay timely execution of new host and service checks. This variable\n	allows you to limit the amount of time that an individual reaper event will\n	run before it hands control back over to Nagios for other portions of the\n	monitoring logic. ');
INSERT INTO `label` VALUES (175,'nagios_main_desc','check_result_path','This options determines which directory Nagios will\n	use to temporarily store host and service check results before they are\n	processed. This directory should not be used to store any other files, as\n	Nagios will periodically clean this directory of old file (see the\n		max_check_result_file_age option for more information).\n	\n	Note: Make sure that only a single instance of Nagios has access to the\n	check result path. If multiple instances of Nagios have their check result\n	path set to the same directory, you will run into problems with check\n	results being processed (incorrectly) by the wrong instance of Nagios! ');
INSERT INTO `label` VALUES (176,'nagios_main_desc','max_check_result_file_age','This options determines the maximum age in\n	seconds that Nagios will consider check result files found in the\n	check_result_path directory to be valid. Check result files that are older\n	that this threshold will be deleted by Nagios and the check results they\n	contain will not be processed. By using a value of zero (0) with this\n	option, Nagios will process all check result files - even if they\'re older\n	than your hardware :-). ');
INSERT INTO `label` VALUES (177,'nagios_main_desc','translate_passive_host_checks','This option determines whether or not\n	Nagios will translate DOWN/UNREACHABLE passive host check results to their\n	\"correct\" state from the viewpoint of the local Nagios instance. This can be\n	very useful in distributed and failover monitoring installations.');
INSERT INTO `label` VALUES (178,'nagios_main_desc','passive_host_checks_are_soft','This option determines whether or not\n	Nagios will treat passive host checks as HARD states or SOFT states. By\n	default, a passive host check result will put a host into a HARD state type.\n	You can change this behavior by enabling this option. ');
INSERT INTO `label` VALUES (179,'nagios_main_desc','enable_predictive_host_dependency_checks','This option determines whether\n	or not Nagios will execute predictive checks of hosts that are being\n	depended upon (as defined in host dependencies) for a particular host when\n	it changes state. Predictive checks help ensure that the dependency logic is\n	as accurate as possible.');
INSERT INTO `label` VALUES (180,'nagios_main_desc','enable_predictive_service_dependency_checks','This option determines\n	whether or not Nagios will execute predictive checks of services that are\n	being depended upon (as defined in service dependencies) for a particular\n	service when it changes state. Predictive checks help ensure that the\n	dependency logic is as accurate as possible.');
INSERT INTO `label` VALUES (181,'nagios_main_desc','cached_host_check_horizon','This option determines the maximum amount of\n	time (in seconds) that the state of a previous host check is considered\n	current. Cached host states (from host checks that were performed more\n		recently than the time specified by this value) can improve host check\n	performance immensely. Too high of a value for this option may result in\n	(temporarily) inaccurate host states, while a low value may result in a\n	performance hit for host checks. Use a value of 0 if you want to disable\n	host check caching.');
INSERT INTO `label` VALUES (182,'nagios_main_desc','cached_service_check_horizon','This option determines the maximum amount\n	of time (in seconds) that the state of a previous service check is\n	considered current. Cached service states (from service checks that were\n		performed more recently than the time specified by this value) can\n	improve service check performance when a lot of service dependencies are\n	used. Too high of a value for this option may result in inaccuracies in the\n	service dependency logic. Use a value of 0 if you want to disable service\n	check caching.');
INSERT INTO `label` VALUES (183,'nagios_main_desc','use_large_installation_tweaks','This option determines whether or not the\n	Nagios daemon will take several shortcuts to improve performance. These\n	shortcuts result in the loss of a few features, but larger installations\n	will likely see a lot of benefit from doing so.');
INSERT INTO `label` VALUES (184,'nagios_main_desc','free_child_process_memory','This option determines whether or not Nagios\n	will free memory in child processes when they are fork()ed off from the main\n	process. By default, Nagios frees memory. However, if the\n	use_large_installation_tweaks option is enabled, it will not. By defining\n	this option in your configuration file, you are able to override things to\n	get the behavior you want.');
INSERT INTO `label` VALUES (185,'nagios_main_desc','child_processes_fork_twice','This option determines whether or not Nagios\n	will fork() child processes twice when it executes host and service checks.\n	By default, Nagios fork()s twice. However, if the\n	use_large_installation_tweaks option is enabled, it will only fork() once.\n	By defining this option in your configuration file, you are able to override\n	things to get the behavior you want. ');
INSERT INTO `label` VALUES (186,'nagios_main_desc','enable_environment_macros','This option determines whether or not the\n	Nagios daemon will make all standard macros available as environment\n	variables to your check, notification, event hander, etc. commands. In large\n	Nagios installations this can be problematic because it takes additional\n	memory and (more importantly) CPU to compute the values of all macros and\n	make them available to the environment. ');
INSERT INTO `label` VALUES (187,'nagios_main_desc','additional_freshness_latency','This option determines the number of\n	seconds Nagios will add to any host or services freshness threshold it\n	automatically calculates (e.g. those not specified explicity by the user).');
INSERT INTO `label` VALUES (188,'nagios_main_desc','enable_embedded_perl','This setting determines whether or not the embedded\n	Perl interpreter is enabled on a program-wide basis. Nagios must be compiled\n	with support for embedded Perl for this option to have an effect.');
INSERT INTO `label` VALUES (189,'nagios_main_desc','use_embedded_perl_implicitly','This setting determines whether or not the\n	embedded Perl interpreter should be used for Perl plugins/scripts that do\n	not explicitly enable/disable it. Nagios must be compiled with support for\n	embedded Perl for this option to have an effect.');
INSERT INTO `label` VALUES (190,'nagios_main_desc','use_timezone','This option allows you to override the default timezone\n	that this instance of Nagios runs in. Useful if you have multiple instances\n	of Nagios that need to run from the same server, but have different local\n	times associated with them. If not specified, Nagios will use the system\n	configured timezone. ');
INSERT INTO `label` VALUES (191,'nagios_main_desc','debug_file','This option determines where Nagios should write debugging\n	information. What (if any) information is written is determined by the\n	debug_level and debug_verbosity options.');
INSERT INTO `label` VALUES (192,'nagios_main_desc','debug_level','This option determines what type of information Nagios\n	should write to the debug_file.');
INSERT INTO `label` VALUES (193,'nagios_main_desc','debug_verbosity','This option determines how much debugging information\n	Nagios should write to the debug_file. ');
INSERT INTO `label` VALUES (194,'nagios_main_desc','max_debug_file_size','This option determines the maximum size (in bytes)\n	of the debug file. If the file grows larger than this size, it will be\n	renamed with a .old extension. If a file already exists with a .old\n	extension it will automatically be deleted. This helps ensure your disk\n	space usage doesn\'t get out of control when debugging Nagios. ');
INSERT INTO `label` VALUES (195,'nagios_main_desc','service_inter_check_delay_method','This option allows you to control how service checks are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all services out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended unless you are testing the service check parallelization functionality. Using no delay will cause all service checks to be scheduled for execution at the same time. This means that you will generally have large CPU spikes when the services are all executed in parallel. Values are as follows:\r\n\r\n    * n = Don\'t use any delay - schedule all service checks to run immediately (i.e. at the same time!)<br />\r\n- d = Use a \"dumb\" delay of 1 second between service checks<br />\r\n- s = Use a \"smart\" delay calculation to spread service checks out evenly (default)<br />\r\n- x.xx = Use a user-supplied inter-check delay of x.xx seconds<br />');
INSERT INTO `label` VALUES (196,'nagios_main_desc','max_service_check_spread','This option determines the maximum number of minutes from when Nagios starts that all services (that are scheduled to be regularly checked) are checked. This option will automatically adjust the service inter-check delay (if necessary) to ensure that the initial checks of all services occur within the timeframe you specify. In general, this option will not have an affect on service check scheduling if scheduling information is being retained using the use_retained_scheduling_info option.');
INSERT INTO `label` VALUES (197,'nagios_main_desc','host_inter_check_delay_method','This option allows you to control how host checks that are scheduled to be checked on a regular basis are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all hosts out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended. Using no delay will cause all host checks to be scheduled for execution at the same time. Values are as follows:<br />\r\n* n = Don\'t use any delay - schedule all host checks to run immediately (i.e. at the same time!)<br />\r\n* d = Use a \"dumb\" delay of 1 second between host checks<br />\r\n* s = Use a \"smart\" delay calculation to spread host checks out evenly (default)<br />\r\n* x.xx = Use a user-supplied inter-check delay of x.xx seconds');
INSERT INTO `label` VALUES (198,'nagios_main_desc','max_host_check_spread','This option determines the maximum number of minutes from when Nagios starts that all hosts (that are scheduled to be regularly checked) are checked. This option will automatically adjust the host inter-check delay (if necessary) to ensure that the initial checks of all hosts occur within the timeframe you specify. In general, this option will not have an affect on host check scheduling if scheduling information is being retained using the use_retained_scheduling_info option. Default value is 30 (minutes).');
INSERT INTO `label` VALUES (199,'nagios_main_desc','auto_reschedule_checks','This option determines whether or not Nagios will attempt to automatically reschedule active host and service checks to \"smooth\" them out over time. This can help to balance the load on the monitoring server, as it will attempt to keep the time between consecutive checks consistent, at the expense of executing checks on a more rigid schedule.<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THIS OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! ');
INSERT INTO `label` VALUES (200,'nagios_main_desc','auto_rescheduling_interval','This option determines how often (in seconds) Nagios will attempt to automatically reschedule checks. This option only has an effect if the auto_reschedule_checks option is enabled. Default is 30 seconds.<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THE AUTO-RESCHEDULING OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! ');
INSERT INTO `label` VALUES (201,'nagios_main_desc','auto_rescheduling_window','This option determines the \"window\" of time (in seconds) that Nagios will look at when automatically rescheduling checks. Only host and service checks that occur in the next X seconds (determined by this variable) will be rescheduled. This option only has an effect if the auto_reschedule_checks option is enabled. Default is 180 seconds (3 minutes).<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THE AUTO-RESCHEDULING OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! ');
INSERT INTO `label` VALUES (202,'nagios_main_desc','ochp_timeout','This is the maximum number of seconds that Nagios will allow an obsessive compulsive host processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.');
INSERT INTO `label` VALUES (203,'nagios_main_desc','obsess_over_hosts','This value determines whether or not Nagios will \"obsess\" over host checks results and run the obsessive compulsive host processor command you define. I know - funny name, but it was all I could think of. This option is useful for performing distributed monitoring. If you\'re not doing distributed monitoring, don\'t enable this option.');
INSERT INTO `label` VALUES (204,'nagios_main_desc','ochp_command','This option allows you to specify a command to be run after every host check, which can be useful in distributed monitoring. This command is executed after any event handler or notification commands. The command argument is the short name of a command definition that you define in your host configuration file. The maximum amount of time that this command can run is controlled by the ochp_timeout option. This command is only executed if the obsess_over_hosts option is enabled globally and if the obsess_over_host directive in the host definition is enabled.');
INSERT INTO `label` VALUES (205,'nagios_main_desc','check_host_freshness','This option determines whether or not Nagios will periodically check the \"freshness\" of host checks. Enabling this option is useful for helping to ensure that passive host checks are received in a timely manner.');
INSERT INTO `label` VALUES (206,'nagios_main_desc','host_freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of host check results. If you have disabled host freshness checking (with the check_host_freshness option), this option has no effect.');
INSERT INTO `label` VALUES (207,'nagios_main_desc','service_freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of service check results. If you have disabled service freshness checking (with the check_service_freshness option), this option has no effect.');
INSERT INTO `label` VALUES (208,'nagios_main_desc','use_regexp_matching','This option determines whether or not various directives in your object definitions will be processed as regular expressions.');
INSERT INTO `label` VALUES (209,'nagios_main_desc','use_true_regexp_matching','If you\'ve enabled regular expression matching of various object directives using the use_regexp_matching option, this option will determine when object directives are treated as regular expressions. If this option is disabled (the default), directives will only be treated as regular expressions if the contain a * or ? wildcard character. If this option is enabled, all appropriate directives will be treated as regular expression - be careful when enabling this!');
INSERT INTO `label` VALUES (210,'nagios_main_desc','log_passive_checks','This variable determines whether or not Nagios will log passive host and service checks that it receives from the external command file. If you are setting up a distributed monitoring environment or plan on handling a large number of passive checks on a regular basis, you may wish to disable this option so your log file doesn\'t get too large.');
INSERT INTO `label` VALUES (211,'nagios_main_desc','daemon_dumps_core','This option determines whether or not Nagios is allowed to create a core dump when it runs as a daemon.  Note that it is generally considered bad form to allow this, but it may be useful for debugging purposes.');
INSERT INTO `label` VALUES (212,'nagios_main_desc','host_perfdata_file','This option allows you to specify a file to which host performance data will be written after every host check. Data will be written to the performance file as specified by the host_perfdata_file_template option. Performance data is only written to this file if the process_performance_data option is enabled globally and if the process_perf_data directive in the host definition is enabled.');
INSERT INTO `label` VALUES (213,'nagios_main_desc','service_perfdata_file','This option allows you to specify a file to which service performance data will be written after every service check. Data will be written to the performance file as specified by the service_perfdata_file_template option. Performance data is only written to this file if the process_performance_data option is enabled globally and if the process_perf_data directive in the service definition is enabled.');
INSERT INTO `label` VALUES (214,'nagios_main_desc','host_perfdata_file_template','This option determines what (and how) data is written to the host performance data file. The template may contain macros, special characters (\\t for tab, \\r for carriage return, \\n for newline) and plain text. A newline is automatically added after each write to the performance data file.');
INSERT INTO `label` VALUES (215,'nagios_main_desc','service_perfdata_file_template','This option determines what (and how) data is written to the service performance data file. The template may contain macros, special characters (\\t for tab, \\r for carriage return, \\n for newline) and plain text. A newline is automatically added after each write to the performance data file.\r\n\r\n');
INSERT INTO `label` VALUES (216,'nagios_main_desc','host_perfdata_file_mode','This option determines whether the host performance data file is opened in write or append mode. Unless the file is a named pipe, you will probably want to use the default mode of append.\r\n\r\n    * a = Open file in append mode (default)\r\n    * w = Open file in write mode ');
INSERT INTO `label` VALUES (217,'nagios_main_desc','service_perfdata_file_mode','This option determines whether the service performance data file is opened in write or append mode. Unless the file is a named pipe, you will probably want to use the default mode of append.\r\n\r\n    * a = Open file in append mode (default)\r\n    * w = Open file in write mode ');
INSERT INTO `label` VALUES (218,'nagios_main_desc','host_perfdata_file_processing_interval','This option allows you to specify the interval (in seconds) at which the host performance data file is processed using the host performance data file processing command. A value of 0 indicates that the performance data file should not be processed at regular intervals.');
INSERT INTO `label` VALUES (219,'nagios_main_desc','service_perfdata_file_processing_interval','This option allows you to specify the interval (in seconds) at which the service performance data file is processed using the service performance data file processing command. A value of 0 indicates that the performance data file should not be processed at regular intervals.');
INSERT INTO `label` VALUES (220,'nagios_main_desc','host_perfdata_file_processing_command','This option allows you to specify the command that should be executed to process the host performance data file. The command argument is the short name of a command definition that you define in your object configuration file. The interval at which this command is executed is determined by the host_perfdata_file_processing_interval directive.');
INSERT INTO `label` VALUES (221,'nagios_main_desc','service_perfdata_file_processing_command','This option allows you to specify the command that should be executed to process the service performance data file. The command argument is the short name of a command definition that you define in your object configuration file. The interval at which this command is executed is determined by the service_perfdata_file_processing_interval directive.');
INSERT INTO `label` VALUES (222,'nagios_main_desc','host_perfdata_file','This directive is used to specify the file where host performance data should be written. An example entry in your main config file might look like this: xpdfile_host_perfdata_file=/usr/local/nagios/var/hostperf.log ');
INSERT INTO `label` VALUES (223,'nagios_main_desc','host_perfdata_template','This directive determines how the host performance data is written to the file. The example template definition show below will cause the performance data to be written to the file in tab-delimited format, with one entry per line (\\t, \\r and \\n are interpreted as tab, carriage return, and newline characters respectively).<br />\r\nxpdfile_host_perfdata_template=$TIMET$\\t$HOSTNAME$\\t$OUTPUT$\\t$PERFDATA$');
INSERT INTO `label` VALUES (224,'nagios_main_desc','service_perfdata_file','This directive is used to specify the file where service performance data should be written. An example entry in your main config file might look like this: service_perfdata_file=/usr/local/nagios/var/serviceperf.log ');
INSERT INTO `label` VALUES (225,'nagios_main_desc','service_perfdata_template','This directive determines how the service performance data is written to the file. The example template definition show below will cause the performance data to be written to the file in tab-delimited format, with one entry per line (\\t, \\r and \\n are interpreted as tab, carriage return, and newline characters respectively).<br />\r\nxpdfile_service_perfdata_template=$TIMET$\\t$HOSTNAME$\\t$SERVICEDESC$\\t$OUTPUT$\\t$PERFDATA$ ');
INSERT INTO `label` VALUES (226,'nagios_main_desc','event_broker_options','Controls what (if any) data gets sent to the event broker.');
INSERT INTO `label` VALUES (227,'nagios_servicegroups_desc','alias','This directive is used to define is a longer name or description used to identify the service group. It is provided in order to allow you to more easily identify a particular service group.');
INSERT INTO `label` VALUES (228,'nagios_servicegroups_desc','servicegroup_name','This directive is used to define a short name used to identify the service group.');
INSERT INTO `label` VALUES (229,'nagios_services_desc','service_description','This directive is used to define the description of the service, which may contain spaces, dashes, and colons (semicolons, apostrophes, and quotation marks should be avoided). No two services associated with the same host can have the same description. Services are uniquely identified with their host_name and service_description directives.');
INSERT INTO `label` VALUES (230,'nagios_services_desc','is_volatile','This directive is used to denote whether the service is \"volatile\". Services are normally not volatile.');
INSERT INTO `label` VALUES (231,'nagios_services_desc','max_check_attempts','This directive is used to define the number of times that Nagios will retry the service check command if it returns any state other than an OK state. Setting this value to 1 will cause Nagios to generate an alert without retrying the service check again.');
INSERT INTO `label` VALUES (232,'nagios_services_desc','normal_check_interval','This directive is used to define the number of \"time units\" to wait before scheduling the next \"regular\" check of the service. \"Regular\" checks are those that occur when the service is in an OK state or when the service is in a non-OK state, but has already been rechecked max_attempts number of times. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. More information on this value can be found in the check scheduling documentation.');
INSERT INTO `label` VALUES (233,'nagios_services_desc','retry_check_interval','This directive is used to define the number of \"time units\" to wait before scheduling a re-check of the service. Services are rescheduled at the retry interval when the have changed to a non-OK state. Once the service has been retried max_attempts times without a change in its status, it will revert to being scheduled at its \"normal\" rate as defined by the check_interval value. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes.');
INSERT INTO `label` VALUES (234,'nagios_services_desc','active_checks_enabled','This directive is used to determine whether or not active checks of this service are enabled. Values: 0 = disable active service checks, 1 = enable active service checks.');
INSERT INTO `label` VALUES (235,'nagios_services_desc','passive_checks_enabled','This directive is used to determine whether or not passive checks of this service are enabled.');
INSERT INTO `label` VALUES (236,'nagios_services_desc','check_period','This directive is used to specify the short name of the time period during which active checks of this service can be made.');
INSERT INTO `label` VALUES (237,'nagios_services_desc','parallelize_check','This directive is used to determine whether or not the service check can be parallelized. By default, all service checks are parallelized. Disabling parallel checks of services can result in serious performance problems. ');
INSERT INTO `label` VALUES (238,'nagios_services_desc','check_freshness','This directive is used to determine whether or not freshness checks are enabled for this service.');
INSERT INTO `label` VALUES (239,'nagios_services_desc','freshness_threshold','This directive is used to specify the freshness threshold (in seconds) for this service. If you set this directive to a value of 0, Nagios will determine a freshness threshold to use automatically.');
INSERT INTO `label` VALUES (240,'nagios_services_desc','event_handler_enabled','This directive is used to determine whether or not the event handler for this service is enabled.');
INSERT INTO `label` VALUES (241,'nagios_services_desc','low_flap_threshold','This directive is used to specify the low state change threshold used in flap detection for this service. If you set this directive to a value of 0, the program-wide value specified by the low_service_flap_threshold directive will be used.');
INSERT INTO `label` VALUES (242,'nagios_services_desc','high_flap_threshold','This directive is used to specify the high state change threshold used in flap detection for this service. If you set this directive to a value of 0, the program-wide value specified by the high_service_flap_threshold directive will be used.');
INSERT INTO `label` VALUES (243,'nagios_services_desc','flap_detection_enabled','This directive is used to determine whether or not flap detection is enabled for this service.');
INSERT INTO `label` VALUES (244,'nagios_services_desc','process_perf_data','This directive is used to determine whether or not the processing of performance data is enabled for this service.');
INSERT INTO `label` VALUES (245,'nagios_services_desc','retain_status_information','This directive is used to determine whether or not status-related information about the service is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.');
INSERT INTO `label` VALUES (246,'nagios_services_desc','retain_nonstatus_information','This directive is used to determine whether or not non-status information about the service is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.');
INSERT INTO `label` VALUES (247,'nagios_services_desc','notification_interval','This directive is used to define the number of \"time units\" to wait before re-notifying a contact that this service is still in a non-OK state. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. If you set this value to 0, Nagios will not re-notify contacts about problems for this service - only one problem notification will be sent out, unless there has been a state change.');
INSERT INTO `label` VALUES (248,'nagios_services_desc','notification_period','This directive is used to specify the short name of the time period during which notifications of events for this service can be sent out to contacts. No service notifications will be sent out during times which is not covered by the time period.');
INSERT INTO `label` VALUES (249,'nagios_services_desc','notification_options','This directive is used to determine when notifications for the service should be sent out.');
INSERT INTO `label` VALUES (250,'nagios_services_desc','notifications_enabled','This directive is used to determine whether or not notifications for this service are enabled.');
INSERT INTO `label` VALUES (251,'nagios_services_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with this service. Multiple contact groups should be separated by commas.');
INSERT INTO `label` VALUES (252,'nagios_services_desc','stalking_options','This directive determines which service states \"stalking\" is enabled for.');
INSERT INTO `label` VALUES (253,'nagios_services_desc','check_command','The full path and arguments to the command to run for this service\'s checks.  If you leave this as empty, you will be able to select a pre-defined command with arguments later.');
INSERT INTO `label` VALUES (254,'nagios_services_desc','user_check_command','Insert the full command line for your User Defined check command.  Used only if selected User Defined in check command.');
INSERT INTO `label` VALUES (255,'nagios_services_desc','host_name','This directive is used to specify the short name of the service that is linked to this host or hostgroup.');
INSERT INTO `label` VALUES (256,'nagios_services_extended_info_desc','notes','This directive is used to define an optional string of notes pertaining to the service. If you specify a note here, you will see the it in the extended information CGI (when you are viewing information about the specified service).');
INSERT INTO `label` VALUES (257,'nagios_services_extended_info_desc','notes_url','This directive is used to define an optional URL that can be used to provide more information about the service. If you specify an URL, you will see a link that says \"Extra Service Notes\" in the extended information CGI (when you are viewing information about the specified service). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/). This can be very useful if you want to make detailed information on the service, emergency contact methods, etc. available to other support staff.');
INSERT INTO `label` VALUES (258,'nagios_services_extended_info_desc','action_url','	This directive is used to define an optional URL that can be used to provide more actions to be performed on the service. If you specify an URL, you will see a link that says \"Extra Service Actions\" in the extended information CGI (when you are viewing information about the specified service). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/).');
INSERT INTO `label` VALUES (259,'nagios_services_extended_info_desc','icon_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be displayed in the status and extended information CGIs. The image will look best if it is 40x40 pixels in size. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).');
INSERT INTO `label` VALUES (260,'nagios_services_extended_info_desc','icon_image_alt','This variable is used to define an optional string that is used in the ALT tag of the image specified by the <icon_image> argument. The ALT tag is used in the status, extended information and statusmap CGIs.');
INSERT INTO `label` VALUES (261,'nagios_timeperiods_desc','timeperiod_name','This directives is the short name used to identify the time period.');
INSERT INTO `label` VALUES (262,'nagios_timeperiods_desc','alias','This directive is a longer name or description used to identify the time period.\r\n');
INSERT INTO `label` VALUES (263,'nagios_timeperiods_desc','days','The sunday through saturday directives are comma-delimited lists of time ranges that are \"valid\" times for a particular day of the week. Notice that there are seven different days for which you can define time ranges (Sunday through Saturday). Each time range is in the form of HH:MM-HH:MM, where hours are specified on a 24 hour clock. For example, 00:15-24:00 means 12:15am in the morning for this day until 12:20am midnight (a 23 hour, 45 minute total time range). If you wish to exclude an entire day from the timeperiod, simply leave it blank.');
INSERT INTO `label` VALUES (264,'nagios_timeperiods_desc','timeperiod_weekday_exception','You can specify a weekday by using \"sunday\" through \"saturday\".  You can also provide an exception which is explained in detail at <a href=\"http://nagios.sourceforge.net/docs/3_0/timeperiods.html\">Nagios\' Timeperiod Documentation</a>.');
INSERT INTO `label` VALUES (265,'nagios_timeperiods_desc','timeperiod_value','Each time range is in the form of HH:MM-HH:MM, where hours are specified on a 24 hour clock. For example, 00:15-24:00 means 12:15am in the morning for this day until 12:00am midnight (a 23 hour, 45 minute total time range). If you wish to exclude an entire day from the timeperiod, simply do not include it in the timeperiod definition. Multiple ranges can be provided as long as they are comma-delimited.  You can also provide a blank value to disable this weekday/exception.');
INSERT INTO `label` VALUES (266,'nagios_timeperiods_desc','exclusion','Specify the names of other timeperiod definitions whose time ranges should be excluded from this timeperiod.');
INSERT INTO `label` VALUES (267,'host_template_autodiscovery','autodiscovery_address_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s address.');
INSERT INTO `label` VALUES (268,'host_template_autodiscovery','autodiscovery_hostname_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s hostname.  If the hostname cannot be looked up, the device\'s address will be used instead.');
INSERT INTO `label` VALUES (269,'host_template_autodiscovery','autodiscovery_os_family_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s family of Operating System.  If this is set, the autodiscovery system MUST get back a value from the device.');
INSERT INTO `label` VALUES (270,'host_template_autodiscovery','autodiscovery_os_generation_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s generation of Operating System.  If this is set, the autodiscovery system MUST get back a value from the device.');
INSERT INTO `label` VALUES (271,'host_template_autodiscovery','autodiscovery_os_vendor_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s Operating System Vendor.  If this is set, the autodiscovery system MUST get back a value from the device.');
INSERT INTO `label` VALUES (272,'host_template_autodiscovery','autodiscovery_service_filter_name','Specify a valid PCRE Regex Pattern to match against a discovered services name.  If this is set, the autodiscovery system MUST get back a value from the device.');
INSERT INTO `label` VALUES (273,'host_template_autodiscovery','autodiscovery_service_filter_product','Specify a valid PCRE Regex Pattern to match against a discovered services product information..  If this is set, the autodiscovery system MUST get back a value from the device.  A Regex Pattern can also be provided for the version.');
INSERT INTO `label` VALUES (274,'host_template_autodiscovery','autodiscovery_service_filter_extra_information','Specify a valid PCRE Regex Pattern to match against a discovered services extra information.  If this is set, the autodiscovery system MUST get back a value from the device.');
INSERT INTO `label` VALUES (275,'nagios_main_desc','check_for_updates','This option determines whether Nagios will automatically check to see if new updates (releases) are available. It is recommend that you enable this option to ensure that you stay on top of the latest critical patches to Nagios. Nagios is critical to you - make sure you keep it in good shape. Nagios will check once a day for new updates. Data collected by Nagios Enterprises from the update check is processed in accordance with our privacy policy - see <a href=\"http://api.nagios.org\">http://api.nagios.org</a> for details.');
INSERT INTO `label` VALUES (276,'nagios_main_desc','check_for_orphaned_hosts','This option allows you to enable or disable checks for orphaned hoste checks. Orphaned host checks are checks which have been executed and have been removed from the event queue, but have not had any results reported in a long time. Since no results have come back in for the host, it is not rescheduled in the event queue. This can cause host checks to stop being executed. Normally it is very rare for this to happen - it might happen if an external user or process killed off the process that was being used to execute a host check. If this option is enabled and Nagios finds that results for a particular host check have not come back, it will log an error message and reschedule the host check. If you start seeing host checks that never seem to get rescheduled, enable this option and see if you notice any log messages about orphaned hosts.');
INSERT INTO `label` VALUES (277,'nagios_main_desc','bare_update_check','This option deterines what data Nagios will send to api.nagios.org when it checks for updates. By default, Nagios will send information on the current version of Nagios you have installed, as well as an indicator as to whether this was a new installation or not. Nagios Enterprises uses this data to determine the number of users running specific version of Nagios. Enable this option if you do not wish for this information to be sent.');
INSERT INTO `label` VALUES (278,'nagios_main_desc','temp_path','This is path where Nagios can create temp files for service and host check results, etc.');
INSERT INTO `label` VALUES (279,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (280,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (281,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (282,'nagios_main_desc','log_current_states',' This option determines whether or not Nagios will log host and service current states at the beginning of a newly created log file after log rotation occurs. In Nagios Core 3, current states were always logged after a log rotation. In Nagios Core 4, the default behavior is to log current states after log rotation, but it can be disabled by setting log_current_states=0. In a large installation, disabling the logging of current states after log rotation can save considerable amounts of disk space, especially if the logs are rotated frequently. This risk is that, if logs are aged off and deleted, you may not have sufficient state information to calculate things like availability. <br><br>0 = Disable logging current state after log rotation<br>1 = Enable logging current state after log rotation (default).');
INSERT INTO `label` VALUES (283,'nagios_main_desc','check_workers','This setting specifies how many worker process should be started when Nagios Core starts. Worker processes are used to perform host and service checks. If the number of workers is not specified, a default number of workers is determined based on the number of CPU cores on the system (1.5 workers per core). If not specified, there is always a minimum of 4 workers.');
INSERT INTO `label` VALUES (284,'nagios_main_desc','query_socket','This is the path to the Unix-domain socket used by the <a href=\"http://nagios.sourceforge.net/docs/nagioscore/4/en/whatsnew.html#qh\">query handler</a> interface. The default value is /usr/local/nagios/var/rw/nagios.qh.');
INSERT INTO `label` VALUES (285,'nagios_cgi_desc','nagios_check_command','This is an optional command that the CGIs can use to check the status of the Nagios process. This provides the CGIs (as well as yourself) with some idea of whether or not Nagios is still running. If you do not specify a command to be run, the CGIs will assume that the Nagios process is running. If you do define a process check command, it should follow the same guidelines that are required of standard plugins. If the command returns a non-OK status, the CGIs will think the Nagios process is not running and will refuse to allow you to commit any commands via the command CGI.');
INSERT INTO `label` VALUES (286,'nagios_main_desc','check_for_updates','This option determines whether Nagios will automatically check to see if new updates (releases) are available. It is recommend that you enable this option to ensure that you stay on top of the latest critical patches to Nagios. Nagios is critical to you - make sure you keep it in good shape. Nagios will check once a day for new updates. Data collected by Nagios Enterprises from the update check is processed in accordance with our privacy policy - see <a href=\"http://api.nagios.org\">http://api.nagios.org</a> for details.');
INSERT INTO `label` VALUES (287,'nagios_main_desc','check_for_orphaned_hosts','This option allows you to enable or disable checks for orphaned hoste checks. Orphaned host checks are checks which have been executed and have been removed from the event queue, but have not had any results reported in a long time. Since no results have come back in for the host, it is not rescheduled in the event queue. This can cause host checks to stop being executed. Normally it is very rare for this to happen - it might happen if an external user or process killed off the process that was being used to execute a host check. If this option is enabled and Nagios finds that results for a particular host check have not come back, it will log an error message and reschedule the host check. If you start seeing host checks that never seem to get rescheduled, enable this option and see if you notice any log messages about orphaned hosts.');
INSERT INTO `label` VALUES (288,'nagios_main_desc','bare_update_check','This option deterines what data Nagios will send to api.nagios.org when it checks for updates. By default, Nagios will send information on the current version of Nagios you have installed, as well as an indicator as to whether this was a new installation or not. Nagios Enterprises uses this data to determine the number of users running specific version of Nagios. Enable this option if you do not wish for this information to be sent.');
INSERT INTO `label` VALUES (289,'nagios_main_desc','temp_path','This is path where Nagios can create temp files for service and host check results, etc.');
INSERT INTO `label` VALUES (290,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (291,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (292,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (293,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (294,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (295,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (296,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (297,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (298,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (299,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (300,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (301,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (302,'nagios_main_desc','log_current_states',' This option determines whether or not Nagios will log host and service current states at the beginning of a newly created log file after log rotation occurs. In Nagios Core 3, current states were always logged after a log rotation. In Nagios Core 4, the default behavior is to log current states after log rotation, but it can be disabled by setting log_current_states=0. In a large installation, disabling the logging of current states after log rotation can save considerable amounts of disk space, especially if the logs are rotated frequently. This risk is that, if logs are aged off and deleted, you may not have sufficient state information to calculate things like availability. <br><br>0 = Disable logging current state after log rotation<br>1 = Enable logging current state after log rotation (default).');
INSERT INTO `label` VALUES (303,'nagios_main_desc','check_workers','This setting specifies how many worker process should be started when Nagios Core starts. Worker processes are used to perform host and service checks. If the number of workers is not specified, a default number of workers is determined based on the number of CPU cores on the system (1.5 workers per core). If not specified, there is always a minimum of 4 workers.');
INSERT INTO `label` VALUES (304,'nagios_main_desc','query_socket','This is the path to the Unix-domain socket used by the <a href=\"http://nagios.sourceforge.net/docs/nagioscore/4/en/whatsnew.html#qh\">query handler</a> interface. The default value is /usr/local/nagios/var/rw/nagios.qh.');
INSERT INTO `label` VALUES (305,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.');
INSERT INTO `label` VALUES (306,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).');
INSERT INTO `label` VALUES (307,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.');
INSERT INTO `label` VALUES (308,'nagios_main_desc','log_current_states',' This option determines whether or not Nagios will log host and service current states at the beginning of a newly created log file after log rotation occurs. In Nagios Core 3, current states were always logged after a log rotation. In Nagios Core 4, the default behavior is to log current states after log rotation, but it can be disabled by setting log_current_states=0. In a large installation, disabling the logging of current states after log rotation can save considerable amounts of disk space, especially if the logs are rotated frequently. This risk is that, if logs are aged off and deleted, you may not have sufficient state information to calculate things like availability. <br><br>0 = Disable logging current state after log rotation<br>1 = Enable logging current state after log rotation (default).');
INSERT INTO `label` VALUES (309,'nagios_main_desc','check_workers','This setting specifies how many worker process should be started when Nagios Core starts. Worker processes are used to perform host and service checks. If the number of workers is not specified, a default number of workers is determined based on the number of CPU cores on the system (1.5 workers per core). If not specified, there is always a minimum of 4 workers.');
INSERT INTO `label` VALUES (310,'nagios_main_desc','query_socket','This is the path to the Unix-domain socket used by the <a href=\"http://nagios.sourceforge.net/docs/nagioscore/4/en/whatsnew.html#qh\">query handler</a> interface. The default value is /usr/local/nagios/var/rw/nagios.qh.');
INSERT INTO `label` VALUES (311,'nagios_cgi_desc','nagios_check_command','This is an optional command that the CGIs can use to check the status of the Nagios process. This provides the CGIs (as well as yourself) with some idea of whether or not Nagios is still running. If you do not specify a command to be run, the CGIs will assume that the Nagios process is running. If you do define a process check command, it should follow the same guidelines that are required of standard plugins. If the command returns a non-OK status, the CGIs will think the Nagios process is not running and will refuse to allow you to commit any commands via the command CGI.');
DROP TABLE IF EXISTS `lilac_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lilac_configuration` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Lilac Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lilac_configuration` VALUES ('db_build','61');
INSERT INTO `lilac_configuration` VALUES ('rgm_base_release','2021072201');
INSERT INTO `lilac_configuration` VALUES ('rgm_user_default_group_id','3');
INSERT INTO `lilac_configuration` VALUES ('rgm_user_default_notify_host_command','11');
INSERT INTO `lilac_configuration` VALUES ('rgm_user_default_notify_service_command','12');
DROP TABLE IF EXISTS `nagios_broker_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_broker_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Event Broker Modules';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_broker_module` VALUES (1,'/srv/rgm/mk-livestatus/lib/livestatus.o /srv/rgm/nagios/var/log/rw/live');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CGI Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_cgi_configuration` VALUES (1,'/srv/rgm/nagios/share','/nagios',1,'','admin','admin','admin','admin','admin','admin','admin',NULL,NULL,5,NULL,4,90,NULL,NULL,NULL,NULL,NULL,'/bin/ping',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DROP TABLE IF EXISTS `nagios_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `line` text NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Command';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_command` VALUES (1,'event-browser-host','srv/rgm/ged/scripts/ged-nagios-host \"$HOSTNAME$\" \"PING\" \"$HOSTSTATE$\" \"$HOSTOUTPUT$\" \"$HOSTADDRESS$\" \"$HOSTALIAS$\" \"$HOSTGROUPNAMES$\"','event browser command for hosts');
INSERT INTO `nagios_command` VALUES (2,'event-browser-service','/srv/rgm/ged/scripts/ged-nagios-service \"$HOSTNAME$\" \"$SERVICEDESC$\" \"$SERVICESTATE$\" \"$SERVICEOUTPUT$\" \"$HOSTADDRESS$\" \"$HOSTALIAS$\" \"$HOSTGROUPNAMES$\" \"$SERVICEGROUPNAMES$\"','event browser command for services');
INSERT INTO `nagios_command` VALUES (3,'nagflux_host-perfdata_processor','mv /srv/rgm/nagflux/var/spool-nagios/host-perfdata /srv/rgm/nagflux/var/spool/host-perfdata-$(date +%s.%N)','generate host perfdata for Nagflux');
INSERT INTO `nagios_command` VALUES (4,'nagflux_service-perfdata_processor','mv /srv/rgm/nagflux/var/spool-nagios/service-perfdata /srv/rgm/nagflux/var/spool/service-perfdata-$(date +%s.%N)','generate service perfdata for NagFlux');
INSERT INTO `nagios_command` VALUES (5,'nagios_true','/bin/true','Nagios command that always return true');
INSERT INTO `nagios_command` VALUES (6,'nagios_false','/bin/false','Nagios command that always return false');
INSERT INTO `nagios_command` VALUES (11,'rgm_host_notifier','$USER17$/notifier/bin/notifier.pl -t host -c $USER17$/notifier/etc/notifier.cfg -r $USER17$/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -e \"$HOSTSTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$HOSTOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$HOSTNOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','RGM notification broker for host');
INSERT INTO `nagios_command` VALUES (12,'rgm_service_notifier','$USER17$/notifier/bin/notifier.pl -t service -c $USER17$/notifier/etc/notifier.cfg -r $USER17$/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -s \"$SERVICEDESC$\" -e \"$SERVICESTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$SERVICEOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -B \"$SERVICEGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$SERVICENOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','RGM notification broker for service');
INSERT INTO `nagios_command` VALUES (20,'check-host-alive','$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 1','check the availability of a host by ping');
INSERT INTO `nagios_command` VALUES (21,'dummy_check','$USER1$/check_dummy $ARG1$ \"$ARG2$\"','Dummy check. $ARG1$ is the return code, $ARG2$ is the return text');
INSERT INTO `nagios_command` VALUES (22,'elastic_interfaces','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/interfaces.py -H $HOSTNAME$ -t 5','ElasticSearch/MetricBeat metrics - INTERFACES');
INSERT INTO `nagios_command` VALUES (23,'elastic_disk','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/disk.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ -v $ARG3$ $ARG4$ $ARG5$ -t 5','ElasticSearch/MetricBeat metrics - disk usage - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (24,'elastic_load','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/load.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$ -t 5','ElasticSearch/MetricBeat metrics - CPU load - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (25,'elastic_uptime','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/uptime.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$','ElasticSearch/MetricBeat metrics - uptime - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (26,'elastic_memory','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/memory.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$ -t 5','ElasticSearch/MetricBeat metrics - memory usage - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (27,'elastic_cpu','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/cpu.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$ -t 5','ElasticSearch/MetricBeat metrics - CPU - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (28,'snmp_process-vcsa','$USER1$/rgm/snmp/check_snmp_process.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','check the load of a given process - arg1 : process name');
INSERT INTO `nagios_command` VALUES (29,'snmp_uptime','$USER1$/rgm/snmp/check_snmp_uptime.pl -H $HOSTADDRESS$ -C $USER2$ -2 -w $ARG1$ -c $ARG2$','uptime snmp');
INSERT INTO `nagios_command` VALUES (30,'snmp_systime','$USER1$/rgm/system/check_systime.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','systime snmp');
INSERT INTO `nagios_command` VALUES (31,'snmp_partitions','$USER1$/rgm/snmp/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m $ARG1$ -w $ARG2$ -c $ARG3$ -t 60 -f $ARG4$ $ARG5$ $ARG6$','used space on a windows partition or linux file system');
INSERT INTO `nagios_command` VALUES (32,'db_oracle_health','perl $USER1$/rgm/database/check_oracle_health --connect \'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$HOSTADDRESS$)(PORT=$ARG1$))(LOAD_BALANCE=yes)(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=$HOSTALIAS$)))\' --user $USER25$ --password $USER26$ --mode $SERVICEDISPLAYNAME$ $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$','Check Oracle (ARG1: TCP Port); ARG2 and ARG3 available for options. (ARG2 could be: --report html) to handle long list');
INSERT INTO `nagios_command` VALUES (33,'virt_ntx_snmp','$USER1$/rgm/virtu/check_nutanix.pl -H $HOSTADDRESS$ -a SHA -u $USER21$ -A $USER8$ -x AES -X $USER8$ -t $ARG1$ -s $SERVICEDESC$ -w $SERVICEDESC$=$ARG2$ -c $SERVICEDESC$=$ARG3$','check_nutanix_snmp');
INSERT INTO `nagios_command` VALUES (34,'virt_ntx_snmp-vmpowerstate','$USER1$/rgm/virtu/check_nutanix.pl -H $HOSTADDRESS$ -a SHA -u $USER21$ -A $USER8$ -x AES -X $USER8$ -t $ARG1$ -s $SERVICEDESC$ -r \'$ARG2$\' -e -S','check_nutanix_snmp');
INSERT INTO `nagios_command` VALUES (35,'virt_ntx_status','perl $USER1$/rgm/virtu/check_ssh_nutanix_cluster.pl -H $HOSTADDRESS$ -u $USER22$ -p $USER23$ -T status','nutanix_status');
INSERT INTO `nagios_command` VALUES (36,'virt_ntx_alerts','perl $USER1$/rgm/virtu/check_ssh_nutanix_cluster.pl -H $HOSTADDRESS$ -u $USER22$ -p $USER23$ -T alerts','nutanix_alerts');
INSERT INTO `nagios_command` VALUES (37,'net_interface_traffic','$USER1$/rgm/network/check_nwc_health --hostname $HOSTADDRESS$ --community $USER2$ --mode interface-usage --multiline --name \"$ARG1$\"  --warning $ARG2$ --critical $ARG3$ --units GB','ARG1: Name of port, ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (38,'snmp_linux_memory','$USER1$/rgm/snmp/check_snmp_mem.pl -H $HOSTADDRESS$ -f -C $USER2$ -w $ARG1$,$ARG2$ -c $ARG3$,$ARG4$ -b -2','memory load of a linux host');
INSERT INTO `nagios_command` VALUES (39,'snmp_linux_cpu_load','$USER1$/rgm/snmp/check_snmp_load.pl -H $HOSTADDRESS$ -T netsc -C $USER2$ -w $ARG1$ -c $ARG2$ -f','cpu load of a linux host');
INSERT INTO `nagios_command` VALUES (40,'snmp_windows_cpu_load','$USER1$/rgm/snmp/check_snmp_load.pl -H $HOSTADDRESS$ -C $USER2$ -w $ARG1$ -c $ARG2$ -f','cpu load of a windows host');
INSERT INTO `nagios_command` VALUES (41,'snmp_win_memory','$USER1$/rgm/snmp/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m \"Mem\" -w $ARG1$ -c $ARG2$ -f','memory load of a windows server');
INSERT INTO `nagios_command` VALUES (42,'wmi_Disk-Queue','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m checkio -s logical -a $ARG1$ -w CurrentDiskQueueLenght=$ARG2$ -c CurrentDiskQueueLenght=$ARG3$ ','Check  Disk Queue Lenght of Windows Server. ARG1=Drive (i.e: C:), ARG2 Warning Queue, ARG3 Critical Queue');
INSERT INTO `nagios_command` VALUES (43,'wmi_PageFileUsage','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m checkpage $ARG1$ $ARG2$','Check Usage Pagefile Usage of Windows Server. ARG1 and ARG2 available for customization.');
INSERT INTO `nagios_command` VALUES (44,'wmi_Processor','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m checkcpu $ARG1$ $ARG2$','Check % Processor Usage of Windows Server ARG1 and ARG2 avail for custom applying');
INSERT INTO `nagios_command` VALUES (45,'wmi_PhysFreeMemory','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m checkmem  -w _MemFree%=$ARG1$: -c _MemFree%=$ARG2$:','Check % Processor Usage of Windows Server. ARG1 = %WarningMinimumFree  ARG2 = %CriticalMinimumFree');
INSERT INTO `nagios_command` VALUES (46,'wmi_windows_uptime','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m $ARG1$ -t 300','check_wmi_plus_windows_template');
INSERT INTO `nagios_command` VALUES (47,'wmi_Network','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m  checknetwork -a $ARG1$','Check Network state of Windows Server ');
INSERT INTO `nagios_command` VALUES (48,'elastic_process','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/process_nb.py -H $HOSTNAME$ -P $ARG1$ -w $ARG2$ -c $ARG3$ $ARG4$ $ARG5$ -t 5','ElasticSearch/MetricBeat metrics - PROCESS - ARG1: Process name, ARG2: warning, ARG3: critical, ARG4-5: optional args (-t -Timeout)');
INSERT INTO `nagios_command` VALUES (49,'elastic_windows_service','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/service_windows.py -H $HOSTNAME$ -S $ARG1$ -c $ARG2$ $ARG3$ $ARG4$ -t 5','ElasticSearch/MetricBeat metrics - SERVICES WINDOWS - ARG1: Service name (short name), ARG2: critical, ARG3-4 and warning: optional args (-t -Timeout)');
INSERT INTO `nagios_command` VALUES (50,'db_mysql_simple_connect','$USER1$/rgm/database/check_mysql.pl -H $HOSTADDRESS$ -u $ARG1$ -p $ARG2$','Check mysql simple connection');
INSERT INTO `nagios_command` VALUES (51,'db_postgres_health','$USER1$/rgm/database/check_postgres.pl --host=$HOSTADDRESS$ --dbname=$HOSTNAME$ --dbuser=$USER23$ --dbpass=$USER24$ --action=$SERVICEDESC$ $ARG2$ $ARG3$','ARG1: DB Name, ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (52,'sys_ldap_connect','$USER1$/check_ldap -H $HOSTADDRESS$ -b $ARG1$ -P $ARG2$ -D \"$ARG3$\"','ARG1: base DN (DC=XXXX,DC=XXXX), ARG2: password, ARG3: binddn (CN=XXXXX,OU=XXXXX,,DC=XXXXXX,DC=XXXX)');
INSERT INTO `nagios_command` VALUES (53,'sys_ldaps_connect','$USER1$/check_ldaps -H $HOSTADDRESS$ -b $ARG1$ -p $ARG2$ -P $ARG3$ -D \"$ARG4$\"','ARG1: base DN (DC=XXXX,DC=XXXX), ARG2: ssl_port ARG3: password, ARG4: binddn (CN=XXXXX,OU=XXXXX,,DC=XXXXXX,DC=XXXX)');
INSERT INTO `nagios_command` VALUES (54,'sys_certificate_validity','$USER1$/rgm/system/check_certificates.pl -c $ARG1$: $HOSTADDRESS$','ARG1: port TCP, ARG2: warning,critical days before end time of certificate');
INSERT INTO `nagios_command` VALUES (55,'sys_http_url_status','$USER1$/check_http -H $HOSTADDRESS$ -p $ARG1$ -w $ARG2$ -c $ARG3$','ARG1: port, ARG2: warning ARG3: critical');
INSERT INTO `nagios_command` VALUES (56,'db_mysql_health','$USER1$/rgm/database/check_mysql_health --hostname $HOSTNAME$ --username $USER25$ --password $USER26$ --port $ARG1$ --mode $SERVICEDESC$','db_mysql_health');
INSERT INTO `nagios_command` VALUES (57,'sys_dns_status','$USER1$/check_dns -H $ARG1$ -s $HOSTADDRESS$ -w $ARG2$ -c $ARG3$','ARG1: Domain Name (FQDN), ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (58,'sys_http_url_status_with_login','$USER1$/check_http -H $HOSTADDRESS$ -u $ARG1$ -p $ARG2$ -a $USER25$:$USER26$ -w $ARG3$ -c $ARG4$','ARG1: url directory, ARG2: port, ARG3: warning ARG4: critical');
INSERT INTO `nagios_command` VALUES (59,'sys_haproxy_status','$USER1$/rgm/system/check_haproxy.rb -u $ARG1$ -U $USER25$ -P \'$USER26$\' -w $ARG2$ -c $ARG3$','ARG1: url stauts page haproxy, ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (60,'net_nwc_health','$USER1$/rgm/network/check_nwc_health --hostname $HOSTADDRESS$ --community $USER2$ --mode $SERVICEDESC$ --multiline $ARG1$ $ARG2$ $ARG3$','ARG1: --warning ARG, ARG2: --critical ARG, ARG3: extended option like --units GB');
INSERT INTO `nagios_command` VALUES (61,'net_interface_discards','$USER1$/rgm/network/check_nwc_health --hostname $HOSTADDRESS$ --community $USER2$ --mode interface-discards --multiline --name \"$ARG1$\"  --warning $ARG2$ --critical $ARG3$ --units GB','ARG1: Name of port, ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (62,'net_interface_errors','$USER1$/rgm/network/check_nwc_health --hostname $HOSTADDRESS$ --community $USER2$ --mode interface-errors --multiline --name \"$ARG1$\"  --warning $ARG2$ --critical $ARG3$ --units GB','ARG1: Name of port, ARG2: warning, ARG3: critical');
INSERT INTO `nagios_command` VALUES (63,'sto_3par','$USER1$/rgm/storage/check_3PAR $HOSTADDRESS$ $USER29$ $ARG1$','ARG1: node_check');
INSERT INTO `nagios_command` VALUES (64,'virt_vmware_esx','$USER1$/rgm/virtu/check_vmware_esx.pl -D $HOSTALIAS$ -u \'$USER11$\\$USER27$\' -p \'$USER28$\' -H $HOSTNAME$ $ARG1$ $ARG2$ $ARG3$ $ARG4$ --sessionfiledir=/var/tmp/check_esx/ --sessionfile=$HOSTALIAS$-$HOSTNAME$-session_file.txt','ARG1: mode, ARG2: submode, ARG3: warning, ARG4: critical');
INSERT INTO `nagios_command` VALUES (65,'sys_tcp_connect','$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$ -w $ARG1$ -c $ARG2$','ARG1: port TCP');
INSERT INTO `nagios_command` VALUES (66,'apache_status','bash $USER1$/rgm/apache/check_apache2.sh -H $HOSTADDRESS$ $ARG1$ $ARG2$','Apache Status Pages. ARG1 and ARG2 are available.');
INSERT INTO `nagios_command` VALUES (67,'gedevent','$USER1$/rgm/nagios/check_gedevents.pl -t $ARG1$ -s $ARG2$  -u $USER12$ -p \"$USER13$\" -H $HOSTADDRESS$ $ARG3$ $ARG4$ -Pe $SERVICEDISPLAYNAME$','ARG1 host(groups), service(groups) ; ARG2 sting (Ex : Cam%) ; ARG3 -we/-ce ev nb, -Wo/-Co occ nb ; ARG4 -Sc complement in sql');
INSERT INTO `nagios_command` VALUES (68,'net_interface_elastic','$USER17$/python-rgm/bin/python3 $USER1$/rgm/network/check_el_nwc.py -H \'$HOSTADDRESS$\' -n \'$SERVICEDISPLAYNAME$\'','Verification de l\'ÃƒÂ©tat de l\'interface via elasticsearch');
INSERT INTO `nagios_command` VALUES (69,'hw_ilo4_snmp','$USER1$/rgm/hardware/check_hp -H $HOSTADDRESS$ -C $USER2$','Configure SNMP Community on USER2');
INSERT INTO `nagios_command` VALUES (70,'wmi_Processor-Queue','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m checkcpuq $ARG1$ $ARG2$','Check  Processor Queue Lenght of Windows Server ARG1 and ARG2 avail for custom applying');
INSERT INTO `nagios_command` VALUES (71,'wmi_Network_outQueue_vmxnet3','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m  checknetwork -a vmxnet3 -w OutputQueueLength=$ARG1$ -c OutputQueueLength=$ARG2$','Check Network Out Queue lenght of Windows Server VM. ARG1warning size,  ARG2 critical');
INSERT INTO `nagios_command` VALUES (72,'wmi_Network_PacketError_vmxnet3','$USER1$/rgm/windows/wmi/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER5$/$USER6$ -p $USER7$ -m  checknetwork -a vmxnet3 -w PacketsReceivedErrors=$ARG1$ -c PacketsReceivedErrors=$ARG2$','Check Network Packets Received Errors of Windows Server VM. ARG1warning size,  ARG2 critical');
INSERT INTO `nagios_command` VALUES (73,'container_cpu','$USER17$/python-rgm/bin/python3 $USER1$/rgm/container/check_container_cpu.py -H $ARG1$ -l $ARG2$ -w $ARG3$ -c $ARG4$ $ARG5$ $ARG6$','Prometheus metrics - Container CPU - ARG1: value to match, ARG2 : Prometheus label name, ARG3: warning, ARG4: critical, ARG5, ARG6: optional args (-i -E)');
INSERT INTO `nagios_command` VALUES (74,'container_disk','$USER17$/python-rgm/bin/python3 $USER1$/rgm/container/check_container_disk.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$ ','Prometheus metrics - Container Disk - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-i -E)');
INSERT INTO `nagios_command` VALUES (75,'container_memory','$USER17$/python-rgm/bin/python3 $USER1$/rgm/container/check_container_memory.py -H $ARG1$ -l $ARG2$ -w $ARG3$ -c $ARG4$ $ARG5$ $ARG6$','Prometheus metrics - Container Memory - ARG1: value to match, ARG2 : Prometheus label name, ARG3: warning, ARG4: critical, ARG5, ARG6: optional args (-i -E)');
INSERT INTO `nagios_command` VALUES (76,'container_uptime','$USER17$/python-rgm/bin/python3 $USER1$/rgm/container/check_container_uptime.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$ $ARG4$','Prometheus metrics - Container Uptime - ARG1: warning, ARG2: critical, ARG3, ARG4: optional args (-i -E)');
INSERT INTO `nagios_command` VALUES (77,'net_interface_snmp',' $USER1$/rgm/network/check_int_traffic.pl -H $HOSTADDRESS$ -C $USER2$ $ARG1$','ARG1 specify SNMP version');
INSERT INTO `nagios_command` VALUES (78,'net_clearpass_service','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_service.py -H $HOSTADDRESS$ -n $SERVICEDESC$ -u $USER27$ -c $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password SERVICEDESC : name of service');
INSERT INTO `nagios_command` VALUES (79,'net_clearpass_events','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_events.py -H $HOSTADDRESS$ -s $ARG1$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password ARG1 : Define criticity of events');
INSERT INTO `nagios_command` VALUES (80,'net_clearpass_cluster','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_cluster.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (81,'net_clearpass_syslog','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_syslog.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (82,'net_clearpass_filebackupsrv','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_filebackupsrv.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (83,'net_clearpass_autoupdates','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_autoupdates.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (84,'net_clearpass_failover','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_failover.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (85,'net_clearpass_supportaccount','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_supportaccount.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (86,'net_clearpass_insight','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_insight.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (87,'net_clearpass_replication','$USER17$/python-rgm/bin/python3 $USER1$/rgm/clearpass/check_clearpass_API_replication.py -H $HOSTADDRESS$ -u $USER27$ -i $USER28$ -p $USER29$','USER27 : API User Name, USER28 : Client ID, USER29 : API password');
INSERT INTO `nagios_command` VALUES (88,'ssl_certificat_status','$USER1$/check_http -H $ARG1$ -C $ARG2$,$ARG3$','$ARG1$ : warning threshold, $ARG2$ : critical threshold');
INSERT INTO `nagios_command` VALUES (89,'snmp_generic_oid','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -C $USER2$ $ARG2$ $ARG3$ $ARG4$ $ARG5$','ARG1 : pecify SNMP oid, ARGX : What you want or you need');
INSERT INTO `nagios_command` VALUES (90,'snmp_generic_oid_with_mibs','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -C $USER2$ -m $ARG2$ -P $ARG3$ -l $ARG4$ ','check a simple SNMP oid by mibs file');
INSERT INTO `nagios_command` VALUES (91,'net_airwave_AP_down_from_folder','$USER17$/python-rgm/bin/python3 $USER1$/rgm/network/airwave/check_airwave_API_folders.py -H $HOSTADDRESS$ -u $USER31$ -p \'$USER32$\' -w $ARG1$ -c $ARG2$','USER31= API Account, USER32= API Password, ARG1 and ARG2= Thresholds');
INSERT INTO `nagios_command` VALUES (92,'net_airwave_AP_Mismatched_and_VC_count','$USER17$/python-rgm/bin/python3 $USER1$/rgm/network/airwave/check_airwave_API_ap.py -H $HOSTADDRESS$ -u $USER31$ -p \'$USER32$\'','USER31= API Account, USER32= API Password');
INSERT INTO `nagios_command` VALUES (93,'net_airwave_Alerts','$USER17$/python-rgm/bin/python3 $USER1$/rgm/network/airwave/check_airwave_API_alerts.py -H $HOSTADDRESS$ -u $USER31$ -p \'$USER32$\' -s $ARG1$ -w $ARG2$ -c $ARG3$','USER31= API Account, USER32= API Password, ARG1= Alerts Level, ARG2, ARG3= Warning and Crtitical threshold');
INSERT INTO `nagios_command` VALUES (94,'elastic_systime','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/systime.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ $ARG3$','ElasticSearch/MetricBeat metrics - system time - ARG1: warning, ARG2: critical, ARG3: optional arg (-E)');
INSERT INTO `nagios_command` VALUES (95,'check_nrpe','$USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$ $ARG2$ $ARG3$ $ARG4$','check_nrpe -H -host <some host> -b --bindaddr <some local address> -p --port <some port> -n --nossl -c --command <some command> (--check is deprecated) -h --help');
INSERT INTO `nagios_command` VALUES (97,'db_oracle_health_rgm','perl $USER1$/rgm/database/check_oracle_health_rgm --connect \'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$HOSTADDRESS$)(PORT=$ARG1$))(LOAD_BALANCE=yes)(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=$HOSTALIAS$)))\' --user $USER25$ --password $USER26$ --mode $SERVICEDISPLAYNAME$ $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$','Check Oracle (ARG1: TCP Port); ARG2 and ARG3 available for options. (ARG2 could be: --report html) to handle long list');
INSERT INTO `nagios_command` VALUES (98,'veeam_licences','$USER17$/python-rgm/bin/python3 $USER1$/rgm/backup/check_wmi_veeam_licence.py -H $HOSTNAME$ -u $USER30$ -p $USER31$ -w $ARG1$ -c $ARG2$ $ARG3$','Enterprise Manager WMI - Licences status - ARG1: Warning threshold, ARG2: Critical threshold, ARG3: Domain Name (optional)');
INSERT INTO `nagios_command` VALUES (99,'veeam_jobs','$USER17$/python-rgm/bin/python3 $USER1$/rgm/backup/check_veeam_jobs.py -H $HOSTNAME$ -u $USER23$ -p $USER24$ $ARG1$','Veeam API - Jobs status - ARG1: Job Name (optional)');
INSERT INTO `nagios_command` VALUES (100,'elastic_windows_cpu_queue','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/win_cpu_queue.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ -t 5 $ARG3$ ','ElasticSearch/MetricBeat metrics - cpu queue size - ARG1: warning, ARG2: critical, ARG3: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (101,'elastic_disk_queue','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/disk_queue.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ -t 5 $ARG3$ ','ElasticSearch/MetricBeat metrics - disk queue size - ARG1: warning, ARG2: critical, ARG3: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (102,'elastic_windows_disk_queue','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/win_disk_queue.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ -t 5 $ARG3$ ','ElasticSearch/MetricBeat metrics - disk queue size - ARG1: warning, ARG2: critical, ARG3: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (103,'elastic_windows_network_queue','$USER17$/python-rgm/bin/python3 $USER1$/rgm/metricbeat/win_network_queue.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$ -t 5 $ARG3$ ','ElasticSearch/MetricBeat metrics - network queue size - ARG1: warning, ARG2: critical, ARG3: optional args (-t -E)');
INSERT INTO `nagios_command` VALUES (104,'es_index_status','$USER17$/python-rgm/bin/python3 $USER1$/rgm/nagios/check_es_index.py','VÃƒÆ’Ã‚Â©rification de l\'ÃƒÆ’Ã‚Â©tat des index elastic locaux ÃƒÆ’Ã‚Â  RGM. ');
INSERT INTO `nagios_command` VALUES (105,'sys_rgm_consumer_cert','$USER17$/python-rgm/bin/python3 $USER1$/rgm/business/check_rgm_consumer_cert.py','check du status du certificat client RGM Business');
INSERT INTO `nagios_command` VALUES (106,'sys_teleport','$USER17$/python-rgm/bin/python3 $USER1$/rgm/business/check_teleport.py -m $ARG1$','check du service Teleport (https://goteleport.com)');
INSERT INTO `nagios_command` VALUES (107,'cloud_azure_appservice','$USER17$/python-rgm/bin/python3 $USER1$/rgm/azure/check_api_azure_appservice_status.py -i \'$USER11$\' -s \'$USER12$\' -d \'$USER13$\' -S \'$USER14$\' -r \'$ARG1$\' -a \'$ARG2$\'','check azure appservice with args (tenant id, secret, resource group,...) -a AppService -r ResourceGroup');
INSERT INTO `nagios_command` VALUES (108,'cloud_azure_vm_status','$USER17$/python-rgm/bin/python3 $USER1$/rgm/azure/check_api_azure_vm_status.py -i \'$USER11$\' -s \'$USER12$\' -d \'$USER13$\' -S \'$USER14$\' -r \'$ARG1$\' -v \'$ARG2$\'','check azure vm status with args (tenant id, secret, resource group,...) -v VMname -r ResourceGroup');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_contact` VALUES (1,'admin','default user','','',1,1,1,1,1,1,1,0,0,1,1,1,1,0,1,1,1);
INSERT INTO `nagios_contact` VALUES (2,'ged','ged brocking event ',NULL,NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_contact_group` VALUES (1,'admins','RGM Administrators');
INSERT INTO `nagios_contact_group` VALUES (2,'notify_everybody','A generic group to receive advanced notifications');
INSERT INTO `nagios_contact_group` VALUES (3,'users','Default users group');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Member of a Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_contact_group_member` VALUES (1,1,1);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Notification Command for a Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_contact_notification_command` VALUES (1,1,11,'host');
INSERT INTO `nagios_contact_notification_command` VALUES (2,1,12,'service');
INSERT INTO `nagios_contact_notification_command` VALUES (25,3,11,'host');
INSERT INTO `nagios_contact_notification_command` VALUES (26,3,12,'service');
INSERT INTO `nagios_contact_notification_command` VALUES (31,2,1,'host');
INSERT INTO `nagios_contact_notification_command` VALUES (32,2,2,'service');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Host';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_host` VALUES (1,'RGM','RGM host itself','RGM_HOST',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rgm.png',NULL,'rgm.png','rgm.png',NULL,NULL);
INSERT INTO `nagios_host` VALUES (2,'bp_apps_gold','BP application with Gold contract service placeholder',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host` VALUES (3,'bp_apps_silver','BP application with Silver contract service placeholder',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host` VALUES (4,'bp_apps_bronze','BP application with Bronze contract service placeholder',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host` VALUES (5,'BP_APPLICATIONS','BP_APPLICATIONS',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host` VALUES (6,'RGMA','Host for application probe',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `nagios_host_check_command_parameter` VALUES (1,NULL,1,'0');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contacts which belong to host templates or hosts';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_host_contact_member` VALUES (1,NULL,1,2);
INSERT INTO `nagios_host_contact_member` VALUES (11,NULL,2,2);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contact Group for Host';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_host_contactgroup` VALUES (1,NULL,1,1);
INSERT INTO `nagios_host_contactgroup` VALUES (2,NULL,1,2);
INSERT INTO `nagios_host_contactgroup` VALUES (11,NULL,2,1);
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
INSERT INTO `nagios_host_parent` VALUES (1,2,NULL,5);
INSERT INTO `nagios_host_parent` VALUES (2,3,NULL,5);
INSERT INTO `nagios_host_parent` VALUES (3,4,NULL,5);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Host Template';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_host_template` VALUES (1,'DUMMY_HOST','Template for dummy host (Non-Active check) <a href=\'https://www.monitoring-plugins.org/doc/man/check_dummy.html\'> Using Manual </a>',NULL,NULL,21,NULL,NULL,2,4,1,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,10,1,1,1,1,1,1,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&refresh=30s','computer.png',NULL,'computer.png','computer.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (2,'GENERIC_HOST','Template Generic',NULL,NULL,20,NULL,NULL,2,4,1,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,1,1,1,1,1,1,1,0,0,0,1,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&refresh=30s','unknown.gif',NULL,'unknown.gif','unknown.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (3,'RGM_LINUX_ES','Template monitor using Metricbeat (recommended) <a href=\'/module/admin_distrib/index.php?&action=display&id=2\' target=\'_blank\'> Deploy Metricbeat Agent</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux.png',NULL,'linux.png','linux.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (4,'RGM_WINDOWS_ES','Template monitor using Metricbeat (recommended) <a href=\'/module/admin_distrib/index.php?&action=display&id=1\' target=\'_blank\'> Deploy Metricbeat Agent </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (6,'RGM_ORACLE_DB_1521','Template to Monitor using SQLNet port 1521: DB User: USER25; DB Password: USER26  <a href=\'https://labs.consol.de/nagios/check_oracle_health/\' target=\'_blank\'> Oracle health Using & Configuration</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oracle.png',NULL,'oracle.png','oracle.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (7,'RGM_NUTANIX_SNMP','Template for NUTANIX HCI <a href=\'https://portal.nutanix.com/page/documents/kbs/details?targetId=kA0600000008bAECAY\'> Nutanix SNMP Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nutanix.png',NULL,'nutanix.png','nutanix.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (8,'RGM_NUTANIX_SSH','Template for NUTANIX HCI Status & Alerts <a href=\'https://exchange.nagios.org/directory/Plugins/Software/check_nutanix-2Epl-2Fcheck_ssh_nutanix_cluster-2Epl/details\'> Nutanix Status & Alerts Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nutanix.png',NULL,'nutanix.png','nutanix.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (9,'RGM_LINUX_SNMP','Template to Monitor using SNMP: USER2 = Community. <a href=\'https://access.redhat.com/documentation/fr-fr/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-system_monitoring_tools-net-snmp\' target=\'_blank\'> Configure SNMP on Linux</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux40.png',NULL,'linux40.png','linux40.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (10,'RGM_PING_ONLY','Template just use to ping an Asset <a href=\'https://www.monitoring-plugins.org/doc/man/check_ping.html\'> Ping Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'computer.png',NULL,'computer.png','computer.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (11,'RGM_WINDOWS_SNMP','Monitor using SNMP: USER2 = Community <a href=\'https://support.microsoft.com/en-us/help/324263/how-to-configure-the-simple-network-management-protocol-snmp-service-i\' target=\'_blank\'> Configure SNMP on Windows</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (12,'RGM_WINDOWS_WMI','Monitor using WMI: USER5 = Domain ; USER7 = Account ; USER8 = Password. <a href=\'https://docs.microsoft.com/fr-fr/sql/ssms/configure-wmi-to-show-server-status-in-sql-server-tools?view=sql-server-ver15\' target=\'_blank\'> Configure WMI on Windows</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (13,'RGM_PGSQL_DB','Template to Monitor PostgreSQL port 5432: DB User: USER23; DB Password: USER24  <a href=\' https://bucardo.org/check_postgres/check_postgres.pl.html\'> PGSQL health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'postgres.png',NULL,'postgres.png','postgres.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (14,'RGM_MYSQL_DB','Template for MySQL DB - Documentation <a href=\'https://labs.consol.de/nagios/check_mysql_health/#documentation\'> Mysql Health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mysql.png',NULL,'mysql.png','mysql.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (15,'RGM_HAPROXY','Template for HA Proxy <a href=\'https://github.com/benprew/nagios-checks\'> HA Proxy Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'haproxy.png',NULL,'haproxy.png','haproxy.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (16,'RGM_NETWORK_STATS_FULL_SNMP','Template for All default Network Asset - Documentation <a href=\'https://github.com/lausser/check_nwc_health/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'network_asset.png',NULL,'network_asset.png','network_asset.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (17,'RGM_NETWORKSWITCH_CORE_SNMP','Template for All Network Asset to have monitoring by SNMP2ELASTIC function <a href=\'https://gitlab.forge.rgm-cloud.io/rgm-components/snmp2elastic/-/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'network_asset.png',NULL,'network_asset.png','network_asset.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (19,'RGM_HPE_ARUBA_CORE_SNMP','Template for Aruba Network Asset - Documentation <a href=\'https://github.com/lausser/check_nwc_health/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aruba.png',NULL,'aruba.png','aruba.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (20,'RGM_CISCO_STATS_SNMP','Template for Cisco Network Asset Stats - Documentation <a href=\'https://github.com/lausser/check_nwc_health/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cisco2.png',NULL,'cisco2.png','cisco2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (21,'RGM_HPE_ARUBA_STATS_SNMP','Template for Aruba Network Asset Stats - Documentation <a href=\'https://github.com/lausser/check_nwc_health/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aruba.png',NULL,'aruba.png','aruba.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (22,'RGM_3PAR','Template for 3PAR Storage - Prerequisites <a href=\'https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=2610&cf_id=29\'> 3PAR Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3PAR.png',NULL,'3PAR.png','3PAR.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (23,'RGM_VMWARE_VCSA','Template to Monitor VCSA Appliance - SNMP Community : USER2  <a href=\'https://docs.vmware.com/fr/VMware-vSphere/6.5/com.vmware.vsphere.vcsa.doc/GUID-AC191A28-2739-4250-A8CA-DCD7F4053ECE.html\'> VCSA SNMP Configuration</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware.png',NULL,'vmware.png','vmware.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (24,'RGM_VMWARE_ESX','Template to Monitor ESX using VCenter: Datacenter FQDN in Host Description (HOSTALIAS); USER11 = Domain ; USER27 = Account ; USER28 = Password. <a href=\'http://bit.ly/2QOy2ZW\' target=\'_blank\'>Create Monitoring account on VSphere</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware2.png',NULL,'vmware2.png','vmware2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (26,'RGM_CISCO_CORE_SNMP','Template for Cisco Network Asset - Documentation <a href=\'https://github.com/lausser/check_nwc_health/blob/master/README.md\'> nwc health Using & Configuration </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cisco2.png',NULL,'cisco2.png','cisco2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (27,'RGM_HPE_ILO4','Template for HP ILO4 <a href=\'https://support.hpe.com/hpsc/doc/public/display?docId=emr_na-a00045551en_us&docLocale=en_US\' target=\'_blank\'> Configure SNMP on ILO4 </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'HP_logo_1.jpg',NULL,'HP_logo_1.jpg','HP_logo_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (28,'RGM_CONTAINER','Template to monitor Containers using Prometheus Datalake',NULL,NULL,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (30,'RGM_HPE_ARUBA_CLEARPASS','Template for ARUBA Clearpass using API <a href=\'https://www.flomain.de/2017/03/how-to-use-the-clearpass-restapi\' target=\'_blank\'> Clearpass Configure user API </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aruba.png',NULL,'aruba.png','aruba.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (31,'RGM_HPE_ARUBA_AIRWAVE','Template for ARUBA Airwave platform <a href=\'https://www.catelsys.eu/images/Catelsys/images/2017/04/0-Notices-AirWave_8.2.pdf\' target=\'_blank\'> Airwave offcial Documentation </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aruba.png',NULL,'aruba.png','aruba.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (32,'RGM_ORACLE_DB_1521_EXTENDED','Template to Monitor using SQLNet port 1521: DB User: USER25; DB Password: USER26  <a href=\'https://labs.consol.de/nagios/check_oracle_health/\' target=\'_blank\'> Oracle health Using & Configuration</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oracle.png',NULL,'oracle.png','oracle.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (33,'RGM_VEEAM','Template to Monitor Veeam Servers <a href=\'https://helpcenter.veeam.com/docs/backup/rest/em_web_api_reference.html?ver=100\' target=\'_blank\'>View Veeam Rest API</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (34,'RGM_LINUX_ES_ADVANCED','Template monitor using Metricbeat including queue metrics <a href=\'/module/admin_distrib/index.php?&action=display&id=2\' target=\'_blank\'> Deploy Metricbeat Agent</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux.png',NULL,'linux.png','linux.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (35,'RGM_WINDOWS_ES_ADVANCED','Template monitor using Metricbeat including queue metrics <a href=\'/module/admin_distrib/index.php?&action=display&id=1\' target=\'_blank\'> Deploy Metricbeat Agent </a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (36,'RGM_BUSINESS','RGM Business Edition',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_host_template` VALUES (37,'RGM_AZURE_API','Template to monitor Azure Cloud',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'azure.png',NULL,'azure.png','azure.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Host Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_host_template_inheritance` VALUES (1,1,NULL,3,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (2,2,NULL,1,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (3,3,NULL,1,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (4,4,NULL,1,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (5,NULL,3,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (6,NULL,4,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (8,NULL,6,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (9,5,NULL,1,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (10,NULL,7,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (11,NULL,8,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (12,NULL,9,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (13,NULL,10,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (14,NULL,11,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (15,NULL,12,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (16,6,NULL,1,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (17,NULL,13,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (18,NULL,14,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (19,NULL,15,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (20,NULL,16,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (22,NULL,17,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (25,NULL,19,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (26,NULL,20,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (27,NULL,21,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (28,NULL,22,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (29,NULL,23,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (30,NULL,24,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (34,NULL,27,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (36,NULL,28,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (38,NULL,30,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (39,NULL,31,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (40,NULL,26,17,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (41,NULL,19,17,1);
INSERT INTO `nagios_host_template_inheritance` VALUES (42,NULL,32,2,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (43,NULL,33,4,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (46,NULL,34,3,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (47,NULL,35,4,0);
INSERT INTO `nagios_host_template_inheritance` VALUES (48,NULL,37,2,0);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Hostgroup';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_hostgroup` VALUES (1,'MS_WINDOWS','HostGroup OS Windows',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (2,'GNU_LINUX','HostGroup OS Linux',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (3,'IBM_AIX','HostGroup OS IBM AIX',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (4,'SOLARIS','HostGroup OS Solaris',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (10,'NETAPP','HostGroup manufacturer Netapp',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (11,'EMC','HostGroup manufacturer EMC',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (12,'HPE','HostGroup manufacturer HPE',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (13,'DELL','HostGroup manufacturer Dell',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (14,'CISCO','HostGroup manufacturer Cisco',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (15,'BROCADE','HostGroup manufacturer Brocade',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (30,'STORAGE','HostGroup techno storage',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (31,'NETWORK','HostGroup techno networking',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (32,'HYPERVISOR','HostGroup techno virtualization',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (50,'VMWARE','HostGroup VmWare',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (51,'HYPER-V','HostGroup infra Hyper-V',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (52,'NUTANIX','HostGroup infra Nutanix',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (53,'DATABASE','DATABASE',NULL,NULL,NULL);
INSERT INTO `nagios_hostgroup` VALUES (54,'OTHER','OTHER',NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Hostgroup Membership for Host';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_hostgroup_membership` VALUES (1,NULL,3,2);
INSERT INTO `nagios_hostgroup_membership` VALUES (2,NULL,4,1);
INSERT INTO `nagios_hostgroup_membership` VALUES (4,NULL,7,52);
INSERT INTO `nagios_hostgroup_membership` VALUES (5,NULL,8,52);
INSERT INTO `nagios_hostgroup_membership` VALUES (6,NULL,9,2);
INSERT INTO `nagios_hostgroup_membership` VALUES (8,NULL,11,1);
INSERT INTO `nagios_hostgroup_membership` VALUES (9,NULL,6,53);
INSERT INTO `nagios_hostgroup_membership` VALUES (10,NULL,10,54);
INSERT INTO `nagios_hostgroup_membership` VALUES (12,NULL,12,1);
INSERT INTO `nagios_hostgroup_membership` VALUES (15,NULL,19,12);
INSERT INTO `nagios_hostgroup_membership` VALUES (16,NULL,20,14);
INSERT INTO `nagios_hostgroup_membership` VALUES (18,NULL,21,12);
INSERT INTO `nagios_hostgroup_membership` VALUES (19,NULL,16,31);
INSERT INTO `nagios_hostgroup_membership` VALUES (20,NULL,13,53);
INSERT INTO `nagios_hostgroup_membership` VALUES (21,NULL,15,31);
INSERT INTO `nagios_hostgroup_membership` VALUES (22,NULL,14,53);
INSERT INTO `nagios_hostgroup_membership` VALUES (23,NULL,23,50);
INSERT INTO `nagios_hostgroup_membership` VALUES (24,NULL,24,50);
INSERT INTO `nagios_hostgroup_membership` VALUES (25,NULL,22,30);
INSERT INTO `nagios_hostgroup_membership` VALUES (27,NULL,26,14);
INSERT INTO `nagios_hostgroup_membership` VALUES (28,NULL,17,31);
INSERT INTO `nagios_hostgroup_membership` VALUES (29,NULL,32,53);
INSERT INTO `nagios_hostgroup_membership` VALUES (30,NULL,34,2);
INSERT INTO `nagios_hostgroup_membership` VALUES (31,NULL,35,1);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Main Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_main_configuration` VALUES (1,'/srv/rgm/nagios/etc','/srv/rgm/nagios/var/log/nagios.log','/srv/rgm/nagios/var/log/nagios.tmp','/srv/rgm/nagios/var/log/status.dat',15,'nagios','rgm',1,1,1,1,'d','/srv/rgm/nagios/var/log/archives',1,NULL,'/srv/rgm/nagios/var/log/rw/nagios.cmd','/var/run/nagios/nagios.pid',1,'/srv/rgm/nagios/var/log/retention.dat',60,1,0,1,1,1,1,0,1,1,NULL,NULL,NULL,NULL,'s',0,10,60,0,1,5,20,5,20,0,40,20,30,30,5,NULL,5,0,NULL,1,0,1,NULL,'euro','`~!$%^&*|\\\'','`~$&|\\\'','nagios','pagenagios',1,'s',0,1,5,'s',5,0,30,180,NULL,NULL,NULL,1,60,60,0,0,'-1',0,NULL,NULL,'/srv/rgm/nagflux/var/spool-nagios/host-perfdata','DATATYPE::HOSTPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tHOSTPERFDATA::$HOSTPERFDATA$\\tHOSTCHECKCOMMAND::$HOSTCHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$\\tGRAPHITEPREFIX::rgm\\tGRAPHITEPOSTFIX::hgraph\\tMETRICTYPE::gauge','/srv/rgm/nagflux/var/spool-nagios/service-perfdata','DATATYPE::SERVICEPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tSERVICEDESC::$SERVICEDESC$\\tSERVICEPERFDATA::$SERVICEPERFDATA$\\tSERVICECHECKCOMMAND::$SERVICECHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$\\tSERVICESTATE::$SERVICESTATE$\\tSERVICESTATETYPE::$SERVICESTATETYPE$\\tGRAPHITEPREFIX::rgm\\tGRAPHITEPOSTFIX::sgraph\\tMETRICTYPE::gauge','a','a',3,4,10,10,'/srv/rgm/nagios/var/log/objects.cache',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/tmp',0,0,0,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Resource';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_resource` VALUES (1,'/srv/rgm/nagios/plugins','<snmp community 1>','<snmp community 2>','<snmp community 3>','<AD 1 domain name>','<AD 1 domain user>','<AD 1 domain password>','<AD 2 domain name>','<AD 2 domain user>','<AD 2 domain password>','','','','','','','/srv/rgm','','','','<generic account>','<generic password>','<generic account2>','<generic password2>','<generic account3>','<generic password3>','<generic api account1>','<generic api clientID1>','<generic api user password1>','','<generic api account2>','<generic api user password2>');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Service';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service` VALUES (1,'processor','processor',NULL,3,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (2,'memory','memory',NULL,3,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (3,'uptime','uptime',NULL,3,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (4,'load','load',NULL,3,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (5,'partitions','partitions',NULL,3,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (6,'interfaces','interfaces',NULL,3,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (7,'processor','processor',NULL,4,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (8,'memory','memory',NULL,4,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (9,'uptime','uptime',NULL,4,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (10,'partitions','partitions',NULL,4,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (11,'interfaces','interfaces',NULL,4,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (29,'connection-time','connection-time',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (30,'tablespace-usage','tablespace-usage',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (31,'session-usage','session-usage',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (36,'redo-io-traffic','redo-io-traffic',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (38,'citIOPerSecond','citIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (39,'citUsedCapacity','citUsedCapacity',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (40,'citAvgLatencyUsecs','citAvgLatencyUsecs',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (41,'citIOBandwidth','citIOBandwidth',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (42,'vmCpuUsagePercent','vmCpuUsagePercent',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (43,'vmMemoryUsagePercent','vmMemoryUsagePercent',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (44,'vmRxBytes','vmRxBytes',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (45,'vmRxDropCount','vmRxDropCount',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (46,'vmReadIOPerSecond','vmReadIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (47,'vmAverageLatency','vmAverageLatency',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (48,'vmPowerState','vmPowerState',NULL,7,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (49,'vmTxBytes','vmTxBytes',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (50,'vmWriteIOPerSecond','vmWriteIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (51,'vmTxDropCount','vmTxDropCount',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (52,'dstNumFreeBytes','dstNumFreeBytes',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (53,'dstAverageLatency','dstAverageLatency',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (54,'dstState','dstState',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (55,'dstNumberIops','dstNumberIops',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (56,'dstIOBandwidth','dstIOBandwidth',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (57,'clusterLatency','clusterLatency',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (58,'clusterUsedStorageCapacity','clusterUsedStorageCapacity',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (59,'clusterIops','clusterIops',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (60,'clusterStatus','clusterStatus',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (61,'cstControllerVMStatus','cstControllerVMStatus',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (62,'cstDataServiceStatus','cstDataServiceStatus',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (63,'cstMetadataServiceStatus','cstMetadataServiceStatus',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (64,'hypervisorTxDropCount','hypervisorTxDropCount',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (65,'hypervisorRxBytes','hypervisorRxBytes',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (66,'hypervisorWriteIOPerSecond','hypervisorWriteIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (67,'hypervisorCpuUsagePercent','hypervisorCpuUsagePercent',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (68,'hypervisorReadIOPerSecond','hypervisorReadIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (69,'hypervisorMemoryUsagePercent','hypervisorMemoryUsagePercent',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (70,'hypervisorIOBandwidth','hypervisorIOBandwidth',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (71,'hypervisorRxDropCount','hypervisorRxDropCount',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (72,'hypervisorTxBytes','hypervisorTxBytes',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (73,'spitIOPerSecond','spitIOPerSecond',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (74,'spitIOBandwidth','spitIOBandwidth',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (75,'spitAvgLatencyUsecs','spitAvgLatencyUsecs',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (76,'spitUsedCapacity','spitUsedCapacity',NULL,7,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (77,'alerts','alerts',NULL,8,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (78,'status','status',NULL,8,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (79,'processor',NULL,NULL,9,NULL,NULL,NULL,39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service` VALUES (80,'memory',NULL,NULL,9,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (81,'partitions',NULL,NULL,9,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service` VALUES (82,'systime',NULL,NULL,9,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (83,'uptime',NULL,NULL,9,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (85,'ping','ping',NULL,10,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (86,'partitions',NULL,NULL,11,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service` VALUES (87,'memory',NULL,NULL,11,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (88,'processor',NULL,NULL,11,NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service` VALUES (89,'systime',NULL,NULL,11,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (90,'uptime',NULL,NULL,11,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (91,'interfaces',NULL,NULL,11,NULL,NULL,NULL,77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (93,'uptime','uptime',NULL,12,NULL,NULL,NULL,46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (94,'memory','memory',NULL,12,NULL,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (95,'processor','processor',NULL,12,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (96,'pagefile','pagefile',NULL,12,NULL,NULL,NULL,43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (97,'partition_C_use','partition_C_use',NULL,12,NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (99,'application-web','application-web',6,NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (100,'mysql_status','mysql_status',1,NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (101,'connection','connection',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (102,'locks','locks',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (103,'backends','backends',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (104,'commitratio','commitratio',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (105,'bloat','bloat',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (106,'txn_time','txn_time',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (107,'table_size','table_size',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (108,'database_size','database_size',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (109,'index_size','index_size',NULL,13,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (110,'connection-time','connection-time',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (111,'uptime','uptime',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (112,'threads-connected','threads-connected',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (113,'threadcache-hitrate','threadcache-hitrate',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (114,'querycache-lowmem-prunes','querycache-lowmem-prunes',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (115,'tablecache-hitrate','tablecache-hitrate',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (116,'table-lock-contention','table-lock-contention',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (117,'slow-queries','slow-queries',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (118,'open-files','open-files',NULL,14,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (119,'nagios_status','nagios_status',1,NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (120,'influxd_status','influxd_status',1,NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (122,'haproxy_status','haproxy_status',NULL,15,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (123,'haproxy_url_status','haproxy_url_status',NULL,15,NULL,NULL,NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (124,'interface-usage','interface-usage',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (125,'interface-errors','interface-errors',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (126,'interface-discards','interface-discards',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (127,'interface-health','interface-health',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (128,'interface-uptime','interface-uptime',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (129,'list-interfaces','list-interfaces',NULL,16,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (132,'cpu-load','cpu-load',NULL,17,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (133,'hardware-health','hardware-health',NULL,17,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (138,'memory-usage','memory-usage',NULL,17,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (139,'uptime','uptime',NULL,17,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (140,'ged_status','ged_status',1,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (154,'interface-uptime','interface-uptime',NULL,20,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (155,'list-interfaces','list-interfaces',NULL,20,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (157,'interface-uptime','interface-uptime',NULL,21,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (158,'list-interfaces','list-interfaces',NULL,21,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (159,'node status','node status',NULL,22,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (160,'physical_disk','physical_disk',NULL,22,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (161,'logical_disk','logical_disk',NULL,22,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (162,'virtual_volumes','virtual_volumes',NULL,22,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (163,'power_supply','power_supply',NULL,22,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (164,'partitions',NULL,NULL,23,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service` VALUES (165,'uptime',NULL,NULL,23,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (167,'vmware-sps','vmware-sps',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (168,'vmcad ','vmcad ',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (169,'vmware-cis-license','vmware-cis-license',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (170,'vmware-content-library ','vmware-content-library ',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (172,'pschealth','pschealth',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (174,'vmware-eam','vmware-eam',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (175,'vmware-sca','vmware-sca',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (176,'vmware-vsm','vmware-vsm',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (177,'vsphere-ui','vsphere-ui',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (178,'vmware-perfcharts','vmware-perfcharts',NULL,23,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (179,'memory','memory',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (180,'processor','processor',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (181,'status','status',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (182,'network','network',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (183,'volumes','volumes',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (184,'io','io',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (185,'service','service',NULL,24,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (186,'httpd_status','httpd_status',1,NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (187,'kibana_status','kibana_status',1,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (188,'elasticsearch_status','elasticsearch_status',1,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (203,'backup_active','backup_active',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (205,'session-active','session-active',NULL,6,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (207,'hw_status','hw_status',NULL,27,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (208,'processor-queue','processor-queue',NULL,12,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (209,'network_outqueue_vmxnet3','network_outqueue_vmxnet3',NULL,12,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (210,'network_packeterror_vmxnet3','network_packeterror_vmxnet3',NULL,12,NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (211,'processor','processor',NULL,28,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (212,'memory','memory',NULL,28,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (213,'uptime','uptime',NULL,28,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (214,'partitions','partitions',NULL,28,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (215,'interfaces','interfaces',NULL,9,NULL,NULL,NULL,77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (216,'airgroup-workqueue','AirGroup notification service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (217,'backend-tomcat.service','System auxiliary services',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (218,'battery.service','Multi-Master cache',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (219,'certificate_validity','certificate_validity',NULL,30,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (220,'cpass-async-netd.service','Async network services',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (221,'cpass-carbon-server.service','Stats aggregation service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (222,'cpass-dbcn-daemon.service','DB change notification server',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (223,'cpass-fdb.service','Async_DB_write_service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (224,'cpass-igslogger.service','Ingress logger service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (225,'cpass-igslogrepo.service','Ingress logrepo service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (226,'cpass-londiste.service','DB replication service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (227,'cpass-policy-server.service','ClearPass Policy server',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (228,'cpass-radius-server.service','ClearPass RADIUS server',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (229,'cpass-radsec','RadSec service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (230,'cpass-statsd-server.service','Stats collection service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (231,'cpass-sysmon.service','System monitor service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (232,'cpass-tacacs-server.service','ClearPass TACACS server',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (233,'cpass-vip.service','Virtual IP service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (234,'cpg-background','Guest Background Service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (235,'cpg-redis-cache','Data cache for Guest and Onboard',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (236,'cpu_load','cpu_load',NULL,30,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (237,'docker','ClearPass Extensions service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (238,'fias-server','Micros Fidelio FIAS',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (239,'strongswan.service','ClearPass IPsec service',NULL,30,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (240,'interface-status','interface-status',NULL,30,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (241,' interface-usage',' interface-usage',NULL,30,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (242,'memory','memory',NULL,30,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (243,'partitions','partitions',NULL,30,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (244,'server_role','server_role',NULL,30,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (245,'systime','systime',NULL,30,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (246,'uptime','uptime',NULL,30,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (247,'version','version',NULL,30,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (248,'clearpass_events','clearpass_events',NULL,30,NULL,NULL,NULL,79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (249,'cluster_status','cluster_status',NULL,30,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (250,'syslog_status','syslog_status',NULL,30,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (251,'File_Backup_server','File_Backup_server',NULL,30,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (252,'autoupdates','autoupdates',NULL,30,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (253,'failover_status','failover_status',NULL,30,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (254,'support_account','support_account',NULL,30,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (255,'insight_status','insight_status',NULL,30,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (256,'replication_status','replication_status',NULL,30,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (257,'AP_status_from_folder','AP_status_from_folder',NULL,31,NULL,NULL,NULL,91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (258,'AP_status_mismatched_VC','AP_status_mismatched_VC',NULL,31,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (259,'Airwave_alerts','Airwave_alerts',NULL,31,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (263,'connected-users','connected-users',NULL,32,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (264,'invalid-objects','invalid-objects',NULL,32,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (265,'flash-recovery-area-usage','flash-recovery-area-usage',NULL,32,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (266,'stale-statistics','stale-statistics',NULL,32,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (268,'event-waits','event-waits',NULL,32,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (269,'systime','systime',NULL,4,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (270,'systime','systime',NULL,3,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (271,'jobs','jobs',NULL,33,NULL,NULL,NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (272,'licences','licences',NULL,33,NULL,NULL,NULL,98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (286,'disk_queue','disk_queue',NULL,34,NULL,NULL,NULL,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (287,'cpu_queue','cpu_queue',NULL,35,NULL,NULL,NULL,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (288,'disk_queue','disk_queue',NULL,35,NULL,NULL,NULL,102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (289,'network_queue','network_queue',NULL,35,NULL,NULL,NULL,103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (290,'elasticsearch_index_status','elasticsearch_index_status',1,NULL,NULL,NULL,NULL,104,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (291,'rgm_consumer_cert','RGM Business Consumer certificate',NULL,36,NULL,NULL,NULL,105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (292,'rgm-teleport-status','Teleport status',NULL,36,NULL,NULL,NULL,106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (293,'teleport-noc-trusted-cluster','Teleport link to NOC trusted cluster',NULL,36,NULL,NULL,NULL,106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (294,'azure_vm_status','azure_vm_status',NULL,37,NULL,NULL,NULL,108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service` VALUES (295,'azure_appservice','azure_appservice',NULL,37,NULL,NULL,NULL,107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Parameter for check command for service or service template';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service_check_command_parameter` VALUES (1,1,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (2,1,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (3,2,NULL,'80,40');
INSERT INTO `nagios_service_check_command_parameter` VALUES (4,2,NULL,'90,50');
INSERT INTO `nagios_service_check_command_parameter` VALUES (5,3,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (6,3,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (7,3,NULL,'-t 15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (8,4,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (9,4,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (10,5,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (11,5,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (12,7,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (13,7,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (14,8,NULL,'80,40');
INSERT INTO `nagios_service_check_command_parameter` VALUES (15,8,NULL,'90,50');
INSERT INTO `nagios_service_check_command_parameter` VALUES (16,9,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (17,9,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (18,9,NULL,'-t 15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (19,10,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (20,10,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (45,38,NULL,'Containers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (46,38,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (47,38,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (48,39,NULL,'Containers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (49,39,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (50,39,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (51,40,NULL,'Containers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (52,40,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (53,40,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (54,41,NULL,'Containers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (55,41,NULL,'100000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (56,41,NULL,'200000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (57,42,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (58,42,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (59,42,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (60,43,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (61,43,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (62,43,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (63,44,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (64,44,NULL,'10000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (65,44,NULL,'20000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (66,45,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (67,45,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (68,45,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (69,46,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (70,46,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (71,46,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (72,47,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (73,47,NULL,'100000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (74,47,NULL,'200000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (75,48,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (76,48,NULL,'TEST_SRVVMMPLT01_VL90|TEST_DEBIANTEST|PROD_SRVVMPPS01_LRSI_J1_VL90_replica|NE PAS DEMARRER AirWave 7.7.9_LAUT_H2|TEST_SRVVMSYNAPSET04_VL10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (77,49,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (78,49,NULL,'10000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (79,49,NULL,'20000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (80,50,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (81,50,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (82,50,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (83,51,NULL,'VirtualMachines');
INSERT INTO `nagios_service_check_command_parameter` VALUES (84,51,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (85,51,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (86,52,NULL,'Disks');
INSERT INTO `nagios_service_check_command_parameter` VALUES (87,52,NULL,'20');
INSERT INTO `nagios_service_check_command_parameter` VALUES (88,52,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (89,53,NULL,'Disks');
INSERT INTO `nagios_service_check_command_parameter` VALUES (90,53,NULL,'100000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (91,53,NULL,'200000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (92,54,NULL,'Disks');
INSERT INTO `nagios_service_check_command_parameter` VALUES (93,54,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (94,54,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (95,55,NULL,'Disks');
INSERT INTO `nagios_service_check_command_parameter` VALUES (96,55,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (97,55,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (98,56,NULL,'Disks');
INSERT INTO `nagios_service_check_command_parameter` VALUES (99,56,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (100,56,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (101,57,NULL,'Cluster');
INSERT INTO `nagios_service_check_command_parameter` VALUES (102,57,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (103,57,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (104,58,NULL,'Cluster');
INSERT INTO `nagios_service_check_command_parameter` VALUES (105,58,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (106,58,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (107,59,NULL,'Cluster');
INSERT INTO `nagios_service_check_command_parameter` VALUES (108,59,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (109,59,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (110,60,NULL,'Cluster');
INSERT INTO `nagios_service_check_command_parameter` VALUES (111,61,NULL,'Controllers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (112,62,NULL,'Controllers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (113,63,NULL,'Controllers');
INSERT INTO `nagios_service_check_command_parameter` VALUES (114,64,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (115,64,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (116,64,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (117,65,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (118,65,NULL,'10000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (119,65,NULL,'20000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (120,66,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (121,66,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (122,66,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (123,67,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (124,67,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (125,67,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (126,68,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (127,68,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (128,68,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (129,69,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (130,69,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (131,69,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (132,70,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (133,70,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (134,70,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (135,71,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (136,71,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (137,71,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (138,72,NULL,'Hypervisors');
INSERT INTO `nagios_service_check_command_parameter` VALUES (139,72,NULL,'10000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (140,72,NULL,'20000000000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (141,73,NULL,'Pools');
INSERT INTO `nagios_service_check_command_parameter` VALUES (142,73,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (143,73,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (144,74,NULL,'Pools');
INSERT INTO `nagios_service_check_command_parameter` VALUES (145,74,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (146,74,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (147,75,NULL,'Pools');
INSERT INTO `nagios_service_check_command_parameter` VALUES (148,75,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (149,75,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (150,76,NULL,'Pools');
INSERT INTO `nagios_service_check_command_parameter` VALUES (151,76,NULL,'10000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (152,76,NULL,'20000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (155,79,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (156,79,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (157,80,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (158,80,NULL,'50');
INSERT INTO `nagios_service_check_command_parameter` VALUES (159,80,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (160,80,NULL,'50');
INSERT INTO `nagios_service_check_command_parameter` VALUES (161,81,NULL,'/');
INSERT INTO `nagios_service_check_command_parameter` VALUES (162,81,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (163,81,NULL,'95');
INSERT INTO `nagios_service_check_command_parameter` VALUES (164,81,NULL,'-q FixedDisk');
INSERT INTO `nagios_service_check_command_parameter` VALUES (167,82,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (168,82,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (171,85,NULL,'3000.0,80%');
INSERT INTO `nagios_service_check_command_parameter` VALUES (172,85,NULL,'5000.0,100%');
INSERT INTO `nagios_service_check_command_parameter` VALUES (173,85,NULL,'1');
INSERT INTO `nagios_service_check_command_parameter` VALUES (176,86,NULL,'^[B-Z]');
INSERT INTO `nagios_service_check_command_parameter` VALUES (177,86,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (178,86,NULL,'95');
INSERT INTO `nagios_service_check_command_parameter` VALUES (179,87,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (180,87,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (181,88,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (182,88,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (183,89,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (184,89,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (185,91,NULL,'-v 2 -g');
INSERT INTO `nagios_service_check_command_parameter` VALUES (188,93,NULL,'checkuptime');
INSERT INTO `nagios_service_check_command_parameter` VALUES (189,94,NULL,'20');
INSERT INTO `nagios_service_check_command_parameter` VALUES (190,94,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (191,95,NULL,'98');
INSERT INTO `nagios_service_check_command_parameter` VALUES (192,95,NULL,'99');
INSERT INTO `nagios_service_check_command_parameter` VALUES (193,97,NULL,'C:');
INSERT INTO `nagios_service_check_command_parameter` VALUES (194,97,NULL,'3');
INSERT INTO `nagios_service_check_command_parameter` VALUES (195,97,NULL,'15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (199,100,NULL,'rgminternal');
INSERT INTO `nagios_service_check_command_parameter` VALUES (200,100,NULL,'0rd0-c0m1735-b47h0n143');
INSERT INTO `nagios_service_check_command_parameter` VALUES (201,101,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (202,102,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (203,103,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (204,104,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (205,105,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (206,106,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (207,106,NULL,'--warning 60');
INSERT INTO `nagios_service_check_command_parameter` VALUES (208,106,NULL,'--critical 120');
INSERT INTO `nagios_service_check_command_parameter` VALUES (209,107,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (210,107,NULL,'--warning 800MB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (211,107,NULL,'--critical 1GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (212,108,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (213,108,NULL,'--warning 800MB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (214,108,NULL,'--critical 1GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (215,109,NULL,'postgres');
INSERT INTO `nagios_service_check_command_parameter` VALUES (216,109,NULL,'--warning 800MB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (217,109,NULL,'--critical 1GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (218,110,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (219,118,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (220,114,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (221,117,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (222,116,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (223,115,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (224,113,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (225,112,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (226,111,NULL,'3306');
INSERT INTO `nagios_service_check_command_parameter` VALUES (227,119,NULL,'nagios');
INSERT INTO `nagios_service_check_command_parameter` VALUES (228,119,NULL,'0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (229,119,NULL,'0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (230,120,NULL,'influxd');
INSERT INTO `nagios_service_check_command_parameter` VALUES (231,120,NULL,'0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (232,120,NULL,'0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (236,122,NULL,'http://IP_HAPROXY:PORT/stats');
INSERT INTO `nagios_service_check_command_parameter` VALUES (237,122,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (238,122,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (239,123,NULL,'/stats');
INSERT INTO `nagios_service_check_command_parameter` VALUES (240,123,NULL,'9999');
INSERT INTO `nagios_service_check_command_parameter` VALUES (241,123,NULL,'1');
INSERT INTO `nagios_service_check_command_parameter` VALUES (242,123,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (243,124,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (244,124,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (245,124,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (246,126,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (247,126,NULL,'--warning 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (248,126,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (249,127,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (250,127,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (251,127,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (252,128,NULL,'--negate warning=critical 5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (253,128,NULL,'--negate critical=warning 10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (254,128,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (255,125,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (256,125,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (257,125,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (267,132,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (268,132,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (282,138,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (283,138,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (284,140,NULL,'2403');
INSERT INTO `nagios_service_check_command_parameter` VALUES (310,154,NULL,'--negate warning=critical 5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (311,154,NULL,'--negate critical=warning 10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (312,154,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (316,157,NULL,'--negate warning=critical 5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (317,157,NULL,'--negate critical=warning 10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (318,157,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (319,NULL,4,'port_name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (320,NULL,4,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (321,NULL,4,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (322,NULL,5,'port_name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (323,NULL,5,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (324,NULL,5,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (325,NULL,6,'port_name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (326,NULL,6,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (327,NULL,6,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (328,159,NULL,'check_node');
INSERT INTO `nagios_service_check_command_parameter` VALUES (329,160,NULL,'check_pd');
INSERT INTO `nagios_service_check_command_parameter` VALUES (330,161,NULL,'check_ld');
INSERT INTO `nagios_service_check_command_parameter` VALUES (331,162,NULL,'check_vv');
INSERT INTO `nagios_service_check_command_parameter` VALUES (332,163,NULL,'check_ps');
INSERT INTO `nagios_service_check_command_parameter` VALUES (333,164,NULL,'/');
INSERT INTO `nagios_service_check_command_parameter` VALUES (334,164,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (335,164,NULL,'95');
INSERT INTO `nagios_service_check_command_parameter` VALUES (336,164,NULL,'/');
INSERT INTO `nagios_service_check_command_parameter` VALUES (337,164,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (338,164,NULL,'95');
INSERT INTO `nagios_service_check_command_parameter` VALUES (339,165,NULL,'15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (340,165,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (342,167,NULL,'vmware-sps');
INSERT INTO `nagios_service_check_command_parameter` VALUES (343,168,NULL,'vmcad ');
INSERT INTO `nagios_service_check_command_parameter` VALUES (344,169,NULL,'vmware-cis-license');
INSERT INTO `nagios_service_check_command_parameter` VALUES (345,170,NULL,'vmware-content-library ');
INSERT INTO `nagios_service_check_command_parameter` VALUES (347,172,NULL,'pschealth');
INSERT INTO `nagios_service_check_command_parameter` VALUES (349,174,NULL,'vmware-eam');
INSERT INTO `nagios_service_check_command_parameter` VALUES (350,175,NULL,'vmware-sca');
INSERT INTO `nagios_service_check_command_parameter` VALUES (351,176,NULL,'vmware-vsm');
INSERT INTO `nagios_service_check_command_parameter` VALUES (352,177,NULL,'vsphere-ui');
INSERT INTO `nagios_service_check_command_parameter` VALUES (353,178,NULL,'vmware-perfcharts');
INSERT INTO `nagios_service_check_command_parameter` VALUES (354,179,NULL,'-S mem');
INSERT INTO `nagios_service_check_command_parameter` VALUES (355,179,NULL,'-B VMware Rollup Health State');
INSERT INTO `nagios_service_check_command_parameter` VALUES (356,180,NULL,'-S cpu');
INSERT INTO `nagios_service_check_command_parameter` VALUES (357,180,NULL,'-s usage');
INSERT INTO `nagios_service_check_command_parameter` VALUES (358,180,NULL,' -w 80% -c 90%');
INSERT INTO `nagios_service_check_command_parameter` VALUES (359,181,NULL,'-S runtime');
INSERT INTO `nagios_service_check_command_parameter` VALUES (360,181,NULL,'-s status');
INSERT INTO `nagios_service_check_command_parameter` VALUES (361,182,NULL,'-S net');
INSERT INTO `nagios_service_check_command_parameter` VALUES (362,182,NULL,'-s nic');
INSERT INTO `nagios_service_check_command_parameter` VALUES (363,183,NULL,'-S volumes');
INSERT INTO `nagios_service_check_command_parameter` VALUES (364,183,NULL,'--gigabyte');
INSERT INTO `nagios_service_check_command_parameter` VALUES (365,183,NULL,'-w 10% -c 5%');
INSERT INTO `nagios_service_check_command_parameter` VALUES (366,184,NULL,'-S io');
INSERT INTO `nagios_service_check_command_parameter` VALUES (367,184,NULL,'-s usage');
INSERT INTO `nagios_service_check_command_parameter` VALUES (368,185,NULL,'-S service');
INSERT INTO `nagios_service_check_command_parameter` VALUES (369,140,NULL,'1');
INSERT INTO `nagios_service_check_command_parameter` VALUES (370,140,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (374,187,NULL,'5601');
INSERT INTO `nagios_service_check_command_parameter` VALUES (375,187,NULL,'1');
INSERT INTO `nagios_service_check_command_parameter` VALUES (376,187,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (377,188,NULL,'9200');
INSERT INTO `nagios_service_check_command_parameter` VALUES (378,188,NULL,'1');
INSERT INTO `nagios_service_check_command_parameter` VALUES (379,188,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (381,29,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (384,36,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (385,31,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (387,30,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (396,83,NULL,'15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (397,83,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (398,90,NULL,'15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (399,90,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (407,30,NULL,'--report html');
INSERT INTO `nagios_service_check_command_parameter` VALUES (409,203,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (411,205,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (414,208,NULL,'6');
INSERT INTO `nagios_service_check_command_parameter` VALUES (415,208,NULL,'12');
INSERT INTO `nagios_service_check_command_parameter` VALUES (416,209,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (417,209,NULL,'20');
INSERT INTO `nagios_service_check_command_parameter` VALUES (418,210,NULL,'100');
INSERT INTO `nagios_service_check_command_parameter` VALUES (419,210,NULL,'1000');
INSERT INTO `nagios_service_check_command_parameter` VALUES (420,211,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (421,211,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (422,212,NULL,'');
INSERT INTO `nagios_service_check_command_parameter` VALUES (423,212,NULL,'name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (424,213,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (425,213,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (426,214,NULL,'');
INSERT INTO `nagios_service_check_command_parameter` VALUES (427,214,NULL,'name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (428,212,NULL,'1024,512');
INSERT INTO `nagios_service_check_command_parameter` VALUES (429,212,NULL,'2048,1024');
INSERT INTO `nagios_service_check_command_parameter` VALUES (430,214,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (431,214,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (432,215,NULL,'-v 2 -g');
INSERT INTO `nagios_service_check_command_parameter` VALUES (433,219,NULL,'28');
INSERT INTO `nagios_service_check_command_parameter` VALUES (434,236,NULL,'1.3.6.1.4.1.2021.10.1.3.1,.1.3.6.1.4.1.2021.10.1.3.2,.1.3.6.1.4.1.2021.10.1.3.3');
INSERT INTO `nagios_service_check_command_parameter` VALUES (435,236,NULL,'-P 2c');
INSERT INTO `nagios_service_check_command_parameter` VALUES (436,236,NULL,'-l \"CPU Load 1 5 15 :\"');
INSERT INTO `nagios_service_check_command_parameter` VALUES (437,241,NULL,'--warning 80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (438,241,NULL,'--critical 90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (439,241,NULL,'--units GB');
INSERT INTO `nagios_service_check_command_parameter` VALUES (440,242,NULL,'80');
INSERT INTO `nagios_service_check_command_parameter` VALUES (441,242,NULL,'50');
INSERT INTO `nagios_service_check_command_parameter` VALUES (442,242,NULL,'90');
INSERT INTO `nagios_service_check_command_parameter` VALUES (443,242,NULL,'70');
INSERT INTO `nagios_service_check_command_parameter` VALUES (444,243,NULL,'cppmSystemDiskSpaceFree.0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (445,243,NULL,'/usr/share/snmp/mibs/aruba-cppm.my');
INSERT INTO `nagios_service_check_command_parameter` VALUES (446,243,NULL,'2c');
INSERT INTO `nagios_service_check_command_parameter` VALUES (447,243,NULL,'free_disk_space: -u bytes');
INSERT INTO `nagios_service_check_command_parameter` VALUES (448,244,NULL,'.1.3.6.1.4.1.14823.1.6.1.1.1.1.1.5.0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (449,244,NULL,'-P 2c');
INSERT INTO `nagios_service_check_command_parameter` VALUES (450,244,NULL,'-r Publisher');
INSERT INTO `nagios_service_check_command_parameter` VALUES (451,244,NULL,'-l \"node is :\"');
INSERT INTO `nagios_service_check_command_parameter` VALUES (452,245,NULL,'300 -v 2c');
INSERT INTO `nagios_service_check_command_parameter` VALUES (453,246,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (454,246,NULL,'15');
INSERT INTO `nagios_service_check_command_parameter` VALUES (455,246,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (456,247,NULL,'.1.3.6.1.2.1.1.1.0');
INSERT INTO `nagios_service_check_command_parameter` VALUES (457,247,NULL,'-P 2c');
INSERT INTO `nagios_service_check_command_parameter` VALUES (458,248,NULL,'WARNING ');
INSERT INTO `nagios_service_check_command_parameter` VALUES (459,257,NULL,'100');
INSERT INTO `nagios_service_check_command_parameter` VALUES (460,257,NULL,'100');
INSERT INTO `nagios_service_check_command_parameter` VALUES (463,259,NULL,'Normal');
INSERT INTO `nagios_service_check_command_parameter` VALUES (464,259,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (465,259,NULL,'4');
INSERT INTO `nagios_service_check_command_parameter` VALUES (470,263,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (471,264,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (472,265,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (473,266,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (475,268,NULL,'1521');
INSERT INTO `nagios_service_check_command_parameter` VALUES (476,268,NULL,'--report html');
INSERT INTO `nagios_service_check_command_parameter` VALUES (477,10,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (478,5,NULL,'2');
INSERT INTO `nagios_service_check_command_parameter` VALUES (479,269,NULL,'500');
INSERT INTO `nagios_service_check_command_parameter` VALUES (480,269,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (482,270,NULL,'500');
INSERT INTO `nagios_service_check_command_parameter` VALUES (483,270,NULL,'300');
INSERT INTO `nagios_service_check_command_parameter` VALUES (484,272,NULL,'60');
INSERT INTO `nagios_service_check_command_parameter` VALUES (485,272,NULL,'30');
INSERT INTO `nagios_service_check_command_parameter` VALUES (512,286,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (513,286,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (514,287,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (515,287,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (516,288,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (517,288,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (518,289,NULL,'5');
INSERT INTO `nagios_service_check_command_parameter` VALUES (519,289,NULL,'10');
INSERT INTO `nagios_service_check_command_parameter` VALUES (520,292,NULL,'status');
INSERT INTO `nagios_service_check_command_parameter` VALUES (521,293,NULL,'trusted_cluster');
INSERT INTO `nagios_service_check_command_parameter` VALUES (522,294,NULL,'resource_group');
INSERT INTO `nagios_service_check_command_parameter` VALUES (523,294,NULL,'vm_name');
INSERT INTO `nagios_service_check_command_parameter` VALUES (524,295,NULL,'resource_group');
INSERT INTO `nagios_service_check_command_parameter` VALUES (525,295,NULL,'appservice_name');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service_contact_group_member` VALUES (9,NULL,1,1);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contacts which belong to service templates or services';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service_group` VALUES (1,'SERVICES','ServiceGroup for services',NULL,NULL,NULL);
INSERT INTO `nagios_service_group` VALUES (2,'VMWARE','ServiceGroup Vmware',NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Service Template';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service_template` VALUES (1,'GENERIC_SERVICE','Template Generic',NULL,NULL,NULL,4,4,NULL,NULL,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `nagios_service_template` VALUES (2,'GENERIC_GRAPH','Template generic + pnp link',NULL,NULL,NULL,4,4,NULL,NULL,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1,1,1,1,1,1,0,0,0,0,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service_template` VALUES (4,'RGM_NET_INT_TRAFFIC','Service template Network traffic through SNMP',NULL,NULL,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service_template` VALUES (5,'RGM_NET_INT_ERROR','Service template Network error through SNMP',NULL,NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service_template` VALUES (6,'RGM_NET_INT_DISCARDS','Service template Network discards through SNMP',NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL);
INSERT INTO `nagios_service_template` VALUES (7,'RGM_NET_INTERFACE_ELASTIC','RGM_NET_INTERFACE_ELASTIC',NULL,NULL,68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios service Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_service_template_inheritance` VALUES (2,1,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (3,2,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (4,3,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (5,4,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (6,5,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (7,6,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (9,7,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (10,8,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (11,9,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (12,10,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (13,11,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (34,29,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (35,30,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (36,31,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (41,36,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (44,38,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (45,39,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (46,40,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (47,41,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (48,42,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (49,43,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (50,44,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (51,45,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (52,46,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (53,47,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (54,48,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (55,49,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (56,50,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (57,51,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (58,52,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (59,53,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (60,54,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (61,55,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (62,56,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (63,57,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (64,58,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (65,59,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (66,60,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (67,61,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (68,62,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (69,63,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (70,64,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (71,65,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (72,66,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (73,67,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (74,68,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (75,69,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (76,70,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (77,71,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (78,72,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (79,73,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (80,74,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (81,75,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (82,76,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (83,77,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (84,78,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (88,79,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (89,80,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (90,81,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (91,82,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (95,85,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (99,86,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (100,87,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (101,88,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (102,89,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (107,93,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (108,94,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (109,95,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (110,96,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (111,97,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (113,99,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (114,100,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (115,101,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (116,102,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (117,103,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (118,104,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (119,105,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (120,106,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (121,107,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (122,108,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (123,109,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (124,110,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (125,111,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (126,112,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (127,113,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (128,114,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (129,115,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (130,116,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (131,117,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (132,118,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (133,119,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (134,120,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (136,122,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (137,123,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (140,124,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (141,126,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (142,125,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (143,127,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (144,128,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (145,129,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (148,132,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (154,138,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (156,133,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (157,139,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (158,140,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (172,154,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (173,155,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (175,157,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (176,158,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (177,NULL,4,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (178,NULL,5,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (179,NULL,6,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (180,159,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (181,160,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (182,161,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (183,162,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (184,163,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (186,164,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (187,165,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (189,167,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (190,168,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (191,169,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (192,170,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (194,172,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (196,174,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (197,175,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (198,176,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (199,177,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (200,178,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (201,NULL,2,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (202,179,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (203,180,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (204,181,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (205,182,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (206,183,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (207,184,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (208,185,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (210,187,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (211,188,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (212,186,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (221,90,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (222,83,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (227,NULL,7,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (230,203,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (232,205,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (234,207,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (235,208,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (236,209,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (237,210,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (238,211,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (239,212,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (240,213,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (241,214,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (242,91,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (243,215,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (244,216,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (245,217,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (246,218,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (247,219,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (248,220,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (249,221,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (250,222,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (251,223,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (252,224,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (253,225,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (254,226,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (255,227,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (256,228,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (257,229,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (258,230,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (259,231,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (260,232,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (261,233,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (262,234,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (263,235,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (264,236,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (265,237,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (266,238,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (267,239,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (268,240,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (269,241,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (270,242,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (271,243,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (272,244,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (273,245,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (274,246,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (275,247,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (276,248,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (277,249,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (278,250,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (279,251,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (280,252,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (281,253,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (282,254,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (283,255,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (284,256,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (285,257,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (286,258,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (287,259,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (291,263,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (292,264,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (293,265,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (294,266,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (296,268,NULL,2,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (297,269,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (298,270,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (299,271,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (300,272,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (314,286,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (315,287,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (316,288,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (317,289,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (318,290,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (319,291,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (320,292,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (321,293,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (322,294,NULL,1,0);
INSERT INTO `nagios_service_template_inheritance` VALUES (323,295,NULL,1,0);
DROP TABLE IF EXISTS `nagios_timeperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_timeperiod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Nagios Timeperiods';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_timeperiod` VALUES (1,'24x7','24 Hours A Day, 7 Days A Week');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time Period Entries';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `nagios_timeperiod_entry` VALUES (106,1,'sunday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (107,1,'monday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (108,1,'tuesday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (109,1,'wednesday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (110,1,'thursday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (111,1,'saturday','00:00-24:00');
INSERT INTO `nagios_timeperiod_entry` VALUES (112,1,'friday','00:00-24:00');
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
