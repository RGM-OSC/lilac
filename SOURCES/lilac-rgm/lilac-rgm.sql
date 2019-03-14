
--
-- Table structure for table `autodiscovery_device`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='AutoDiscovery Found Device';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autodiscovery_device`
--

LOCK TABLES `autodiscovery_device` WRITE;
/*!40000 ALTER TABLE `autodiscovery_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `autodiscovery_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autodiscovery_device_service`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='AutoDiscovery Found Service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autodiscovery_device_service`
--

LOCK TABLES `autodiscovery_device_service` WRITE;
/*!40000 ALTER TABLE `autodiscovery_device_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `autodiscovery_device_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autodiscovery_device_template_match`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='AutoDiscovery Device Matched Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autodiscovery_device_template_match`
--

LOCK TABLES `autodiscovery_device_template_match` WRITE;
/*!40000 ALTER TABLE `autodiscovery_device_template_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `autodiscovery_device_template_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autodiscovery_job`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='AutoDiscovery Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autodiscovery_job`
--

LOCK TABLES `autodiscovery_job` WRITE;
/*!40000 ALTER TABLE `autodiscovery_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `autodiscovery_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autodiscovery_log_entry`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Export Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autodiscovery_log_entry`
--

LOCK TABLES `autodiscovery_log_entry` WRITE;
/*!40000 ALTER TABLE `autodiscovery_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `autodiscovery_log_entry` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),('%','test\\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),('localhost','ged','gedadmin','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','cacti','cacti','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','eonweb','eonweb','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','lilac','eonweb','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','ged','eonweb','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','cacti','eonweb','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','lilac','lilac','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_job`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Export Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_job`
--

LOCK TABLES `export_job` WRITE;
/*!40000 ALTER TABLE `export_job` DISABLE KEYS */;
INSERT INTO `export_job` VALUES (1,'nagios','','O:12:\"ExportConfig\":2:{s:24:\"\0ExportConfig\0configVars\";a:5:{s:15:\"backup_existing\";b:0;s:15:\"preflight_check\";b:1;s:14:\"restart_nagios\";b:1;s:11:\"nagios_path\";s:70:\"/srv/eyesofnetwork/nagios/bin/nagios -v /tmp/lilac-export-1/nagios.cfg\";s:15:\"restart_command\";s:43:\"/usr/bin/sudo /bin/systemctl restart nagios\";}s:25:\"\0ExportConfig\0engineClass\";s:18:\"NagiosExportEngine\";}','2019-02-11 17:50:11','2019-02-11 17:50:17','Complete',4,'2019-02-11 17:50:17','O:11:\"ImportStats\":2:{s:18:\"\0ImportStats\0stats\";a:0:{}s:16:\"\0ImportStats\0job\";N;}','start'),(3,'nagios_incremental','','O:12:\"ExportConfig\":2:{s:24:\"\0ExportConfig\0configVars\";a:9:{s:12:\"export_debug\";b:0;s:11:\"export_diff\";b:0;s:10:\"export_dep\";b:0;s:10:\"export_esc\";b:0;s:15:\"backup_existing\";b:0;s:15:\"preflight_check\";b:1;s:14:\"restart_nagios\";b:1;s:11:\"nagios_path\";s:70:\"/srv/eyesofnetwork/nagios/bin/nagios -v /tmp/lilac-export-3/nagios.cfg\";s:15:\"restart_command\";s:43:\"/usr/bin/sudo /bin/systemctl restart nagios\";}s:25:\"\0ExportConfig\0engineClass\";s:18:\"NagiosExportEngine\";}','2018-08-27 17:08:29','2018-08-27 17:08:35','Complete',4,'2018-08-27 17:08:35','O:11:\"ImportStats\":2:{s:18:\"\0ImportStats\0stats\";a:0:{}s:16:\"\0ImportStats\0job\";N;}','start');
/*!40000 ALTER TABLE `export_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_job_history`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=6095 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Actions history for differential export job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_job_history`
--

LOCK TABLES `export_job_history` WRITE;
/*!40000 ALTER TABLE `export_job_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_log_entry`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=204883 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Export Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_log_entry`
--

LOCK TABLES `export_log_entry` WRITE;
/*!40000 ALTER TABLE `export_log_entry` DISABLE KEYS */;
INSERT INTO `export_log_entry` VALUES (203838,3,'2018-08-27 17:08:35','Nagios Restarted Successfully.',1),(203835,3,'2018-08-27 17:08:29','NagiosExportEngine Starting...',1),(203836,3,'2018-08-27 17:08:29','NagiosExportEngine beginning export...',1),(203837,3,'2018-08-27 17:08:32','Nagios Sanity Check Passed.',1),(204881,1,'2019-02-11 17:50:16','Nagios Sanity Check Passed.',1),(204882,1,'2019-02-11 17:50:17','Nagios Restarted Successfully.',1),(204880,1,'2019-02-11 17:50:12','NagiosExportEngine beginning export...',1),(204879,1,'2019-02-11 17:50:11','NagiosExportEngine Starting...',1);
/*!40000 ALTER TABLE `export_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupright`
--

DROP TABLE IF EXISTS `groupright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupright` (
  `group_id` int(11) NOT NULL,
  `tab_1` enum('0','1') NOT NULL DEFAULT '0',
  `tab_2` enum('0','1') NOT NULL DEFAULT '0',
  `tab_3` enum('0','1') NOT NULL DEFAULT '0',
  `tab_4` enum('0','1') NOT NULL DEFAULT '0',
  `tab_5` enum('0','1') NOT NULL DEFAULT '0',
  `tab_6` enum('0','1') NOT NULL DEFAULT '0',
  `tab_7` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupright`
--

LOCK TABLES `groupright` WRITE;
/*!40000 ALTER TABLE `groupright` DISABLE KEYS */;
INSERT INTO `groupright` VALUES (1,'1','1','1','1','1','1','1'),(2,'1','1','1','1','1','0','1'),(3,'1','1','1','1','1','0','1'),(4,'1','1','1','1','1','0','1'),(5,'1','1','1','1','1','0','1'),(6,'1','1','1','1','1','0','1'),(7,'0','1','1','0','1','0','0');
/*!40000 ALTER TABLE `groupright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_descr` text,
  PRIMARY KEY (`group_id`,`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admins','Administrator group'),(2,'Linux','Groupe des utilisateurs Linux'),(3,'AIX','Groupe des utilisateurs AIX'),(4,'Win','Groupe des utilisateurs Windows'),(5,'SGBD','Groupe des utilisateurs SGBD'),(6,'Exploit','Groupe des utilisateurs Exploit'),(7,'Manager','Groupe des utilisateurs Manager');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_job`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Import Job Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_job`
--

LOCK TABLES `import_job` WRITE;
/*!40000 ALTER TABLE `import_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_log_entry`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Import Job Entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_log_entry`
--

LOCK TABLES `import_log_entry` WRITE;
/*!40000 ALTER TABLE `import_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--



--
-- Table structure for table `lilac_configuration`
--

DROP TABLE IF EXISTS `lilac_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lilac_configuration` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Lilac Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lilac_configuration`
--

LOCK TABLES `lilac_configuration` WRITE;
/*!40000 ALTER TABLE `lilac_configuration` DISABLE KEYS */;
INSERT INTO `lilac_configuration` VALUES ('db_build','61');
/*!40000 ALTER TABLE `lilac_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=444 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (395,'1299753226','admin','login','User logged in','170.217.199.254'),(398,'1300093409','admin','login','User logged in','170.217.253.201'),(399,'1300093635','admin','logout','User logged out','170.217.253.201'),(400,'1300093643','exploit','login','User logged in','170.217.253.201'),(401,'1300094018','exploit','logout','User logged out','170.217.253.201'),(402,'1300094024','admin','login','User logged in','170.217.253.201'),(403,'1300096513','admin','login','User logged in','170.217.199.90'),(404,'1300112750','admin','logout','User logged out','170.217.253.201'),(405,'1300115163','admin','login','User logged in','170.217.253.201'),(406,'1300118396','admin','login','User logged in','170.217.199.1'),(412,'1300717278','admin','logout','User logged out','170.217.253.201'),(413,'1300724930','admin','login','User logged in','170.217.253.201'),(410,'1300714749','admin','logout','User logged out','170.217.253.201'),(409,'1300714712','admin','login','User logged in','170.217.253.201'),(418,'1300956364','admin','login','User logged in','170.217.253.201'),(416,'1300811041','admin','logout','User logged out','170.217.253.201'),(417,'1300812217','admin','login','User logged in','170.217.253.201'),(414,'1300790798','system','login','User logged in','170.217.253.201'),(415,'1300790843','system','logout','User logged out','170.217.253.201'),(419,'1300956403','system','login','User logged in','170.217.199.1'),(420,'1300958392','admin','login','User logged in','170.217.171.61'),(421,'1300960711','admin','logout','User logged out','170.217.253.201'),(422,'1300960787','admin','login','User logged in','170.217.253.201'),(423,'1300980286','admin','login','User logged in','170.217.199.1'),(424,'1301043965','admin','login','User logged in','170.217.253.201'),(425,'1301044228','admin','logout','User logged out','170.217.253.201'),(426,'1301049500','admin','login','User logged in','170.217.199.254'),(427,'1301050034','admin','login','User logged in','170.217.253.201'),(428,'1301050312','admin','logout','User logged out','170.217.253.201'),(429,'1301057662','admin','login','User logged in','170.217.253.201'),(430,'1301057862','admin','logout','User logged out','170.217.253.201'),(431,'1301060756','admin','logout','User logged out','170.217.199.1'),(432,'1301060766','exploit','login','User logged in','170.217.199.1'),(433,'1301296914','admin','login','User logged in','170.217.199.254'),(434,'1301298120','exploit','logout','User logged out','170.217.199.1'),(435,'1301298133','admin','login','User logged in','170.217.199.1'),(436,'1301298725','admin','login','User logged in','170.217.253.201'),(437,'1301300710','admin','login','User logged in','170.217.171.61'),(438,'1301319077','admin','login','User logged in','170.217.199.254'),(443,'1301391166','admin','logout','User logged out','170.217.253.201'),(397,'1299850610','admin','login','User logged in','170.217.199.254'),(390,'1299502972','admin','login','User logged in','170.217.199.254'),(394,'1299681933','admin','login','User logged in','170.217.199.254'),(393,'1299680887','admin','login','User logged in','170.217.199.1'),(392,'1299677241','admin','login','User logged in','170.217.199.254'),(391,'1299675888','admin','login','User logged in','170.217.199.254'),(396,'1299766675','admin','login','User logged in','170.217.199.1'),(389,'1299486641','admin','login','User logged in','170.217.199.254'),(387,'1299223493','admin','login','User logged in','170.217.199.254'),(386,'1299137551','admin','login','User logged in','170.217.199.254'),(388,'1299227462','admin','login','User logged in','170.217.199.254'),(383,'1298994328','admin','login','User logged in','170.217.199.254'),(384,'1299051016','admin','login','User logged in','170.217.199.254'),(385,'1299055766','admin','login','User logged in','170.217.199.254'),(407,'1300351043','admin','login','User logged in','170.217.253.201'),(408,'1300431096','admin','login','User logged in','170.217.253.201'),(411,'1300717172','admin','login','User logged in','170.217.253.201'),(439,'1301325819','admin','login','User logged in','170.217.199.90'),(440,'1301379559','admin','logout','User logged out','170.217.199.90'),(441,'1301379569','admin','login','User logged in','170.217.199.90'),(442,'1301381577','admin','login','User logged in','170.217.199.254');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_broker_module`
--

DROP TABLE IF EXISTS `nagios_broker_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_broker_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Event Broker Modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_broker_module`
--

LOCK TABLES `nagios_broker_module` WRITE;
/*!40000 ALTER TABLE `nagios_broker_module` DISABLE KEYS */;
INSERT INTO `nagios_broker_module` VALUES (2,'/srv/eyesofnetwork/mk-livestatus/lib/livestatus.o /srv/eyesofnetwork/nagios/var/log/rw/live');
/*!40000 ALTER TABLE `nagios_broker_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_cgi_configuration`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CGI Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_cgi_configuration`
--

LOCK TABLES `nagios_cgi_configuration` WRITE;
/*!40000 ALTER TABLE `nagios_cgi_configuration` DISABLE KEYS */;
INSERT INTO `nagios_cgi_configuration` VALUES (3,'/srv/eyesofnetwork/nagios/share','/nagios',1,'','admin','admin','admin','admin','admin','admin','admin',NULL,NULL,5,NULL,4,90,NULL,NULL,NULL,NULL,NULL,'/bin/ping',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_cgi_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_command`
--

DROP TABLE IF EXISTS `nagios_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `line` text NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_command`
--

LOCK TABLES `nagios_command` WRITE;
/*!40000 ALTER TABLE `nagios_command` DISABLE KEYS */;
INSERT INTO `nagios_command` VALUES (49,'dns_status','$USER1$/check_dns -H $ARG1$ -s $HOSTADDRESS$ -w $ARG2$ -c $ARG3$','check the response time of a DNS server'),(50,'check_ftp','$USER1$/check_ftp -H $HOSTADDRESS$','check if the ftp port is opened (21)'),(190,'check_wmi_Disk-Queue','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkio -s logical -a $ARG1$ -w CurrentDiskQueueLenght=$ARG2$ -c CurrentDiskQueueLenght=$ARG3$ ','Check  Disk Queue Lenght of Windows Server. ARG1=Drive (i.e: C:), ARG2 Warning Queue, ARG3 Critical Queue'),(57,'check_ping','$USER1$/check_ping -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 1','check the ICMP availability of a given device'),(58,'check_tcp','$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$','check the openning of a given tcp port'),(59,'check_telnet','$USER1$/check_tcp -H $HOSTADDRESS$ -p 23','check the openning of the telnet port (23)'),(60,'check_udp','$USER1$/check_udp -H $HOSTADDRESS$ -p $ARG1$','check the openning of a given udp port'),(61,'check-host-alive','$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 1','check the availability of a host by ping'),(62,'notify-by-email-host','/srv/eyesofnetwork/notifier/bin/notifier.pl -t host -c /srv/eyesofnetwork/notifier/etc/notifier.cfg -r /srv/eyesofnetwork/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -e \"$HOSTSTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$HOSTOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$HOSTNOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','notification mail hosts'),(63,'host-notify-by-epager','/usr/bin/printf \"%b\" \"Host \\\'$HOSTALIAS$\\\' is $HOSTSTATE$\\\\nInfo: $HOSTOUTPUT$\\\\nTime: $LONGDATETIME$\" | /bin/mail -s \"$NOTIFICATIONTYPE$ alert - Host $HOSTNAME$ is $HOSTSTATE$\" $CONTACTPAGER$','be notified about problems by epager'),(64,'notify-by-email-service','/srv/eyesofnetwork/notifier/bin/notifier.pl -t service -c /srv/eyesofnetwork/notifier/etc/notifier.cfg -r /srv/eyesofnetwork/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -s \"$SERVICEDESC$\" -e \"$SERVICESTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$SERVICEOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -B \"$SERVICEGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$SERVICENOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','notification mail services'),(65,'notify-by-epager','/usr/bin/printf \"%b\" \"Service: $SERVICEDESC$\\\\nHost: $HOSTNAME$\\\\nAddress: $HOSTADDRESS$\\\\nState: $SERVICESTATE$\\\\nInfo: $SERVICEOUTPUT$\\\\nDate: $LONGDATETIME$\" | /bin/mail -s \"$NOTIFICATIONTYPE$: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$\" $CONTACTPAGER$','service notification by epager'),(66,'process-host-perfdata','/usr/bin/printf \"%b\" \"$LASTHOSTCHECK$\\\\t$HOSTNAME$\\\\t$HOSTSTATE$\\\\t$HOSTATTEMPT$\\\\t$HOSTSTATETYPE$\\\\t$HOSTEXECUTIONTIME$\\\\t$HOSTOUTPUT$\\\\t$HOSTPERFDATA$\\\\n\" >> /srv/eyesofnetwork/nagios/var/log/host-perfdata.out','generate host perfdata'),(67,'process-service-perfdata','/usr/bin/printf \"%b\" \"$LASTSERVICECHECK$\\\\t$HOSTNAME$\\\\t$SERVICEDESC$\\\\t$SERVICESTATE$\\\\t$SERVICEATTEMPT$\\\\t$SERVICESTATETYPE$\\\\t$SERVICEEXECUTIONTIME$\\\\t$SERVICELATENCY$\\\\t$SERVICEOUTPUT$\\\\t$SERVICEPERFDATA$\\\\n\" >> /srv/eyesofnetwork/nagios/var/log/service-perfdata.out','generate service perfdata'),(68,'event-browser-service','/srv/eyesofnetwork/ged/scripts/ged-nagios-service \"$HOSTNAME$\" \"$SERVICEDESC$\" \"$SERVICESTATE$\" \"$SERVICEOUTPUT$\" \"$HOSTADDRESS$\" \"$HOSTALIAS$\" \"$HOSTGROUPNAMES$\" \"$SERVICEGROUPNAMES$\"','event browser command for services'),(69,'linux_cpu','$USER1$/check_snmp_load.pl -H $HOSTADDRESS$ -T netsc -C $USER2$ -w $ARG1$ -c $ARG2$ -f','cpu load of a linux host'),(70,'linux_memory','$USER1$/check_snmp_mem.pl -H $HOSTADDRESS$ -f -C $USER2$ -w $ARG1$,$ARG2$ -c $ARG3$,$ARG4$ -b -2','memory load of a linux host'),(180,'check_HyperV','$USER1$/check_hyperv-health.sh $HOSTADDRESS$ $USER2$','check_HyperV'),(181,'nutanix_status','perl $USER1$/check_ssh_nutanix_cluster.pl -H $HOSTADDRESS$ -u $USER8$ -p $USER22$ -T status','nutanix_status'),(73,'mssql_alldb_stat','$USER1$/check_snmp_mssql -H $HOSTADDRESS$ -C $USER2$','statistics on mssql databases'),(74,'mssql_db_stat','$USER1$/check_snmp_mssql -H $HOSTADDRESS$ -d $ARG1$ -C $USER2$','statistics on a mssql database'),(75,'mssql_db_list','$USER1$/check_snmp_mssql -H $HOSTADDRESS$ -i -C $USER2$','list databases on mssql server'),(76,'notes_availability','$USER1$/check_lotus.pl -H $HOSTADDRESS$','availability of a notes server'),(77,'dhcp_status','$USER1$/check_dhcp -s $HOSTADDRESS$','check the response time of a DHCP server'),(80,'check_snmp_interface','perl $USER1$/check_snmp_int.pl -H $HOSTADDRESS$ -C $USER2$ -r -n $ARG1$ -k -w $ARG2$,$ARG3$ -c $ARG4$,$ARG5$','check the bandwith\\\'s state of a given interface'),(167,'process-service-perfdata-file','/bin/mv /srv/eyesofnetwork/graphios/var/spool/service-perfdata /srv/eyesofnetwork/graphios/var/spool/service-perfdata.$TIMET$','process-service-perfdata-file'),(166,'process-host-perfdata-file','/bin/mv /srv/eyesofnetwork/graphios/var/spool/host-perfdata /srv/eyesofnetwork/graphios/var/spool/host-perfdata.$TIMET$','process-host-perfdata-file'),(188,'check_wmi_Processor','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkcpu $ARG1$ $ARG2$','Check % Processor Usage of Windows Server ARG1 and ARG2 avail for custom applying'),(187,'check_wmi_PageFileUsage','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkpage $ARG1$ $ARG2$','Check Usage Pagefile Usage of Windows Server. ARG1 and ARG2 available for customization.'),(91,'event-browser-host','/srv/eyesofnetwork/ged/scripts/ged-nagios-host \"$HOSTNAME$\" \"PING\" \"$HOSTSTATE$\" \"$HOSTOUTPUT$\" \"$HOSTADDRESS$\" \"$HOSTALIAS$\" \"$HOSTGROUPNAMES$\"','event browser command for hosts'),(94,'process','perl $USER1$/check_snmp_process.pl -H $HOSTADDRESS$ -C $USER2$ -r -n $ARG1$','check the load of a given process - arg1 : process name'),(99,'snmp_cpu','$USER1$/check_snmp_load.pl -H $HOSTADDRESS$ -C $USER2$ -w $ARG1$ -c $ARG2$ -f','cpu average'),(100,'win_snmp_memory','$USER1$/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m \"Mem\" -w $ARG1$ -c $ARG2$ -f','memory load of a windows server'),(101,'PARTITION-FS_SNMP','$USER1$/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m $ARG1$ -w $ARG2$ -c $ARG3$ -t 60 -f','used space on a windows partition or linux file system'),(112,'check_http','$USER1$/check_http -H $HOSTADDRESS$ -p $ARG1$','check a HTTP URL and return the exit code of the web page'),(115,'dhcp_free_address','perl $USER1$/check_dhcp_addfree -H $HOSTADDRESS$ -C $USER2$ -v 2 -s $ARG1$ -c $ARG2$ -w $ARG3$','check the number of free addresses on a dhcp subnet'),(116,'win_services','$USER1$/check_snmp_win.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','check generique service'),(182,'nutanix_alerts','perl $USER1$/check_ssh_nutanix_cluster.pl -H $HOSTADDRESS$ -u $USER8$ -p $USER22$ -T alerts','nutanix_alerts'),(183,'check_snmp_ups_with_args','$USER1$/check_ups_snmp2.sh -H $HOSTADDRESS$ -C AMETRA -p $SERVICEDESC$ -w $ARG1$ -c $ARG2$','check_snmp_ups_with_args'),(184,'check_wmi_PhysFreeMemory','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkmem  -w _MemFree%=$ARG1$: -c _MemFree%=$ARG2$:','Check % Processor Usage of Windows Server. ARG1 = %WarningMinimumFree  ARG2 = %CriticalMinimumFree'),(124,'snmp_int','perl $USER1$/check_snmp_int.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','inerface state'),(192,'check_wmi_plus_windows_services','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m $ARG1$ -a $ARG2$ -t 300','check_wmi_plus_windows_services'),(193,'check_wmi_plus_windows_network','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m $ARG1$ -a $ARG2$ -t 300','check_wmi_plus_windows_network'),(191,'check_wmi_Network_vmxnet3','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m  checknetwork -a vmxnet3 ','Check Network state of Windows Server.'),(143,'nslookup','$USER1$/check_dns -H $ARG1$ -w $ARG2$ -c $ARG3$','check nslookup'),(144,'linux_swap','$USER1$/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m Swap -w $ARG1$ -c $ARG2$','swap load of a linux server'),(145,'check_mysql','$USER1$/check_mysql -H $HOSTADDRESS$ -u $ARG1$ -p $ARG2$','check mysql availability'),(146,'check_ssh','$USER1$/check_ssh -H $HOSTADDRESS$','check ssh availability'),(147,'uptime_public','$USER1$/check_snmp_uptime.pl -H $HOSTADDRESS$ -C public -w $ARG1$ -c $ARG2$','uptime communautÃ© public'),(148,'uptime','$USER1$/check_snmp_uptime.sh $HOSTADDRESS$ $USER2$ 1 $ARG1$ $ARG2$','uptime snmp'),(186,'check_wmi_Network_outQueue_vmxnet3','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m  checknetwork -a vmxnet3 -w OutputQueueLength=$ARG1$ -c OutputQueueLength=$ARG2$ ','Check Network Out Queue lenght of Windows Server. ARG1warning size,  ARG2 critical'),(185,'check_wmi_Network_PacketError_vmxnet3','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m  checknetwork -a vmxnet3 -w PacketsReceivedErrors=$ARG1$ -c PacketsReceivedErrors=$ARG2$ ','Check Network Packets Received Errors of Windows Server. ARG1warning size,  ARG2 critical'),(152,'dell_status','$USER1$/check_openmanage -H $HOSTADDRESS$ -C $USER2$','dell openmanage state'),(153,'systime','$USER1$/check_systime.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','systime snmp'),(161,'eon_service_notifier','/srv/eyesofnetwork/notifier/bin/notifier.pl -t service -c /srv/eyesofnetwork/notifier/etc/notifier.cfg -r /srv/eyesofnetwork/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -s \"$SERVICEDESC$\" -e \"$SERVICESTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$SERVICEOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -B \"$SERVICEGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$SERVICENOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','Eon notification broker for service'),(162,'eon_host_notifier','/srv/eyesofnetwork/notifier/bin/notifier.pl -t host -c /srv/eyesofnetwork/notifier/etc/notifier.cfg -r /srv/eyesofnetwork/notifier/etc/notifier.rules -T \"$LONGDATETIME$\" -h \"$HOSTNAME$\" -e \"$HOSTSTATE$\" -i \"$HOSTADDRESS$\" -n \"$NOTIFICATIONTYPE$\" -C \"$CONTACTNAME$\" -M \"$CONTACTEMAIL$\" -O \"$HOSTOUTPUT$\" -A \"$HOSTGROUPNAMES$\" -G \"$CONTACTGROUPNAMES$\" -X \"$TIME$\" -Y \"$HOSTNOTIFICATIONNUMBER$\" -N \"$CONTACTPAGER$\"','Eon notification broker for host'),(163,'check_int_traffic','$USER1$/check_int_traffic.pl -H $HOSTADDRESS$ -C $USER2$ $ARG1$','check_int_traffic'),(164,'check_disk','$USER1$/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m $ARG1$ -w $ARG2$ -c $ARG3$ -S 0 -q FixedDisk -f','used space on a windows partition or linux file system'),(189,'check_wmi_Processor-Queue','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkcpuq $ARG1$ $ARG2$','Check  Processor Queue Lenght of Windows Server ARG1 and ARG2 avail for custom applying'),(168,'notify-by-email-host-old','/usr/bin/printf \"%b\" \"***** Nagios  *****\\\\n\\\\nNotification Type: $NOTIFICATIONTYPE$\\\\nHost: $HOSTNAME$\\\\nState: $HOSTSTATE$\\\\nAddress: $HOSTADDRESS$\\\\nInfo: $HOSTOUTPUT$\\\\n\\\\nDate/Time: $LONGDATETIME$\\\\n\" | /bin/mail -s \"Host $HOSTSTATE$ alert for $HOSTNAME$!\" $CONTACTEMAIL$','notify-by-email-host-old'),(169,'notify-by-email-service-old','/usr/bin/printf \"%b\" \"***** Nagios  *****\\\\n\\\\nNotification Type: $NOTIFICATIONTYPE$\\\\n\\\\nService: $SERVICEDESC$\\\\nHost: $HOSTALIAS$\\\\nAddress: $HOSTADDRESS$\\\\nState: $SERVICESTATE$\\\\n\\\\nDate/Time: $LONGDATETIME$\\\\n\\\\nAdditional Info:\\\\n\\\\n$SERVICEOUTPUT$\" | /bin/mail -s \"Services $SERVICESTATE$ alert for $HOSTNAME$/$SERVICEDESC$!\" $CONTACTEMAIL$','notify-by-email-service-old'),(170,'scc-check-esx-service','$USER1$/check_vmware_esx.pl -D $HOSTALIAS$ -u \'$USER4$\\$USER7$\' -p \'$USER23$\' -H $HOSTADDRESS$ -S $ARG1$ $ARG3$ $ARG4$ --sessionfiledir=$USER1$/esxresult/test --sessionfile=test','apx-check-esx-service'),(171,'scc-check-esx-io','$USER1$/check_vmware_esx.pl -D $HOSTALIAS$ -u \'$USER4$\\$USER7$\' -p \'$USER23$\' -H $HOSTADDRESS$ -S $ARG1$ -s $ARG2$ $ARG3$ $ARG4$ --sessionfiledir=$USER1$/esxresult/test --sessionfile=test',NULL),(172,'scc-check-esx-volume','$USER1$/check_vmware_esx.pl -D $HOSTALIAS$ -u \'$USER4$\\$USER7$\' -p \'$USER23$\' -H $HOSTADDRESS$ -S $ARG1$ $ARG2$ $ARG3$ $ARG4$ --sessionfiledir=$USER1$/esxresult/test --sessionfile=test',NULL),(173,'scc-check-esx','$USER1$/check_vmware_esx.pl -D $HOSTALIAS$ -u \'$USER4$\\$USER7$\' -p \'$USER23$\' -H $HOSTADDRESS$ -S $ARG1$ -s $ARG2$ $ARG3$ $ARG4$ --sessionfiledir=$USER1$/esxresult/test --sessionfile=test',NULL),(174,'hpe_storeonce_service_status','$USER1$/hpe_storeonce/serviceSetHealth.py $HOSTADDRESS$ $USER7$ $USER23$','hpe_storeonce_service_status'),(175,'hpe_storeonce_systemCapacity_status','$USER1$/hpe_storeonce/systemHealthCapacity.py $HOSTADDRESS$ $USER7$ $USER23$','hpe_storeonce_systemCapacity_status'),(176,'hpe_storeonce_hw_status','$USER1$/hpe_storeonce/hardwareCompStatus.py $HOSTADDRESS$ $USER7$ $USER23$','hpe_storeonce_hw_status'),(177,'check_hard_hp_ilo','$USER1$/check_hp -H $HOSTADDRESS$ -C $USER2$ -x cpqFcaHostCntlrStatus','check_hard_hp_ilo'),(179,'check_idrac_7_8','$USER1$/check_dell_idrac7.pl -H $HOSTADDRESS$ -C $USER2$ -T $ARG1$','check_idrac_7_8'),(194,'check_wmi_plus_windows_template','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m $ARG1$ -w $ARG2$ -c $ARG3$ -t 300','check_wmi_plus_windows_template'),(195,'check_wmi_sizedrive','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m checkdrivesize -a $ARG1$ -o 1','check_wmi_sizedrive'),(196,'check_wmi_plus_windows_uptime','$USER1$/check_wmi_plus.pl -H $HOSTADDRESS$ -u $USER4$/$USER7$ -p $USER23$ -m $ARG1$ -t 300','check_wmi_plus_windows_template'),(197,'check_mssql_srv','$USER1$/check_mssql_health2 --server=$HOSTADDRESS$ --username=$USER19$\\\\$USER20$ --password=$USER21$ --mode $SERVICEDISPLAYNAME$','check mysql database'),(198,'check_mssql-Ag_serv_inst_std','$USER1$/check_snmp_win.pl -H $HOSTADDRESS$ -C $USER2$ -n \"Agent SQL Server \\(MSSQLSERVER\\)\"','Check of SQL Server basic agent'),(199,'check_mssql_db','$USER1$/check_mssql_health2 --server=$HOSTADDRESS$ --username=$USER19$\\\\$USER20$ --password=$USER21$ --mode $SERVICEDISPLAYNAME$ ','check mssql database'),(200,'check_mysql_health','$USER1$/check_mysql_health --hostname $HOSTADDRESS$ --username $USER3$ --password $USER19$ --mode $SERVICEDESC$','check_mysql_health'),(201,'check_mysql_health_argument','$USER1$/check_mysql_health --hostname $HOSTADDRESS$ --username $USER3$ --password $USER19$ --mode $ARG1$','check_mysql_health_argument'),(202,'check_oracle','perl $USER1$/check_oracle_health --connect \'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$HOSTADDRESS$)(PORT=1521))(LOAD_BALANCE=yes)(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=$HOSTALIAS$)))\' --user $USER20$ --password $USER21$ --mode $SERVICEDISPLAYNAME$','Check Oracle'),(203,'check_snmp_synology','$USER1$/check_snmp_synology -v -2 $USER2$ -h $HOSTADDRESS$','check_snmp_synology'),(204,'check_snmp_with_args','$USER1$/./check_snmp -H 10.151.2.41 -C $USER2$ -o','check_snmp_with_args'),(205,'check_netapp_vol_aggr','$USER1$/check_netapp_sam.pl -H $HOSTADDRESS$ -C $USER2$ -T $ARG1$ -v $ARG2$  -w $ARG3$ -c $ARG4$','check_netapp_vol_aggr'),(206,'check_Nettap','perl $USER1$/check_netapp3.pl -H $HOSTADDRESS$ -v $SERVICEDESC$','check_Nettap'),(207,'check_equallogic','$USER1$/check_equallogic.sh -C $USER2$ -H $HOSTADDRESS$ -t $SERVICEDISPLAYNAME$ -w $ARG1$ -c $ARG2$','check_equallogic'),(208,'check_snmp_dell_equallogic','$USER1$/check_snmp_dell_equallogic_eon.sh -C $USER2$ -H $HOSTADDRESS$ -n $ARG1$ -t $SERVICEDISPLAYNAME$ -w $ARG2$ -c $ARG3$','check_snmp_dell_equallogic'),(209,'check_solidfire','$USER1$/checkSolidFire.py $HOSTADDRESS$ $ARG1$ $USER8$ $USER23$ mvip','check_solidfire'),(210,'check_3par','$USER1$/check_3PAR $HOSTADDRESS$ $USER9$ $ARG1$','check_3par'),(211,'emc_check_storage_pool','$USER1$/check_emc_clariion.pl -H $HOSTADDRESS$ -u $USER6$ -p $USER21$ -t storage_pool --storage_pool_id $ARG1$','emc_check_storage_pool'),(212,'emc_check_lun','$USER1$/check_emc_clariion.pl -H $HOSTADDRESS$ -u $USER6$ -p $USER21$ -t lun --lun_id $ARG1$','emc_check_lun'),(213,'emc_check_simple_2','$USER1$/check_emc_clariion_2.pl -H $HOSTADDRESS$ -u $USER6$ -p $USER21$ -t $ARG1$','emc_check_simple_2'),(214,'emc_check_simple','$USER1$/check_emc_clariion.pl -H $HOSTADDRESS$ -u $USER6$ -p $USER21$ -t $ARG1$','emc_check_simple'),(215,'process_vcsa','perl $USER1$/check_snmp_process.pl -H $HOSTADDRESS$ -C $USER2$ -n $ARG1$','check the load of a given process - arg1 : process name'),(216,'check_int_traffic_vcsa','$USER1$/check_snmp_int.pl -H $HOSTADDRESS$ -C $USER2$ -n ','check_int_traffic_vcsa'),(217,'check_disk_vcsa','$USER1$/check_snmp_storage.pl -H $HOSTADDRESS$ -C $USER2$ -m $ARG1$ -w $ARG2$ -c $ARG3$ -S 0 -f','used space on a windows partition or linux file system'),(218,'Compellent_Global_Status','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -w 3 -c 3 -C $USER2$ -u ALL','Compellent_Global_Status'),(219,'Compellent_Disk_Status','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -w 1 -c 1 -C $USER2$ -u UP','Compellent_Disk_Status'),(220,'Compellent_Temperature_Panier','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -w 40 -c 50 -C $USER2$ -u degres','Compellent_Temperature_Panier'),(221,'Compellent_Temperature_Status','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -w 60 -c 70 -C $USER2$ -u degres','Compellent_Temperature_Status'),(222,'check_datadomain','perl $USER1$/check_dd.pl -H $HOSTADDRESS$ -v ALERTS','check_datadomain'),(223,'brocade_status','$USER1$/check_FCBrocade_hardware.sh -H $HOSTADDRESS$ -c $USER2$','brocade status'),(224,'check_nrpe_wrapper','$USER1$/ce/check_nrpe_wrapper $HOSTADDRESS$ $ARG1$','check_nrpe_wrapper'),(225,'check_nrpe_wrapper_1arg','$USER1$/ce/check_nrpe_wrapper_1arg $HOSTADDRESS$ $ARG1$ $ARG2$','check_nrpe_wrapper_1arg'),(226,'check_nrpe_wrapper_3arg','$USER1$/ce/check_nrpe_wrapper_3arg $HOSTADDRESS$ $ARG1$ $ARG2$ $ARG3$ $ARG4$','check_nrpe_wrapper_3arg'),(227,'check_nrpe_wrapper_2arg','$USER1$/ce/check_nrpe_wrapper_2arg $HOSTADDRESS$ $ARG1$ $ARG2$ $ARG3$','check_nrpe_wrapper_2arg'),(228,'check_ntp','$USER1$/ce/check_ntp_wrapper $HOSTADDRESS$','check_ntp for Celerra'),(229,'check_ssh_wrapper','$USER1$/ce/check_ssh_wrapper $HOSTADDRESS$','check_ssh_wrapper for Celerra'),(230,'check_nrpe_availability','$USER1$/ce/check_nrpe_availability $HOSTADDRESS$','check_nrpe_availability for Celerra'),(231,'Arkoon uptime','$USER1$/check_snmp_uptime.sh $HOSTADDRESS$ public 1 $ARG1$ $ARG2$','uptime snmp'),(232,'check_memory-fortinet','$USER1$/check_fortigate_memory -H $HOSTADDRESS$ -C $USER2$ -w $ARG1$ -c $ARG2$','memory load of a fortinet'),(233,'check_mge_power','$USER1$/check_mge_power_status.sh -H $HOSTADDRESS$ -l $ARG1$ -p $ARG2$ -w $ARG3$ -c $ARG4$','Commande de verification de la consommation PDU'),(234,'check_mge_temp','$USER1$/check_temp_mge_sensor.sh -H $HOSTADDRESS$ -l $ARG1$ -p $ARG2$ -w $ARG3$ -c $ARG4$','Commande de verification des sondes de temperature PDU'),(235,'check_es_uptime','python $USER1$/uptime.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$','Uptime from ElasticSearch/MetricBeat'),(236,'check_es_cpu','python $USER1$/cpu.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$','CPU from ElasticSearch/MetricBeat'),(237,'check_es_load','python $USER1$/load.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$','LOAD AVERAGE from ElasticSearch/MetricBeat'),(238,'check_es_memory','python $USER1$/memory.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$','Memory from ElasticSearch/MetricBeat'),(239,'check_es_disk','python $USER1$/disk.py -H $HOSTNAME$ -w $ARG1$ -c $ARG2$','DISK from ElasticSearch/MetricBeat'),(240,'check_nwc_health','$USER1$/check_nwc_health --mode $SERVICEDISPLAYNAME$ --hostname $HOSTADDRESS$ --community $USER5$ -t 300','check_nwc_health'),(241,'passive','$USER1$/check_dummy 1 \"Etat de la sonde anormal\"','Commande pour la reception des Alerts RGMA'),(242,'check_nrpe','$USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$','check_nrpe'),(243,'brocade_fc_status','$USER1$/check_snmp_FCports_brocade-v1.3.pl -H $HOSTADDRESS$ -C $USER5$','brocade_fc_status'),(244,'bp_status','$USER1$/check_bp_status.pl -b $SERVICEDESC$','bp_status'),(245,'check_nutanix_snmp','$USER1$/check_nutanix.pl -H $HOSTADDRESS$ -a SHA -u $USER7$ -A $USER17$ -x AES -X $USER17$ -t $ARG1$ -s $SERVICEDESC$ -w $SERVICEDESC$=$ARG2$ -c $SERVICEDESC$=$ARG2$','check_nutanix_snmp');
/*!40000 ALTER TABLE `nagios_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact`
--

LOCK TABLES `nagios_contact` WRITE;
/*!40000 ALTER TABLE `nagios_contact` DISABLE KEYS */;
INSERT INTO `nagios_contact` VALUES (3,'admin','default user','','',1,1,11,11,1,1,1,0,0,1,1,1,1,0,1,1,1),(5,'test','test','',NULL,1,1,11,11,1,1,1,1,1,1,1,1,1,1,1,1,1),(6,'ged','ged Brocking events',NULL,NULL,1,1,11,11,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `nagios_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact_address`
--

DROP TABLE IF EXISTS `nagios_contact_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nagios_contact_address_FI_1` (`contact`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Contact Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact_address`
--

LOCK TABLES `nagios_contact_address` WRITE;
/*!40000 ALTER TABLE `nagios_contact_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_contact_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact_custom_object_var`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Custom Object Variables for Contact';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact_custom_object_var`
--

LOCK TABLES `nagios_contact_custom_object_var` WRITE;
/*!40000 ALTER TABLE `nagios_contact_custom_object_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_contact_custom_object_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact_group`
--

DROP TABLE IF EXISTS `nagios_contact_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact_group`
--

LOCK TABLES `nagios_contact_group` WRITE;
/*!40000 ALTER TABLE `nagios_contact_group` DISABLE KEYS */;
INSERT INTO `nagios_contact_group` VALUES (3,'admins','EyesOfNetwork Administrators'),(5,'test','test'),(7,'Exploitation','Groupes pour la reception des notifications avancÃ©es');
/*!40000 ALTER TABLE `nagios_contact_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact_group_member`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Member of a Nagios Contact Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact_group_member`
--

LOCK TABLES `nagios_contact_group_member` WRITE;
/*!40000 ALTER TABLE `nagios_contact_group_member` DISABLE KEYS */;
INSERT INTO `nagios_contact_group_member` VALUES (5,5,5),(12,3,3);
/*!40000 ALTER TABLE `nagios_contact_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_contact_notification_command`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Notification Command for a Nagios Contact';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_contact_notification_command`
--

LOCK TABLES `nagios_contact_notification_command` WRITE;
/*!40000 ALTER TABLE `nagios_contact_notification_command` DISABLE KEYS */;
INSERT INTO `nagios_contact_notification_command` VALUES (56,3,91,'host'),(55,3,68,'service'),(13,0,91,'host'),(14,1,68,'service'),(15,5,62,'host'),(16,5,64,'service'),(66,6,68,'service'),(65,6,91,'host');
/*!40000 ALTER TABLE `nagios_contact_notification_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_dependency`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Dependency';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_dependency`
--

LOCK TABLES `nagios_dependency` WRITE;
/*!40000 ALTER TABLE `nagios_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_dependency_target`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Targets for a Dependency';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_dependency_target`
--

LOCK TABLES `nagios_dependency_target` WRITE;
/*!40000 ALTER TABLE `nagios_dependency_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_dependency_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_escalation`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_escalation`
--

LOCK TABLES `nagios_escalation` WRITE;
/*!40000 ALTER TABLE `nagios_escalation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_escalation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_escalation_contact`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contact Group for Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_escalation_contact`
--

LOCK TABLES `nagios_escalation_contact` WRITE;
/*!40000 ALTER TABLE `nagios_escalation_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_escalation_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_escalation_contactgroup`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contact Group for Escalation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_escalation_contactgroup`
--

LOCK TABLES `nagios_escalation_contactgroup` WRITE;
/*!40000 ALTER TABLE `nagios_escalation_contactgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_escalation_contactgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host`
--

LOCK TABLES `nagios_host` WRITE;
/*!40000 ALTER TABLE `nagios_host` DISABLE KEYS */;
INSERT INTO `nagios_host` VALUES (6,'rgm-01-poc','EyesOfNetwork Network Server','RGM',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,'venus.budcca-demo.lab','10.112.11.100','VENUS',NULL,'venus.budcca-demo.lab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,'neptune.budcca-demo.lab','10.112.11.100','NEPTUNE',NULL,'neptune.budcca-demo.lab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,'mars.budcca-demo.lab','10.112.11.100','MARS',NULL,'mars.budcca-demo.lab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,'LUNE','storeonce','LUNE',NULL,'10.112.11.14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,'jupiter.budcca-demo.lab','10.112.11.100','JUPITER',NULL,'jupiter.budcca-demo.lab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,'ilo-venus.budcca-demo.lab','ilo-venus.budcca-demo.lab','ILO-VENUS',NULL,'10.112.11.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,'ilo-neptune.budcca-demo.lab','ilo-neptune.budcca-demo.lab','ILO-NEPTUNE',NULL,'10.112.11.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,'ENV_DEV_JULIEN','ENV_DEV_JULIEN','ENV_DEV_JULIEN',NULL,'10.112.11.167',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'ilo-jupiter.budcca-demo.lab','ilo-jupiter.budcca-demo.lab','ILO-JUPITER',NULL,'10.112.11.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,'elk','ElasticStack','ELK',NULL,'10.112.11.57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,'CLUSTER-BUDCA','CLUSTER-BUDCA','CLUSTER-BUDCA',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,'BUDCA','BUDCA','BUDCA',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,'ADBUDCCA','ADBUDCCA','ADBUDCCA',NULL,'10.112.11.150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,'APPLI_METIER','APPLI_METIER','APPLI_METIER',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'computer.png',NULL,'computer.png','computer.png',NULL,NULL),(169,'ADBUDCCA2','ADBUDCCA2','ADBUDCCA2',NULL,'10.112.11.151',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,'SOLIDFIRE','SOLIDFIRE','SOLIDFIRE',NULL,'10.112.11.220',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,'3PAR','3PAR','3PAR',NULL,'10.112.11.12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,'client1','La Banque Postale','La Banque Postale',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,'client2','Kiabi','Kiabi',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,'client3','Compass Group','Compass Group',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,'client4','Conseil General Haute Loire','Conseil General Haute Loire',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,'ERIS','ERIS','ERIS',NULL,'10.112.11.10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,'RGMA','Sondes applicatives','RGMA',NULL,'10.112.11.65',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL),(181,'ENV_DEV_GUILLAUME','ENV_DEV_GUILLAUME','ENV_DEV_GUILLAUME',NULL,'10.112.11.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,'ENV_DEV_SAM','ENV_DEV_SAM','ENV_DEV_SAM',NULL,'10.112.11.165',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,'SELENE','SELENE','SELENE',NULL,'10.112.11.11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,'ENV_DEV_MICHAEL','ENV_DEV_MICHAEL','ENV_DEV_MICHAEL',NULL,'10.112.11.166',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,'nextcloud','NEXTCLOUD','NEXTCLOUD',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,'docker_nextcloud_webserver','docker_nextcloud_webserver','docker_nextcloud_webserver',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL),(187,'docker_reverent_chandrasekhar','docker_reverent_chandrasekhar','docker_reverent_chandrasekhar',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL),(188,'docker_letsencrypt-companion','docker_letsencrypt-companion','docker_letsencrypt-companion',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL),(189,'docker_nextcloud_proxy','docker_nextcloud_proxy','docker_nextcloud_proxy',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL),(190,'docker_nextcloud_db','docker_nextcloud_db','docker_nextcloud_db',NULL,'10.112.11.58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL),(191,'APPLI_INFRA','APPLI_INFRA','APPLI_INFRA',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'computer.png',NULL,'computer.png','computer.png',NULL,NULL),(193,'NUTANIX_CVM1','NUTANIX_CVM1','NUTANIX_CVM1',NULL,'10.112.11.133',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,'NUTANIX_CVM2','NUTANIX_CVM2','NUTANIX_CVM2',NULL,'10.112.11.136',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,'NUTANIX_CVM3','NUTANIX_CVM3','NUTANIX_CVM3',NULL,'10.112.11.139',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,'Mike_TEST_NEW','My_Test',NULL,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10000,'ADBUDCCA-2327','ADBUDCCA','ADBUDCCA',NULL,'10.112.11.150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_check_command_parameter`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Parameter for Host Check Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_check_command_parameter`
--

LOCK TABLES `nagios_host_check_command_parameter` WRITE;
/*!40000 ALTER TABLE `nagios_host_check_command_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_host_check_command_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_contact_member`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contacts which belong to host templates or hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_contact_member`
--

LOCK TABLES `nagios_host_contact_member` WRITE;
/*!40000 ALTER TABLE `nagios_host_contact_member` DISABLE KEYS */;
INSERT INTO `nagios_host_contact_member` VALUES (30,198,NULL,3),(27,NULL,33,6);
/*!40000 ALTER TABLE `nagios_host_contact_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_contactgroup`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contact Group for Host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_contactgroup`
--

LOCK TABLES `nagios_host_contactgroup` WRITE;
/*!40000 ALTER TABLE `nagios_host_contactgroup` DISABLE KEYS */;
INSERT INTO `nagios_host_contactgroup` VALUES (48,NULL,79,3),(49,NULL,33,3),(51,198,NULL,5);
/*!40000 ALTER TABLE `nagios_host_contactgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_custom_object_var`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Custom Object Variables for Host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_custom_object_var`
--

LOCK TABLES `nagios_host_custom_object_var` WRITE;
/*!40000 ALTER TABLE `nagios_host_custom_object_var` DISABLE KEYS */;
INSERT INTO `nagios_host_custom_object_var` VALUES (10001,NULL,80,'TOTO','coincoin');
/*!40000 ALTER TABLE `nagios_host_custom_object_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_parent`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Additional Host Parent Relationship';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_parent`
--

LOCK TABLES `nagios_host_parent` WRITE;
/*!40000 ALTER TABLE `nagios_host_parent` DISABLE KEYS */;
INSERT INTO `nagios_host_parent` VALUES (2,186,NULL,185),(3,187,NULL,185),(4,188,NULL,185),(5,189,NULL,185),(6,190,NULL,185),(14,198,NULL,171);
/*!40000 ALTER TABLE `nagios_host_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_template`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Host Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_template`
--

LOCK TABLES `nagios_host_template` WRITE;
/*!40000 ALTER TABLE `nagios_host_template` DISABLE KEYS */;
INSERT INTO `nagios_host_template` VALUES (10,'RGM_WINDOWS_SNMP','Template Windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'RGM_LINUX_SNMP','Template Linux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux40.png',NULL,'linux40.png','linux40.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'RGM_NUTANIX_AHV','Template Nutanix Hyperviseur AHV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nutanix.png',NULL,'nutanix.png','nutanix.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'RGM_UPS','Template Onduleur UPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'legrand.png',NULL,'legrand.png','legrand.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'RGM_WINDOWS_WMI_ADVANCED','Template Windows WMI compteurs specifiques',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Windows_2012.png',NULL,'Windows_2012.png','Windows_2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'RGM_WINDOWS_WMI','Template Windows base en WMI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'RGM_MSSQL_DBHEALTH','Template Mssql DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSSQL2008.png',NULL,'MSSQL2008.png','MSSQL2008.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'RGM_MYSQL_DBHEALTH','Template Mysql DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mysql.png',NULL,'mysql.png','mysql.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'RGM_WINDOWS_VMTOOLS','Template Windows Virtual Machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windows2012.png',NULL,'windows2012.png','windows2012.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'RGM_LINUX_VMTOOLS','Template Linux Virtual Machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux.png',NULL,'linux.png','linux.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'RGM_MS_HYPER-V','Template HYPER-V',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'windowsxp.png',NULL,'windowsxp.png','windowsxp.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'GENERIC_HOST','Template Generic',NULL,NULL,61,NULL,NULL,2,4,1,11,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,10,11,1,1,1,1,1,1,1,1,1,1,NULL,NULL,NULL,NULL,'https://10.112.11.38/module/module_frame/index.php?url=%2Fnagvis%2Ffrontend%2Fnagvis-js%2FRGM_DTE_PART1_Supervision.pdf','/grafana/dashboard/script/histou.js?host=$HOSTNAME$&refresh=30s','computer.png',NULL,'computer.png','computer.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'RGM_HPE_SWITCH','Template Network device',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'network_node.png',NULL,'network_node.png','network_node.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'RGM_DELL_HARDWARE','Template Hardware iDRAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dell2.png',NULL,'dell2.png','dell2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'RGM_VMWARE_ESX','Template ESX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware2.png',NULL,'vmware2.png','vmware2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'RGM_HPE_STOREONCE','Template Baie Storeonce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'HP_logo_1.jpg',NULL,'HP_logo_1.jpg','HP_logo_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'RGM_HPE_HARDWARE','Template Hardware ILO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'HP_logo_1.jpg',NULL,'HP_logo_1.jpg','HP_logo_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'RGM_ORACLE_DBHEALTH','Template Oracle DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oracle.png',NULL,'oracle.png','oracle.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'RGM_NAS_SYNOLOGY','Template NAS Synology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'synology.png',NULL,'synology.png','synology.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'RGM_EMC_ISILON','Template EMC ISILON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'RGM_NETAPP_METROCLUSTER','Template Netapp MetroCluster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'netapp.png',NULL,'netapp.png','netapp.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'RGM_DELL_EQUALLOGIC','Template DELL Equallogic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dell.png',NULL,'dell.png','dell.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'RGM_NETAPP_SOLIDFIRE','Template Netapp Solidfire',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'netapp.png',NULL,'netapp.png','netapp.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'RGM_HPE_3PAR','Template 3PAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3PAR.png',NULL,'3PAR.png','3PAR.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'RGM_EMC_VNX','Template Emc VNX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EMC2.png',NULL,'EMC2.png','EMC2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'RGM_VMWARE_VCSA','Template VCenter Aplliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware.png',NULL,'vmware.png','vmware.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'RGM_DELL_COMPELLENT','Template DELL Compellent',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'compellent.png',NULL,'compellent.png','compellent.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'RGM_EMC_DATADOMAIN','Template EMC Datadomain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EMC2.png',NULL,'EMC2.png','EMC2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'RGM_EMC_CELERRA','Template EMC Celerra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EMC2.png',NULL,'EMC2.png','EMC2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'RGM_MGE_PDU','Template PDU MGE',NULL,NULL,61,NULL,NULL,2,4,1,11,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,1,1,1,1,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,'/module/capacity_for_nagios/index.php?ip=$HOSTNAME$','rack1.png',NULL,'rack1.png','rack1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'RGM_LINUX_SNMP_MEMUP','Template Linux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux40.png',NULL,'linux40.png','linux40.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'RGM_NETWORK_DEVICE','Template Network device',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'network_node.png',NULL,'network_node.png','network_node.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'RGM_LINUX_ES','RGM_LINUX_ES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'linux.png',NULL,'linux.png','linux.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'RGM_DOCKER_NEXCLOUD_WS','RGM_DOCKER_NEXCLOUD_WS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'RGM_DOCKER_NEXCLOUD_RC','RGM_DOCKER_NEXCLOUD_RC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'RGM_DOCKER_NEXCLOUD_LC','RGM_DOCKER_NEXCLOUD_LC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'RGM_DOCKER_NEXCLOUD_PROXY','RGM_DOCKER_NEXCLOUD_PROXY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'RGM_DOCKER_NEXCLOUD_DB','RGM_DOCKER_NEXCLOUD_DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'docker.png',NULL,'docker.png','docker.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'RGM_NUTANIX_SNMPv3','RGM_NUTANIX_SNMPv3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nutanix.png',NULL,'nutanix.png','nutanix.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'RGM_BROCADE_SWITCH','RGM_BROCADE_SWITCH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brocade.png',NULL,'brocade.png','brocade.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_host_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_template_autodiscovery_service`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_template_autodiscovery_service`
--

LOCK TABLES `nagios_host_template_autodiscovery_service` WRITE;
/*!40000 ALTER TABLE `nagios_host_template_autodiscovery_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_host_template_autodiscovery_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_host_template_inheritance`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Host Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_host_template_inheritance`
--

LOCK TABLES `nagios_host_template_inheritance` WRITE;
/*!40000 ALTER TABLE `nagios_host_template_inheritance` DISABLE KEYS */;
INSERT INTO `nagios_host_template_inheritance` VALUES (30,NULL,36,33,0),(31,NULL,37,33,0),(278,169,NULL,36,0),(279,NULL,61,33,0),(273,NULL,60,33,0),(270,NULL,57,33,0),(280,NULL,62,33,0),(349,182,NULL,89,0),(253,NULL,11,33,0),(263,NULL,10,33,0),(313,NULL,82,33,0),(282,NULL,64,33,0),(281,NULL,63,33,0),(269,NULL,56,33,0),(326,184,NULL,61,0),(353,191,NULL,33,0),(347,6,NULL,82,0),(348,NULL,89,33,0),(271,NULL,58,33,0),(272,NULL,59,33,0),(247,NULL,52,33,0),(248,153,NULL,52,0),(249,154,NULL,52,0),(250,155,NULL,52,0),(251,NULL,53,33,0),(252,156,NULL,53,0),(254,157,NULL,52,0),(255,NULL,54,33,0),(256,158,NULL,54,0),(257,159,NULL,54,0),(323,183,NULL,61,0),(259,161,NULL,54,0),(346,162,NULL,11,0),(261,163,NULL,33,0),(262,164,NULL,33,0),(275,165,NULL,36,0),(283,NULL,65,33,0),(284,NULL,66,33,0),(285,NULL,67,33,0),(286,NULL,68,33,0),(287,NULL,69,33,0),(288,170,NULL,70,0),(289,NULL,70,33,0),(290,NULL,71,33,0),(291,171,NULL,71,0),(292,NULL,72,33,0),(293,NULL,73,33,0),(294,NULL,74,33,0),(295,NULL,75,33,0),(297,NULL,77,33,0),(299,NULL,79,33,0),(309,175,NULL,80,0),(308,174,NULL,80,0),(307,173,NULL,80,0),(306,172,NULL,80,0),(305,NULL,80,33,0),(310,176,NULL,56,0),(311,NULL,81,33,0),(312,177,NULL,33,0),(320,181,NULL,61,0),(318,180,NULL,61,0),(324,165,NULL,61,1),(325,169,NULL,61,1),(331,NULL,84,33,0),(329,NULL,83,33,0),(330,186,NULL,83,0),(332,NULL,85,33,0),(333,NULL,86,33,0),(334,NULL,87,33,0),(356,193,NULL,59,0),(336,187,NULL,84,0),(338,188,NULL,85,0),(340,189,NULL,86,0),(342,190,NULL,87,0),(357,194,NULL,59,0),(354,192,NULL,33,0),(355,185,NULL,82,0),(358,195,NULL,59,0),(359,NULL,91,33,0),(360,194,NULL,91,1),(363,198,NULL,82,0),(364,193,NULL,91,1),(365,195,NULL,91,1),(10000,10000,NULL,36,0),(10001,10000,NULL,61,1);
/*!40000 ALTER TABLE `nagios_host_template_inheritance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_hostgroup`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Hostgroup';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_hostgroup`
--

LOCK TABLES `nagios_hostgroup` WRITE;
/*!40000 ALTER TABLE `nagios_hostgroup` DISABLE KEYS */;
INSERT INTO `nagios_hostgroup` VALUES (8,'WINDOWS','HostGroup Windows',NULL,NULL,NULL),(7,'LINUX','HostGroup Linux',NULL,NULL,NULL),(11,'VMWARE','HostGroup VmWare',NULL,NULL,NULL),(12,'ESX','HostGroup Esx',NULL,NULL,NULL),(30,'role_wins_1Osec','Role de metricbeat Ã  10sec',NULL,NULL,NULL),(29,'BROCADE','HostGroup Brocade',NULL,NULL,NULL),(28,'EMC','HostGroup Emc',NULL,NULL,NULL),(24,'CISCO','HostGroup Cisco',NULL,NULL,NULL),(25,'ALL','ALL',NULL,NULL,NULL),(26,'MSSQL','MSSQL',NULL,NULL,NULL),(27,'ORACLE','ORACLE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_hostgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_hostgroup_membership`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hostgroup Membership for Host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_hostgroup_membership`
--

LOCK TABLES `nagios_hostgroup_membership` WRITE;
/*!40000 ALTER TABLE `nagios_hostgroup_membership` DISABLE KEYS */;
INSERT INTO `nagios_hostgroup_membership` VALUES (30,NULL,11,7),(31,NULL,10,8),(8,NULL,36,11),(9,NULL,37,11),(42,NULL,75,7),(37,NULL,65,27),(47,159,NULL,30),(40,NULL,73,7),(36,NULL,63,26),(35,NULL,61,8),(38,NULL,72,28),(48,NULL,80,7),(45,161,NULL,30),(41,NULL,74,7);
/*!40000 ALTER TABLE `nagios_hostgroup_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_main_configuration`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Main Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_main_configuration`
--

LOCK TABLES `nagios_main_configuration` WRITE;
/*!40000 ALTER TABLE `nagios_main_configuration` DISABLE KEYS */;
INSERT INTO `nagios_main_configuration` VALUES (3,'/srv/eyesofnetwork/nagios/etc','/srv/eyesofnetwork/nagios/var/log/nagios.log','/srv/eyesofnetwork/nagios/var/log/nagios.tmp','/srv/eyesofnetwork/nagios/var/log/status.dat',15,'nagios','eyesofnetwork',1,1,1,1,'d','/srv/eyesofnetwork/nagios/var/log/archives',1,NULL,'/srv/eyesofnetwork/nagios/var/log/rw/nagios.cmd','/var/run/nagios/nagios.pid',1,'/srv/eyesofnetwork/nagios/var/log/retention.dat',60,1,0,1,1,1,1,0,1,1,91,68,NULL,NULL,'s',0,10,60,0,1,5,20,5,20,0,20,10,30,30,5,NULL,5,0,NULL,1,0,1,NULL,'euro','`~!$%^&*|\\\'\"<>?,()=','`~$&|\\\'\"<>','nagios','pagenagios',1,'s',0,1,5,'s',5,0,30,180,NULL,NULL,NULL,1,60,60,0,0,'-1',0,NULL,NULL,'/srv/eyesofnetwork/nagflux/var/spool/host-perfdata','DATATYPE::HOSTPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tHOSTPERFDATA::$HOSTPERFDATA$\\tHOSTCHECKCOMMAND::$HOSTCHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$\\tGRAPHITEPREFIX::rgm\\tGRAPHITEPOSTFIX::hgraph\\tMETRICTYPE::gauge','/srv/eyesofnetwork/nagflux/var/spool/service-perfdata','DATATYPE::SERVICEPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tSERVICEDESC::$SERVICEDESC$\\tSERVICEPERFDATA::$SERVICEPERFDATA$\\tSERVICECHECKCOMMAND::$SERVICECHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$\\tSERVICESTATE::$SERVICESTATE$\\tSERVICESTATETYPE::$SERVICESTATETYPE$\\tGRAPHITEPREFIX::rgm\\tGRAPHITEPOSTFIX::sgraph\\tMETRICTYPE::gauge','a','a',166,167,15,15,'/srv/eyesofnetwork/nagios/var/log/objects.cache',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/tmp',0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_main_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_resource`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_resource`
--

LOCK TABLES `nagios_resource` WRITE;
/*!40000 ALTER TABLE `nagios_resource` DISABLE KEYS */;
INSERT INTO `nagios_resource` VALUES (2,'/srv/eyesofnetwork/nagios/plugins','scc_com1','/srv/eyesofnetwork/notifier','budcca','public','','svc-rgm','admin','3paradm','/srv/eyesofnetwork/pnp4nagios','','','','','','','3f64b92e9948c84f1566c92e53d58e418a2163c2','','','','','Constell@tion123','Constell@tion','','','','','','','','','');
/*!40000 ALTER TABLE `nagios_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service`
--

LOCK TABLES `nagios_service` WRITE;
/*!40000 ALTER TABLE `nagios_service` DISABLE KEYS */;
INSERT INTO `nagios_service` VALUES (185,'processor',NULL,NULL,10,NULL,NULL,NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(611,'status','status',NULL,84,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,'memory',NULL,NULL,10,NULL,NULL,NULL,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(609,'uptime','uptime',NULL,84,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,'partitions',NULL,NULL,10,NULL,NULL,NULL,164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(610,'restarts','restarts',NULL,84,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'process_ged',NULL,6,NULL,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,'processor',NULL,NULL,11,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL),(180,'memory',NULL,NULL,11,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(588,'processor','processor',NULL,82,NULL,NULL,NULL,236,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,'partitions',NULL,NULL,11,NULL,NULL,NULL,164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL),(38,'mysql',NULL,6,NULL,NULL,NULL,NULL,145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'ssh',NULL,6,NULL,NULL,NULL,NULL,146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,'VMXNet3_Network_Error','VMXNet3_Network_Error',NULL,61,NULL,NULL,NULL,185,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,'systime',NULL,NULL,11,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,'systime',NULL,NULL,10,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,'processor','processor',NULL,62,NULL,NULL,NULL,194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,'Hyper-V Virtual Machine Management','Hyper-V Virtual Machine Management',NULL,58,NULL,NULL,NULL,116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,'uptime',NULL,NULL,10,NULL,NULL,NULL,148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,'Processor_Usage','Processor_Usage',NULL,61,NULL,NULL,NULL,188,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,'VMXNet_Network_Output_Queue','VMXNet_Network_Output_Queue',NULL,61,NULL,NULL,NULL,186,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,'vmware_tools',NULL,NULL,36,NULL,NULL,NULL,116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware.png',NULL),(112,'vmware_tools',NULL,NULL,37,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmware.png',NULL),(264,'PageFile_Usage_PCT','PageFile_Usage_PCT',NULL,61,NULL,NULL,NULL,187,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,'uptime',NULL,NULL,11,NULL,NULL,NULL,148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,'uptime','uptime',NULL,62,NULL,NULL,NULL,196,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,'Physical_MemoryFree','Physical_MemoryFree',NULL,61,NULL,NULL,NULL,184,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,'partition_C','partition_C',NULL,62,NULL,NULL,NULL,195,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,'alerts_nutanix','alerts_nutanix',NULL,59,NULL,NULL,NULL,182,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,'status_nutanix','status_nutanix',NULL,59,NULL,NULL,NULL,181,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,'num_output_lines','num_output_lines',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(253,'num_input_lines','num_input_lines',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,'ups_alarm','ups_alarm',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,'interfaces',NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL),(190,'interfaces',NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,'Processor_Queue','Processor_Queue',NULL,61,NULL,NULL,NULL,189,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,'C_Current_Disk_Queue','C_Current_Disk_Queue',NULL,61,NULL,NULL,NULL,190,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,'VMXNet_Network_State','VMXNet_Network_State',NULL,61,NULL,NULL,NULL,191,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,'battery_charge_remain','battery_charge_remain',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,'battery_status','battery_status',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,'battery_temp','battery_temp',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,'input_voltage','input_voltage',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,'output_load','output_load',NULL,60,NULL,NULL,NULL,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(247,'Hyper-V Image Management Service','Hyper-V Image Management Service',NULL,58,NULL,NULL,NULL,116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(246,'hyper-V_Global_Status','hyper-V_Global_Status',NULL,58,NULL,NULL,NULL,180,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,'Hyper-V Networking Management Service','Hyper-V Networking Management Service',NULL,58,NULL,NULL,NULL,116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,'OS_Status','OS_Status',NULL,57,NULL,NULL,NULL,179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,'Model_Status','Model_Status',NULL,57,NULL,NULL,NULL,179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,'Global_Status','Global_Status',NULL,57,NULL,NULL,NULL,179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(238,'uptime','uptime',NULL,56,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(586,'application-web','application-web',177,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,'interface-usage','interface-usage',NULL,56,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,'interface-availability','interface-availability',NULL,56,NULL,NULL,NULL,240,NULL,1440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(590,'memory','memory',NULL,82,NULL,NULL,NULL,238,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,'hardware_status','hardware_status',NULL,54,NULL,NULL,NULL,177,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,'cpu',NULL,NULL,52,NULL,NULL,NULL,173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,'memory',NULL,NULL,52,NULL,NULL,NULL,173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,'status',NULL,NULL,52,NULL,NULL,NULL,173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,'network',NULL,NULL,52,NULL,NULL,NULL,173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,'volumes','volumes',NULL,52,NULL,NULL,NULL,172,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,'io','io',NULL,52,NULL,NULL,NULL,171,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,'service','service',NULL,52,NULL,NULL,NULL,170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(587,'application-lourde','application-lourde',177,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,'interface-errors','interface-errors',NULL,56,NULL,NULL,NULL,240,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,'hardware_status','hardware_status',NULL,53,NULL,NULL,NULL,176,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,'system_health','system_health',NULL,53,NULL,NULL,NULL,175,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,'service_status','service_status',NULL,53,NULL,NULL,NULL,174,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(602,'uptime','uptime',NULL,61,NULL,NULL,NULL,196,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,'processor_average','processor_average',NULL,62,NULL,NULL,NULL,194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,'memory','memory',NULL,62,NULL,NULL,NULL,194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,'Interfaces','Interfaces',NULL,62,NULL,NULL,NULL,193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,'database-free','database-free',NULL,63,NULL,NULL,NULL,199,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(284,'connection-time','connection-time',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,'connection-time','connection-time',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,'io-busy','io-busy',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,'full-scans','full-scans',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,'mem-pool-data-buffer-hit-ratio','mem-pool-data-buffer-hit-ratio',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(282,'page-life-expectancy','page-life-expectancy',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(283,'free-list-stalls','free-list-stalls',NULL,63,NULL,NULL,NULL,197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(285,'uptime-db','uptime-db',NULL,64,NULL,NULL,NULL,201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(286,'threads-connected','threads-connected',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,'threadcache-hitrate','threadcache-hitrate',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,'querycache-hitrate','querycache-hitrate',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,'querycache-lowmem-prunes','querycache-lowmem-prunes',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,'myisam-keycache-hitrate','myisam-keycache-hitrate',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,'innodb-bufferpool-hitrate','innodb-bufferpool-hitrate',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(292,'innodb-bufferpool-wait-free','innodb-bufferpool-wait-free',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(293,'innodb-log-waits','innodb-log-waits',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,'tablecache-hitrate','tablecache-hitrate',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(295,'table-lock-contention','table-lock-contention',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(296,'index-usage','index-usage',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(297,'tmp-disk-tables','tmp-disk-tables',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(298,'slow-queries','slow-queries',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(299,'long-running-procs','long-running-procs',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,'slave-lag','slave-lag',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(301,'slave-io-running','slave-io-running',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,'slave-sql-running','slave-sql-running',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(303,'sql','sql',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,'open-files','open-files',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(305,'encode','encode',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,'cluster-ndb-running','cluster-ndb-running',NULL,64,NULL,NULL,NULL,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(307,'sga-library-cache-hit-ratio','sga-library-cache-hit-ratio',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(308,'sga-latches-hit-ratio','sga-latches-hit-ratio',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(309,'sga-shared-pool-reloads','sga-shared-pool-reloads',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,'sga-data-buffer-hit-ratio','sga-data-buffer-hit-ratio',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,'connection-time','connection-time',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,'sga-shared-pool-free','sga-shared-pool-free',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,'pga-in-memory-sort-ratio','pga-in-memory-sort-ratio',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,'switch-interval','switch-interval',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(315,'tablespace-free','tablespace-free',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(316,'datafile-io-traffic','datafile-io-traffic',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(317,'tablespace-fragmentation','tablespace-fragmentation',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(318,'connected-users','connected-users',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,'sga-dictionary-cache-hit-ratio','sga-dictionary-cache-hit-ratio',NULL,65,NULL,NULL,NULL,202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(320,'Global_Status','Global_Status',NULL,66,NULL,NULL,NULL,203,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,'Utilisation_Processeur','Utilisation_Processeur',NULL,67,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,'SNMP_CLUSTER_HEALTH','SNMP_CLUSTER_HEALTH',NULL,67,NULL,NULL,NULL,204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,'uptime','uptime',NULL,67,NULL,NULL,NULL,148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,'SNMP_ONEFS_VERSION','SNMP_ONEFS_VERSION',NULL,67,NULL,NULL,NULL,204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,'SNMP_CONFIGURED_NODES','SNMP_CONFIGURED_NODES',NULL,67,NULL,NULL,NULL,204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(326,'systime','systime',NULL,67,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(327,'SNMP_ONLINE_NODES','SNMP_ONLINE_NODES',NULL,67,NULL,NULL,NULL,204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(328,'ORACLE_DEV_DATA','ORACLE_DEV_DATA',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,'controller','controller',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(330,'CPULOAD','CPULOAD',NULL,68,NULL,NULL,NULL,206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,'UPTIME','UPTIME',NULL,68,NULL,NULL,NULL,206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,'CPTIME','CPTIME',NULL,68,NULL,NULL,NULL,206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,'CPBACK','CPBACK',NULL,68,NULL,NULL,NULL,206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,' aggr_sas_status',' aggr_sas_status',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,'health','health',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(336,'SHELFINFO','SHELFINFO',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(337,'DISK_STATUS','DISK_STATUS',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(338,'AUTOSUPPORTSTATUS','AUTOSUPPORTSTATUS',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,'battery','battery',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(340,'ORACLE_DATA','ORACLE_DATA',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,'redundancy','redundancy',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,'latency','latency',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(343,'VMWARE_PROD01','VMWARE_PROD01',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(344,'VMWARE_PROD02','VMWARE_PROD02',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(367,'usage','usage',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(346,'vol_VM_Oracle','vol_VM_Oracle',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(347,'datas','datas',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(365,'network','network',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,'info','info',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(363,'disk','disk',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,'GENNFS_SHARE_TEST','GENNFS_SHARE_TEST',NULL,68,NULL,NULL,NULL,205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,'temperature','temperature',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,'io','io',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,'fan','fan',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,'connection','connection',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,'raid','raid',NULL,69,NULL,NULL,NULL,208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,'volumes','volumes',NULL,69,NULL,NULL,NULL,207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(370,'ps','ps',NULL,69,NULL,NULL,NULL,207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(371,'uptime','uptime',NULL,69,NULL,NULL,NULL,207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(372,'global_status','global_status',NULL,70,NULL,NULL,NULL,209,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(373,'node_status','node_status',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(374,'physical_disks','physical_disks',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(375,'logical_disks','logical_disks',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(376,'virtual_volumes','virtual_volumes',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(377,'power_supply','power_supply',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(378,'fc_ports','fc_ports',NULL,71,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,'vmware-sca','vmware-sca',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(381,'disks',NULL,NULL,72,NULL,NULL,NULL,214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,'spB',NULL,NULL,72,NULL,NULL,NULL,213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(383,'spA',NULL,NULL,72,NULL,NULL,NULL,213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,'errors',NULL,NULL,72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(385,'cache',NULL,NULL,72,NULL,NULL,NULL,213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,'vmware-syslog-health','vmware-syslog-health',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(428,'vsphere-client','vsphere-client',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(389,'VMWARE','VMWARE',NULL,72,NULL,NULL,NULL,212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(390,'VMWARE_BKP','VMWARE_BKP',NULL,72,NULL,NULL,NULL,212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,'partitions',NULL,NULL,73,NULL,NULL,NULL,217,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$&view=1',NULL,NULL),(415,'Apache_Status','Apache_Status',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(417,'systime',NULL,NULL,73,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(418,'uptime',NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(419,'interfaces',NULL,NULL,73,NULL,NULL,NULL,216,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(420,'vmware-cm','vmware-cm',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(421,'vmware-sps','vmware-sps',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(422,'vmware-vdcs','vmware-vdcs',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(423,'vmware-cis-license','vmware-cis-license',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(424,'vmware-stsd','vmware-stsd',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(425,'vmware-psc-client','vmware-psc-client',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(426,'vmware-sts-idmd','vmware-sts-idmd',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(427,'vmware-vpx-workflow','vmware-vpx-workflow',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(407,'IMPAX_RIS_DB','IMPAX_RIS_DB',NULL,72,NULL,NULL,NULL,212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,'vmware-vsm','vmware-vsm',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(432,'vmware-vapi-endpoint','vmware-vapi-endpoint',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(412,'Tier_1','Tier_1',NULL,72,NULL,NULL,NULL,211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,'Tier_2','Tier_2',NULL,72,NULL,NULL,NULL,211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,'Tier_3','Tier_3',NULL,72,NULL,NULL,NULL,211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,'vmware-vsan-health','vmware-vsan-health',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(434,'vmware-perfcharts','vmware-perfcharts',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(435,'vmware-invsvc','vmware-invsvc',NULL,73,NULL,NULL,NULL,215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(436,'Temperature','Temperature',NULL,74,NULL,NULL,NULL,221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(437,'Status_FAN2-1','Status_FAN2-1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(438,'Status_Enclosure2','Status_Enclosure2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(439,'Status_Enclosure1','Status_Enclosure1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(440,'uptime',NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(442,'10K_Status_Disk01-01','10K_Status_Disk01-01',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(581,'hardware-health','hardware-health',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(444,'10K_Status_Disk01-02','10K_Status_Disk01-02',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(445,'SSD_Status_Disk02-00','SSD_Status_Disk02-00',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(446,'10K_Status_Disk01-10','10K_Status_Disk01-10',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(571,'partitions',NULL,NULL,80,NULL,NULL,NULL,164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$&view=1',NULL,NULL),(448,'Status_FAN2-4','Status_FAN2-4',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(449,'10K_Status_Disk01-18','10K_Status_Disk01-18',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(450,'10K_Status_Disk01-05','10K_Status_Disk01-05',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(451,'10K_Status_Disk01-11','10K_Status_Disk01-11',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(452,'SSD_Status_Disk02-01','SSD_Status_Disk02-01',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(580,'cpu-load','cpu-load',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(582,'interface-errors','interface-errors',NULL,81,NULL,NULL,NULL,240,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(456,'Status_FAN1-1','Status_FAN1-1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(457,'10K_Status_Disk01-22','10K_Status_Disk01-22',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(458,'10K_Status_Disk01-03','10K_Status_Disk01-03',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(459,'10K_Status_Disk01-06','10K_Status_Disk01-06',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(460,'10K_Status_Disk01-16','10K_Status_Disk01-16',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(461,'10K_Status_Disk01-12','10K_Status_Disk01-12',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(462,'10K_Status_Disk01-20','10K_Status_Disk01-20',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(463,'SSD_Status_Disk02-05','SSD_Status_Disk02-05',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(464,'SSD_Status_Disk02-03','SSD_Status_Disk02-03',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,'LUN_PROD_VM1','LUN_PROD_VM1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(466,'Power_Supply2-2','Power_Supply2-2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(467,'Power_Supply2-1','Power_Supply2-1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(468,'Temperature_Panier_Central_Encl1','Temperature_Panier_Central_Encl1',NULL,74,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(469,'Temperature_Panier_Central_Encl2','Temperature_Panier_Central_Encl2',NULL,74,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(470,'Status_FAN2-3','Status_FAN2-3',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(471,'Status_FAN1-3','Status_FAN1-3',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(472,'10K_Status_Disk01-09','10K_Status_Disk01-09',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(473,'10K_Status_Disk01-04','10K_Status_Disk01-04',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,'10K_Status_Disk01-08','10K_Status_Disk01-08',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,'10K_Status_Disk01-07','10K_Status_Disk01-07',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(476,'10K_Status_Disk01-15','10K_Status_Disk01-15',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,'10K_Status_Disk01-14','10K_Status_Disk01-14',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(478,'10K_Status_Disk01-13','10K_Status_Disk01-13',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(479,'10K_Status_Disk01-17','10K_Status_Disk01-17',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,'10K_Status_Disk01-19','10K_Status_Disk01-19',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,'10K_Status_Disk01-21','10K_Status_Disk01-21',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,'10K_Status_Disk01-23','10K_Status_Disk01-23',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(547,'SAVVOL-DATA1','SAVVOL-DATA1',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,'SSD_Status_Disk02-02','SSD_Status_Disk02-02',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,'SSD_Status_Disk02-04','SSD_Status_Disk02-04',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,'SSD_Status_Disk02-06','SSD_Status_Disk02-06',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(578,'interface-usage','interface-usage',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(556,'NFS Exports','NFS Exports',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(557,'HW-Status','HW Status',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(608,'uptime','uptime',NULL,83,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(569,'processor',NULL,NULL,80,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(551,'Replication-vdm1','Replication-vdm1',NULL,77,NULL,NULL,NULL,225,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(550,'CheckPoints','CheckPoints',NULL,77,NULL,NULL,NULL,225,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(579,'interface-availability','interface-availability',NULL,81,NULL,NULL,NULL,240,NULL,1440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(560,'TEMP','Temperature',NULL,79,NULL,NULL,NULL,234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(561,'POWER','Power consomation',NULL,79,NULL,NULL,NULL,233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(546,'NTP','NTP',NULL,77,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,'Power_Supply1-1','Power_Supply1-1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,'Power_Supply1-2','Power_Supply1-2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,'Status_FAN1-2','Status_FAN1-2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,'Status_FAN2-2','Status_FAN2-2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,'Status_FAN1-4','Status_FAN1-4',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(570,'memory',NULL,NULL,80,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(552,'Anti-Virus','Anti Virus',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(553,'Data-Mover','Data-Mover',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(554,'User-mapper','User Mapper',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(555,'CIFS-SERVERS','CIFS Servers',NULL,77,NULL,NULL,NULL,224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(573,'uptime',NULL,NULL,80,NULL,NULL,NULL,148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(574,'interfaces',NULL,NULL,80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL),(575,'status','status',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(576,'uptime','uptime',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(577,'memory-usage','memory-usage',NULL,81,NULL,NULL,NULL,240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(548,'FS-DATA1','FS-DATA1',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(549,'Quota-DATA1','Quota-DATA1',NULL,77,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(572,'systime',NULL,NULL,80,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,'uptime',NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,'global_service','global_service',NULL,75,NULL,NULL,NULL,222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(535,'systime',NULL,NULL,75,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(536,'partitions',NULL,NULL,75,NULL,NULL,NULL,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(537,'memory',NULL,NULL,75,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(538,'processor',NULL,NULL,75,NULL,NULL,NULL,69,6,5,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',NULL,NULL),(540,'SystemFS','SystemFS',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(541,'NRPE-Availlability','NRPE-Availlability',NULL,77,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(542,'SSH','SSH',NULL,77,NULL,NULL,NULL,229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(543,'Load','Load',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544,'Total-Process','Total-Process',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(545,'Zombie-Process','Zombie-Process',NULL,77,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(530,'Cache_Battery_Status_Encl1','Cache_Battery_Status_Encl1',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,'Cache_Battery_Status_Encl2','Cache_Battery_Status_Encl2',NULL,74,NULL,NULL,NULL,219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,'Global_Status','Global_Status',NULL,74,NULL,NULL,NULL,218,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(591,'uptime','uptime',NULL,82,NULL,NULL,NULL,235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(592,'load','load',NULL,82,NULL,NULL,NULL,237,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(593,'partitions','partitions',NULL,82,NULL,NULL,NULL,239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(607,'restarts','restarts',NULL,83,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(606,'status','status',NULL,83,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://10.112.11.58/index.php/apps/files/?dir=/seafile-BUDCA/Documentation%20Constructeur-Editeur/Docker%20Technical%20Sales%20Professional/02%20-%20Product&fileid=212664',NULL,NULL,NULL),(605,'memory','memory',NULL,83,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(604,'processor','processor',NULL,83,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,'memory','memory',NULL,84,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,'processor','processor',NULL,84,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,'status','status',NULL,85,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(615,'uptime','uptime',NULL,85,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(616,'restarts','restarts',NULL,85,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(617,'memory','memory',NULL,85,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(618,'processor','processor',NULL,85,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(619,'status','status',NULL,86,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(620,'uptime','uptime',NULL,86,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(621,'restarts','restarts',NULL,86,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,'memory','memory',NULL,86,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,'processor','processor',NULL,86,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,'status','status',NULL,87,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(625,'uptime','uptime',NULL,87,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(626,'restarts','restarts',NULL,87,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(627,'memory','memory',NULL,87,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(628,'processor','processor',NULL,87,NULL,NULL,NULL,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(638,'port_FC_status','port_FC_status',NULL,89,NULL,NULL,NULL,243,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(656,'vmPowerState','vmPowerState',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(655,'EYESOFNETWORK','EYESOFNETWORK',192,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(654,'NUTANIX','NUTANIX',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(639,'hardware_status','hardware_status',NULL,89,NULL,NULL,NULL,223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(640,'uptime','uptime',NULL,89,NULL,NULL,NULL,147,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(643,'3PAR','3PAR',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(651,'ELASTIC_STACK','ELASTIC_STACK',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(645,'SOLIDFIRE','SOLIDFIRE',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(646,'CLUSTER_ESX','CLUSTER_ESX',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(647,'APPLICATION_DOCKER','APPLICATION_DOCKER',192,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(653,'KUBERNETES','KUBERNETES',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(652,'OPENSTACK','OPENSTACK',191,NULL,NULL,NULL,NULL,244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(657,'vmReadIOPerSecond','vmReadIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(658,'vmCpuUsagePercent','vmCpuUsagePercent',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(659,'vmMemoryUsagePercent','vmMemoryUsagePercent',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(660,'vmRxBytes','vmRxBytes',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(661,'vmRxDropCount','vmRxDropCount',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(662,'vmAverageLatency','vmAverageLatency',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(663,'vmTxBytes','vmTxBytes',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(664,'vmWriteIOPerSecond','vmWriteIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(665,'vmTxDropCount','vmTxDropCount',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(666,'citIOPerSecond','citIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(667,'citUsedCapacity','citUsedCapacity',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(668,'citAvgLatencyUsecs','citAvgLatencyUsecs',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(669,'citIOBandwidth','citIOBandwidth',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(670,'dstNumFreeBytes','dstNumFreeBytes',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(671,'clusterLatency','clusterLatency',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(672,'dstAverageLatency','dstAverageLatency',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(673,'dstState','dstState',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(674,'dstNumberIops','dstNumberIops',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(675,'dstIOBandwidth','dstIOBandwidth',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(676,'clusterUsedStorageCapacity','clusterUsedStorageCapacity',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(677,'clusterIops','clusterIops',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(678,'clusterStatus','clusterStatus',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(679,'cstControllerVMStatus','cstControllerVMStatus',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(680,'cstDataServiceStatus','cstDataServiceStatus',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(681,'cstMetadataServiceStatus','cstMetadataServiceStatus',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(682,'hypervisorTxDropCount','hypervisorTxDropCount',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(683,'hypervisorRxBytes','hypervisorRxBytes',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(684,'hypervisorWriteIOPerSecond','hypervisorWriteIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(685,'hypervisorCpuUsagePercent','hypervisorCpuUsagePercent',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(686,'hypervisorMemoryUsagePercent','hypervisorMemoryUsagePercent',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(687,'hypervisorReadIOPerSecond','hypervisorReadIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(688,'hypervisorIOBandwidth','hypervisorIOBandwidth',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(689,'hypervisorRxDropCount','hypervisorRxDropCount',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(690,'hypervisorTxBytes','hypervisorTxBytes',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(691,'spitIOPerSecond','spitIOPerSecond',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(692,'spitIOBandwidth','spitIOBandwidth',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(693,'spitAvgLatencyUsecs','spitAvgLatencyUsecs',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(694,'spitUsedCapacity','spitUsedCapacity',NULL,91,NULL,NULL,NULL,245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_check_command_parameter`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Parameter for check command for service or service template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_check_command_parameter`
--

LOCK TABLES `nagios_service_check_command_parameter` WRITE;
/*!40000 ALTER TABLE `nagios_service_check_command_parameter` DISABLE KEYS */;
INSERT INTO `nagios_service_check_command_parameter` VALUES (170,38,NULL,'root'),(291,180,NULL,'90'),(858,590,NULL,'90'),(287,179,NULL,'90'),(388,260,NULL,'3'),(298,185,NULL,'90'),(297,185,NULL,'80'),(300,186,NULL,'95'),(299,186,NULL,'80'),(303,187,NULL,'95'),(26,33,NULL,'ged'),(272,NULL,12,'80'),(304,188,NULL,'300'),(387,260,NULL,'C'),(386,259,NULL,'90'),(385,259,NULL,'95'),(379,255,NULL,'23'),(384,257,NULL,'30'),(373,243,NULL,'model_servicetag'),(374,244,NULL,'global'),(859,590,NULL,'40'),(171,38,NULL,'root66'),(809,NULL,6,'10'),(380,255,NULL,'26'),(391,261,NULL,'3'),(390,261,NULL,'C:'),(389,260,NULL,'15'),(174,111,NULL,'\"Vmware Tools\"'),(175,112,NULL,'vmware-guestd'),(295,182,NULL,'300'),(302,187,NULL,'90'),(286,179,NULL,'80'),(294,181,NULL,'95'),(293,181,NULL,'90'),(292,181,NULL,'/'),(289,180,NULL,'20'),(288,180,NULL,'80'),(301,187,NULL,'^[A-Z]'),(383,257,NULL,'25'),(810,NULL,6,'5'),(382,256,NULL,'225:245'),(381,256,NULL,'230:240'),(296,184,NULL,'-v 2 -g'),(305,190,NULL,'-v 2'),(378,249,NULL,'\"Hyper-V Virtual Machine Management\"'),(377,248,NULL,'\"Hyper-V Networking Management Service\"'),(371,235,NULL,'--lookback 3600'),(375,245,NULL,'os'),(376,247,NULL,'\"Hyper-V Image Management Service\"'),(322,185,NULL,'80'),(323,185,NULL,'90'),(395,263,NULL,'80'),(394,262,NULL,'12'),(326,187,NULL,'^[A-Z]'),(327,187,NULL,'90'),(328,187,NULL,'95'),(329,188,NULL,'300'),(330,190,NULL,'-v 2'),(856,588,NULL,'90'),(855,588,NULL,'80'),(333,180,NULL,'30'),(857,590,NULL,'80'),(337,181,NULL,'/'),(338,181,NULL,'90'),(339,181,NULL,'95'),(340,182,NULL,'300'),(341,184,NULL,'-v 2 -g'),(342,218,NULL,'cpu'),(343,218,NULL,'usage'),(344,218,NULL,' -w 80% -c 90%'),(345,219,NULL,'mem'),(346,219,NULL,'usage'),(347,219,NULL,'-w 80% -c 90%'),(348,220,NULL,'runtime'),(349,220,NULL,'status'),(350,221,NULL,'net'),(351,221,NULL,'nic'),(352,222,NULL,'volumes'),(353,222,NULL,'--gigabyte'),(354,222,NULL,'-w 10%'),(355,222,NULL,'-c 5%'),(356,223,NULL,'io'),(357,223,NULL,'usage'),(358,224,NULL,'service'),(359,33,NULL,'ged'),(360,38,NULL,'root'),(361,38,NULL,'root66'),(393,262,NULL,'6'),(392,261,NULL,'15'),(396,263,NULL,'95'),(397,265,NULL,'10'),(398,265,NULL,'20'),(399,266,NULL,'100'),(400,266,NULL,'1000'),(401,267,NULL,'15'),(402,267,NULL,'5'),(403,268,NULL,'checkuptime'),(404,268,NULL,'95'),(405,268,NULL,'98'),(406,269,NULL,'checkcpu'),(407,269,NULL,'95'),(408,269,NULL,'98'),(409,270,NULL,'\"c:\"'),(410,270,NULL,'80'),(411,270,NULL,'90'),(884,602,NULL,'5'),(883,602,NULL,'checkuptime'),(415,272,NULL,'checkcpuq'),(416,272,NULL,'95'),(417,272,NULL,'98'),(418,273,NULL,'checkmem'),(419,273,NULL,'80'),(420,273,NULL,'90'),(421,274,NULL,'checknetwork'),(422,274,NULL,'\"vmxnet3 Ethernet Adapter\"'),(426,309,NULL,'SID'),(425,285,NULL,'uptime'),(427,309,NULL,'USER'),(428,309,NULL,'PASS'),(429,321,NULL,'80'),(430,321,NULL,'90'),(431,322,NULL,'.1.3.6.1.4.1.12124.1.1.2.0 -e 1 -t 10 -c 0'),(432,323,NULL,'10'),(433,323,NULL,'5'),(434,324,NULL,'.1.3.6.1.2.1.1.1.0'),(435,325,NULL,'.1.3.6.1.4.1.12124.1.1.5.0'),(436,326,NULL,'300'),(437,327,NULL,'.1.3.6.1.4.1.12124.1.1.6.0'),(438,328,NULL,'DISKUSED'),(439,328,NULL,'/vol/ORACLE_DEV_DATA'),(440,328,NULL,'80'),(441,328,NULL,'90'),(544,368,NULL,'San-Prod'),(543,367,NULL,'San-Prod'),(542,366,NULL,'San-Prod'),(446,334,NULL,'DISKUSED'),(447,334,NULL,'aggr_sas'),(448,334,NULL,'85'),(449,334,NULL,'90'),(547,374,NULL,'check_pd'),(546,373,NULL,'check_node'),(545,372,NULL,'443'),(454,336,NULL,'SHELFINFO'),(455,336,NULL,'0'),(456,336,NULL,'0'),(457,337,NULL,'DISKSUMMARY'),(458,337,NULL,'0'),(459,337,NULL,'0'),(460,338,NULL,'AUTOSUPPORTSTATUS'),(461,338,NULL,'0'),(462,338,NULL,'0'),(541,365,NULL,'San-Prod'),(540,364,NULL,'San-Prod'),(539,363,NULL,'San-Prod'),(467,340,NULL,'DISKUSED'),(468,340,NULL,'/vol/ORACLE_DATA'),(469,340,NULL,'80'),(470,340,NULL,'90'),(560,383,NULL,'sp --sp A'),(559,382,NULL,'sp --sp B'),(558,381,NULL,'disk'),(535,359,NULL,'50'),(534,359,NULL,'45'),(533,359,NULL,'San-Prod'),(479,343,NULL,'DISKUSED'),(480,343,NULL,'/vol/VMWARE_PROD01'),(481,343,NULL,'80'),(482,343,NULL,'90'),(483,344,NULL,'DISKUSED'),(484,344,NULL,'/vol/VMWARE_PROD02'),(485,344,NULL,'80'),(486,344,NULL,'90'),(661,430,NULL,'vmware-sca'),(562,385,NULL,'cache'),(561,384,NULL,'faults'),(491,346,NULL,'DISKUSED'),(492,346,NULL,'/vol/vol_VM_Oracle'),(493,346,NULL,'80'),(494,346,NULL,'90'),(495,347,NULL,'DISKUSED'),(496,347,NULL,'/vol/datas'),(497,347,NULL,'80'),(498,347,NULL,'90'),(665,434,NULL,'vmware-perfcharts'),(664,433,NULL,'vmware-vsan-health'),(663,432,NULL,'vmware-vapi-endpoint'),(662,431,NULL,'vmware-vsm'),(551,378,NULL,'check_port_fc'),(550,377,NULL,'check_ps'),(549,376,NULL,'check_vv'),(548,375,NULL,'check_ld'),(511,351,NULL,'DISKUSED'),(512,351,NULL,'/vol/GENNFS_SHARE_PROD'),(513,351,NULL,'80'),(514,351,NULL,'90'),(538,362,NULL,'San-Prod'),(537,361,NULL,'San-Prod'),(536,360,NULL,'San-Prod'),(532,358,NULL,'San-Prod'),(531,357,NULL,'San-Prod'),(530,356,NULL,'San-Prod'),(529,355,NULL,'250'),(528,355,NULL,'200'),(527,355,NULL,'San-Prod'),(660,429,NULL,'vmware-syslog-health'),(659,428,NULL,'vsphere-client'),(572,389,NULL,'61'),(573,389,NULL,'10'),(574,389,NULL,'5'),(575,390,NULL,'62'),(576,390,NULL,'10'),(577,390,NULL,'5'),(648,416,NULL,'90'),(647,416,NULL,'/'),(646,415,NULL,'httpd2'),(666,435,NULL,'vmware-invsvc'),(669,436,NULL,'.1.3.6.1.4.1.16139.2.19.1.5.1.1'),(670,437,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.2.1'),(651,420,NULL,'vmware-cm'),(650,417,NULL,'300'),(649,416,NULL,'95'),(652,421,NULL,'vmware-sps'),(653,422,NULL,'vmware-vdcs'),(654,423,NULL,'vmware-cis-license'),(655,424,NULL,'vmware-vdcs'),(656,425,NULL,'vmware-psc-client'),(657,426,NULL,'vmware-sts-idmd'),(658,427,NULL,'vmware-vpx-workflow'),(671,438,NULL,'.1.3.6.1.4.1.16139.2.15.1.3.2'),(672,439,NULL,'.1.3.6.1.4.1.16139.2.15.1.3.1'),(626,407,NULL,'73'),(627,407,NULL,'10'),(628,407,NULL,'5'),(891,608,NULL,'check_docker_nextcloud_webserver_uptime'),(674,442,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.18'),(641,412,NULL,'0'),(642,413,NULL,'1'),(643,414,NULL,'2'),(820,561,NULL,'3.50'),(676,444,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.31'),(677,445,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.3'),(678,446,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.22'),(815,560,NULL,'30'),(680,448,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.2.4'),(681,449,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.14'),(682,450,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.26'),(683,451,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.19'),(684,452,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.24'),(818,561,NULL,'MGEUPS'),(819,561,NULL,'2.50'),(816,560,NULL,'35'),(688,456,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.1.1'),(689,457,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.9'),(690,458,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.17'),(691,459,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.29'),(692,460,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.8'),(693,461,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.15'),(694,462,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.25'),(695,463,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.2'),(696,464,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.5'),(697,465,NULL,'.1.3.6.1.4.1.16139.2.26.1.3.1'),(698,466,NULL,'.1.3.6.1.4.1.16139.2.21.1.3.2.2'),(699,467,NULL,'.1.3.6.1.4.1.16139.2.21.1.3.2.1'),(700,468,NULL,'.1.3.6.1.4.1.16139.2.23.1.5.1.2'),(701,469,NULL,'.1.3.6.1.4.1.16139.2.23.1.5.2.3'),(702,470,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.2.3'),(703,471,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.1.3'),(704,472,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.28'),(705,473,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.27'),(706,474,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.21'),(707,475,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.23'),(708,476,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.10'),(709,477,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.30'),(710,478,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.16'),(711,479,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.13'),(712,480,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.12'),(713,481,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.20'),(714,482,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.11'),(785,544,NULL,'400'),(716,484,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.4'),(717,485,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.6'),(718,486,NULL,'.1.3.6.1.4.1.16139.2.14.1.3.7'),(817,561,NULL,'MGEUPS'),(803,552,NULL,'check_antivirus'),(804,553,NULL,'check_datamover'),(805,554,NULL,'check_usermapper'),(806,555,NULL,'check_cifs'),(807,556,NULL,'check_nfs'),(789,547,NULL,'check_savvol'),(790,547,NULL,'data1'),(791,547,NULL,'80'),(792,548,NULL,'check_fs'),(793,548,NULL,'data1'),(784,544,NULL,'300'),(730,498,NULL,'.1.3.6.1.4.1.16139.2.21.1.3.1.1'),(731,499,NULL,'.1.3.6.1.4.1.16139.2.21.1.3.1.2'),(732,500,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.1.2'),(733,501,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.2.2'),(734,502,NULL,'.1.3.6.1.4.1.16139.2.20.1.3.1.4'),(814,560,NULL,'MGEUPS'),(813,560,NULL,'MGEUPS'),(808,557,NULL,'check_hardware'),(794,548,NULL,'90'),(795,549,NULL,'check_quota'),(796,549,NULL,'data1'),(797,549,NULL,'group'),(798,549,NULL,'1024'),(799,550,NULL,'check_checkpoints'),(800,550,NULL,'home'),(801,551,NULL,'check_replication'),(802,551,NULL,'vdm1'),(786,545,NULL,'check_zombie_procs'),(787,545,NULL,'1'),(788,545,NULL,'1'),(767,535,NULL,'300'),(768,536,NULL,'/'),(769,536,NULL,'90'),(770,536,NULL,'95'),(771,537,NULL,'90'),(772,537,NULL,'20'),(773,537,NULL,'95'),(774,537,NULL,'30'),(775,538,NULL,'85'),(776,538,NULL,'95'),(777,540,NULL,'check_disk'),(778,540,NULL,'10%'),(779,540,NULL,'5%'),(780,543,NULL,'check_load'),(781,543,NULL,'8,8,8'),(782,543,NULL,'10,10,10'),(783,544,NULL,'check_total_procs'),(762,530,NULL,'.1.3.6.1.4.1.16139.2.28.1.5.1'),(763,531,NULL,'.1.3.6.1.4.1.16139.2.28.1.5.2'),(764,532,NULL,'.1.3.6.1.4.1.16139.2.6.0'),(890,607,NULL,'check_docker_nextcloud_webserver_restarts'),(889,606,NULL,'check_docker_nextcloud_webserver_status'),(831,569,NULL,'80'),(832,569,NULL,'90'),(833,569,NULL,'80'),(834,569,NULL,'90'),(835,570,NULL,'95'),(836,570,NULL,'40'),(837,570,NULL,'98'),(838,570,NULL,'50'),(854,582,NULL,'--lookback 3600'),(853,575,NULL,'cisco'),(843,571,NULL,'/'),(844,571,NULL,'90'),(845,571,NULL,'95'),(846,571,NULL,'/'),(847,571,NULL,'90'),(848,571,NULL,'95'),(849,572,NULL,'300'),(850,572,NULL,'300'),(851,574,NULL,'-v 2 -g'),(852,574,NULL,'-v 2 -g'),(860,590,NULL,'50'),(861,591,NULL,'5'),(862,591,NULL,'10'),(863,592,NULL,'10'),(864,592,NULL,'5'),(865,593,NULL,'80'),(866,593,NULL,'90'),(888,605,NULL,'check_docker_nextcloud_webserver_memory'),(887,604,NULL,'check_docker_nextcloud_webserver_cpu'),(940,659,NULL,'80'),(941,659,NULL,'90'),(942,660,NULL,'VirtualMachines'),(885,602,NULL,'10'),(892,609,NULL,'check_docker_reverent_chandrasekhar_uptime'),(893,610,NULL,'check_docker_reverent_chandrasekhar_restarts'),(894,611,NULL,'check_docker_reverent_chandrasekhar_status'),(895,612,NULL,'check_docker_reverent_chandrasekhar_memory'),(896,613,NULL,'check_docker_reverent_chandrasekhar_cpu'),(897,614,NULL,'check_docker_letsencrypt-companion_status'),(898,615,NULL,'check_docker_letsencrypt-companion_uptime'),(899,616,NULL,'check_docker_letsencrypt-companion_restarts'),(900,617,NULL,'check_docker_letsencrypt-companion_memory'),(901,618,NULL,'check_docker_letsencrypt-companion_cpu'),(902,619,NULL,'check_docker_proxy_status'),(903,620,NULL,'check_docker_proxy_uptime'),(904,621,NULL,'check_docker_proxy_restarts'),(905,622,NULL,'check_docker_proxy_memory'),(906,623,NULL,'check_docker_proxy_cpu'),(907,624,NULL,'check_docker_db_status'),(908,625,NULL,'check_docker_db_uptime'),(909,626,NULL,'check_docker_db_restarts'),(910,627,NULL,'check_docker_db_memory'),(911,628,NULL,'check_docker_db_cpu'),(928,640,NULL,'10'),(929,640,NULL,'5'),(937,658,NULL,'80'),(938,658,NULL,'90'),(939,659,NULL,'VirtualMachines'),(935,657,NULL,'2000000'),(934,657,NULL,'1000000'),(933,657,NULL,'VirtualMachines'),(932,656,NULL,'2'),(931,656,NULL,'1'),(936,658,NULL,'VirtualMachines'),(930,656,NULL,'VirtualMachines'),(943,660,NULL,'100000000000'),(944,660,NULL,'200000000000'),(945,661,NULL,'VirtualMachines'),(946,661,NULL,'1000'),(947,661,NULL,'2000'),(948,662,NULL,'VirtualMachines'),(949,662,NULL,'1000000'),(950,662,NULL,'2000000'),(951,663,NULL,'VirtualMachines'),(952,663,NULL,'100000000000'),(953,663,NULL,'200000000000'),(954,664,NULL,'VirtualMachines'),(955,664,NULL,'1000000'),(956,664,NULL,'2000000'),(957,665,NULL,'VirtualMachines'),(958,665,NULL,'1000'),(959,665,NULL,'2000'),(960,666,NULL,'Containers'),(961,666,NULL,'100000000'),(962,666,NULL,'200000000'),(963,667,NULL,'Containers'),(964,667,NULL,'80'),(965,667,NULL,'90'),(966,668,NULL,'Containers'),(967,668,NULL,'100000000'),(968,668,NULL,'200000000'),(969,669,NULL,'Containers'),(970,669,NULL,'100000000'),(971,669,NULL,'200000000'),(972,670,NULL,'Disks'),(973,670,NULL,'10'),(974,670,NULL,'5'),(975,671,NULL,'Cluster'),(976,671,NULL,'100000000000'),(977,671,NULL,'200000000000'),(978,672,NULL,'Disks'),(979,672,NULL,'100000000000'),(980,672,NULL,'200000000000'),(981,673,NULL,'Disks'),(982,673,NULL,'1'),(983,673,NULL,'2'),(984,674,NULL,'Disks'),(985,674,NULL,'100000000000'),(986,674,NULL,'200000000000'),(987,675,NULL,'Disks'),(988,675,NULL,'100000000000'),(989,675,NULL,'200000000000'),(990,676,NULL,'Cluster'),(991,676,NULL,'80'),(992,676,NULL,'90'),(993,677,NULL,'Cluster'),(994,677,NULL,'100000000000'),(995,677,NULL,'200000000000'),(996,678,NULL,'Cluster'),(1000,680,NULL,'Controllers'),(999,679,NULL,'Controllers'),(1001,681,NULL,'Controllers'),(1002,682,NULL,'Hypervisors'),(1003,682,NULL,'100000000000'),(1004,682,NULL,'200000000000'),(1005,683,NULL,'Hypervisors'),(1006,683,NULL,'100000000000'),(1007,683,NULL,'200000000000'),(1008,684,NULL,'Hypervisors'),(1009,684,NULL,'100000000000'),(1010,684,NULL,'200000000000'),(1011,685,NULL,'Hypervisors'),(1012,685,NULL,'80'),(1013,685,NULL,'90'),(1014,686,NULL,'Hypervisors'),(1015,686,NULL,'80'),(1016,686,NULL,'90'),(1017,687,NULL,'Hypervisors'),(1018,687,NULL,'100000000000'),(1019,687,NULL,'200000000000'),(1020,688,NULL,'Hypervisors'),(1021,688,NULL,'100000000000'),(1022,688,NULL,'200000000000'),(1023,689,NULL,'Hypervisors'),(1024,689,NULL,'100000000000'),(1025,689,NULL,'200000000000'),(1026,690,NULL,'Hypervisors'),(1027,690,NULL,'100000000000'),(1028,690,NULL,'200000000000'),(1029,691,NULL,'Pools'),(1030,691,NULL,'100000000000'),(1031,691,NULL,'200000000000'),(1032,692,NULL,'Pools'),(1033,692,NULL,'100000000000'),(1034,692,NULL,'200000000000'),(1035,693,NULL,'Pools'),(1036,693,NULL,'100000000000'),(1037,693,NULL,'200000000000'),(1038,694,NULL,'Pools'),(1039,694,NULL,'80'),(1040,694,NULL,'90');
/*!40000 ALTER TABLE `nagios_service_check_command_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_contact_group_member`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_contact_group_member`
--

LOCK TABLES `nagios_service_contact_group_member` WRITE;
/*!40000 ALTER TABLE `nagios_service_contact_group_member` DISABLE KEYS */;
INSERT INTO `nagios_service_contact_group_member` VALUES (29,NULL,5,3);
/*!40000 ALTER TABLE `nagios_service_contact_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_contact_member`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contacts which belong to service templates or services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_contact_member`
--

LOCK TABLES `nagios_service_contact_member` WRITE;
/*!40000 ALTER TABLE `nagios_service_contact_member` DISABLE KEYS */;
INSERT INTO `nagios_service_contact_member` VALUES (18,NULL,5,6);
/*!40000 ALTER TABLE `nagios_service_contact_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_custom_object_var`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Custom Object Variables for Service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_custom_object_var`
--

LOCK TABLES `nagios_service_custom_object_var` WRITE;
/*!40000 ALTER TABLE `nagios_service_custom_object_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_service_custom_object_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_group`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios  Service Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_group`
--

LOCK TABLES `nagios_service_group` WRITE;
/*!40000 ALTER TABLE `nagios_service_group` DISABLE KEYS */;
INSERT INTO `nagios_service_group` VALUES (3,'DELL','ServiceGroup Dell',NULL,NULL,NULL),(4,'SERVICES','ServiceGroup Specifics',NULL,NULL,NULL),(5,'VMWARE','ServiceGroup Vmware',NULL,NULL,NULL),(6,'HTTP','ServiceGroup Http',NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_group_member`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_group_member`
--

LOCK TABLES `nagios_service_group_member` WRITE;
/*!40000 ALTER TABLE `nagios_service_group_member` DISABLE KEYS */;
INSERT INTO `nagios_service_group_member` VALUES (4,NULL,9,4),(5,112,NULL,5),(6,111,NULL,5),(10,NULL,12,6);
/*!40000 ALTER TABLE `nagios_service_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_template`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Service Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_template`
--

LOCK TABLES `nagios_service_template` WRITE;
/*!40000 ALTER TABLE `nagios_service_template` DISABLE KEYS */;
INSERT INTO `nagios_service_template` VALUES (5,'GENERIC_SERVICE','Template Generic',NULL,NULL,NULL,4,4,NULL,NULL,1,1,11,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,11,1,1,1,1,1,1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'UPTIME','Template Uptime',NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'GENERIC_GRAPH','Template generic + pnp link',NULL,NULL,NULL,4,4,NULL,NULL,1,1,11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,11,1,1,1,1,NULL,NULL,1,NULL,1,1,1,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL),(12,'HTTP_80','Template Http port 80',NULL,NULL,112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'WINDOWS_SERVICE','Template Windows Service',NULL,NULL,116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'GENERIC_PASSIVE','Template passif for RGMA',NULL,NULL,241,NULL,NULL,NULL,NULL,0,1,11,1,NULL,1,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/grafana/dashboard/script/histou.js?host=$HOSTNAME$&service=$SERVICEDESC$&refresh=30s',NULL,NULL),(13,'TRAFFIC','Template network traffic',NULL,NULL,163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$&view=1',NULL,NULL),(16,'EMC','Template Emc',NULL,NULL,213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nagios_service_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_service_template_inheritance`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios service Template Inheritance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_service_template_inheritance`
--

LOCK TABLES `nagios_service_template_inheritance` WRITE;
/*!40000 ALTER TABLE `nagios_service_template_inheritance` DISABLE KEYS */;
INSERT INTO `nagios_service_template_inheritance` VALUES (206,185,NULL,15,0),(295,266,NULL,15,0),(299,269,NULL,15,0),(281,252,NULL,5,0),(315,285,NULL,5,0),(290,261,NULL,15,0),(41,39,NULL,5,0),(40,38,NULL,5,0),(202,181,NULL,15,0),(201,180,NULL,15,0),(200,179,NULL,15,0),(35,33,NULL,5,0),(208,187,NULL,15,0),(207,186,NULL,15,0),(183,NULL,12,5,0),(597,NULL,6,5,0),(298,268,NULL,5,0),(472,NULL,15,5,0),(314,284,NULL,5,0),(279,250,NULL,5,0),(296,267,NULL,15,0),(308,278,NULL,5,0),(210,189,NULL,6,0),(291,262,NULL,15,0),(280,251,NULL,5,0),(113,111,NULL,5,0),(204,183,NULL,6,0),(311,281,NULL,5,0),(310,280,NULL,5,0),(317,287,NULL,5,0),(316,286,NULL,5,0),(318,288,NULL,5,0),(312,282,NULL,5,0),(313,283,NULL,5,0),(125,NULL,9,5,0),(209,188,NULL,5,0),(203,182,NULL,5,0),(300,270,NULL,15,0),(267,238,NULL,15,0),(114,112,NULL,5,0),(309,279,NULL,5,0),(304,274,NULL,5,0),(303,273,NULL,15,0),(449,NULL,13,5,0),(302,272,NULL,5,0),(646,602,NULL,5,0),(205,184,NULL,13,0),(211,190,NULL,13,0),(306,276,NULL,5,0),(289,260,NULL,15,0),(288,259,NULL,5,0),(287,258,NULL,5,0),(286,257,NULL,5,0),(285,256,NULL,5,0),(284,255,NULL,5,0),(283,254,NULL,5,0),(282,253,NULL,5,0),(294,265,NULL,15,0),(293,264,NULL,15,0),(292,263,NULL,15,0),(276,247,NULL,5,0),(319,289,NULL,5,0),(277,248,NULL,5,0),(275,246,NULL,5,0),(274,245,NULL,5,0),(278,249,NULL,5,0),(270,241,NULL,15,0),(272,243,NULL,5,0),(630,NULL,17,15,0),(269,240,NULL,15,0),(629,586,NULL,17,0),(273,244,NULL,5,0),(245,217,NULL,5,0),(603,223,NULL,15,0),(605,221,NULL,15,0),(248,220,NULL,5,0),(606,222,NULL,15,0),(659,615,NULL,15,0),(604,219,NULL,15,0),(252,224,NULL,5,0),(631,587,NULL,17,0),(632,588,NULL,15,0),(264,235,NULL,15,0),(256,228,NULL,5,0),(257,229,NULL,5,0),(258,230,NULL,5,0),(320,290,NULL,5,0),(321,291,NULL,5,0),(322,292,NULL,5,0),(323,293,NULL,5,0),(324,294,NULL,5,0),(325,295,NULL,5,0),(326,296,NULL,5,0),(327,297,NULL,5,0),(328,298,NULL,5,0),(329,299,NULL,5,0),(330,300,NULL,5,0),(331,301,NULL,5,0),(332,302,NULL,5,0),(333,303,NULL,5,0),(334,304,NULL,5,0),(335,305,NULL,5,0),(336,306,NULL,5,0),(337,307,NULL,5,0),(338,308,NULL,5,0),(339,309,NULL,5,0),(340,310,NULL,5,0),(341,311,NULL,5,0),(342,312,NULL,5,0),(343,313,NULL,5,0),(344,314,NULL,5,0),(345,315,NULL,5,0),(346,316,NULL,5,0),(347,317,NULL,5,0),(348,318,NULL,5,0),(349,319,NULL,5,0),(350,320,NULL,5,0),(352,321,NULL,15,0),(353,322,NULL,5,0),(354,323,NULL,5,0),(355,324,NULL,5,0),(356,325,NULL,5,0),(357,326,NULL,5,0),(358,327,NULL,5,0),(359,328,NULL,5,0),(391,360,NULL,5,0),(361,330,NULL,5,0),(362,331,NULL,5,0),(363,332,NULL,5,0),(364,333,NULL,5,0),(365,334,NULL,5,0),(392,361,NULL,5,0),(367,336,NULL,5,0),(368,337,NULL,5,0),(369,338,NULL,5,0),(390,359,NULL,5,0),(371,340,NULL,5,0),(396,365,NULL,5,0),(388,357,NULL,5,0),(374,343,NULL,5,0),(375,344,NULL,5,0),(397,366,NULL,5,0),(377,346,NULL,5,0),(378,347,NULL,5,0),(395,364,NULL,5,0),(394,363,NULL,5,0),(393,362,NULL,5,0),(382,351,NULL,5,0),(389,358,NULL,5,0),(387,356,NULL,5,0),(386,355,NULL,5,0),(398,367,NULL,5,0),(399,368,NULL,5,0),(400,369,NULL,5,0),(401,370,NULL,5,0),(402,371,NULL,5,0),(403,372,NULL,5,0),(404,373,NULL,5,0),(405,374,NULL,5,0),(406,375,NULL,5,0),(407,376,NULL,5,0),(408,377,NULL,5,0),(409,378,NULL,5,0),(411,NULL,16,5,0),(463,427,NULL,15,0),(464,428,NULL,15,0),(414,381,NULL,16,0),(415,382,NULL,16,0),(416,383,NULL,16,0),(417,384,NULL,16,0),(418,385,NULL,16,0),(462,426,NULL,15,0),(461,425,NULL,15,0),(460,424,NULL,15,0),(422,389,NULL,15,0),(423,390,NULL,15,0),(451,415,NULL,15,0),(465,429,NULL,15,0),(466,430,NULL,15,0),(467,431,NULL,15,0),(468,432,NULL,15,0),(452,416,NULL,15,0),(453,417,NULL,5,0),(454,418,NULL,6,0),(455,419,NULL,13,0),(456,420,NULL,15,0),(457,421,NULL,15,0),(458,422,NULL,15,0),(459,423,NULL,15,0),(469,433,NULL,15,0),(470,434,NULL,15,0),(471,435,NULL,15,0),(440,407,NULL,15,0),(474,436,NULL,15,0),(475,437,NULL,5,0),(476,438,NULL,5,0),(477,439,NULL,5,0),(445,412,NULL,15,0),(446,413,NULL,15,0),(447,414,NULL,15,0),(478,440,NULL,6,0),(624,581,NULL,15,0),(480,442,NULL,5,0),(615,572,NULL,5,0),(482,444,NULL,5,0),(483,445,NULL,5,0),(484,446,NULL,5,0),(594,555,NULL,5,0),(486,448,NULL,5,0),(487,449,NULL,5,0),(488,450,NULL,5,0),(489,451,NULL,5,0),(490,452,NULL,5,0),(613,570,NULL,15,0),(620,577,NULL,15,0),(601,561,NULL,5,0),(494,456,NULL,5,0),(495,457,NULL,5,0),(496,458,NULL,5,0),(497,459,NULL,5,0),(498,460,NULL,5,0),(499,461,NULL,5,0),(500,462,NULL,5,0),(501,463,NULL,5,0),(502,464,NULL,5,0),(503,465,NULL,5,0),(504,466,NULL,5,0),(505,467,NULL,5,0),(506,468,NULL,15,0),(507,469,NULL,15,0),(508,470,NULL,5,0),(509,471,NULL,5,0),(510,472,NULL,5,0),(511,473,NULL,5,0),(512,474,NULL,5,0),(513,475,NULL,5,0),(514,476,NULL,5,0),(515,477,NULL,5,0),(516,478,NULL,5,0),(517,479,NULL,5,0),(518,480,NULL,5,0),(519,481,NULL,5,0),(520,482,NULL,5,0),(581,542,NULL,5,0),(522,484,NULL,5,0),(523,485,NULL,5,0),(524,486,NULL,5,0),(658,614,NULL,15,0),(585,546,NULL,5,0),(655,611,NULL,15,0),(617,574,NULL,13,0),(591,552,NULL,5,0),(596,557,NULL,5,0),(583,544,NULL,5,0),(656,612,NULL,15,0),(587,548,NULL,5,0),(589,550,NULL,5,0),(577,538,NULL,5,0),(536,498,NULL,5,0),(537,499,NULL,5,0),(538,500,NULL,5,0),(539,501,NULL,5,0),(540,502,NULL,5,0),(590,551,NULL,5,0),(588,549,NULL,5,0),(586,547,NULL,5,0),(584,545,NULL,5,0),(595,556,NULL,5,0),(616,573,NULL,6,0),(614,571,NULL,15,0),(602,218,NULL,15,0),(618,575,NULL,5,0),(619,576,NULL,15,0),(612,569,NULL,15,0),(582,543,NULL,5,0),(657,613,NULL,15,0),(600,560,NULL,5,0),(572,533,NULL,5,0),(580,541,NULL,5,0),(576,537,NULL,5,0),(573,534,NULL,6,0),(579,540,NULL,5,0),(574,535,NULL,5,0),(575,536,NULL,5,0),(592,553,NULL,5,0),(593,554,NULL,5,0),(625,582,NULL,15,0),(623,580,NULL,15,0),(621,578,NULL,15,0),(622,579,NULL,15,0),(568,530,NULL,5,0),(569,531,NULL,5,0),(570,532,NULL,5,0),(634,590,NULL,15,0),(635,591,NULL,5,0),(636,593,NULL,15,0),(654,610,NULL,15,0),(653,609,NULL,15,0),(652,608,NULL,15,0),(651,607,NULL,15,0),(650,606,NULL,15,0),(649,605,NULL,15,0),(648,604,NULL,15,0),(687,643,NULL,5,0),(645,592,NULL,15,0),(660,616,NULL,15,0),(661,617,NULL,15,0),(662,618,NULL,15,0),(663,619,NULL,15,0),(664,620,NULL,15,0),(665,621,NULL,15,0),(666,622,NULL,15,0),(667,623,NULL,15,0),(668,624,NULL,15,0),(669,625,NULL,15,0),(670,626,NULL,15,0),(671,627,NULL,15,0),(672,628,NULL,15,0),(682,638,NULL,5,0),(684,640,NULL,5,0),(683,639,NULL,5,0),(695,651,NULL,5,0),(689,645,NULL,5,0),(703,658,NULL,5,0),(700,656,NULL,5,0),(699,655,NULL,5,0),(698,654,NULL,5,0),(690,646,NULL,5,0),(691,647,NULL,5,0),(702,657,NULL,15,0),(697,653,NULL,5,0),(696,652,NULL,5,0),(704,659,NULL,5,0),(705,660,NULL,5,0),(706,661,NULL,15,0),(707,662,NULL,15,0),(708,663,NULL,5,0),(709,664,NULL,15,0),(710,665,NULL,15,0),(711,666,NULL,5,0),(712,667,NULL,5,0),(713,668,NULL,5,0),(714,669,NULL,5,0),(715,670,NULL,15,0),(716,671,NULL,15,0),(717,672,NULL,15,0),(718,673,NULL,15,0),(719,674,NULL,15,0),(720,675,NULL,15,0),(721,676,NULL,15,0),(722,677,NULL,15,0),(723,678,NULL,15,0),(724,679,NULL,15,0),(725,680,NULL,15,0),(726,681,NULL,15,0),(727,682,NULL,15,0),(728,683,NULL,15,0),(729,684,NULL,15,0),(730,685,NULL,15,0),(731,686,NULL,15,0),(732,687,NULL,15,0),(733,688,NULL,15,0),(734,689,NULL,15,0),(735,690,NULL,15,0),(736,691,NULL,15,0),(737,692,NULL,15,0),(738,693,NULL,15,0),(739,694,NULL,15,0);
/*!40000 ALTER TABLE `nagios_service_template_inheritance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_timeperiod`
--

DROP TABLE IF EXISTS `nagios_timeperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_timeperiod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nagios Timeperiods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_timeperiod`
--

LOCK TABLES `nagios_timeperiod` WRITE;
/*!40000 ALTER TABLE `nagios_timeperiod` DISABLE KEYS */;
INSERT INTO `nagios_timeperiod` VALUES (11,'24x7','24 Hours A Day, 7 Days A Week');
/*!40000 ALTER TABLE `nagios_timeperiod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_timeperiod_entry`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Time Period Entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_timeperiod_entry`
--

LOCK TABLES `nagios_timeperiod_entry` WRITE;
/*!40000 ALTER TABLE `nagios_timeperiod_entry` DISABLE KEYS */;
INSERT INTO `nagios_timeperiod_entry` VALUES (1,NULL,'sunday','00:00-24:00'),(2,NULL,'monday','00:00-24:00'),(3,NULL,'tuesday','00:00-24:00'),(4,NULL,'wednesday','00:00-24:00'),(5,NULL,'thursday','00:00-24:00'),(6,NULL,'friday','00:00-24:00'),(7,NULL,'saturday','00:00-24:00'),(8,NULL,'monday','09:00-17:00'),(9,NULL,'tuesday','09:00-17:00'),(10,NULL,'wednesday','09:00-17:00'),(11,NULL,'thursday','09:00-17:00'),(12,NULL,'friday','09:00-17:00'),(13,NULL,'january 1','00:00-00:00'),(14,NULL,'monday -1 may','00:00-00:00'),(15,NULL,'monday 1 september','00:00-00:00'),(16,NULL,'july 4','00:00-00:00'),(17,NULL,'thursday -1 november','00:00-00:00'),(18,NULL,'december 25','00:00-00:00'),(19,NULL,'january 1','00:00-00:00'),(20,NULL,'monday -1 may','00:00-00:00'),(21,NULL,'monday 1 september','00:00-00:00'),(22,NULL,'july 4','00:00-00:00'),(23,NULL,'thursday -1 november','00:00-00:00'),(24,NULL,'december 25','00:00-00:00'),(25,NULL,'sunday','00:00-24:00'),(26,NULL,'monday','00:00-24:00'),(27,NULL,'tuesday','00:00-24:00'),(28,NULL,'wednesday','00:00-24:00'),(29,NULL,'thursday','00:00-24:00'),(30,NULL,'friday','00:00-24:00'),(31,NULL,'saturday','00:00-24:00'),(32,NULL,'sunday','00:00-24:00'),(33,NULL,'monday','00:00-24:00'),(34,NULL,'tuesday','00:00-24:00'),(35,NULL,'wednesday','00:00-24:00'),(36,NULL,'thursday','00:00-24:00'),(37,NULL,'friday','00:00-24:00'),(38,NULL,'saturday','00:00-24:00'),(39,NULL,'monday','09:00-17:00'),(40,NULL,'tuesday','09:00-17:00'),(41,NULL,'wednesday','09:00-17:00'),(42,NULL,'thursday','09:00-17:00'),(43,NULL,'friday','09:00-17:00'),(44,NULL,'january 1','00:00-00:00'),(45,NULL,'monday -1 may','00:00-00:00'),(46,NULL,'monday 1 september','00:00-00:00'),(47,NULL,'july 4','00:00-00:00'),(48,NULL,'thursday -1 november','00:00-00:00'),(49,NULL,'december 25','00:00-00:00'),(50,NULL,'january 1','00:00-00:00'),(51,NULL,'monday -1 may','00:00-00:00'),(52,NULL,'monday 1 september','00:00-00:00'),(53,NULL,'july 4','00:00-00:00'),(54,NULL,'thursday -1 november','00:00-00:00'),(55,NULL,'december 25','00:00-00:00'),(56,NULL,'sunday','00:00-24:00'),(57,NULL,'monday','00:00-24:00'),(58,NULL,'tuesday','00:00-24:00'),(59,NULL,'wednesday','00:00-24:00'),(60,NULL,'thursday','00:00-24:00'),(61,NULL,'friday','00:00-24:00'),(62,NULL,'saturday','00:00-24:00'),(265,11,'sunday','00:00-24:00'),(264,11,'monday','00:00-24:00'),(263,11,'tuesday','00:00-24:00'),(262,11,'wednesday','00:00-24:00'),(261,11,'thursday','00:00-24:00'),(260,11,'friday','00:00-24:00'),(259,11,'saturday','00:00-24:00');
/*!40000 ALTER TABLE `nagios_timeperiod_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_timeperiod_exclude`
--

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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Time Period Excludes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_timeperiod_exclude`
--

LOCK TABLES `nagios_timeperiod_exclude` WRITE;
/*!40000 ALTER TABLE `nagios_timeperiod_exclude` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagios_timeperiod_exclude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (492497698,1),(28606106,1),(441613760,1),(1720051301,1),(870243470,1),(702108421,1),(823766042,1),(422274446,1),(263648232,1),(1915648207,1),(302361342,1),(617102946,1),(1466204130,1),(60829471,1),(1734173596,1),(1987706233,1),(249011468,1),(1496175577,1),(1915706287,1),(1317409294,1),(1105508206,1),(831322301,1),(1143918270,1),(1163037470,1),(981536038,1),(1044787949,1),(974287469,1),(791459635,1),(648125182,1),(1900932230,1),(969400127,1),(1715459471,1),(196669677,1),(1969908833,1),(1186566863,1),(2103252725,1),(391235915,1),(80825841,1),(747831338,1),(2071494830,1),(414826920,1),(1126270771,1),(871221863,1),(199194682,1),(1988129119,1),(773457402,1),(2074130127,1),(332649926,1),(895968206,1),(1696699474,1),(431282348,1),(92774534,1),(1571593217,1),(1706486725,1),(900833683,1),(463546101,1),(862234212,1),(40464539,1),(795131004,1),(619681427,1),(1160798909,1),(1067162689,1),(119151738,1),(919606161,1),(696852254,1),(2126491130,1),(105972945,1),(449500175,1),(966925097,1),(933764547,1),(1933111206,1),(1434137188,1),(2121742314,1),(1363804782,3),(1793163444,1),(773356986,1),(1486822661,1),(2103910936,1),(1986979242,1),(411246207,1),(1511113946,1),(2035962001,1),(166509589,1),(1532927190,1),(948968071,1),(2111740117,2),(876577792,1),(574454426,1),(648544556,1),(280710041,1),(1109100372,1),(1641660244,1),(288110360,1),(351886457,1),(1497038052,1),(352214961,1),(1440693710,1),(1859500703,1),(1630575608,1),(890157969,1),(2117579733,1),(1957761162,1),(12100676,1),(626213642,1),(403609289,1),(363223016,1),(483940922,1),(1560761297,1),(1534127198,1),(1940989038,1),(508223156,5),(997576797,1),(1426826732,1),(113951287,1),(919935458,1),(2146963264,1),(1532294524,1),(1256053442,1),(1649015285,1),(1143363427,1),(2091143952,1),(1058769421,1),(358684642,1),(1342122725,1),(2089909044,1),(543000647,1),(854745940,1),(718389366,1),(1609673238,2),(326468362,1),(2028013339,1),(472065943,1),(98211640,1),(2081927001,1),(1920292904,1),(578310584,1),(244663337,1),(283076576,1),(499021484,1),(1739007367,1),(1780096029,1),(1865718259,1),(629616053,1),(1342199316,1),(215679761,1),(414273175,1),(813398438,1),(2114110080,1),(484030289,1),(397075600,1),(116570416,1),(1518680760,1),(1186724097,1),(1964247944,1),(1349461907,1),(30968559,2),(1187540406,1),(2484405,1),(1915689927,1),(848629125,1),(814168527,1),(626560179,1),(1236230029,1),(431839315,1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','19c3b9c273eb815b','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('localhost.localdomain','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('127.0.0.1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('localhost','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost.localdomain','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','gedadmin','47817a2109ee1a66','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','cacti','19c3b9c273eb815b','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','eonweb','19c3b9c273eb815b','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','lilac','19c3b9c273eb815b','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_passwd` varchar(255) NOT NULL,
  `user_descr` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_limitation` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','21232f297a57a5a743894a0e4a801fc3','default user',0,'',0),(2,1,'system','6539e8d6913c820fb4b36c46e65f25bb','Administrateur Systemes',0,'',0),(3,1,'systemx','6539e8d6913c820fb4b36c46e65f25bb','Administrateur Systemes Unix-Linux',0,'',0),(4,1,'systemw','6539e8d6913c820fb4b36c46e65f25bb','Administrateur Systemes Windows',0,'',0),(5,2,'linux','6539e8d6913c820fb4b36c46e65f25bb','Operateur Systemes Linux',0,'',0),(6,3,'aix','6539e8d6913c820fb4b36c46e65f25bb','Operateur Systemes AIX',0,'',0),(7,4,'opwin','6539e8d6913c820fb4b36c46e65f25bb','Operateur systemes Windows',0,'',0),(8,5,'sgbd','6539e8d6913c820fb4b36c46e65f25bb','Operateur SGBD',0,'',0),(9,6,'exploit','6539e8d6913c820fb4b36c46e65f25bb','Operateur Exploit',0,'',0),(10,0,'manager','6539e8d6913c820fb4b36c46e65f25bb','Utilisateur Manager',0,'',1),(11,1,'alarmpoint','6539e8d6913c820fb4b36c46e65f25bb','Operateur AlarmPoint',0,'',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Language based labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES
(1,'nagios_cgi_desc','physical_html_path','This is the physical path where the HTML files for Nagios are kept on your workstation or server. Nagios assumes that the documentation and images files (used by the CGIs) are stored in subdirectories called docs/ and images/, respectively.'),  
(2,'nagios_cgi_desc','url_html_path','If, when accessing Nagios via a web browser, you point to an URL like http://www.myhost.com/nagios, this value should be /nagios. Basically, its the path portion of the URL that is used to access the Nagios HTML pages.'),  
(3,'nagios_cgi_desc','use_authentication','This option controls whether or not the CGIs will use the authentication and authorization functionality when determining what information and commands users have access to. I would strongly suggest that you use the authentication functionality for the CGIs. If you decide not to use authentication, make sure to remove the command CGI to prevent unauthorized users from issuing commands to Nagios. The CGI will not issue commands to Nagios if authentication is disabled, but I would suggest removing it altogether just to be on the safe side.'),  
(4,'nagios_cgi_desc','default_user_name','Setting this variable will define a default username that can access the CGIs. This allows people within a secure domain (i.e., behind a firewall) to access the CGIs without necessarily having to authenticate to the web server. You may want to use this to avoid having to use basic authentication if you are not using a secure server, as basic authentication transmits passwords in clear text over the Internet.<br />\r\n<br />\r\n<b>Important:</b> Do not define a default username unless you are running a secure web server and are sure that everyone who has access to the CGIs has been authenticated in some manner! If you define this variable, anyone who has not authenticated to the web server will inherit all rights you assign to this user! '),  
(5,'nagios_cgi_desc','authorized_for_system_information','This is a comma-delimited list of names of authenticated users who can view system/process information in the extended information CGI. Users in this list are not automatically authorized to issue system/process commands. If you want users to be able to issue system/process commands as well, you must add them to the authorized_for_system_commands variable.'),  
(6,'nagios_cgi_desc','authorized_for_system_commands','This is a comma-delimited list of names of authenticated users who can issue system/process commands via the command CGI. Users in this list are not automatically authorized to view system/process information. If you want users to be able to view system/process information as well, you must add them to the authorized_for_system_information variable. '),  
(7,'nagios_cgi_desc','authorized_for_configuration_information','This is a comma-delimited list of names of authenticated users who can view configuration information in the configuration CGI. Users in this list can view information on all configured hosts, host groups, services, contacts, contact groups, time periods, and commands.'),  
(8,'nagios_cgi_desc','authorized_for_all_hosts','This is a comma-delimited list of names of authenticated users who can view status and configuration information for all hosts. Users in this list are also automatically authorized to view information for all services. Users in this list are not automatically authorized to issue commands for all hosts or services. If you want users able to issue commands for all hosts and services as well, you must add them to the authorized_for_all_host_commands variable.'),  
(9,'nagios_cgi_desc','authorized_for_all_host_commands','This is a comma-delimited list of names of authenticated users who can issue commands for all hosts via the command CGI. Users in this list are also automatically authorized to issue commands for all services. Users in this list are not automatically authorized to view status or configuration information for all hosts or services. If you want users able to view status and configuration information for all hosts and services as well, you must add them to the authorized_for_all_hosts variable.'),  
(10,'nagios_cgi_desc','authorized_for_all_services','This is a comma-delimited list of names of authenticated users who can view status and configuration information for all services. Users in this list are not automatically authorized to view information for all hosts. Users in this list are not automatically authorized to issue commands for all services. If you want users able to issue commands for all services as well, you must add them to the authorized_for_all_service_commands variable.'),  
(11,'nagios_cgi_desc','authorized_for_all_service_commands','This is a comma-delimited list of names of authenticated users who can issue commands for all services via the command CGI. Users in this list are not automatically authorized to issue commands for all hosts. Users in this list are not automatically authorized to view status or configuration information for all hosts. If you want users able to view status and configuration information for all services as well, you must add them to the authorized_for_all_services variable.'),  
(12,'nagios_cgi_desc','statusmap_background_image','This option allows you to specify an image to be used as a background in the statusmap CGI. It is assumed that the image resides in the HTML images path (i.e. /usr/local/nagios/share/images). This path is automatically determined by appending \"/images\" to the path specified by the physical_html_path directive. Note: The image file can be in GIF, JPEG, PNG, or GD2 format. However, GD2 format (preferably in uncompressed format) is recommended, as it will reduce the CPU load when the CGI generates the map image.'),  
(13,'nagios_cgi_desc','default_statusmap_layout','This option allows you to specify the default layout method used by the statusmap CGI.'),  
(14,'nagios_cgi_desc','statuswrl_include','This option allows you to include your own objects in the generated VRML world. It is assumed that the file resides in the path specified by the physical_html_path directive. Note: This file must be a fully qualified VRML world (i.e. you can view it by itself in a VRML browser).'),  
(15,'nagios_cgi_desc','default_statuswrl_layout','This option allows you to specify the default layout method used by the statuswrl CGI.'),  
(16,'nagios_cgi_desc','refresh_rate','This option allows you to specify the number of seconds between page refreshes for the status, statusmap, and extinfo CGIs.'),  
(17,'nagios_cgi_desc','host_unreachable_sound','These options allow you to specify an audio file that should be played in your browser if there are problems when you are viewing the status CGI. If there are problems, the audio file for the most critical type of problem will be played. The most critical type of problem is on or more unreachable hosts, while the least critical is one or more services in an unknown state (see the order in the example above). Audio files are assumed to be in the media/ subdirectory in your HTML directory (i.e. /usr/local/nagios/share/media).'),  
(18,'nagios_cgi_desc','ping_syntax','This option determines what syntax should be used when attempting to ping a host from the WAP interface (using the statuswml CGI. You must include the full path to the ping binary, along with all required options. The $HOSTADDRESS$ macro is substituted with the address of the host before the command is executed.'),  
(19,'nagios_cgi_desc','escape_html_tags','This option determines whether or not HTML tags in host and service (plugin) output is escaped in the CGIs. If you enable this option, your plugin output will not be able to contain clickable hyperlinks. '),  
(20,'nagios_cgi_desc','lock_author_names','This option allows you to restrict users from changing the author name when submitting comments, acknowledgements, and scheduled downtime from the web interface. If this option is enabled, users will be unable to change the author name associated with the command request. '),  
(21,'nagios_cgi_desc','notes_url_target','This option determines the name of the frame target that notes URLs should be displayed in. Valid options include _blank, _self, _top, _parent, or any other valid target name. '),  
(22,'nagios_cgi_desc','action_url_target','This option determines the name of the frame target that action URLs should be displayed in. Valid options include _blank, _self, _top, _parent, or any other valid target name. '),  
(23,'nagios_cgi_desc','enable_splunk_integration','This option determines whether integration functionality with Splunk is enabled in the web interface. If enabled, you\'ll be presented with \"Splunk It\" links in various places in the CGIs (log file, alert history, host/service detail, etc). Useful if you\'re trying to research why a particular problem occurred.'),  
(24,'nagios_cgi_desc','splunk_url','This option is used to define the base URL to your Splunk interface. This URL is used by the CGIs when creating links if the enable_splunk_integration option is enabled. '),  
(25,'nagios_commands_desc','command_name','This directive is the short name used to identify the command. It is referenced in contact, host, and service definitions, among other places.'),  
(26,'nagios_commands_desc','command_line','This directive is used to define what is actually executed by Nagios when the command is used for service or host checks, notifications, or event handlers. Before the command line is executed, all valid macros are replaced with their respective values. See the documentation on macros for determining when you can use different macros. Note that the command line is not surrounded in quotes. Also, if you want to pass a dollar sign ($) on the command line, you have to escape it with another dollar sign.'),  
(27,'nagios_commands_desc','command_desc','This is a description of the command.'),  
(28,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.'),  
(29,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.'),  
(30,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.'),  
(31,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.'),  
(32,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.'),  
(33,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.'),  
(34,'nagios_contactgroups_desc','contactgroup_name','This directive is a short name used to identify the contact group.'),  
(35,'nagios_contactgroups_desc','alias','This directive is used to define a longer name or description used to identify the contact group.'),  
(36,'nagios_contactgroups_desc','members','This directive is used to define a list of the short names of contacts  that should be included in this group. Multiple contact names should be separated by commas.'),  
(37,'nagios_contacts_desc','contact_name','This directive is used to define a short name used to identify the contact. It is referenced in contact group definitions. Under the right circumstances, the $CONTACTNAME$ macro will contain this value.'),  
(38,'nagios_contacts_desc','alias','This directive is used to define a longer name or description for the contact. Under the rights circumstances, the $CONTACTALIAS$ macro will contain this value.'),  
(39,'nagios_contacts_desc','host_notification_period','This directive is used to specify the short name of the time period during which the contact can be notified about host problems or recoveries. You can think of this as an \"on call\" time for host notifications for the contact. Read the documentation on time periods for more information on how this works and potential problems that may result from improper use.'),  
(40,'nagios_contacts_desc','service_notification_period','This directive is used to specify the short name of the time period during which the contact can be notified about service problems or recoveries. You can think of this as an \"on call\" time for service notifications for the contact. Read the documentation on time periods for more information on how this works and potential problems that may result from improper use.'),  
(41,'nagios_contacts_desc','host_notification_commands','This directive is used to define a list of the short names of the commands used to notify the contact of a host problem or recovery. Multiple notification commands should be separated by commas. All notification commands are executed when the contact needs to be notified. The maximum amount of time that a notification command can run is controlled by the notification_timeout option.'),  
(42,'nagios_contacts_desc','host_notification_options','This directive is used to define the host states for which notifications can be sent out to this contact.'),  
(43,'nagios_contacts_desc','service_notification_options','This directive is used to define the service states for which notifications can be sent out to this contact.'),  
(44,'nagios_contacts_desc','service_notification_commands','This directive is used to define a list of the short names of the commands used to notify the contact of a service problem or recovery. Multiple notification commands should be separated by commas. All notification commands are executed when the contact needs to be notified. The maximum amount of time that a notification command can run is controlled by the notification_timeout option.'),  
(45,'nagios_contacts_desc','email','This directive is used to define an email address for the contact. Depending on how you configure your notification commands, it can be used to send out an alert email to the contact. Under the right circumstances, the $CONTACTEMAIL$ macro will contain this value.'),  
(46,'nagios_contacts_desc','pager','This directive is used to define a pager number for the contact. It can also be an email address to a pager gateway (i.e. pagejoe@pagenet.com). Depending on how you configure your notification commands, it can be used to send out an alert page to the contact. Under the right circumstances, the $CONTACTPAGER$ macro will contact this value.'),  
(47,'nagios_contacts_desc','address','Address directives are used to define additional \"addresses\" for the contact. These addresses can be anything - cell phone numbers, instant messaging addresses, etc. Depending on how you configure your notification commands, they can be used to send out an alert o the contact. Up to six addresses can be defined using these directives (address1 through address6). The $CONTACTADDRESSx$ macro will contain this value.'),  
(48,'nagios_dependency_desc','inherits_parent','This directive indicates whether or not the dependency inherits dependencies of the host that is being depended upon (also referred to as the master host). In other words, if the master host is dependent upon other hosts and any one of those dependencies fail, this dependency will also fail.'),  
(49,'nagios_dependency_desc','host_execution_failure_criteria','This directive is used to specify the criteria that determine when the dependent host should not be actively checked. If the master host is in one of the failure states we specify, the dependent host will not be actively checked. Valid options are a combination of one or more of the following (multiple options are seperated with commas): o = fail on an UP state, d = fail on a DOWN state, u = fail on an UNREACHABLE state, and p = fail on a pending state (e.g. the host has not yet been checked). If you specify n (none) as an option, the execution dependency will never fail and the dependent host will always be actively checked (if other conditions allow for it to be). Example: If you specify u,d in this field, the dependent host will not be actively checked if the master host is in either an UNREACHABLE or DOWN state.'),  
(50,'nagios_dependency_desc','service_execution_failure_criteria','	This directive is used to specify the criteria that determine when the dependent service should not be actively checked. If the master service is in one of the failure states we specify, the dependent service will not be actively checked. Valid options are a combination of one or more of the following (multiple options are seperated with commas): o = fail on an OK state, w = fail on a WARNING state, u = fail on an UNKNOWN state, c = fail on a CRITICAL state, and p = fail on a pending state (e.g. the service has not yet been checked). If you specify n (none) as an option, the execution dependency will never fail and checks of the dependent service will always be actively checked (if other conditions allow for it to be). Example: If you specify o,c,u in this field, the dependent service will not be actively checked if the master service is in either an OK, a CRITICAL, or an UNKNOWN state.'),  
(51,'nagios_dependency_desc','service_notification_failure_criteria','This directive is used to define the criteria that determine when notifications for the dependent service should not be sent out. If the master service is in one of the failure states we specify, notifications for the dependent service will not be sent to contacts. Valid options are a combination of one or more of the following: o = fail on an OK state, w = fail on a WARNING state, u = fail on an UNKNOWN state, c = fail on a CRITICAL state, and p = fail on a pending state (e.g. the service has not yet been checked). If you specify n (none) as an option, the notification dependency will never fail and notifications for the dependent service will always be sent out. Example: If you specify w in this field, the notifications for the dependent service will not be sent out if the master service is in a WARNING state.'),  
(52,'nagios_dependency_desc','host_notification_failure_criteria','This directive is used to define the criteria that determine when notifications for the dependent host should not be sent out. If the master host is in one of the failure states we specify, notifications for the dependent host will not be sent to contacts. Valid options are a combination of one or more of the following: o = fail on an UP state, d = fail on a DOWN state, u = fail on an UNREACHABLE state, and p = fail on a pending state (e.g. the host has not yet been checked). If you specify n (none) as an option, the notification dependency will never fail and notifications for the dependent host will always be sent out. Example: If you specify d in this field, the notifications for the dependent host will not be sent out if the master host is in a DOWN state.'),  
(53,'nagios_escalations_desc','escalation_description','A description of the escalation.'),  
(54,'nagios_escalations_desc','first_notification','This directive is a number that identifies the first notification for which this escalation is effective. For instance, if you set this value to 3, this escalation will only be used if the host is down or unreachable long enough for a third notification to go out.'),  
(55,'nagios_escalations_desc','last_notification','This directive is a number that identifies the last notification for which this escalation is effective. For instance, if you set this value to 5, this escalation will not be used if more than five notifications are sent out for the host. Setting this value to 0 means to keep using this escalation entry forever (no matter how many notifications go out).'),  
(56,'nagios_escalations_desc','escalation_period','This directive is used to specify the short name of the time period during which this escalation is valid. If this directive is not specified, the escalation is considered to be valid during all times.'),  
(57,'nagios_escalations_desc','escalation_options','This directive is used to define the criteria that determine when this host escalation is used. The escalation is used only if the host is in one of the states specified in this directive. If this directive is not specified in a host escalation, the escalation is considered to be valid during all host states. Valid options are a combination of one or more of the following: r = escalate on an UP (recovery) state, d = escalate on a DOWN state, and u = escalate on an UNREACHABLE state. Example: If you specify d in this field, the escalation will only be used if the host is in a DOWN state.'),  
(58,'nagios_escalations_desc','notification_interval','This directive is used to determine the interval at which notifications should be made while this escalation is valid. If you specify a value of 0 for the interval, Nagios will send the first notification when this escalation definition is valid, but will then prevent any more problem notifications from being sent out for the host. Notifications are sent out again until the host recovers. This is useful if you want to stop having notifications sent out after a certain amount of time. Note: If multiple escalation entries for a host overlap for one or more notification ranges, the smallest notification interval from all escalation entries is used'),  
(59,'nagios_hostgroups_desc','hostgroup_name','This directive is used to define a short name used to identify the host group.'),  
(60,'nagios_hostgroups_desc','alias','This directive is used to define is a longer name or description used to identify the host group. It is provided in order to allow you to more easily identify a particular host group.'),  
(61,'nagios_hostgroups_desc','members','This is a list of the short names of hosts that should be included in this group. Multiple host names should be separated by commas.'),  
(62,'nagios_hostgroups_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with any of the hosts in this host group. Multiple contact groups should be separated by commas.'),  
(63,'nagios_hosts_desc','host_name','This directive is used to define a short name used to identify the host. It is used in host group and service definitions to reference this particular host. Hosts can have multiple services (which are monitored) associated with them. When used properly, the $HOSTNAME$ macro will contain this short name.'),  
(64,'nagios_hosts_desc','alias','This directive is used to define a longer name or description used to identify the host. It is provided in order to allow you to more easily identify a particular host. When used properly, the $HOSTALIAS$ macro will contain this alias/description.'),  
(65,'nagios_hosts_desc','address','This directive is used to define the address of the host. Normally, this is an IP address, although it could really be anything you want (so long as it can be used to check the status of the host). You can use a FQDN to identify the host instead of an IP address, but if DNS services are not availble this could cause problems. When used properly, the $HOSTADDRESS$ macro will contain this address. Note: If you do not specify an address directive in a host definition, the name of the host will be used as its address. A word of caution about doing this, however - if DNS fails, most of your service checks will fail because the plugins will be unable to resolve the host name.'),  
(66,'nagios_hosts_desc','check_command','This directive is used to specify the short name of the command that should be used to check if the host is up or down. Typically, this command would try and ping the host to see if it is \"alive\". The command must return a status of OK (0) or Nagios will assume the host is down. If you leave this argument blank, the host will not be checked - Nagios will always assume the host is up. This is useful if you are monitoring printers or other devices that are frequently turned off. The maximum amount of time that the notification command can run is controlled by the host_check_timeout option.'),  
(67,'nagios_hosts_desc','max_check_attempts','This directive is used to define the number of times that Nagios will retry the host check command if it returns any state other than an OK state. Setting this value to 1 will cause Nagios to generate an alert without retrying the host check again. Note: If you do not want to check the status of the host, you must still set this to a minimum value of 1. To bypass the host check, just leave the check_command option blank.'),  
(68,'nagios_hosts_desc','checks_enabled','This directive is used to determine whether or not checks of this host are enabled.'),  
(69,'nagios_hosts_desc','event_handler','This directive is used to specify the short name of the command that should be run whenever a change in the state of the host is detected (i.e. whenever it goes down or recovers). Read the documentation on event handlers for a more detailed explanation of how to write scripts for handling events. The maximum amount of time that the event handler command can run is controlled by the event_handler_timeout option.'),  
(70,'nagios_hosts_desc','event_handler_enabled','This directive is used to determine whether or not the event handler for this host is enabled. Values: 0 = disable host event handler, 1 = enable host event handler.'),  
(71,'nagios_hosts_desc','low_flap_threshold','This directive is used to specify the low state change threshold used in flap detection for this host. If you set this directive to a value of 0, the program-wide value specified by the low_host_flap_threshold directive will be used.'),  
(72,'nagios_hosts_desc','high_flap_threshold','This directive is used to specify the high state change threshold used in flap detection for this host. If you set this directive to a value of 0, the program-wide value specified by the high_host_flap_threshold directive will be used.'),  
(73,'nagios_hosts_desc','flap_detection_enabled','This directive is used to determine whether or not flap detection is enabled for this host.'),  
(74,'nagios_hosts_desc','process_perf_data','This directive is used to determine whether or not the processing of performance data is enabled for this host.'),  
(75,'nagios_hosts_desc','retain_status_information','This directive is used to determine whether or not status-related information about the host is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive. '),  
(76,'nagios_hosts_desc','retain_nonstatus_information','This directive is used to determine whether or not non-status information about the host is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.'),  
(77,'nagios_hosts_desc','notification_interval','This directive is used to define the number of \"time units\" to wait before re-notifying a contact that this server is still down or unreachable. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. If you set this value to 0, Nagios will not re-notify contacts about problems for this host - only one problem notification will be sent out.'),  
(78,'nagios_hosts_desc','notification_period','This directive is used to specify the short name of the time period during which notifications of events for this host can be sent out to contacts. If a host goes down, becomes unreachable, or recoveries during a time which is not covered by the time period, no notifications will be sent out.'),  
(79,'nagios_hosts_desc','notification_options','This directive is used to determine when notifications for the host should be sent out. Valid options are a combination of one or more of the following: d = send notifications on a DOWN state, u = send notifications on an UNREACHABLE state, and r = send notifications on recoveries (OK state). If you specify n (none) as an option, no host notifications will be sent out. Example: If you specify d,r in this field, notifications will only be sent out when the host goes DOWN and when it recovers from a DOWN state.'),  
(80,'nagios_hosts_desc','notifications_enabled','This directive is used to determine whether or not notifications for this host are enabled.'),  
(81,'nagios_hosts_desc','stalking_options','This directive determines which host states \"stalking\" is enabled for.'),  
(82,'nagios_hosts_desc','check_interval','<b>NOTE:</b> Do NOT enable regularly scheduled checks of a host unless you absolutely need to! Host checks are already performed on-demand when necessary, so there are few times when regularly scheduled checks would be needed. Regularly scheduled host checks can negatively impact performance - see the performance tuning tips for more information. This directive is used to define the number of \"time units\" between regularly scheduled checks of the host. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes.'),  
(83,'nagios_hosts_desc','active_checks_enabled','This directive is used to determine whether or not active checks (either regularly scheduled or on-demand) of this host are enabled.'),  
(84,'nagios_hosts_desc','passive_checks_enabled','This directive is used to determine whether or not passive checks are enabled for this host.'),  
(85,'nagios_hosts_desc','obsess_over_host','This directive determines whether or not checks for the host will be \"obsessed\" over using the ochp_command.'),  
(86,'nagios_hosts_desc','check_freshness','This directive is used to determine whether or not freshness checks are enabled for this host.'),  
(87,'nagios_hosts_desc','freshness_threshold','This directive is used to specify the freshness threshold (in seconds) for this host. If you set this directive to a value of 0, Nagios will determine a freshness threshold to use automatically.'),  
(88,'nagios_hosts_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with this host. Multiple contact groups should be separated by commas.'),  
(89,'nagios_hosts_extended_info_desc','notes','This directive is used to define an optional string of notes pertaining to the host. If you specify a note here, you will see the it in the extended information CGI (when you are viewing information about the specified host).'),  
(90,'nagios_hosts_extended_info_desc','notes_url','This variable is used to define an optional URL that can be used to provide more information about the host. If you specify an URL, you will see a link that says \"Extra Host Notes\" in the extended information CGI (when you are viewing information about the specified host). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/). This can be very useful if you want to make detailed information on the host, emergency contact methods, etc. available to other support staff.'),  
(91,'nagios_hosts_extended_info_desc','action_url','	This directive is used to define an optional URL that can be used to provide more actions to be performed on the host. If you specify an URL, you will see a link that says \"Extra Host Actions\" in the extended information CGI (when you are viewing information about the specified host). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/).'),  
(92,'nagios_hosts_extended_info_desc','icon_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be displayed in the status and extended information CGIs. The image will look best if it is 40x40 pixels in size. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).'),  
(93,'nagios_hosts_extended_info_desc','icon_image_alt','This variable is used to define an optional string that is used in the ALT tag of the image specified by the <icon_image> argument. The ALT tag is used in the status, extended information and statusmap CGIs.'),  
(94,'nagios_hosts_extended_info_desc','vrml_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be used as the texture map for the specified host in the statuswrl CGI. Unlike the image you use for the <icon_image> variable, this one should probably not have any transparency. If it does, the host object will look a bit wierd. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).'),  
(95,'nagios_hosts_extended_info_desc','statusmap_image','This variable is used to define the name of an image that should be associated with this host in the statusmap CGI. You can specify a JPEG, PNG, and GIF image if you want, although I would strongly suggest using a GD2 format image, as other image formats will result in a lot of wasted CPU time when the statusmap image is generated. GD2 images can be created from PNG images by using the pngtogd2 utility supplied with Thomas Boutell\'s gd library. The GD2 images should be created in uncompressed format in order to minimize CPU load when the statusmap CGI is generating the network map image. The image will look best if it is 40x40 pixels in size. You can leave these option blank if you are not using the statusmap CGI. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).'),  
(96,'nagios_hosts_extended_info_desc','two_d_coords','This variable is used to define coordinates to use when drawing the host in the statusmap CGI. Coordinates should be given in positive integers, as the correspond to physical pixels in the generated image. The origin for drawing (0,0) is in the upper left hand corner of the image and extends in the positive x direction (to the right) along the top of the image and in the positive y direction (down) along the left hand side of the image. For reference, the size of the icons drawn is usually about 40x40 pixels (text takes a little extra space). The coordinates you specify here are for the upper left hand corner of the host icon that is drawn. Note: Don\'t worry about what the maximum x and y coordinates that you can use are. The CGI will automatically calculate the maximum dimensions of the image it creates based on the largest x and y coordinates you specify.'),  
(97,'nagios_hosts_extended_info_desc','three_d_coords','This variable is used to define coordinates to use when drawing the host in the statuswrl CGI. Coordinates can be positive or negative real numbers. The origin for drawing is (0.0,0.0,0.0). For reference, the size of the host cubes drawn is 0.5 units on each side (text takes a little more space). The coordinates you specify here are used as the center of the host cube.'),  
(98,'nagios_main_desc','config_dir','This is the location on the filesystem where you would like your nagios configuration files to be stored.  The webserver user MUST have write access to this directory and the files within.'),  
(99,'nagios_main_desc','log_file','This variable specifies where Nagios should create its main log file. This should be the first variable that you define in your configuration file, as Nagios will try to write errors that it finds in the rest of your configuration data to this file. If you have log rotation enabled, this file will automatically be rotated every hour, day, week, or month.'),  
(100,'nagios_main_desc','temp_file','This is a temporary file that Nagios periodically creates to use when updating comment data, status data, etc. The file is deleted when it is no longer needed.'),  
(101,'nagios_main_desc','status_file','This is the file that Nagios uses to store the current status of all monitored services. The status of all hosts associated with the service you monitor are also recorded here. This file is used by the CGIs so that current monitoring status can be reported via a web interface. The CGIs must have read access to this file in order to function properly. This file is deleted every time Nagios stops and recreated when it starts.'),  
(102,'nagios_main_desc','status_update_interval','This setting determines how often (in seconds) that Nagios will update status data in the status file. The minimum update interval is five seconds. If you have disabled aggregated status updates (with the aggregate_status_updates option), this option has no effect.'),  
(103,'nagios_main_desc','nagios_user','This is used to set the effective user that the Nagios process should run as. After initial program startup and before starting to monitor anything, Nagios will drop its effective privileges and run as this user. You may specify either a username or a UID. '),  
(104,'nagios_main_desc','nagios_group','This is used to set the effective group that the Nagios process should run as. After initial program startup and before starting to monitor anything, Nagios will drop its effective privileges and run as this group. You may specify either a groupname or a GID.'),  
(105,'nagios_main_desc','enable_notifications','This option determines whether or not Nagios will send out notifications when it initially (re)starts. If this option is disabled, Nagios will not send out notifications for any host or service. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(106,'nagios_main_desc','execute_service_checks','This option determines whether or not Nagios will execute service checks when it initially (re)starts. If this option is disabled, Nagios will not actively execute any service checks and will remain in a sort of \"sleep\" mode (it can still accept passive checks unless you\'ve disabled them). This option is most often used when configuring backup monitoring servers, as described in the documentation on redundancy, or when setting up a distributed monitoring environment. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(107,'nagios_main_desc','accept_passive_service_checks','This option determines whether or not Nagios will accept passive service checks when it initially (re)starts. If this option is disabled, Nagios will not accept any passive service checks. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(108,'nagios_main_desc','enable_event_handlers','This option determines whether or not Nagios will run event handlers when it initially (re)starts. If this option is disabled, Nagios will not run any host or service event handlers. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(109,'nagios_main_desc','log_rotation_method','This is the rotation method that you would like Nagios to use for your log file.'),  
(110,'nagios_main_desc','log_archive_path','This is the directory where Nagios should place log files that have been rotated. This option is ignored if you choose to not use the log rotation functionality.'),  
(111,'nagios_main_desc','check_external_commands','This option determines whether or not Nagios will check the command file for internal commands it should execute. This option must be enabled if you plan on using the command CGI to issue commands via the web interface. Third party programs can also issue commands to Nagios by writing to the command file, provided proper rights to the file have been granted.'),  
(112,'nagios_main_desc','external_command_buffer_slots','This setting is used to tweak the number of items or \'slots\' that the Nagios daemon should allocate to the buffer that holds incoming external commands before they are processed.  As external commands are processed by the daemon, they are removed from the buffer'),  
(113,'nagios_main_desc','command_check_interval','If you specify a number with an \"s\" appended to it (i.e. 30s), this is the number of seconds to wait between external command checks. If you leave off the \"s\", this is the number of \"time units\" to wait between external command checks. Unless you\'ve changed the interval_length value (as defined below) from the default value of 60, this number will mean minutes.<br />\r\n<b>Note:</b> By setting this value to -1, Nagios will check for external commands as often as possible. Each time Nagios checks for external commands it will read and process all commands present in the command file before continuing on with its other duties.'),  
(114,'nagios_main_desc','command_file','This is the file that Nagios will check for external commands to process. The command CGI writes commands to this file. Other third party programs can write to this file if proper file permissions have been granted as outline in here. The external command file is implemented as a named pipe (FIFO), which is created when Nagios starts and removed when it shuts down. If the file exists when Nagios starts, the Nagios process will terminate with an error message.'),  
(115,'nagios_main_desc','lock_file','This option specifies the location of the lock file that Nagios should create when it runs as a daemon (when started with the -d command line argument). This file contains the process id (PID) number of the running Nagios process.'),  
(116,'nagios_main_desc','retain_state_information','This option determines whether or not Nagios will retain state information for hosts and services between program restarts. If you enable this option, you should supply a value for the state_retention_file variable. When enabled, Nagios will save all state information for hosts and service before it shuts down (or restarts) and will read in previously saved state information when it starts up again.'),  
(117,'nagios_main_desc','state_retention_file','This is the file that Nagios will use for storing service and host state information before it shuts down. When Nagios is restarted it will use the information stored in this file for setting the initial states of services and hosts before it starts monitoring anything. This file is deleted after Nagios reads in initial state information when it (re)starts. In order to make Nagios retain state information between program restarts, you must enable the retain_state_information option.'),  
(118,'nagios_main_desc','retention_update_interval','This setting determines how often (in minutes) that Nagios will automatically save retention data during normal operation. If you set this value to 0, Nagios will not save retention data at regular intervals, but it will still save retention data before shutting down or restarting. If you have disabled state retention (with the retain_state_information option), this option has no effect.'),  
(119,'nagios_main_desc','use_retained_program_state','This setting determines whether or not Nagios will set various program-wide state variables based on the values saved in the retention file. Some of these program-wide state variables that are normally saved across program restarts if state retention is enabled include the enable_notifications, enable_flap_detection, enable_event_handlers, execute_service_checks, and accept_passive_service_checks options. If you do not have state retention enabled, this option has no effect.'),  
(120,'nagios_main_desc','use_syslog','This variable determines whether messages are logged to the syslog facility on your local host.'),  
(121,'nagios_main_desc','log_notifications','This variable determines whether or not notification messages are logged. If you have a lot of contacts or regular service failures your log file will grow relatively quickly. Use this option to keep contact notifications from being logged.'),  
(122,'nagios_main_desc','log_service_retries','This variable determines whether or not service check retries are logged. Service check retries occur when a service check results in a non-OK state, but you have configured Nagios to retry the service more than once before responding to the error. Services in this situation are considered to be in \"soft\" states. Logging service check retries is mostly useful when attempting to debug Nagios or test out service event handlers.'),  
(123,'nagios_main_desc','log_host_retries','This variable determines whether or not host check retries are logged. Logging host check retries is mostly useful when attempting to debug Nagios or test out host event handlers.'),  
(124,'nagios_main_desc','log_event_handlers','This variable determines whether or not service and host event handlers are logged. Event handlers are optional commands that can be run whenever a service or hosts changes state. Logging event handlers is most useful when debugging Nagios or first trying out your event handler scripts.'),  
(125,'nagios_main_desc','log_initial_states','This variable determines whether or not Nagios will force all initial host and service states to be logged, even if they result in an OK state. Initial service and host states are normally only logged when there is a problem on the first check. Enabling this option is useful if you are using an application that scans the log file to determine long-term state statistics for services and hosts.'),  
(126,'nagios_main_desc','log_external_commands','This variable determines whether or not Nagios will log external commands that it receives from the external command file. Note: This option does not control whether or not passive service checks (which are a type of external command) get logged. To enable or disable logging of passive checks, use the log_passive_service_checks option.'),  
(127,'nagios_main_desc','log_passive_service_checks','This variable determines whether or not Nagios will log passive service checks that it receives from the external command file. If you are setting up a distributed monitoring environment or plan on handling a large number of passive checks on a regular basis, you may wish to disable this option so your log file doesn\'t get too large.'),  
(128,'nagios_main_desc','global_host_event_handler','This option allows you to specify a host event handler command that is to be run for every host state change. The global event handler is executed immediately prior to the event handler that you have optionally specified in each host definition. The command argument is the short name of a command that you define in your object configuration file. The maximum amount of time that this command can run is controlled by the event_handler_timeout option.'),  
(129,'nagios_main_desc','global_service_event_handler','This option allows you to specify a service event handler command that is to be run for every service state change. The global event handler is executed immediately prior to the event handler that you have optionally specified in each service definition. The command argument is the short name of a command that you define in your object configuration file. The maximum amount of time that this command can run is controlled by the event_handler_timeout option'),  
(130,'nagios_main_desc','sleep_time','This is the number of seconds that Nagios will sleep before checking to see if the next service check in the scheduling queue should be executed. Note that Nagios will only sleep after it \"catches up\" with queued service checks that have fallen behind.'),  
(131,'nagios_main_desc','inter_check_delay_method','This option allows you to control how service checks are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all services out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended unless you are testing the service check parallelization functionality. Using no delay will cause all service checks to be scheduled for execution at the same time. This means that you will generally have large CPU spikes when the services are all executed in parallel. Values are as follows:<br />\r\n* n = Don\'t use any delay - schedule all service checks to run immediately (i.e. at the same time!)<br />\r\n* d = Use a \"dumb\" delay of 1 second between service checks<br />\r\n* s = Use a \"smart\" delay calculation to spread service checks out evenly (default)<br />* x.xx = Use a user-supplied inter-check delay of x.xx seconds'),  
(132,'nagios_main_desc','max_concurrent_checks','This option allows you to specify the maximum number of service checks that can be run in parallel at any given time. Specifying a value of 1 for this variable essentially prevents any service checks from being parallelized. Specifying a value of 0 (the default) does not place any restrictions on the number of concurrent checks. You\'ll have to modify this value based on the system resources you have available on the machine that runs Nagios, as it directly affects the maximum load that will be imposed on the system (processor utilization, memory, etc.).'),  
(133,'nagios_main_desc','service_reaper_frequency','This option allows you to control the frequency in seconds of service \"reaper\" events. \"Reaper\" events process the results from parallelized service checks that have finished executing. These events consitute the core of the monitoring logic in Nagios.'),  
(134,'nagios_main_desc','interval_length','This is the number of seconds per \"unit interval\" used for timing in the scheduling queue, re-notifications, etc. \"Units intervals\" are used in the host configuration file to determine how often to run a service check, how often of re-notify a contact, etc.'),  
(135,'nagios_main_desc','service_interleave_factor','This variable determines how service checks are interleaved. Interleaving allows for a more even distribution of service checks, reduced load on remote hosts, and faster overall detection of host problems. With the introduction of service check parallelization, remote hosts could get bombarded with checks if interleaving was not implemented. This could cause the service checks to fail or return incorrect results if the remote host was overloaded with processing other service check requests. Setting this value to 1 is equivalent to not interleaving the service checks (this is how versions of Nagios previous to 0.0.5 worked). Set this value to s (smart) for automatic calculation of the interleave factor unless you have a specific reason to change it. The best way to understand how interleaving works is to watch the status CGI (detailed view) when Nagios is just starting. You should see that the service check results are spread out as they begin to appear.<br />\r\n* x = A number greater than or equal to 1 that specifies the interleave factor to use. An interleave factor of 1 is equivalent to not interleaving the service checks.<br />\r\n* s = Use a \"smart\" interleave factor calculation (default)<br />'),  
(136,'nagios_main_desc','use_agressive_host_checking','Nagios tries to be smart about how and when it checks the status of hosts. In general, disabling this option will allow Nagios to make some smarter decisions and check hosts a bit faster. Enabling this option will increase the amount of time required to check hosts, but may improve reliability a bit. Unless you have problems with Nagios not recognizing that a host recovered, I would suggest not enabling this option.'),  
(137,'nagios_main_desc','enable_flap_detection','This option determines whether or not Nagios will try and detect hosts and services that are \"flapping\". Flapping occurs when a host or service changes between states too frequently, resulting in a barrage of notifications being sent out. When Nagios detects that a host or service is flapping, it will temporarily suppress notifications for that host/service until it stops flapping. Flap detection is very experimental at this point, so use this feature with caution! Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(138,'nagios_main_desc','low_service_flap_threshold','This option is used to set the low threshold for detection of service flapping.'),  
(139,'nagios_main_desc','high_service_flap_threshold','This option is used to set the low threshold for detection of service flapping.'),  
(140,'nagios_main_desc','low_host_flap_threshold','This option is used to set the low threshold for detection of host flapping.'),  
(141,'nagios_main_desc','high_host_flap_threshold','This option is used to set the low threshold for detection of host flapping.'),  
(142,'nagios_main_desc','soft_state_dependencies','This option determines whether or not Nagios will use soft service state information when checking service dependencies. Normally Nagios will only use the latest hard service state when checking dependencies. If you want it to use the latest state (regardless of whether its a soft or hard state type), enable this option.'),  
(143,'nagios_main_desc','service_check_timeout','This is the maximum number of seconds that Nagios will allow service checks to run. If checks exceed this limit, they are killed and a CRITICAL state is returned. A timeout error will also be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off plugins which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each service check normally finishes executing within this time limit. If a service check runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. '),  
(144,'nagios_main_desc','host_check_timeout','This is the maximum number of seconds that Nagios will allow host checks to run. If checks exceed this limit, they are killed and a CRITICAL state is returned and the host will be assumed to be DOWN. A timeout error will also be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off plugins which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each host check normally finishes executing within this time limit. If a host check runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. '),  
(145,'nagios_main_desc','event_handler_timeout','This is the maximum number of seconds that Nagios will allow event handlers to be run. If an event handler exceeds this time limit it will be killed and a warning will be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off commands which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each event handler command normally finishes executing within this time limit. If an event handler runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. '),  
(146,'nagios_main_desc','notification_timeout','This is the maximum number of seconds that Nagios will allow notification commands to be run. If a notification command exceeds this time limit it will be killed and a warning will be logged.\r\n\r\nThere is often widespread confusion as to what this option really does. It is meant to be used as a last ditch mechanism to kill off commands which are misbehaving and not exiting in a timely manner. It should be set to something high (like 60 seconds or more), so that each notification command finishes executing within this time limit. If a notification command runs longer than this limit, Nagios will kill it off thinking it is a runaway processes. '),  
(147,'nagios_main_desc','ocsp_timeout','This is the maximum number of seconds that Nagios will allow an obsessive compulsive service processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.'),  
(148,'nagios_main_desc','perfdata_timeout','This is the maximum number of seconds that Nagios will allow a host performance data processor command or service performance data processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.'),  
(149,'nagios_main_desc','obsess_over_services','This value determines whether or not Nagios will \"obsess\" over service checks results and run the obsessive compulsive service processor command you define. I know - funny name, but it was all I could think of. This option is useful for performing distributed monitoring. If you\'re not doing distributed monitoring, don\'t enable this option.'),  
(150,'nagios_main_desc','ocsp_command','This option allows you to specify a command to be run after every service check, which can be useful in distributed monitoring. This command is executed after any event handler or notification commands. The command argument is the short name of a command definition that you define in your host configuration file. The maximum amount of time that this command can run is controlled by the ocsp_timeout option.'),  
(151,'nagios_main_desc','process_performance_data','This value determines whether or not Nagios will process host and service check performance data.'),  
(152,'nagios_main_desc','host_perfdata_command','This is the command that will be run to process host performance data.'),  
(153,'nagios_main_desc','service_perfdata_command','This is the command that will be run to process service performance data.'),  
(154,'nagios_main_desc','check_for_orphaned_services','This option allows you to enable or disable checks for orphaned service checks. Orphaned service checks are checks which ahve been executed and have been removed from the event queue, but have not had any results reported in a long time. Since no results have come back in for the service, it is not rescheduled in the event queue. This can cause service checks to stop being executed. Normally it is very rare for this to happen - it might happen if an external user or process killed off the process that was being used to execute a service check. If this option is enabled and Nagios finds that results for a particular service check have not come back, it will log an error message and reschedule the service check. If you start seeing service checks that never seem to get rescheduled, enable this option and see if you notice any log messages about orphaned services.'),  
(155,'nagios_main_desc','check_service_freshness','This option determines whether or not Nagios will periodically check the \"freshness\" of service checks. Enabling this option is useful for helping to ensure that passive service checks are received in a timely manner.'),  
(156,'nagios_main_desc','freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of service check results. If you have disabled service freshness checking (with the check_service_freshness option), this option has no effect.'),  
(157,'nagios_main_desc','date_format','This option allows you to specify what kind of date/time format Nagios should use in the web interface and date/time macros.'),  
(158,'nagios_main_desc','illegal_object_name_chars','This option allows you to specify illegal characters that cannot be used in host names, service descriptions, or names of other object types.'),  
(159,'nagios_main_desc','illegal_macro_output_chars','This option allows you to specify illegal characters that should be stripped from macros before being used in notifications, event handlers, and other commands. This DOES NOT affect macros used in service or host check commands. You can choose to not strip out the characters shown in the example above, but I recommend you do not do this. Some of these characters are interpreted by the shell (i.e. the backtick) and can lead to security problems. The following macros are stripped of the characters you specify: $OUTPUT$, $PERFDATA$ '),  
(160,'nagios_main_desc','admin_email','This is the email address for the administrator of the local machine (i.e. the one that Nagios is running on). This value can be used in notification commands by using the $ADMINEMAIL$ macro.'),  
(161,'nagios_main_desc','admin_pager','This is the pager number (or pager email gateway) for the administrator of the local machine (i.e. the one that Nagios is running on). The pager number/address can be used in notification commands by using the $ADMINPAGER$ macro.'),  
(162,'nagios_main_desc','use_retained_scheduling_info','This setting determines whether or not Nagios will retain scheduling info (next check times) for hosts and services when it restarts. If you are adding a large number (or percentage) of hosts and services, I would recommend disabling this option when you first restart Nagios, as it can adversely skew the spread of initial checks.'),  
(163,'nagios_main_desc','accept_passive_host_checks','This option determines whether or not Nagios will accept passive host checks when it initially (re)starts. If this option is disabled, Nagios will not accept any passive host checks. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(164,'nagios_main_desc','execute_host_checks','This option determines whether or not Nagios will execute on-demand and regularly scheduled host checks when it initially (re)starts. If this option is disabled, Nagios will not actively execute any host checks, although it can still accept passive host checks unless you\'ve disabled them). This option is most often used when configuring backup monitoring servers, as described in the documentation on redundancy, or when setting up a distributed monitoring environment. Note: If you have state retention enabled, Nagios will ignore this setting when it (re)starts and use the last known setting for this option (as stored in the state retention file), unless you disable the use_retained_program_state option. If you want to change this option when state retention is active (and the use_retained_program_state is enabled), you\'ll have to use the appropriate external command or change it via the web interface.'),  
(165,'nagios_main_desc','object_cache_file','This directive is used to specify a file in which a cached copy of object definitions should be stored. The cache file is (re)created every time Nagios is (re)started and is used by the CGIs. It is intended to speed up config file caching in the CGIs and allow you to edit the source object config files while Nagios is running without affecting the output displayed in the CGIs.'),  
(166,'nagios_main_desc','precached_object_file','This directive is used to specify a file in which\n	a pre-processed, pre-cached copy of object definitions should be stored.\n	This file can be used to drastically improve startup times in large/complex\n	Nagios installations.'),  
(167,'nagios_main_desc','retained_host_attribute_mask','These options determine which host \n	 attributes are NOT retained across program restarts. The values for\n	these options are a bitwise AND of values specified by the \"MODATTR_\"\n	definitions in the include/common.h source code file. By default, all host\n	attributes are retained.'),  
(168,'nagios_main_desc','retained_service_attribute_mask','These options determine which service \n	 attributes are NOT retained across program restarts. The values for\n	these options are a bitwise AND of values specified by the \"MODATTR_\"\n	definitions in the include/common.h source code file. By default, all service\n	attributes are retained.'),  
(169,'nagios_main_desc','retained_process_host_attribute_mask','These options determine which\n	process attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service process attributes\n	that can be changed. For example, host checks can be disabled at the program\n	level, while service checks are still enabled. The values for these options\n	are a bitwise AND of values specified by the \"MODATTR_\" definitions in the\n	include/common.h source code file. By default, all process attributes are\n	retained. '),  
(170,'nagios_main_desc','retained_process_service_attribute_mask','These options determine which\n	process attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service process attributes\n	that can be changed. For example, host checks can be disabled at the program\n	level, while service checks are still enabled. The values for these options\n	are a bitwise AND of values specified by the \"MODATTR_\" definitions in the\n	include/common.h source code file. By default, all process attributes are\n	retained. '),  
(171,'nagios_main_desc','retained_contact_host_attribute_mask','These options determine which\n	contact attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service contact attributes\n	that can be changed. The values for these options are a bitwise AND of\n	values specified by the \"MODATTR_\" definitions in the include/common.h\n	source code file. By default, all process attributes are retained. '),  
(172,'nagios_main_desc','retained_contact_service_attribute_mask','These options determine which\n	contact attributes are NOT retained across program restarts. There are two\n	masks because there are often separate host and service contact attributes\n	that can be changed. The values for these options are a bitwise AND of\n	values specified by the \"MODATTR_\" definitions in the include/common.h\n	source code file. By default, all process attributes are retained. '),  
(173,'nagios_main_desc','check_result_reaper_frequency','This option allows you to control the\n	frequency in seconds of check result \"reaper\" events. \"Reaper\" events\n	process the results from host and service checks that have finished\n	executing. These events consitute the core of the monitoring logic in\n	Nagios. '),  
(174,'nagios_main_desc','max_check_result_reaper_time','This option allows you to control the\n	maximum amount of time in seconds that host and service check result\n	\"reaper\" events are allowed to run. \"Reaper\" events process the results from\n	host and service checks that have finished executing. If there are a lot of\n	results to process, reaper events may take a long time to finish, which\n	might delay timely execution of new host and service checks. This variable\n	allows you to limit the amount of time that an individual reaper event will\n	run before it hands control back over to Nagios for other portions of the\n	monitoring logic. '),  
(175,'nagios_main_desc','check_result_path','This options determines which directory Nagios will\n	use to temporarily store host and service check results before they are\n	processed. This directory should not be used to store any other files, as\n	Nagios will periodically clean this directory of old file (see the\n		max_check_result_file_age option for more information).\n	\n	Note: Make sure that only a single instance of Nagios has access to the\n	check result path. If multiple instances of Nagios have their check result\n	path set to the same directory, you will run into problems with check\n	results being processed (incorrectly) by the wrong instance of Nagios! '),  
(176,'nagios_main_desc','max_check_result_file_age','This options determines the maximum age in\n	seconds that Nagios will consider check result files found in the\n	check_result_path directory to be valid. Check result files that are older\n	that this threshold will be deleted by Nagios and the check results they\n	contain will not be processed. By using a value of zero (0) with this\n	option, Nagios will process all check result files - even if they\'re older\n	than your hardware :-). '),  
(177,'nagios_main_desc','translate_passive_host_checks','This option determines whether or not\n	Nagios will translate DOWN/UNREACHABLE passive host check results to their\n	\"correct\" state from the viewpoint of the local Nagios instance. This can be\n	very useful in distributed and failover monitoring installations.'),  
(178,'nagios_main_desc','passive_host_checks_are_soft','This option determines whether or not\n	Nagios will treat passive host checks as HARD states or SOFT states. By\n	default, a passive host check result will put a host into a HARD state type.\n	You can change this behavior by enabling this option. '),  
(179,'nagios_main_desc','enable_predictive_host_dependency_checks','This option determines whether\n	or not Nagios will execute predictive checks of hosts that are being\n	depended upon (as defined in host dependencies) for a particular host when\n	it changes state. Predictive checks help ensure that the dependency logic is\n	as accurate as possible.'),  
(180,'nagios_main_desc','enable_predictive_service_dependency_checks','This option determines\n	whether or not Nagios will execute predictive checks of services that are\n	being depended upon (as defined in service dependencies) for a particular\n	service when it changes state. Predictive checks help ensure that the\n	dependency logic is as accurate as possible.'),  
(181,'nagios_main_desc','cached_host_check_horizon','This option determines the maximum amount of\n	time (in seconds) that the state of a previous host check is considered\n	current. Cached host states (from host checks that were performed more\n		recently than the time specified by this value) can improve host check\n	performance immensely. Too high of a value for this option may result in\n	(temporarily) inaccurate host states, while a low value may result in a\n	performance hit for host checks. Use a value of 0 if you want to disable\n	host check caching.'),  
(182,'nagios_main_desc','cached_service_check_horizon','This option determines the maximum amount\n	of time (in seconds) that the state of a previous service check is\n	considered current. Cached service states (from service checks that were\n		performed more recently than the time specified by this value) can\n	improve service check performance when a lot of service dependencies are\n	used. Too high of a value for this option may result in inaccuracies in the\n	service dependency logic. Use a value of 0 if you want to disable service\n	check caching.'),  
(183,'nagios_main_desc','use_large_installation_tweaks','This option determines whether or not the\n	Nagios daemon will take several shortcuts to improve performance. These\n	shortcuts result in the loss of a few features, but larger installations\n	will likely see a lot of benefit from doing so.'),  
(184,'nagios_main_desc','free_child_process_memory','This option determines whether or not Nagios\n	will free memory in child processes when they are fork()ed off from the main\n	process. By default, Nagios frees memory. However, if the\n	use_large_installation_tweaks option is enabled, it will not. By defining\n	this option in your configuration file, you are able to override things to\n	get the behavior you want.'),  
(185,'nagios_main_desc','child_processes_fork_twice','This option determines whether or not Nagios\n	will fork() child processes twice when it executes host and service checks.\n	By default, Nagios fork()s twice. However, if the\n	use_large_installation_tweaks option is enabled, it will only fork() once.\n	By defining this option in your configuration file, you are able to override\n	things to get the behavior you want. '),  
(186,'nagios_main_desc','enable_environment_macros','This option determines whether or not the\n	Nagios daemon will make all standard macros available as environment\n	variables to your check, notification, event hander, etc. commands. In large\n	Nagios installations this can be problematic because it takes additional\n	memory and (more importantly) CPU to compute the values of all macros and\n	make them available to the environment. '),  
(187,'nagios_main_desc','additional_freshness_latency','This option determines the number of\n	seconds Nagios will add to any host or services freshness threshold it\n	automatically calculates (e.g. those not specified explicity by the user).'),  
(188,'nagios_main_desc','enable_embedded_perl','This setting determines whether or not the embedded\n	Perl interpreter is enabled on a program-wide basis. Nagios must be compiled\n	with support for embedded Perl for this option to have an effect.'),  
(189,'nagios_main_desc','use_embedded_perl_implicitly','This setting determines whether or not the\n	embedded Perl interpreter should be used for Perl plugins/scripts that do\n	not explicitly enable/disable it. Nagios must be compiled with support for\n	embedded Perl for this option to have an effect.'),  
(190,'nagios_main_desc','use_timezone','This option allows you to override the default timezone\n	that this instance of Nagios runs in. Useful if you have multiple instances\n	of Nagios that need to run from the same server, but have different local\n	times associated with them. If not specified, Nagios will use the system\n	configured timezone. '),  
(191,'nagios_main_desc','debug_file','This option determines where Nagios should write debugging\n	information. What (if any) information is written is determined by the\n	debug_level and debug_verbosity options.'),  
(192,'nagios_main_desc','debug_level','This option determines what type of information Nagios\n	should write to the debug_file.'),  
(193,'nagios_main_desc','debug_verbosity','This option determines how much debugging information\n	Nagios should write to the debug_file. '),  
(194,'nagios_main_desc','max_debug_file_size','This option determines the maximum size (in bytes)\n	of the debug file. If the file grows larger than this size, it will be\n	renamed with a .old extension. If a file already exists with a .old\n	extension it will automatically be deleted. This helps ensure your disk\n	space usage doesn\'t get out of control when debugging Nagios. '),  
(195,'nagios_main_desc','service_inter_check_delay_method','This option allows you to control how service checks are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all services out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended unless you are testing the service check parallelization functionality. Using no delay will cause all service checks to be scheduled for execution at the same time. This means that you will generally have large CPU spikes when the services are all executed in parallel. Values are as follows:\r\n\r\n    * n = Don\'t use any delay - schedule all service checks to run immediately (i.e. at the same time!)<br />\r\n- d = Use a \"dumb\" delay of 1 second between service checks<br />\r\n- s = Use a \"smart\" delay calculation to spread service checks out evenly (default)<br />\r\n- x.xx = Use a user-supplied inter-check delay of x.xx seconds<br />'),  
(196,'nagios_main_desc','max_service_check_spread','This option determines the maximum number of minutes from when Nagios starts that all services (that are scheduled to be regularly checked) are checked. This option will automatically adjust the service inter-check delay (if necessary) to ensure that the initial checks of all services occur within the timeframe you specify. In general, this option will not have an affect on service check scheduling if scheduling information is being retained using the use_retained_scheduling_info option.'),  
(197,'nagios_main_desc','host_inter_check_delay_method','This option allows you to control how host checks that are scheduled to be checked on a regular basis are initially \"spread out\" in the event queue. Using a \"smart\" delay calculation (the default) will cause Nagios to calculate an average check interval and spread initial checks of all hosts out over that interval, thereby helping to eliminate CPU load spikes. Using no delay is generally not recommended. Using no delay will cause all host checks to be scheduled for execution at the same time. Values are as follows:<br />\r\n* n = Don\'t use any delay - schedule all host checks to run immediately (i.e. at the same time!)<br />\r\n* d = Use a \"dumb\" delay of 1 second between host checks<br />\r\n* s = Use a \"smart\" delay calculation to spread host checks out evenly (default)<br />\r\n* x.xx = Use a user-supplied inter-check delay of x.xx seconds'),  
(198,'nagios_main_desc','max_host_check_spread','This option determines the maximum number of minutes from when Nagios starts that all hosts (that are scheduled to be regularly checked) are checked. This option will automatically adjust the host inter-check delay (if necessary) to ensure that the initial checks of all hosts occur within the timeframe you specify. In general, this option will not have an affect on host check scheduling if scheduling information is being retained using the use_retained_scheduling_info option. Default value is 30 (minutes).'),  
(199,'nagios_main_desc','auto_reschedule_checks','This option determines whether or not Nagios will attempt to automatically reschedule active host and service checks to \"smooth\" them out over time. This can help to balance the load on the monitoring server, as it will attempt to keep the time between consecutive checks consistent, at the expense of executing checks on a more rigid schedule.<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THIS OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! '),  
(200,'nagios_main_desc','auto_rescheduling_interval','This option determines how often (in seconds) Nagios will attempt to automatically reschedule checks. This option only has an effect if the auto_reschedule_checks option is enabled. Default is 30 seconds.<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THE AUTO-RESCHEDULING OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! '),  
(201,'nagios_main_desc','auto_rescheduling_window','This option determines the \"window\" of time (in seconds) that Nagios will look at when automatically rescheduling checks. Only host and service checks that occur in the next X seconds (determined by this variable) will be rescheduled. This option only has an effect if the auto_reschedule_checks option is enabled. Default is 180 seconds (3 minutes).<br />\r\n<b>WARNING:</b> THIS IS AN EXPERIMENTAL FEATURE AND MAY BE REMOVED IN FUTURE VERSIONS. ENABLING THE AUTO-RESCHEDULING OPTION CAN DEGRADE PERFORMANCE - RATHER THAN INCREASE IT - IF USED IMPROPERLY! '),  
(202,'nagios_main_desc','ochp_timeout','This is the maximum number of seconds that Nagios will allow an obsessive compulsive host processor command to be run. If a command exceeds this time limit it will be killed and a warning will be logged.'),  
(203,'nagios_main_desc','obsess_over_hosts','This value determines whether or not Nagios will \"obsess\" over host checks results and run the obsessive compulsive host processor command you define. I know - funny name, but it was all I could think of. This option is useful for performing distributed monitoring. If you\'re not doing distributed monitoring, don\'t enable this option.'),  
(204,'nagios_main_desc','ochp_command','This option allows you to specify a command to be run after every host check, which can be useful in distributed monitoring. This command is executed after any event handler or notification commands. The command argument is the short name of a command definition that you define in your host configuration file. The maximum amount of time that this command can run is controlled by the ochp_timeout option. This command is only executed if the obsess_over_hosts option is enabled globally and if the obsess_over_host directive in the host definition is enabled.'),  
(205,'nagios_main_desc','check_host_freshness','This option determines whether or not Nagios will periodically check the \"freshness\" of host checks. Enabling this option is useful for helping to ensure that passive host checks are received in a timely manner.'),  
(206,'nagios_main_desc','host_freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of host check results. If you have disabled host freshness checking (with the check_host_freshness option), this option has no effect.'),  
(207,'nagios_main_desc','service_freshness_check_interval','This setting determines how often (in seconds) Nagios will periodically check the \"freshness\" of service check results. If you have disabled service freshness checking (with the check_service_freshness option), this option has no effect.'),  
(208,'nagios_main_desc','use_regexp_matching','This option determines whether or not various directives in your object definitions will be processed as regular expressions.'),  
(209,'nagios_main_desc','use_true_regexp_matching','If you\'ve enabled regular expression matching of various object directives using the use_regexp_matching option, this option will determine when object directives are treated as regular expressions. If this option is disabled (the default), directives will only be treated as regular expressions if the contain a * or ? wildcard character. If this option is enabled, all appropriate directives will be treated as regular expression - be careful when enabling this!'),  
(210,'nagios_main_desc','log_passive_checks','This variable determines whether or not Nagios will log passive host and service checks that it receives from the external command file. If you are setting up a distributed monitoring environment or plan on handling a large number of passive checks on a regular basis, you may wish to disable this option so your log file doesn\'t get too large.'),  
(211,'nagios_main_desc','daemon_dumps_core','This option determines whether or not Nagios is allowed to create a core dump when it runs as a daemon.  Note that it is generally considered bad form to allow this, but it may be useful for debugging purposes.'),  
(212,'nagios_main_desc','host_perfdata_file','This option allows you to specify a file to which host performance data will be written after every host check. Data will be written to the performance file as specified by the host_perfdata_file_template option. Performance data is only written to this file if the process_performance_data option is enabled globally and if the process_perf_data directive in the host definition is enabled.'),  
(213,'nagios_main_desc','service_perfdata_file','This option allows you to specify a file to which service performance data will be written after every service check. Data will be written to the performance file as specified by the service_perfdata_file_template option. Performance data is only written to this file if the process_performance_data option is enabled globally and if the process_perf_data directive in the service definition is enabled.'),  
(214,'nagios_main_desc','host_perfdata_file_template','This option determines what (and how) data is written to the host performance data file. The template may contain macros, special characters (\\t for tab, \\r for carriage return, \\n for newline) and plain text. A newline is automatically added after each write to the performance data file.'),  
(215,'nagios_main_desc','service_perfdata_file_template','This option determines what (and how) data is written to the service performance data file. The template may contain macros, special characters (\\t for tab, \\r for carriage return, \\n for newline) and plain text. A newline is automatically added after each write to the performance data file.\r\n\r\n'),  
(216,'nagios_main_desc','host_perfdata_file_mode','This option determines whether the host performance data file is opened in write or append mode. Unless the file is a named pipe, you will probably want to use the default mode of append.\r\n\r\n    * a = Open file in append mode (default)\r\n    * w = Open file in write mode '),  
(217,'nagios_main_desc','service_perfdata_file_mode','This option determines whether the service performance data file is opened in write or append mode. Unless the file is a named pipe, you will probably want to use the default mode of append.\r\n\r\n    * a = Open file in append mode (default)\r\n    * w = Open file in write mode '),  
(218,'nagios_main_desc','host_perfdata_file_processing_interval','This option allows you to specify the interval (in seconds) at which the host performance data file is processed using the host performance data file processing command. A value of 0 indicates that the performance data file should not be processed at regular intervals.'),  
(219,'nagios_main_desc','service_perfdata_file_processing_interval','This option allows you to specify the interval (in seconds) at which the service performance data file is processed using the service performance data file processing command. A value of 0 indicates that the performance data file should not be processed at regular intervals.'),  
(220,'nagios_main_desc','host_perfdata_file_processing_command','This option allows you to specify the command that should be executed to process the host performance data file. The command argument is the short name of a command definition that you define in your object configuration file. The interval at which this command is executed is determined by the host_perfdata_file_processing_interval directive.'),  
(221,'nagios_main_desc','service_perfdata_file_processing_command','This option allows you to specify the command that should be executed to process the service performance data file. The command argument is the short name of a command definition that you define in your object configuration file. The interval at which this command is executed is determined by the service_perfdata_file_processing_interval directive.'),  
(222,'nagios_main_desc','host_perfdata_file','This directive is used to specify the file where host performance data should be written. An example entry in your main config file might look like this: xpdfile_host_perfdata_file=/usr/local/nagios/var/hostperf.log '),  
(223,'nagios_main_desc','host_perfdata_template','This directive determines how the host performance data is written to the file. The example template definition show below will cause the performance data to be written to the file in tab-delimited format, with one entry per line (\\t, \\r and \\n are interpreted as tab, carriage return, and newline characters respectively).<br />\r\nxpdfile_host_perfdata_template=$TIMET$\\t$HOSTNAME$\\t$OUTPUT$\\t$PERFDATA$'),  
(224,'nagios_main_desc','service_perfdata_file','This directive is used to specify the file where service performance data should be written. An example entry in your main config file might look like this: service_perfdata_file=/usr/local/nagios/var/serviceperf.log '),  
(225,'nagios_main_desc','service_perfdata_template','This directive determines how the service performance data is written to the file. The example template definition show below will cause the performance data to be written to the file in tab-delimited format, with one entry per line (\\t, \\r and \\n are interpreted as tab, carriage return, and newline characters respectively).<br />\r\nxpdfile_service_perfdata_template=$TIMET$\\t$HOSTNAME$\\t$SERVICEDESC$\\t$OUTPUT$\\t$PERFDATA$ '),  
(226,'nagios_main_desc','event_broker_options','Controls what (if any) data gets sent to the event broker.'),  
(227,'nagios_servicegroups_desc','alias','This directive is used to define is a longer name or description used to identify the service group. It is provided in order to allow you to more easily identify a particular service group.'),  
(228,'nagios_servicegroups_desc','servicegroup_name','This directive is used to define a short name used to identify the service group.'),  
(229,'nagios_services_desc','service_description','This directive is used to define the description of the service, which may contain spaces, dashes, and colons (semicolons, apostrophes, and quotation marks should be avoided). No two services associated with the same host can have the same description. Services are uniquely identified with their host_name and service_description directives.'),  
(230,'nagios_services_desc','is_volatile','This directive is used to denote whether the service is \"volatile\". Services are normally not volatile.'),  
(231,'nagios_services_desc','max_check_attempts','This directive is used to define the number of times that Nagios will retry the service check command if it returns any state other than an OK state. Setting this value to 1 will cause Nagios to generate an alert without retrying the service check again.'),  
(232,'nagios_services_desc','normal_check_interval','This directive is used to define the number of \"time units\" to wait before scheduling the next \"regular\" check of the service. \"Regular\" checks are those that occur when the service is in an OK state or when the service is in a non-OK state, but has already been rechecked max_attempts number of times. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. More information on this value can be found in the check scheduling documentation.'),  
(233,'nagios_services_desc','retry_check_interval','This directive is used to define the number of \"time units\" to wait before scheduling a re-check of the service. Services are rescheduled at the retry interval when the have changed to a non-OK state. Once the service has been retried max_attempts times without a change in its status, it will revert to being scheduled at its \"normal\" rate as defined by the check_interval value. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes.'),  
(234,'nagios_services_desc','active_checks_enabled','This directive is used to determine whether or not active checks of this service are enabled. Values: 0 = disable active service checks, 1 = enable active service checks.'),  
(235,'nagios_services_desc','passive_checks_enabled','This directive is used to determine whether or not passive checks of this service are enabled.'),  
(236,'nagios_services_desc','check_period','This directive is used to specify the short name of the time period during which active checks of this service can be made.'),  
(237,'nagios_services_desc','parallelize_check','This directive is used to determine whether or not the service check can be parallelized. By default, all service checks are parallelized. Disabling parallel checks of services can result in serious performance problems. '),  
(238,'nagios_services_desc','check_freshness','This directive is used to determine whether or not freshness checks are enabled for this service.'),  
(239,'nagios_services_desc','freshness_threshold','This directive is used to specify the freshness threshold (in seconds) for this service. If you set this directive to a value of 0, Nagios will determine a freshness threshold to use automatically.'),  
(240,'nagios_services_desc','event_handler_enabled','This directive is used to determine whether or not the event handler for this service is enabled.'),  
(241,'nagios_services_desc','low_flap_threshold','This directive is used to specify the low state change threshold used in flap detection for this service. If you set this directive to a value of 0, the program-wide value specified by the low_service_flap_threshold directive will be used.'),  
(242,'nagios_services_desc','high_flap_threshold','This directive is used to specify the high state change threshold used in flap detection for this service. If you set this directive to a value of 0, the program-wide value specified by the high_service_flap_threshold directive will be used.'),  
(243,'nagios_services_desc','flap_detection_enabled','This directive is used to determine whether or not flap detection is enabled for this service.'),  
(244,'nagios_services_desc','process_perf_data','This directive is used to determine whether or not the processing of performance data is enabled for this service.'),  
(245,'nagios_services_desc','retain_status_information','This directive is used to determine whether or not status-related information about the service is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.'),  
(246,'nagios_services_desc','retain_nonstatus_information','This directive is used to determine whether or not non-status information about the service is retained across program restarts. This is only useful if you have enabled state retention using the retain_state_information directive.'),  
(247,'nagios_services_desc','notification_interval','This directive is used to define the number of \"time units\" to wait before re-notifying a contact that this service is still in a non-OK state. Unless you\'ve changed the interval_length directive from the default value of 60, this number will mean minutes. If you set this value to 0, Nagios will not re-notify contacts about problems for this service - only one problem notification will be sent out, unless there has been a state change.'),  
(248,'nagios_services_desc','notification_period','This directive is used to specify the short name of the time period during which notifications of events for this service can be sent out to contacts. No service notifications will be sent out during times which is not covered by the time period.'),  
(249,'nagios_services_desc','notification_options','This directive is used to determine when notifications for the service should be sent out.'),  
(250,'nagios_services_desc','notifications_enabled','This directive is used to determine whether or not notifications for this service are enabled.'),  
(251,'nagios_services_desc','contact_groups','This is a list of the short names of the contact groups that should be notified whenever there are problems (or recoveries) with this service. Multiple contact groups should be separated by commas.'),  
(252,'nagios_services_desc','stalking_options','This directive determines which service states \"stalking\" is enabled for.'),  
(253,'nagios_services_desc','check_command','The full path and arguments to the command to run for this service\'s checks.  If you leave this as empty, you will be able to select a pre-defined command with arguments later.'),  
(254,'nagios_services_desc','user_check_command','Insert the full command line for your User Defined check command.  Used only if selected User Defined in check command.'),  
(255,'nagios_services_desc','host_name','This directive is used to specify the short name of the service that is linked to this host or hostgroup.'),  
(256,'nagios_services_extended_info_desc','notes','This directive is used to define an optional string of notes pertaining to the service. If you specify a note here, you will see the it in the extended information CGI (when you are viewing information about the specified service).'),  
(257,'nagios_services_extended_info_desc','notes_url','This directive is used to define an optional URL that can be used to provide more information about the service. If you specify an URL, you will see a link that says \"Extra Service Notes\" in the extended information CGI (when you are viewing information about the specified service). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/). This can be very useful if you want to make detailed information on the service, emergency contact methods, etc. available to other support staff.'),  
(258,'nagios_services_extended_info_desc','action_url','	This directive is used to define an optional URL that can be used to provide more actions to be performed on the service. If you specify an URL, you will see a link that says \"Extra Service Actions\" in the extended information CGI (when you are viewing information about the specified service). Any valid URL can be used. If you plan on using relative paths, the base path will the the same as what is used to access the CGIs (i.e. /cgi-bin/nagios/).'),  
(259,'nagios_services_extended_info_desc','icon_image','This variable is used to define the name of a GIF, PNG, or JPG image that should be associated with this host. This image will be displayed in the status and extended information CGIs. The image will look best if it is 40x40 pixels in size. Images for hosts are assumed to be in the logos/ subdirectory in your HTML images directory (i.e. /usr/local/nagios/share/images/logos).'),  
(260,'nagios_services_extended_info_desc','icon_image_alt','This variable is used to define an optional string that is used in the ALT tag of the image specified by the <icon_image> argument. The ALT tag is used in the status, extended information and statusmap CGIs.'),  
(261,'nagios_timeperiods_desc','timeperiod_name','This directives is the short name used to identify the time period.'),  
(262,'nagios_timeperiods_desc','alias','This directive is a longer name or description used to identify the time period.\r\n'),  
(263,'nagios_timeperiods_desc','days','The sunday through saturday directives are comma-delimited lists of time ranges that are \"valid\" times for a particular day of the week. Notice that there are seven different days for which you can define time ranges (Sunday through Saturday). Each time range is in the form of HH:MM-HH:MM, where hours are specified on a 24 hour clock. For example, 00:15-24:00 means 12:15am in the morning for this day until 12:20am midnight (a 23 hour, 45 minute total time range). If you wish to exclude an entire day from the timeperiod, simply leave it blank.'),  
(264,'nagios_timeperiods_desc','timeperiod_weekday_exception','You can specify a weekday by using \"sunday\" through \"saturday\".  You can also provide an exception which is explained in detail at <a href=\"http://nagios.sourceforge.net/docs/3_0/timeperiods.html\">Nagios\' Timeperiod Documentation</a>.'),  
(265,'nagios_timeperiods_desc','timeperiod_value','Each time range is in the form of HH:MM-HH:MM, where hours are specified on a 24 hour clock. For example, 00:15-24:00 means 12:15am in the morning for this day until 12:00am midnight (a 23 hour, 45 minute total time range). If you wish to exclude an entire day from the timeperiod, simply do not include it in the timeperiod definition. Multiple ranges can be provided as long as they are comma-delimited.  You can also provide a blank value to disable this weekday/exception.'),  
(266,'nagios_timeperiods_desc','exclusion','Specify the names of other timeperiod definitions whose time ranges should be excluded from this timeperiod.'),  
(267,'host_template_autodiscovery','autodiscovery_address_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s address.'),  
(268,'host_template_autodiscovery','autodiscovery_hostname_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s hostname.  If the hostname cannot be looked up, the device\'s address will be used instead.'),  
(269,'host_template_autodiscovery','autodiscovery_os_family_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s family of Operating System.  If this is set, the autodiscovery system MUST get back a value from the device.'),  
(270,'host_template_autodiscovery','autodiscovery_os_generation_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s generation of Operating System.  If this is set, the autodiscovery system MUST get back a value from the device.'),  
(271,'host_template_autodiscovery','autodiscovery_os_vendor_filter','Specify a valid PCRE Regex Pattern to match against a discovered device\'s Operating System Vendor.  If this is set, the autodiscovery system MUST get back a value from the device.'),  
(272,'host_template_autodiscovery','autodiscovery_service_filter_name','Specify a valid PCRE Regex Pattern to match against a discovered services name.  If this is set, the autodiscovery system MUST get back a value from the device.'),  
(273,'host_template_autodiscovery','autodiscovery_service_filter_product','Specify a valid PCRE Regex Pattern to match against a discovered services product information..  If this is set, the autodiscovery system MUST get back a value from the device.  A Regex Pattern can also be provided for the version.'),  
(274,'host_template_autodiscovery','autodiscovery_service_filter_extra_information','Specify a valid PCRE Regex Pattern to match against a discovered services extra information.  If this is set, the autodiscovery system MUST get back a value from the device.'),  
(275,'nagios_main_desc','check_for_updates','This option determines whether Nagios will automatically check to see if new updates (releases) are available. It is recommend that you enable this option to ensure that you stay on top of the latest critical patches to Nagios. Nagios is critical to you - make sure you keep it in good shape. Nagios will check once a day for new updates. Data collected by Nagios Enterprises from the update check is processed in accordance with our privacy policy - see <a href=\"http://api.nagios.org\">http://api.nagios.org</a> for details.'),  
(276,'nagios_main_desc','check_for_orphaned_hosts','This option allows you to enable or disable checks for orphaned hoste checks. Orphaned host checks are checks which have been executed and have been removed from the event queue, but have not had any results reported in a long time. Since no results have come back in for the host, it is not rescheduled in the event queue. This can cause host checks to stop being executed. Normally it is very rare for this to happen - it might happen if an external user or process killed off the process that was being used to execute a host check. If this option is enabled and Nagios finds that results for a particular host check have not come back, it will log an error message and reschedule the host check. If you start seeing host checks that never seem to get rescheduled, enable this option and see if you notice any log messages about orphaned hosts.'),  
(277,'nagios_main_desc','bare_update_check','This option deterines what data Nagios will send to api.nagios.org when it checks for updates. By default, Nagios will send information on the current version of Nagios you have installed, as well as an indicator as to whether this was a new installation or not. Nagios Enterprises uses this data to determine the number of users running specific version of Nagios. Enable this option if you do not wish for this information to be sent.'),  
(278,'nagios_main_desc','temp_path','This is path where Nagios can create temp files for service and host check results, etc.'),  
(279,'nagios_cgi_desc','authorized_for_read_only','A comma-delimited list of usernames that have read-only rights in the CGIs. This will block any service or host commands normally shown on the extinfo CGI pages. It will also block comments from being shown to read-only users.'),  
(280,'nagios_cgi_desc','color_transparency_index','These options set the r,g,b values of the background color used the statusmap CGI, so normal browsers that can\'t show real png transparency set the desired color as a background color instead (to make it look pretty). Defaults to white: (R,G,B) = (255,255,255).'),  
(281,'nagios_cgi_desc','result_limit','The number of services being shown in Nagios at the same time.'),  
(282,'nagios_main_desc','log_current_states',' This option determines whether or not Nagios will log host and service current states at the beginning of a newly created log file after log rotation occurs. In Nagios Core 3, current states were always logged after a log rotation. In Nagios Core 4, the default behavior is to log current states after log rotation, but it can be disabled by setting log_current_states=0. In a large installation, disabling the logging of current states after log rotation can save considerable amounts of disk space, especially if the logs are rotated frequently. This risk is that, if logs are aged off and deleted, you may not have sufficient state information to calculate things like availability. <br><br>0 = Disable logging current state after log rotation<br>1 = Enable logging current state after log rotation (default).'),  
(283,'nagios_main_desc','check_workers','This setting specifies how many worker process should be started when Nagios Core starts. Worker processes are used to perform host and service checks. If the number of workers is not specified, a default number of workers is determined based on the number of CPU cores on the system (1.5 workers per core). If not specified, there is always a minimum of 4 workers.'),  
(284,'nagios_main_desc','query_socket','This is the path to the Unix-domain socket used by the <a href=\"http://nagios.sourceforge.net/docs/nagioscore/4/en/whatsnew.html#qh\">query handler</a> interface. The default value is /usr/local/nagios/var/rw/nagios.qh.'),  
(285,'nagios_cgi_desc','nagios_check_command','This is an optional command that the CGIs can use to check the status of the Nagios process. This provides the CGIs (as well as yourself) with some idea of whether or not Nagios is still running. If you do not specify a command to be run, the CGIs will assume that the Nagios process is running. If you do define a process check command, it should follow the same guidelines that are required of standard plugins. If the command returns a non-OK status, the CGIs will think the Nagios process is not running and will refuse to allow you to commit any commands via the command CGI.');
UNLOCK TABLES;

