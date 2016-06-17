
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `chat_customgroup`
-- ----------------------------
DROP TABLE IF EXISTS `chat_customgroup`;
CREATE TABLE `chat_customgroup` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default '0',
  `groupName` varchar(250) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `chat_pals`
-- ----------------------------
DROP TABLE IF EXISTS `chat_pals`;
CREATE TABLE `chat_pals` (
  `host_id` int(11) NOT NULL,
  `pals_id` int(11) NOT NULL,
  `pals_name` varchar(60) NOT NULL default '',
  `pals_ico` varchar(255) NOT NULL default '',
  `line_status` tinyint(1) NOT NULL default '0',
  `groupId` int(11) default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `chat_session`
-- ----------------------------
DROP TABLE IF EXISTS `chat_session`;
CREATE TABLE `chat_session` (
  `session_id` int(10) unsigned NOT NULL auto_increment,
  `player_ids` varchar(255) default NULL,
  `page_num` int(6) default NULL,
  `ct_num` int(6) default NULL,
  `init_pagect_position` varchar(255) default NULL,
  `readed_pagect_position` varchar(255) default NULL,
  `group_name` varchar(200) NOT NULL default '',
  `session_code` varchar(6) NOT NULL default '',
  `contact_status` varchar(255) default NULL,
  `video_status` tinyint(1) default '0',
  `from_user_id` int(11) default NULL,
  `video_peerid` varchar(130) default '',
  PRIMARY KEY  (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `chat_transfer_fileinfo`
-- ----------------------------
DROP TABLE IF EXISTS `chat_transfer_fileinfo`;
CREATE TABLE `chat_transfer_fileinfo` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `promoter_id` int(11) default NULL,
  `recipient_id` int(11) default NULL,
  `file_url` varchar(255) default NULL,
  `is_download` tinyint(1) unsigned default '0',
  `upload_time` int(11) default NULL,
  `download_time` int(11) default NULL,
  `old_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `pid_rid` (`promoter_id`,`recipient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `chat_txt`
-- ----------------------------
DROP TABLE IF EXISTS `chat_txt`;
CREATE TABLE `chat_txt` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `multi_chat` tinyint(2) NOT NULL default '0',
  `session_id` int(10) NOT NULL default '0',
  `player_ids` varchar(60) NOT NULL default '',
  `txt_content` text,
  `txt_length` int(6) NOT NULL default '0',
  `txt_pagenum` int(11) NOT NULL default '1',
  `txt_ctnum` int(11) NOT NULL default '1',
  `txtlog_pageview` varchar(60) NOT NULL default '',
  `using` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `chat_users`
-- ----------------------------
DROP TABLE IF EXISTS `chat_users`;
CREATE TABLE `chat_users` (
  `uid` int(11) unsigned NOT NULL auto_increment,
  `u_name` varchar(60) default NULL,
  `u_intro` varchar(255) NOT NULL default '',
  `u_ico` varchar(255) NOT NULL default '',
  `line_status` tinyint(1) NOT NULL default '0',
  `msg_wav` tinyint(1) NOT NULL default '1',
  `last_time` int(11) default '0',
  `im_peerid` varchar(64) default '',
  `online_time` int(11) default '0',
  `acceptStrange` tinyint(1) default '0',
  `addFriends` tinyint(1) default '1',
  `question` varchar(300) default NULL,
  `answer` varchar(300) default NULL,
  `contacted` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
