/*
MySQL Data Transfer
Source Host: localhost
Source Database: pama
Target Host: localhost
Target Database: pama
Date: 2010-7-4 13:00:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for dede_1234aa
-- ----------------------------
CREATE TABLE `dede_1234aa` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `parentid` mediumint(8) NOT NULL default '0',
  `title` varchar(200) default '',
  `url` varchar(500) default NULL,
  `dtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `dede_1234aa` VALUES ('184', '2', 'a', 'aa/201007040441001278565396.doc', '2010-07-04 12:41:00');
INSERT INTO `dede_1234aa` VALUES ('185', '2', 'b', 'aa/201007040441251278651265.doc', '2010-07-04 12:41:25');
