-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 08, 2017 at 11:26 PM
-- Server version: 5.1.72
-- PHP Version: 5.3.2-1ubuntu4.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `elgg`
--

-- --------------------------------------------------------

--
-- Table structure for table `elgg_access_collections`
--

CREATE TABLE IF NOT EXISTS `elgg_access_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `elgg_access_collections`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_access_collection_membership`
--

CREATE TABLE IF NOT EXISTS `elgg_access_collection_membership` (
  `user_guid` int(11) NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`user_guid`,`access_collection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_access_collection_membership`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_annotations`
--

CREATE TABLE IF NOT EXISTS `elgg_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_annotations`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_api_users`
--

CREATE TABLE IF NOT EXISTS `elgg_api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_guid` bigint(20) unsigned DEFAULT NULL,
  `api_key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) NOT NULL,
  `active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_api_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_config`
--

CREATE TABLE IF NOT EXISTS `elgg_config` (
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `site_guid` int(11) NOT NULL,
  PRIMARY KEY (`name`,`site_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_config`
--

INSERT INTO `elgg_config` (`name`, `value`, `site_guid`) VALUES
('view', 's:7:"default";', 1),
('language', 's:2:"en";', 1),
('default_access', 's:1:"1";', 1);

-- --------------------------------------------------------

--
-- Table structure for table `elgg_datalists`
--

CREATE TABLE IF NOT EXISTS `elgg_datalists` (
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_datalists`
--

INSERT INTO `elgg_datalists` (`name`, `value`) VALUES
('__site_secret__', '65401db620ed1f6d7ffef5c3cc387195'),
('filestore_run_once', '1422248831'),
('plugin_run_once', '1422248831'),
('widget_run_once', '1422248831'),
('installed', '1422248993'),
('path', '/home/student/public_html/elgg/'),
('dataroot', '/home/student/public_html/elgg_data/'),
('default_site', '1'),
('version', '2010030101'),
('simplecache_lastupdate', '1422249078'),
('simplecache_default', '1422249078'),
('admin_registered', '1'),
('first_admin_login', '1422249031');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_entities`
--

CREATE TABLE IF NOT EXISTS `elgg_entities` (
  `guid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` int(11) DEFAULT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `container_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `last_action` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`guid`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`),
  KEY `container_guid` (`container_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `time_updated` (`time_updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `elgg_entities`
--

INSERT INTO `elgg_entities` (`guid`, `type`, `subtype`, `owner_guid`, `site_guid`, `container_guid`, `access_id`, `time_created`, `time_updated`, `last_action`, `enabled`) VALUES
(1, 'site', 0, 0, 0, 0, 2, 1422248993, 1422248993, 0, 'yes'),
(2, 'user', 0, 0, 1, 0, 2, 1422249027, 1422249031, 0, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_entity_relationships`
--

CREATE TABLE IF NOT EXISTS `elgg_entity_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid_one` bigint(20) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_one` (`guid_one`,`relationship`,`guid_two`),
  KEY `relationship` (`relationship`),
  KEY `guid_two` (`guid_two`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `elgg_entity_relationships`
--

INSERT INTO `elgg_entity_relationships` (`id`, `guid_one`, `relationship`, `guid_two`) VALUES
(1, 2, 'member_of_site', 1);

-- --------------------------------------------------------

--
-- Table structure for table `elgg_entity_subtypes`
--

CREATE TABLE IF NOT EXISTS `elgg_entity_subtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`subtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `elgg_entity_subtypes`
--

INSERT INTO `elgg_entity_subtypes` (`id`, `type`, `subtype`, `class`) VALUES
(1, 'object', 'file', 'ElggFile'),
(2, 'object', 'plugin', 'ElggPlugin'),
(3, 'object', 'widget', 'ElggWidget');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_geocode_cache`
--

CREATE TABLE IF NOT EXISTS `elgg_geocode_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(128) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_geocode_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_groups_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_groups_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `name` (`name`(50)),
  KEY `description` (`description`(50)),
  FULLTEXT KEY `name_2` (`name`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_groups_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_hmac_cache`
--

CREATE TABLE IF NOT EXISTS `elgg_hmac_cache` (
  `hmac` varchar(255) NOT NULL,
  `ts` int(11) NOT NULL,
  PRIMARY KEY (`hmac`),
  KEY `ts` (`ts`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elgg_hmac_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_metadata`
--

CREATE TABLE IF NOT EXISTS `elgg_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `elgg_metadata`
--

INSERT INTO `elgg_metadata` (`id`, `entity_guid`, `name_id`, `value_id`, `value_type`, `owner_guid`, `access_id`, `time_created`, `enabled`) VALUES
(1, 1, 1, 2, 'text', 0, 2, 1422248993, 'yes'),
(21, 1, 3, 8, 'text', 0, 2, 1422248993, 'yes'),
(20, 1, 3, 7, 'text', 0, 2, 1422248993, 'yes'),
(19, 1, 3, 6, 'text', 0, 2, 1422248993, 'yes'),
(18, 1, 3, 5, 'text', 0, 2, 1422248993, 'yes'),
(17, 1, 3, 4, 'text', 0, 2, 1422248993, 'yes'),
(22, 1, 3, 9, 'text', 0, 2, 1422248993, 'yes'),
(23, 2, 10, 11, 'text', 2, 2, 1422249027, 'yes'),
(24, 2, 12, 11, 'text', 0, 2, 1422249027, 'yes'),
(25, 2, 13, 14, 'text', 0, 2, 1422249027, 'yes'),
(26, 2, 15, 11, 'text', 2, 2, 1422249027, 'yes'),
(27, 1, 16, 17, 'text', 2, 2, 1422249031, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_metastrings`
--

CREATE TABLE IF NOT EXISTS `elgg_metastrings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `elgg_metastrings`
--

INSERT INTO `elgg_metastrings` (`id`, `string`) VALUES
(1, 'email'),
(2, 'student@student.com'),
(3, 'enabled_plugins'),
(4, 'profile'),
(5, 'logbrowser'),
(6, 'diagnostics'),
(7, 'uservalidationbyemail'),
(8, 'htmlawed'),
(9, 'search'),
(10, 'admin'),
(11, '1'),
(12, 'validated'),
(13, 'validated_method'),
(14, 'first_run'),
(15, 'notification:method:email'),
(16, 'pluginorder'),
(17, 'a:33:{i:10;s:9:"bookmarks";i:20;s:7:"thewire";i:30;s:10:"logbrowser";i:40;s:7:"friends";i:50;s:6:"search";i:60;s:7:"tinymce";i:70;s:5:"pages";i:80;s:14:"riverdashboard";i:90;s:16:"garbagecollector";i:100;s:11:"crontrigger";i:110;s:7:"captcha";i:120;s:6:"zaudio";i:130;s:4:"blog";i:140;s:12:"custom_index";i:150;s:6:"groups";i:160;s:7:"twitter";i:170;s:8:"messages";i:180;s:7:"members";i:190;s:13:"externalpages";i:200;s:12:"messageboard";i:210;s:9:"logrotate";i:220;s:11:"diagnostics";i:230;s:13:"invitefriends";i:240;s:14:"defaultwidgets";i:250;s:8:"htmlawed";i:260;s:7:"profile";i:270;s:5:"embed";i:280;s:4:"file";i:290;s:14:"twitterservice";i:300;s:15:"reportedcontent";i:310;s:21:"uservalidationbyemail";i:320;s:10:"categories";i:330;s:13:"notifications";}');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_objects_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_objects_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_objects_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_private_settings`
--

CREATE TABLE IF NOT EXISTS `elgg_private_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_guid` (`entity_guid`,`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(50))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_private_settings`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_river`
--

CREATE TABLE IF NOT EXISTS `elgg_river` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL,
  `subtype` varchar(32) NOT NULL,
  `action_type` varchar(32) NOT NULL,
  `access_id` int(11) NOT NULL,
  `view` text NOT NULL,
  `subject_guid` int(11) NOT NULL,
  `object_guid` int(11) NOT NULL,
  `annotation_id` int(11) NOT NULL,
  `posted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `action_type` (`action_type`),
  KEY `access_id` (`access_id`),
  KEY `subject_guid` (`subject_guid`),
  KEY `object_guid` (`object_guid`),
  KEY `annotation_id` (`annotation_id`),
  KEY `posted` (`posted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_river`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_sites_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_sites_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `url` (`url`),
  FULLTEXT KEY `name` (`name`,`description`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_sites_entity`
--

INSERT INTO `elgg_sites_entity` (`guid`, `name`, `description`, `url`) VALUES
(1, 'New Elgg site', '', 'http://localhost/elgg/');

-- --------------------------------------------------------

--
-- Table structure for table `elgg_system_log`
--

CREATE TABLE IF NOT EXISTS `elgg_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_class` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_subtype` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `performed_by_guid` int(11) NOT NULL,
  `owner_guid` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `time_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_class` (`object_class`),
  KEY `object_type` (`object_type`),
  KEY `object_subtype` (`object_subtype`),
  KEY `event` (`event`),
  KEY `performed_by_guid` (`performed_by_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `river_key` (`object_type`,`object_subtype`,`event`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `elgg_system_log`
--

INSERT INTO `elgg_system_log` (`id`, `object_id`, `object_class`, `object_type`, `object_subtype`, `event`, `performed_by_guid`, `owner_guid`, `access_id`, `enabled`, `time_created`) VALUES
(1, 1, 'ElggMetadata', 'metadata', 'email', 'create', 0, 0, 2, 'yes', 1422248993),
(2, 2, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(3, 2, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(4, 3, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(5, 4, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(6, 3, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(7, 4, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(8, 5, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(9, 6, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(10, 7, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(11, 6, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(12, 5, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(13, 7, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(14, 8, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(15, 9, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(16, 10, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(17, 11, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(18, 10, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(19, 9, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(20, 8, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(21, 11, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(22, 12, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(23, 13, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(24, 14, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(25, 15, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(26, 16, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(27, 15, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(28, 14, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(29, 13, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(30, 12, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(31, 16, 'ElggMetadata', 'metadata', 'enabled_plugins', 'delete', 0, 0, 2, 'yes', 1422248993),
(32, 17, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(33, 18, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(34, 19, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(35, 20, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(36, 21, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(37, 22, 'ElggMetadata', 'metadata', 'enabled_plugins', 'create', 0, 0, 2, 'yes', 1422248993),
(38, 1, 'ElggRelationship', 'relationship', 'member_of_site', 'create', 0, 0, 2, 'yes', 1422249027),
(39, 2, 'ElggUser', 'user', '', 'create', 0, 0, 2, 'yes', 1422249027),
(40, 23, 'ElggMetadata', 'metadata', 'admin', 'create', 0, 0, 2, 'yes', 1422249027),
(41, 24, 'ElggMetadata', 'metadata', 'validated', 'create', 0, 0, 2, 'yes', 1422249027),
(42, 25, 'ElggMetadata', 'metadata', 'validated_method', 'create', 0, 0, 2, 'yes', 1422249027),
(43, 26, 'ElggMetadata', 'metadata', 'notification:method:email', 'create', 0, 0, 2, 'yes', 1422249027),
(44, 2, 'ElggUser', 'user', '', 'update', 2, 0, 2, 'yes', 1422249031),
(45, 2, 'ElggUser', 'user', '', 'login', 2, 0, 2, 'yes', 1422249031),
(46, 27, 'ElggMetadata', 'metadata', 'pluginorder', 'create', 2, 0, 2, 'yes', 1422249031);

-- --------------------------------------------------------

--
-- Table structure for table `elgg_users_apisessions`
--

CREATE TABLE IF NOT EXISTS `elgg_users_apisessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_guid` (`user_guid`,`site_guid`),
  KEY `token` (`token`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elgg_users_apisessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `elgg_users_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_users_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(8) NOT NULL DEFAULT '',
  `email` text NOT NULL,
  `language` varchar(6) NOT NULL DEFAULT '',
  `code` varchar(32) NOT NULL DEFAULT '',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `last_action` int(11) NOT NULL DEFAULT '0',
  `prev_last_action` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `prev_last_login` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `email` (`email`(50)),
  KEY `code` (`code`),
  KEY `last_action` (`last_action`),
  KEY `last_login` (`last_login`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `name_2` (`name`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_users_entity`
--

INSERT INTO `elgg_users_entity` (`guid`, `name`, `username`, `password`, `salt`, `email`, `language`, `code`, `banned`, `last_action`, `prev_last_action`, `last_login`, `prev_last_login`) VALUES
(2, 'CS5331 Student', 'student', 'c003719746906e5a419754ba98ebb251', 'c76cf867', 'student@student.com', '', '', 'no', 1422249086, 1422249086, 1422249031, 0);

-- --------------------------------------------------------

--
-- Table structure for table `elgg_users_sessions`
--

CREATE TABLE IF NOT EXISTS `elgg_users_sessions` (
  `session` varchar(255) NOT NULL,
  `ts` int(11) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob,
  PRIMARY KEY (`session`),
  KEY `ts` (`ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elgg_users_sessions`
--

INSERT INTO `elgg_users_sessions` (`session`, `ts`, `data`) VALUES
('rm154nl3hf498eh53nrj75nh17', 1422249027, 0x5f5f656c67675f66696e6765727072696e747c733a33323a223430633635623161306332663332333766386466613563616234616430383866223b5f5f656c67675f73657373696f6e7c733a33323a223563396133363036323134323764303661303331313962643466343731633036223b6d73677c613a303a7b7d766965777c733a373a2264656661756c74223b),
('jmsajcfg07drbpd7ep9sdu5d05', 1422249086, 0x5f5f656c67675f66696e6765727072696e747c733a33323a223430633635623161306332663332333766386466613563616234616430383866223b5f5f656c67675f73657373696f6e7c733a33323a223563396133363036323134323764303661303331313962643466343731633036223b6d73677c613a303a7b7d766965777c733a373a2264656661756c74223b757365727c4f3a383a22456c676755736572223a373a7b733a31333a22002a0061747472696275746573223b613a32343a7b733a343a2267756964223b733a313a2232223b733a343a2274797065223b733a343a2275736572223b733a373a2273756274797065223b733a313a2230223b733a31303a226f776e65725f67756964223b733a313a2230223b733a31343a22636f6e7461696e65725f67756964223b733a313a2230223b733a393a22736974655f67756964223b733a313a2231223b733a393a226163636573735f6964223b733a313a2232223b733a31323a2274696d655f63726561746564223b733a31303a2231343232323439303237223b733a31323a2274696d655f75706461746564223b733a31303a2231343232323439303331223b733a373a22656e61626c6564223b733a333a22796573223b733a31323a227461626c65735f73706c6974223b693a323b733a31333a227461626c65735f6c6f61646564223b693a323b733a343a226e616d65223b733a31343a224353353333312053747564656e74223b733a383a22757365726e616d65223b733a373a2273747564656e74223b733a383a2270617373776f7264223b733a33323a226330303337313937343639303665356134313937353462613938656262323531223b733a343a2273616c74223b733a383a226337366366383637223b733a353a22656d61696c223b733a31393a2273747564656e744073747564656e742e636f6d223b733a383a226c616e6775616765223b733a303a22223b733a343a22636f6465223b733a303a22223b733a363a2262616e6e6564223b733a323a226e6f223b733a31313a226c6173745f616374696f6e223b733a31303a2231343232323439303836223b733a31363a22707265765f6c6173745f616374696f6e223b733a31303a2231343232323439303833223b733a31303a226c6173745f6c6f67696e223b733a31303a2231343232323439303331223b733a31353a22707265765f6c6173745f6c6f67696e223b733a313a2230223b7d733a31353a22002a0075726c5f6f76657272696465223b4e3b733a31363a22002a0069636f6e5f6f76657272696465223b4e3b733a31363a22002a0074656d705f6d65746164617461223b613a303a7b7d733a31393a22002a0074656d705f616e6e6f746174696f6e73223b613a303a7b7d733a31313a22002a00766f6c6174696c65223b613a303a7b7d733a31373a2200456c6767456e746974790076616c6964223b623a303b7d677569647c733a313a2232223b69647c733a313a2232223b757365726e616d657c733a373a2273747564656e74223b6e616d657c733a31343a224353353333312053747564656e74223b),
('ek4g9pfle90evl6auesnu030o5', 1484383292, 0x5f5f656c67675f66696e6765727072696e747c733a33323a223430633635623161306332663332333766386466613563616234616430383866223b5f5f656c67675f73657373696f6e7c733a33323a223462646539356261396438353231386337343261633631373337666564343635223b766965777c733a373a2264656661756c74223b6d73677c613a303a7b7d),
('6bblsnbpn530qodatj2drgkrb1', 1485067213, 0x5f5f656c67675f66696e6765727072696e747c733a33323a223430633635623161306332663332333766386466613563616234616430383866223b5f5f656c67675f73657373696f6e7c733a33323a223633373863616530333532656430356263616638326539333161663063343563223b766965777c733a373a2264656661756c74223b6d73677c613a303a7b7d);
