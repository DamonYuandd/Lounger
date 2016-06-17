-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad`
--

DROP TABLE IF EXISTS `ecs_ad`;
CREATE TABLE `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL auto_increment,
  `position_id` smallint unsigned NOT NULL default '0',
  `media_type` tinyint(3) unsigned NOT NULL default '0',
  `ad_name` varchar(60) NOT NULL default '',
  `ad_link` varchar(255) NOT NULL default '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL default '0',
  `end_time` int(11) NOT NULL default '0',
  `link_man` varchar(60) NOT NULL default '',
  `link_email` varchar(60) NOT NULL default '',
  `link_phone` varchar(60) NOT NULL default '',
  `click_count` mediumint(8) unsigned NOT NULL default '0',
  `enabled` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad_position`
--

DROP TABLE IF EXISTS `ecs_ad_position`;
CREATE TABLE `ecs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL auto_increment,
  `position_name` varchar(60) NOT NULL default '',
  `ad_width` smallint(5) unsigned NOT NULL default '0',
  `ad_height` smallint(5) unsigned NOT NULL default '0',
  `position_desc` varchar(255) NOT NULL default '',
  `position_style` text NOT NULL,
  PRIMARY KEY  (`position_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_action`
--

DROP TABLE IF EXISTS `ecs_admin_action`;
CREATE TABLE `ecs_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL auto_increment,
  `parent_id` tinyint(3) unsigned NOT NULL default '0',
  `action_code` varchar(20) NOT NULL default '',
  `relevance` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`action_id`),
  KEY `parent_id` (`parent_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_log`
--

DROP TABLE IF EXISTS `ecs_admin_log`;
CREATE TABLE `ecs_admin_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_time` int(10) unsigned NOT NULL default '0',
  `user_id` tinyint(3) unsigned NOT NULL default '0',
  `log_info` varchar(255) NOT NULL default '',
  `ip_address` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`user_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_message`
--

DROP TABLE IF EXISTS `ecs_admin_message`;
CREATE TABLE `ecs_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL auto_increment,
  `sender_id` tinyint(3) unsigned NOT NULL default '0',
  `receiver_id` tinyint(3) unsigned NOT NULL default '0',
  `sent_time` int(11) unsigned NOT NULL default '0',
  `read_time` int(11) unsigned NOT NULL default '0',
  `readed` tinyint(1) unsigned NOT NULL default '0',
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_user`
--

DROP TABLE IF EXISTS `ecs_admin_user`;
CREATE TABLE `ecs_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL auto_increment,
  `user_name` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `ec_salt` VARCHAR( 10 )  NULL,
  `add_time` int(11) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  `last_ip` varchar(15) NOT NULL default '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL default '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned default '0',
  `todolist` LONGTEXT NULL,
  `role_id` smallint(5) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `agency_id` (`agency_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_adsense`
--

DROP TABLE IF EXISTS `ecs_adsense`;
CREATE TABLE `ecs_adsense` (
  `from_ad` smallint(5) NOT NULL default '0',
  `referer` varchar(255) NOT NULL default '',
  `clicks` int(10) unsigned NOT NULL default '0',
  KEY `from_ad` (`from_ad`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_area_region`
--

DROP TABLE IF EXISTS `ecs_area_region`;
CREATE TABLE `ecs_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL default '0',
  `region_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`shipping_area_id`,`region_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_article`
--

DROP TABLE IF EXISTS `ecs_article`;
CREATE TABLE `ecs_article` (
  `article_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL default '',
  `author_email` varchar(60) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `article_type` tinyint(1) unsigned NOT NULL default '2',
  `is_open` tinyint(1) unsigned NOT NULL default '1',
  `add_time` int(10) unsigned NOT NULL default '0',
  `file_url` varchar(255) NOT NULL default '',
  `open_type` tinyint(1) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`article_id`),
  KEY `cat_id` (`cat_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_article_cat`
--

DROP TABLE IF EXISTS `ecs_article_cat`;
CREATE TABLE `ecs_article_cat` (
  `cat_id` smallint(5) NOT NULL auto_increment,
  `cat_name` varchar(255) NOT NULL default '',
  `cat_type` tinyint(1) unsigned NOT NULL default '1',
  `keywords` varchar(255) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `sort_order` tinyint(3) unsigned NOT NULL default '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL default '0',
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_attribute`
--

DROP TABLE IF EXISTS `ecs_attribute`;
CREATE TABLE `ecs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  `attr_name` varchar(60) NOT NULL default '',
  `attr_input_type` tinyint(1) unsigned NOT NULL default '1',
  `attr_type` tinyint(1) unsigned NOT NULL default '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `is_linked` tinyint(1) unsigned NOT NULL default '0',
  `attr_group` tinyint( 1 ) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (`attr_id`),
  KEY `cat_id` (`cat_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_bonus_type`
--

DROP TABLE IF EXISTS `ecs_bonus_type`;
CREATE TABLE `ecs_bonus_type` (
  `type_id` smallint unsigned NOT NULL auto_increment,
  `type_name` varchar(60) NOT NULL default '',
  `type_money` decimal(10,2) NOT NULL default '0.00',
  `send_type` tinyint(3) unsigned NOT NULL default '0',
  `min_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `send_start_date` int(11) NOT NULL default '0',
  `send_end_date` int(11) NOT NULL default '0',
  `use_start_date` int(11) NOT NULL default '0',
  `use_end_date` int(11) NOT NULL default '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`type_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_booking_goods`
--

DROP TABLE IF EXISTS `ecs_booking_goods`;
CREATE TABLE `ecs_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `email` varchar(60) NOT NULL default '',
  `link_man` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_desc` varchar(255) NOT NULL default '',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `booking_time` int(10) unsigned NOT NULL default '0',
  `is_dispose` tinyint(1) unsigned NOT NULL default '0',
  `dispose_user` varchar(30) NOT NULL default '',
  `dispose_time` int(10) unsigned NOT NULL default '0',
  `dispose_note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `user_id` (`user_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_brand`
--

DROP TABLE IF EXISTS `ecs_brand`;
CREATE TABLE `ecs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL auto_increment,
  `brand_name` varchar(60) NOT NULL default '',
  `brand_logo` varchar(80) NOT NULL default '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL default '',
  `sort_order` tinyint(3) unsigned NOT NULL default '50',
  `is_show` tinyint( 1 ) unsigned NOT NULL default '1',
  PRIMARY KEY  (`brand_id`),
  KEY `is_show` (`is_show`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_card`
--

DROP TABLE IF EXISTS `ecs_card`;
CREATE TABLE `ecs_card` (
  `card_id` tinyint(3) unsigned NOT NULL auto_increment,
  `card_name` varchar(120) NOT NULL default '',
  `card_img` varchar(255) NOT NULL default '',
  `card_fee` decimal(6,2) unsigned NOT NULL default '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL default '0.00',
  `card_desc` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`card_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_cart`
--

DROP TABLE IF EXISTS `ecs_cart`;
CREATE TABLE `ecs_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) binary NOT NULL default '',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_sn` varchar(60) NOT NULL default '',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(120) NOT NULL default '',
  `market_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `goods_price` decimal(10,2) NOT NULL default '0.00',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL default '0',
  `extension_code` varchar(30) NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `rec_type` tinyint(1) unsigned NOT NULL default '0',
  `is_gift` smallint unsigned NOT NULL default '0',
  `is_shipping` tinyint(1) unsigned NOT NULL default '0',
  `can_handsel` tinyint(3) unsigned NOT NULL default '0',
  `goods_attr_id` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `session_id` (`session_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_category`
--

DROP TABLE IF EXISTS `ecs_category`;
CREATE TABLE `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_name` varchar(90) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` tinyint(1) unsigned NOT NULL default '50',
  `template_file` varchar(50) NOT NULL default '',
  `measure_unit` varchar(15) NOT NULL default '',
  `show_in_nav` tinyint(1) NOT NULL default '0',
  `style` varchar( 150 ) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL default '1',
  `grade` tinyint(4) NOT NULL default '0',
  `filter_attr` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `parent_id` (`parent_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_collect_goods`
--

DROP TABLE IF EXISTS `ecs_collect_goods`;
CREATE TABLE `ecs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `add_time` int(11) unsigned NOT NULL default '0',
  `is_attention` TINYINT( 1 ) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_comment`
--

DROP TABLE IF EXISTS `ecs_comment`;
CREATE TABLE `ecs_comment` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `comment_type` tinyint(3) unsigned NOT NULL default '0',
  `id_value` mediumint(8) unsigned NOT NULL default '0',
  `email` varchar(60) NOT NULL default '',
  `user_name` varchar(60) NOT NULL default '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_crons`
--

DROP TABLE IF EXISTS `ecs_crons`;
CREATE TABLE `ecs_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL auto_increment,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL default '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL default '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL default '1',
  `run_once` tinyint(1) NOT NULL default '0',
  `allow_ip` varchar(100) NOT NULL default '',
  `alow_files` varchar(255) NOT NULL,
  PRIMARY KEY  (`cron_id`),
  KEY `nextime` (`nextime`),
  KEY `enable` (`enable`),
  KEY `cron_code` (`cron_code`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_error_log`
--

DROP TABLE IF EXISTS `ecs_error_log`;
CREATE TABLE `ecs_error_log` (
  `id` int(10) NOT NULL auto_increment,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `time` (`time`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_feedback`
--

DROP TABLE IF EXISTS `ecs_feedback`;
CREATE TABLE `ecs_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(60) NOT NULL default '',
  `user_email` varchar(60) NOT NULL default '',
  `msg_title` varchar(200) NOT NULL default '',
  `msg_type` tinyint(1) unsigned NOT NULL default '0',
  `msg_status` tinyint( 1 ) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL default '0',
  `message_img` varchar(255) NOT NULL default '0',
  `order_id` int(11) unsigned NOT NULL default '0',
  `msg_area` TINYINT(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msg_id`),
  KEY `user_id` (`user_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_friend_link`
--

DROP TABLE IF EXISTS `ecs_friend_link`;
CREATE TABLE `ecs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL auto_increment,
  `link_name` varchar(255) NOT NULL default '',
  `link_url` varchar(255) NOT NULL default '',
  `link_logo` varchar(255) NOT NULL default '',
  `show_order` tinyint(3) unsigned NOT NULL default '50',
  PRIMARY KEY  (`link_id`),
  KEY `show_order` (`show_order`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods`
--

DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  `goods_sn` varchar(60) NOT NULL default '',
  `goods_name` varchar(120) NOT NULL default '',
  `goods_name_style` varchar(60) NOT NULL default '+',
  `click_count` int(10) unsigned NOT NULL default '0',
  `brand_id` smallint(5) unsigned NOT NULL default '0',
  `provider_name` varchar(100) NOT NULL default '',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL default '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_start_date` int(11) unsigned NOT NULL default '0',
  `promote_end_date` int(11) unsigned NOT NULL default '0',
  `warn_number` tinyint(3) unsigned NOT NULL default '1',
  `keywords` varchar(255) NOT NULL default '',
  `goods_brief` varchar(255) NOT NULL default '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL default '',
  `goods_img` varchar(255) NOT NULL default '',
  `original_img` varchar(255) NOT NULL default '',
  `is_real` tinyint(3) unsigned NOT NULL default '1',
  `extension_code` varchar(30) NOT NULL default '',
  `is_on_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_shipping` tinyint(1) unsigned NOT NULL default '0',
  `integral` int unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(4) unsigned NOT NULL default '100',
  `is_delete` tinyint(1) unsigned NOT NULL default '0',
  `is_best` tinyint(1) unsigned NOT NULL default '0',
  `is_new` tinyint(1) unsigned NOT NULL default '0',
  `is_hot` tinyint(1) unsigned NOT NULL default '0',
  `is_promote` tinyint(1) unsigned NOT NULL default '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL default '0',
  `last_update` int(10) unsigned NOT NULL default '0',
  `goods_type` smallint(5) unsigned NOT NULL default '0',
  `seller_note` varchar(255) NOT NULL default '',
  `give_integral` int NOT NULL default '-1',
  `rank_integral` int NOT NULL default '-1',
  `suppliers_id` smallint(5) unsigned default NULL,
  `is_check` tinyint(1) unsigned default NULL,
  PRIMARY KEY  (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_article`
--

DROP TABLE IF EXISTS `ecs_goods_article`;
CREATE TABLE `ecs_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `article_id` mediumint(8) unsigned NOT NULL default '0',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`article_id`,`admin_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_attr`
--

DROP TABLE IF EXISTS `ecs_goods_attr`;
CREATE TABLE `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `attr_id` smallint(5) unsigned NOT NULL default '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_cat`
--

DROP TABLE IF EXISTS `ecs_goods_cat`;
CREATE TABLE `ecs_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`cat_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_gallery`
--

DROP TABLE IF EXISTS `ecs_goods_gallery`;
CREATE TABLE `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `img_url` varchar(255) NOT NULL default '',
  `img_desc` varchar(255) NOT NULL default '',
  `thumb_url` varchar(255) NOT NULL default '',
  `img_original` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`img_id`),
  KEY `goods_id` (`goods_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_type`
--

DROP TABLE IF EXISTS `ecs_goods_type`;
CREATE TABLE `ecs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_name` varchar(60) NOT NULL default '',
  `enabled` tinyint(1) unsigned NOT NULL default '1',
  `attr_group` VARCHAR( 255 ) NOT NULL,
  PRIMARY KEY  (`cat_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_group_goods`
--

DROP TABLE IF EXISTS `ecs_group_goods`;
CREATE TABLE `ecs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parent_id`,`goods_id`,`admin_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_link_goods`
--

DROP TABLE IF EXISTS `ecs_link_goods`;
CREATE TABLE `ecs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL default '0',
  `is_double` tinyint(1) unsigned NOT NULL default '0',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`link_goods_id`,`admin_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_mail_templates`
--

DROP TABLE IF EXISTS `ecs_mail_templates`;
CREATE TABLE `ecs_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL auto_increment,
  `template_code` varchar(30) NOT NULL default '',
  `is_html` tinyint(1) unsigned NOT NULL default '0',
  `template_subject` varchar(200) NOT NULL default '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL default '0',
  `last_send` int(10) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY  (`template_id`),
  UNIQUE (`template_code`),
  KEY `type` (`type`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_member_price`
--

DROP TABLE IF EXISTS `ecs_member_price`;
CREATE TABLE `ecs_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` tinyint(3) NOT NULL default '0',
  `user_price` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`price_id`),
  KEY `goods_id` (`goods_id`,`user_rank`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_keywords`
--

DROP TABLE IF EXISTS `ecs_keywords`;
CREATE TABLE `ecs_keywords` (
  `date` date NOT NULL default '0000-00-00',
  `searchengine` varchar(20) NOT NULL default '',
  `keyword` varchar(90) NOT NULL default '',
  `count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`date`,`searchengine`,`keyword`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_action`
--

DROP TABLE IF EXISTS `ecs_order_action`;
CREATE TABLE `ecs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `action_user` varchar(30) NOT NULL default '',
  `order_status` tinyint(1) unsigned NOT NULL default '0',
  `shipping_status` tinyint(1) unsigned NOT NULL default '0',
  `pay_status` tinyint(1) unsigned NOT NULL default '0',
  `action_place` TINYINT( 1 ) UNSIGNED NOT NULL default '0',
  `action_note` varchar(255) NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`action_id`),
  KEY `order_id` (`order_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_goods`
--

DROP TABLE IF EXISTS `ecs_order_goods`;
CREATE TABLE `ecs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(120) NOT NULL default '',
  `goods_sn` varchar(60) NOT NULL default '',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_number` smallint(5) unsigned NOT NULL default '1',
  `market_price` decimal(10,2) NOT NULL default '0.00',
  `goods_price` decimal(10,2) NOT NULL default '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL default '0',
  `is_real` tinyint(1) unsigned NOT NULL default '0',
  `extension_code` varchar(30) NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `is_gift` smallint unsigned NOT NULL default '0',
  `goods_attr_id` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_info`
--

DROP TABLE IF EXISTS `ecs_order_info`;
CREATE TABLE `ecs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_sn` varchar(20) NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `order_status` tinyint(1) unsigned NOT NULL default '0',
  `shipping_status` tinyint(1) unsigned NOT NULL default '0',
  `pay_status` tinyint(1) unsigned NOT NULL default '0',
  `consignee` varchar(60) NOT NULL default '',
  `country` smallint(5) unsigned NOT NULL default '0',
  `province` smallint(5) unsigned NOT NULL default '0',
  `city` smallint(5) unsigned NOT NULL default '0',
  `district` smallint(5) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  `zipcode` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `mobile` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `best_time` varchar(120) NOT NULL default '',
  `sign_building` varchar(120) NOT NULL default '',
  `postscript` varchar(255) NOT NULL default '',
  `shipping_id` tinyint(3) NOT NULL default '0',
  `shipping_name` varchar(120) NOT NULL default '',
  `pay_id` tinyint(3) NOT NULL default '0',
  `pay_name` varchar(120) NOT NULL default '',
  `how_oos` varchar(120) NOT NULL default '',
  `how_surplus` varchar(120) NOT NULL default '',
  `pack_name` varchar(120) NOT NULL default '',
  `card_name` varchar(120) NOT NULL default '',
  `card_message` varchar(255) NOT NULL default '',
  `inv_payee` varchar(120) NOT NULL default '',
  `inv_content` varchar(120) NOT NULL default '',
  `goods_amount` decimal(10,2) NOT NULL default '0.00',
  `shipping_fee` decimal(10,2) NOT NULL default '0.00',
  `insure_fee` DECIMAL( 10, 2 ) NOT NULL DEFAULT '0.00',
  `pay_fee` DECIMAL( 10, 2 ) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL default '0.00',
  `card_fee` decimal(10,2) NOT NULL default '0.00',
  `money_paid` decimal(10, 2) NOT NULL default '0.00',
  `surplus` decimal(10,2) NOT NULL default '0.00',
  `integral` int unsigned NOT NULL default '0.00',
  `integral_money` decimal(10,2) NOT NULL default '0.00',
  `bonus` decimal(10,2) NOT NULL default '0.00',
  `order_amount` decimal(10,2) NOT NULL default '0.00',
  `from_ad` smallint(5) NOT NULL default '0',
  `referer` varchar(255) NOT NULL default '',
  `add_time` int(10) unsigned NOT NULL default '0',
  `confirm_time` int(10) unsigned NOT NULL default '0',
  `pay_time` int(10) unsigned NOT NULL default '0',
  `shipping_time` int(10) unsigned NOT NULL default '0',
  `pack_id` tinyint(3) unsigned NOT NULL default '0',
  `card_id` tinyint(3) unsigned NOT NULL default '0',
  `bonus_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(255) NOT NULL default '',
  `extension_code` varchar(30) NOT NULL default '',
  `extension_id` mediumint(8) unsigned NOT NULL default '0',
  `to_buyer` varchar(255) NOT NULL default '',
  `pay_note` varchar(255) NOT NULL default '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10, 2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL default '0',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `discount` decimal(10, 2) NOT NULL,
  PRIMARY KEY  (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_pack`
--

DROP TABLE IF EXISTS `ecs_pack`;
CREATE TABLE `ecs_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL auto_increment,
  `pack_name` varchar(120) NOT NULL default '',
  `pack_img` varchar(255) NOT NULL default '',
  `pack_fee` decimal(6,2) unsigned NOT NULL default '0',
  `free_money` smallint(5) unsigned NOT NULL default '0',
  `pack_desc` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pack_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_payment`
--

DROP TABLE IF EXISTS `ecs_payment`;
CREATE TABLE `ecs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `pay_code` varchar(20) NOT NULL default '',
  `pay_name` varchar(120) NOT NULL default '',
  `pay_fee` VARCHAR( 10 ) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
)  TYPE=MyISAM;
-- --------------------------------------------------------

--
-- 表的结构 `ecs_plugins`
--

DROP TABLE IF EXISTS `ecs_plugins`;
CREATE TABLE `ecs_plugins` (
  `code` varchar(30) NOT NULL default '',
  `version` varchar(10) NOT NULL default '',
  `library` varchar(255) NOT NULL default '',
  `assign` tinyint(1) unsigned NOT NULL default '0',
  `install_date` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`code`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_region`
--

DROP TABLE IF EXISTS `ecs_region`;
CREATE TABLE `ecs_region` (
  `region_id` smallint(5) unsigned NOT NULL auto_increment,
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `region_name` varchar(120) NOT NULL default '',
  `region_type` tinyint(1) NOT NULL default '2',
  `agency_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_reg_extend_info`
--

DROP TABLE IF EXISTS `ecs_reg_extend_info`;
CREATE TABLE `ecs_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_reg_fields`
--

DROP TABLE IF EXISTS `ecs_reg_fields`;
CREATE TABLE `ecs_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint unsigned NOT NULL default '100',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `is_need` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM, AUTO_INCREMENT=100;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_searchengine`
--

DROP TABLE IF EXISTS `ecs_searchengine`;
CREATE TABLE `ecs_searchengine` (
  `date` date NOT NULL default '0000-00-00',
  `searchengine` varchar(20) NOT NULL default '',
  `count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`date`,`searchengine`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_sessions`
--

DROP TABLE IF EXISTS `ecs_sessions`;
CREATE TABLE `ecs_sessions` (
  `sesskey` char(32) binary NOT NULL default '',
  `expiry` int(10) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `adminid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL default '',
  PRIMARY KEY  (`sesskey`),
  KEY `expiry` (`expiry`)
) TYPE=HEAP;


-- --------------------------------------------------------

--
-- 表的结构 `ecs_sessions_data`
--

DROP TABLE IF EXISTS `ecs_sessions_data`;
CREATE TABLE `ecs_sessions_data` (
  `sesskey` varchar( 32 ) binary NOT NULL default '',
  `expiry` int( 10 ) unsigned NOT NULL default '0',
  `data` longtext NOT NULL ,
  PRIMARY KEY ( `sesskey` ) ,
  KEY `expiry` ( `expiry` )
) TYPE = MYISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shipping`
--

DROP TABLE IF EXISTS `ecs_shipping`;
CREATE TABLE `ecs_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL auto_increment,
  `shipping_code` varchar(20) NOT NULL default '',
  `shipping_name` varchar(120) NOT NULL default '',
  `shipping_desc` varchar(255) NOT NULL default '',
  `insure` VARCHAR( 10 ) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) default NULL,
  `config_lable` text,
  `print_model` tinyint(1) default '0',
  `shipping_order` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`shipping_id`),
  KEY `shipping_code` (`shipping_code`,`enabled`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shipping_area`
--

DROP TABLE IF EXISTS `ecs_shipping_area`;
CREATE TABLE `ecs_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL auto_increment,
  `shipping_area_name` varchar(150) NOT NULL default '',
  `shipping_id` tinyint(3) unsigned NOT NULL default '0',
  `configure` text NOT NULL,
  PRIMARY KEY  (`shipping_area_id`),
  KEY `shipping_id` (`shipping_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shop_config`
--

DROP TABLE IF EXISTS `ecs_shop_config`;
CREATE TABLE `ecs_shop_config` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `code` varchar(30) NOT NULL default '',
  `type` varchar(10) NOT NULL default '',
  `store_range` varchar(255) NOT NULL default '',
  `store_dir` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL  default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_snatch_log`
--

DROP TABLE IF EXISTS `ecs_snatch_log`;
CREATE TABLE `ecs_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `snatch_id` tinyint(3) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bid_price` decimal(10,2) NOT NULL default '0.00',
  `bid_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `snatch_id` (`snatch_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_stats`
--

DROP TABLE IF EXISTS `ecs_stats`;
CREATE TABLE `ecs_stats` (
  `access_time` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `visit_times` smallint(5) unsigned NOT NULL default '1',
  `browser` varchar(60) NOT NULL default '',
  `system` varchar(20) NOT NULL default '',
  `language` varchar(20) NOT NULL default '',
  `area` varchar(30) NOT NULL default '',
  `referer_domain` varchar(100) NOT NULL default '',
  `referer_path` varchar(200) NOT NULL default '',
  `access_url` varchar(255) NOT NULL default '',
  KEY `access_time` (`access_time`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_tag`
--

DROP TABLE IF EXISTS `ecs_tag`;
CREATE TABLE `ecs_tag` (
  `tag_id` mediumint(8) NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `tag_words` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`tag_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_template`
--

DROP TABLE IF EXISTS `ecs_template`;
CREATE TABLE `ecs_template` (
  `filename` varchar(30) NOT NULL default '',
  `region` varchar(40) NOT NULL default '',
  `library` varchar(40) NOT NULL default '',
  `sort_order` tinyint(1) unsigned NOT NULL default '0',
  `id` smallint(5) unsigned NOT NULL default '0',
  `number` tinyint(1) unsigned NOT NULL default '5',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(60) NOT NULL default '',
  `remarks` varchar(30) NOT NULL default '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_address`
--

DROP TABLE IF EXISTS `ecs_user_address`;
CREATE TABLE `ecs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL auto_increment,
  `address_name` varchar(50) NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `consignee` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `country` smallint(5) NOT NULL default '0',
  `province` smallint(5) NOT NULL default '0',
  `city` smallint(5) NOT NULL default '0',
  `district` smallint(5) NOT NULL default '0',
  `address` varchar(120) NOT NULL default '',
  `zipcode` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `mobile` varchar(60) NOT NULL default '',
  `sign_building` varchar(120) NOT NULL default '',
  `best_time` varchar(120) NOT NULL default '',
  PRIMARY KEY  (`address_id`),
  KEY `user_id` (`user_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_bonus`
--

DROP TABLE IF EXISTS `ecs_user_bonus`;
CREATE TABLE `ecs_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bonus_type_id` tinyint(3) unsigned NOT NULL default '0',
  `bonus_sn` bigint(20) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `used_time` int(10) unsigned NOT NULL default '0',
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `emailed` tinyint unsigned NOT NULL default '0',
  PRIMARY KEY  (`bonus_id`),
  KEY `user_id` (`user_id`)
)  TYPE=MyISAM;

-- ---------------------------------------------------------
--
-- 表的结构 `ecs_user_feed`
--

DROP TABLE IF EXISTS `ecs_user_feed`;
CREATE TABLE IF NOT EXISTS `ecs_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `value_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `feed_type` tinyint(1) unsigned NOT NULL default '0',
  `is_feed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`feed_id`)
)  TYPE=MyISAM;


-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_rank`
--

DROP TABLE IF EXISTS `ecs_user_rank`;
CREATE TABLE `ecs_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL auto_increment,
  `rank_name` varchar(30) NOT NULL default '',
  `min_points` int unsigned NOT NULL default '0',
  `max_points` int unsigned NOT NULL default '0',
  `discount` tinyint(3) unsigned NOT NULL default '0',
  `show_price` tinyint(1) unsigned NOT NULL default '1',
  `special_rank` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rank_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_users`
--

DROP TABLE IF EXISTS `ecs_users`;
CREATE TABLE `ecs_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `email` varchar(60) NOT NULL default '',
  `user_name` varchar(60) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `question` varchar(255) NOT NULL default '',
  `answer` varchar(255) NOT NULL default '',
  `sex` tinyint(1) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  `user_money` decimal(10,2) NOT NULL default '0.00',
  `frozen_money` decimal(10,2) NOT NULL default '0.00',
  `pay_points` int unsigned NOT NULL default '0',
  `rank_points` int unsigned NOT NULL default '0',
  `address_id` mediumint(8) unsigned NOT NULL default '0',
  `reg_time` int(10) unsigned NOT NULL default '0',
  `last_login` INT( 11 ) UNSIGNED NOT NULL default '0',
  `last_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL default '',
  `visit_count` smallint(5) unsigned NOT NULL default '0',
  `user_rank` tinyint(3) unsigned NOT NULL default '0',
  `is_special` tinyint(3) unsigned NOT NULL default '0',
  `ec_salt` VARCHAR( 10 )  NULL ,
  `salt` varchar(10) NOT NULL default '0',
  `parent_id` mediumint(9) NOT NULL default '0',
  `flag` TINYINT UNSIGNED NOT NULL DEFAULT '0',
  `alias` VARCHAR( 60 ) NOT NULL ,
  `msn` VARCHAR( 60 ) NOT NULL ,
  `qq` VARCHAR( 20 ) NOT NULL,
  `office_phone` VARCHAR( 20 ) NOT NULL,
  `home_phone` VARCHAR( 20 ) NOT NULL,
  `mobile_phone` VARCHAR( 20 ) NOT NULL,
  `is_validated` TINYINT UNSIGNED NOT NULL DEFAULT '0',
  `credit_line` DECIMAL( 10, 2 ) UNSIGNED NOT NULL,
  `passwd_question` VARCHAR( 50 ) NULL,
  `passwd_answer` VARCHAR( 255 ) NULL,
  PRIMARY KEY  (`user_id`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `flag` (`flag`),
  UNIQUE (`user_name`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote`
--

DROP TABLE IF EXISTS `ecs_vote`;
CREATE TABLE `ecs_vote` (
  `vote_id` smallint unsigned NOT NULL auto_increment,
  `vote_name` varchar(250) NOT NULL default '',
  `start_time` int(11) unsigned NOT NULL default '0',
  `end_time` int(11) unsigned NOT NULL default '0',
  `can_multi` tinyint(1) unsigned NOT NULL default '0',
  `vote_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vote_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote_log`
--

DROP TABLE IF EXISTS `ecs_vote_log`;
CREATE TABLE `ecs_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `vote_id` smallint unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `vote_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `vote_id` (`vote_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote_option`
--

DROP TABLE IF EXISTS `ecs_vote_option`;
CREATE TABLE `ecs_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL auto_increment,
  `vote_id` smallint unsigned NOT NULL default '0',
  `option_name` varchar(250) NOT NULL default '',
  `option_count` int(8) unsigned NOT NULL default '0',
  `option_order` tinyint(3) unsigned NOT NULL default '100',
  PRIMARY KEY  (`option_id`),
  KEY `vote_id` (`vote_id`)
)  TYPE=MyISAM;

-- --------------------------------------------------------
--
-- 表的结构 `ecs_pay_log`
--
DROP TABLE IF EXISTS `ecs_pay_log`;
CREATE TABLE `ecs_pay_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL default '0',
  `is_paid` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------
--
-- 表的结构 `ecs_user_account`
--
DROP TABLE IF EXISTS `ecs_user_account`;
CREATE TABLE `ecs_user_account` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL default '0',
  `paid_time` int(10) NOT NULL default '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL default '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_paid` (`is_paid`)
) TYPE=MyISAM;

--
-- 表的结构 `ecs_agency`
--
DROP TABLE IF EXISTS `ecs_agency`;
CREATE TABLE `ecs_agency` (
  `agency_id` smallint(5) unsigned NOT NULL auto_increment,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL,
  PRIMARY KEY  (`agency_id`),
  KEY `agency_name` (`agency_name`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_activity`
--

DROP TABLE IF EXISTS `ecs_goods_activity`;
CREATE TABLE `ecs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL auto_increment,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY  (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `account_log`
--

DROP TABLE IF EXISTS `ecs_account_log`;
CREATE TABLE `ecs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_topic`
--

DROP TABLE IF EXISTS `ecs_topic`;
CREATE TABLE `ecs_topic` (
  `topic_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL default '0',
  `end_time` int(10) NOT NULL default '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL default '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) default NULL,
  `title_pic` varchar(255) default NULL,
  `base_style` char(6) default NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  KEY `topic_id` (`topic_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_auction_log`
--

DROP TABLE IF EXISTS `ecs_auction_log`;
CREATE TABLE `ecs_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `act_id` (`act_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------


-- 增加分成信息纪录
DROP TABLE IF EXISTS `ecs_affiliate_log`;
CREATE TABLE  `ecs_affiliate_log` (
 `log_id` MEDIUMINT( 8 ) NOT NULL auto_increment,
 `order_id` MEDIUMINT( 8 ) NOT NULL ,
 `time` INT( 10 ) NOT NULL ,
 `user_id` MEDIUMINT( 8 ) NOT NULL,
 `user_name` varchar(60),
 `money` DECIMAL(10,2) NOT NULL DEFAULT '0',
 `point` INT(10) NOT NULL DEFAULT '0',
 `separate_type` TINYINT(1) NOT NULL DEFAULT '0',
PRIMARY KEY ( `log_id` )
) TYPE = MYISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_favourable_activity`
--

DROP TABLE IF EXISTS `ecs_favourable_activity`;
CREATE TABLE `ecs_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL auto_increment,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY  (`act_id`),
  KEY `act_name` (`act_name`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_virtual_card`
--
DROP TABLE IF EXISTS `ecs_virtual_card`;
CREATE TABLE `ecs_virtual_card` (
    `card_id` mediumint(8) NOT NULL auto_increment,
    `goods_id` mediumint(8) unsigned NOT NULL default '0',
    `card_sn` varchar(60) NOT NULL default '',
    `card_password` varchar(60) NOT NULL default '',
    `add_date` int(11) NOT NULL default '0',
    `end_date` int(11) NOT NULL default '0',
    `is_saled` tinyint(1) NOT NULL default '0',
    `order_sn` varchar(20) NOT NULL default '',
    `crc32` varchar(12) NOT NULL default '0',
    PRIMARY KEY  (`card_id`),
    KEY `goods_id` (`goods_id`),
    KEY `car_sn` (`card_sn`),
    KEY `is_saled` (`is_saled`)
    ) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_wholesale`
--
DROP TABLE IF EXISTS `ecs_wholesale`;
CREATE TABLE IF NOT EXISTS `ecs_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`act_id`),
  KEY `goods_id` (`goods_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_nav`
--
DROP TABLE IF EXISTS `ecs_nav`;
CREATE TABLE `ecs_nav` (
  `id` mediumint(8) NOT NULL auto_increment,
  `ctype` VARCHAR( 10 ) NULL,
  `cid` SMALLINT( 5 ) UNSIGNED NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) TYPE=MyISAM;

-- 增加发送队列表
DROP TABLE IF EXISTS `ecs_email_sendlist`;
CREATE TABLE  `ecs_email_sendlist` (
 `id` MEDIUMINT( 8 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
 `email` VARCHAR( 100 ) NOT NULL ,
 `template_id` MEDIUMINT( 8 ) NOT NULL ,
 `email_content` TEXT NOT NULL ,
 `error` TINYINT( 1 ) NOT NULL DEFAULT  '0' ,
 `pri` TINYINT( 10 ) NOT NULL ,
 `last_send` INT( 10 ) NOT NULL
) TYPE = MYISAM;

-- 增加电子杂志订阅表
DROP TABLE IF EXISTS `ecs_email_list`;
CREATE TABLE `ecs_email_list` (
  `id` mediumint(8) NOT NULL auto_increment,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL default '0',
  `hash` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

-- 增加自动处理的表
DROP TABLE IF EXISTS `ecs_auto_manage`;
CREATE TABLE `ecs_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY  (`item_id`,`type`)
) TYPE=MyISAM;

-- 增加分类首页推荐表
DROP TABLE IF EXISTS `ecs_cat_recommend`;
CREATE TABLE `ecs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY  (`cat_id`,`recommend_type`)
) TYPE=MyISAM;

-- 增加商品批量购买优惠价格表
DROP TABLE IF EXISTS `ecs_volume_price`;
CREATE TABLE IF NOT EXISTS `ecs_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_type`,`goods_id`,`volume_number`)
) TYPE=MyISAM;

-- 增加超值礼包商品表
DROP TABLE IF EXISTS `ecs_package_goods`;
CREATE TABLE `ecs_package_goods` (
  `package_id` mediumint( 8 ) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint( 8 ) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_number` smallint( 5 ) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint( 3 ) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (`package_id`,`goods_id`,`admin_id`,`product_id`)
) TYPE = MYISAM;

-- 增加积分商城商品表
DROP TABLE IF EXISTS `ecs_exchange_goods`;
CREATE TABLE IF NOT EXISTS `ecs_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) TYPE=MYISAM;

-- 发货单商品表 `ecs_delivery_goods`
DROP TABLE IF EXISTS `ecs_delivery_goods`;
CREATE TABLE `ecs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned default '0',
  `product_sn` varchar(60) default NULL,
  `goods_name` varchar(120) default NULL,
  `brand_name` varchar(60) default NULL,
  `goods_sn` varchar(60) default NULL,
  `is_real` tinyint(1) unsigned default '0',
  `extension_code` varchar(30) default NULL,
  `parent_id` mediumint(8) unsigned default '0',
  `send_number` smallint(5) unsigned default '0',
  `goods_attr` text,
  PRIMARY KEY  (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM;

-- 发货单表 `ecs_delivery_order`
DROP TABLE IF EXISTS `ecs_delivery_order`;
CREATE TABLE `ecs_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(50) default NULL,
  `add_time` int(10) unsigned default '0',
  `shipping_id` tinyint(3) unsigned default '0',
  `shipping_name` varchar(120) default NULL,
  `user_id` mediumint(8) unsigned default '0',
  `action_user` varchar(30) default NULL,
  `consignee` varchar(60) default NULL,
  `address` varchar(250) default NULL,
  `country` smallint(5) unsigned default '0',
  `province` smallint(5) unsigned default '0',
  `city` smallint(5) unsigned default '0',
  `district` smallint(5) unsigned default '0',
  `sign_building` varchar(120) default NULL,
  `email` varchar(60) default NULL,
  `zipcode` varchar(60) default NULL,
  `tel` varchar(60) default NULL,
  `mobile` varchar(60) default NULL,
  `best_time` varchar(120) default NULL,
  `postscript` varchar(255) default NULL,
  `how_oos` varchar(120) default NULL,
  `insure_fee` decimal(10,2) unsigned default '0.00',
  `shipping_fee` decimal(10,2) unsigned default '0.00',
  `update_time` int(10) unsigned default '0',
  `suppliers_id` smallint(5) default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `agency_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM;

-- 退货单商品表 `ecs_back_goods`
DROP TABLE IF EXISTS `ecs_back_goods`;
CREATE TABLE `ecs_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `back_id` mediumint(8) unsigned default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `product_sn` varchar(60) default NULL,
  `goods_name` varchar(120) default NULL,
  `brand_name` varchar(60) default NULL,
  `goods_sn` varchar(60) default NULL,
  `is_real` tinyint(1) unsigned default '0',
  `send_number` smallint(5) unsigned default '0',
  `goods_attr` text,
  PRIMARY KEY  (`rec_id`),
  KEY `back_id` (`back_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM;

-- 退货单表 `ecs_back_order`
DROP TABLE IF EXISTS `ecs_back_order`;
CREATE TABLE `ecs_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(50) default NULL,
  `add_time` int(10) unsigned default '0',
  `shipping_id` tinyint(3) unsigned default '0',
  `shipping_name` varchar(120) default NULL,
  `user_id` mediumint(8) unsigned default '0',
  `action_user` varchar(30) default NULL,
  `consignee` varchar(60) default NULL,
  `address` varchar(250) default NULL,
  `country` smallint(5) unsigned default '0',
  `province` smallint(5) unsigned default '0',
  `city` smallint(5) unsigned default '0',
  `district` smallint(5) unsigned default '0',
  `sign_building` varchar(120) default NULL,
  `email` varchar(60) default NULL,
  `zipcode` varchar(60) default NULL,
  `tel` varchar(60) default NULL,
  `mobile` varchar(60) default NULL,
  `best_time` varchar(120) default NULL,
  `postscript` varchar(255) default NULL,
  `how_oos` varchar(120) default NULL,
  `insure_fee` decimal(10,2) unsigned default '0.00',
  `shipping_fee` decimal(10,2) unsigned default '0.00',
  `update_time` int(10) unsigned default '0',
  `suppliers_id` smallint(5) default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `return_time` int(10) unsigned default '0',
  `agency_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM;

-- 供货商 `ecs_suppliers`
DROP TABLE IF EXISTS `ecs_suppliers`;
CREATE TABLE `ecs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL auto_increment,
  `suppliers_name` varchar(255) default NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`suppliers_id`)
) ENGINE=MyISAM;

-- 首页主广告用户自定义表 `ecs_ad_custom`
DROP TABLE IF EXISTS `ecs_ad_custom`;
CREATE TABLE `ecs_ad_custom` (
`ad_id` MEDIUMINT( 8 ) UNSIGNED NOT NULL auto_increment,
`ad_type` TINYINT( 1 ) UNSIGNED DEFAULT '1' NOT NULL ,
`ad_name` VARCHAR( 60 ) ,
`add_time` INT( 10 ) UNSIGNED DEFAULT '0' NOT NULL ,
`content` mediumtext,
`url` varchar(255) ,
`ad_status` TINYINT( 0 ) UNSIGNED DEFAULT '0' NOT NULL ,
PRIMARY KEY ( `ad_id` )
)ENGINE=MyISAM;

-- 角色管理

DROP TABLE IF EXISTS `ecs_role`;
CREATE TABLE `ecs_role` (
  `role_id` smallint(5) unsigned NOT NULL auto_increment,
  `role_name` varchar(60) NOT NULL default '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY  (`role_id`),
  KEY `user_name` (`role_name`)
) ENGINE=MyISAM;

-- 货品表

DROP TABLE IF EXISTS `ecs_products`;
CREATE TABLE `ecs_products` (
  `product_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_attr` varchar(50) default NULL,
  `product_sn` varchar(60) default NULL,
  `product_number` smallint(5) unsigned default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

TRUNCATE TABLE ecs_ad;
TRUNCATE TABLE ecs_ad_position;
TRUNCATE TABLE ecs_template;

TRUNCATE TABLE ecs_category;
TRUNCATE TABLE ecs_goods;
TRUNCATE TABLE ecs_goods_activity;

TRUNCATE TABLE ecs_goods_attr;
TRUNCATE TABLE ecs_goods_gallery;
TRUNCATE TABLE ecs_goods_type;
TRUNCATE TABLE ecs_group_goods;
TRUNCATE TABLE ecs_nav;
TRUNCATE TABLE ecs_attribute;

TRUNCATE TABLE ecs_brand;
TRUNCATE TABLE ecs_cat_recommend;
TRUNCATE TABLE ecs_collect_goods;
TRUNCATE TABLE ecs_delivery_goods;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad`
--

CREATE TABLE IF NOT EXISTS `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=194 ;

--
-- 转存表中的数据 `ecs_ad`
--

INSERT INTO `ecs_ad` (`ad_id`, `position_id`, `media_type`, `ad_name`, `ad_link`, `ad_code`, `start_time`, `end_time`, `link_man`, `link_email`, `link_phone`, `click_count`, `enabled`) VALUES
(193, 159, 0, '首页左侧广告', 'http://ectouch.cn/', '1413916122102071507.png', 1381219200, 1983427200, '', '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad_position`
--

CREATE TABLE IF NOT EXISTS `ecs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

--
-- 转存表中的数据 `ecs_ad_position`
--

INSERT INTO `ecs_ad_position` (`position_id`, `position_name`, `ad_width`, `ad_height`, `position_desc`, `position_style`) VALUES
(159, '首页左侧广告', 240, 140, '', '<table cellpadding="0" cellspacing="0">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');

-- --------------------------------------------------------

--
-- 表的结构 `ecs_template`
--

CREATE TABLE IF NOT EXISTS `ecs_template` (
  `filename` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(40) NOT NULL DEFAULT '',
  `library` varchar(40) NOT NULL DEFAULT '',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `remarks` varchar(30) NOT NULL DEFAULT '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ecs_template`
--

INSERT INTO `ecs_template` (`filename`, `region`, `library`, `sort_order`, `id`, `number`, `type`, `theme`, `remarks`) VALUES
('index', '左边区域', '/library/vote_list.lbi', 8, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/email_list.lbi', 9, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/order_query.lbi', 6, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/cart.lbi', 0, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/promotion_info.lbi', 3, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/auction.lbi', 4, 0, 3, 0, 'default', ''),
('index', '左边区域', '/library/group_buy.lbi', 5, 0, 3, 0, 'default', ''),
('index', '', '/library/recommend_promotion.lbi', 0, 0, 4, 0, 'default', ''),
('index', '右边主区域', '/library/recommend_hot.lbi', 2, 0, 10, 0, 'default', ''),
('index', '右边主区域', '/library/recommend_new.lbi', 1, 0, 10, 0, 'default', ''),
('index', '右边主区域', '/library/recommend_best.lbi', 0, 0, 10, 0, 'default', ''),
('index', '左边区域', '/library/invoice_query.lbi', 7, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/top10.lbi', 2, 0, 0, 0, 'default', ''),
('index', '左边区域', '/library/category_tree.lbi', 1, 0, 0, 0, 'default', ''),
('index', '', '/library/brands.lbi', 0, 0, 11, 0, 'default', ''),
('category', '左边区域', '/library/category_tree.lbi', 1, 0, 0, 0, 'default', ''),
('category', '右边区域', '/library/recommend_best.lbi', 0, 0, 5, 0, 'default', ''),
('category', '右边区域', '/library/goods_list.lbi', 1, 0, 0, 0, 'default', ''),
('category', '右边区域', '/library/pages.lbi', 2, 0, 0, 0, 'default', ''),
('category', '左边区域', '/library/cart.lbi', 0, 0, 0, 0, 'default', ''),
('category', '左边区域', '/library/price_grade.lbi', 3, 0, 0, 0, 'default', ''),
('category', '左边区域', '/library/filter_attr.lbi', 2, 0, 0, 0, 'default', ''),
('index', '商店公告下广告', '/library/ad_position.lbi', 0, 159, 1, 4, 'ecmoban_meilishuo', ''),
('index', '全宽行', '/library/cat_goods.lbi', 3, 21, 5, 1, 'ecmoban_meilishuo', ''),
('index', '', '/library/brands.lbi', 0, 0, 3, 0, 'ecmoban_meilishuo', ''),
('index', '', '/library/auction.lbi', 0, 0, 3, 0, 'ecmoban_meilishuo', ''),
('index', '', '/library/group_buy.lbi', 0, 0, 3, 0, 'ecmoban_meilishuo', ''),
('index', '促销商品区域', '/library/recommend_promotion.lbi', 0, 0, 4, 0, 'ecmoban_meilishuo', ''),
('index', '全宽行', '/library/recommend_hot.lbi', 1, 0, 5, 0, 'ecmoban_meilishuo', ''),
('index', '全宽行', '/library/recommend_new.lbi', 0, 0, 5, 0, 'ecmoban_meilishuo', ''),
('index', '全宽行', '/library/recommend_best.lbi', 2, 0, 5, 0, 'ecmoban_meilishuo', ''),
('index', '商店公告', '/library/new_articles.lbi', 0, 0, 0, 0, 'ecmoban_meilishuo', '');


-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_type`
--

CREATE TABLE IF NOT EXISTS `ecs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ecs_goods_type`
--

INSERT INTO `ecs_goods_type` (`cat_id`, `cat_name`, `enabled`, `attr_group`) VALUES
(14, '服装', 1, ''),
(12, '液晶电视', 1, '主体\r\n显示\r\n音频'),
(15, '美妆', 1, '');

--
-- 表的结构 `ecs_group_goods`
--

CREATE TABLE IF NOT EXISTS `ecs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ecs_group_goods`
--

INSERT INTO `ecs_group_goods` (`parent_id`, `goods_id`, `goods_price`, `admin_id`) VALUES
(134, 141, '100.00', 1),
(134, 140, '100.00', 1),
(134, 139, '100.00', 1),
(134, 138, '100.00', 1),
(134, 137, '100.00', 1),
(134, 136, '100.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_category`
--

CREATE TABLE IF NOT EXISTS `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=683 ;

--
-- 转存表中的数据 `ecs_category`
--

INSERT INTO `ecs_category` (`cat_id`, `cat_name`, `keywords`, `cat_desc`, `parent_id`, `sort_order`, `template_file`, `measure_unit`, `show_in_nav`, `style`, `is_show`, `grade`, `filter_attr`) VALUES
(2, 'CDMA手机', '', '', 17, 50, '', '', 0, '', 1, 5, '6'),
(19, '双模手机', '', '', 17, 50, '', '', 0, '', 1, 5, '0'),
(20, 'GSM手机', '', '', 17, 50, '', '', 0, '', 1, 5, '0'),
(6, '装备配件', '', '耳机 电池 读卡内存卡 充 电 器 ', 16, 50, '', '', 0, '', 1, 5, ''),
(7, '充 电 器', '', '', 6, 50, '', '', 0, '', 1, 5, '0'),
(8, '耳机', '', '', 6, 50, '', '', 0, '', 1, 5, '0'),
(9, '电池', '', '', 6, 50, '', '', 0, '', 1, 0, '0'),
(11, '读卡内存卡', '', '', 6, 50, '', '', 0, '', 1, 5, '0'),
(12, '户外服装', '', '联通充值卡 小灵通充值卡 移动充值卡 ', 16, 50, '', '', 0, '', 1, 5, ''),
(13, '小灵通充值卡', '', '', 12, 50, '', '', 0, '', 1, 5, '0'),
(14, '移动充值卡', '', '', 12, 50, '', '', 0, '', 1, 5, '0'),
(15, '联通充值卡', '', '', 12, 50, '', '', 0, '', 1, 5, '0'),
(16, '运动户外', '', '', 0, 11, '', '', 0, '', 1, 5, ''),
(17, '运动鞋', '', '3G手机 GSM手机 CDMA手机 ', 16, 2, '', '', 0, '', 1, 5, ''),
(18, '3G手机', '', '', 17, 50, '', '', 0, '', 1, 5, '0'),
(21, '女装', '', '', 0, 10, '', '个', 1, '', 1, 10, '243,246,245,242,244'),
(22, 'T恤/POLO', '', '电话机 电熨斗 清洁机 饮水机', 21, 50, '', '', 0, '', 1, 0, '238,239'),
(23, 'POLO衫', '', '', 22, 50, '', '', 0, '', 1, 0, ''),
(26, '短袖T恤', '', '', 22, 50, '', '', 0, '', 1, 0, ''),
(27, '长袖T恤', '', '', 22, 50, '', '', 0, '', 1, 0, ''),
(29, '衬衫', '', '燃气炉 电饭煲 电磁炉 电水壶 ', 21, 50, '', '', 0, '', 1, 0, ''),
(30, '长袖衬衫', '', '', 29, 50, '', '', 0, '', 1, 0, ''),
(624, '皮衣', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(32, '短袖衬衫', '', '', 29, 50, '', '', 0, '', 1, 0, ''),
(33, '分袖衬衫', '', '', 29, 50, '', '', 0, '', 1, 0, ''),
(34, '裤子', '', '吹风机 血压计 剃须刀', 21, 50, '', '', 0, '', 1, 0, ''),
(35, '牛仔分裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(36, '牛仔短裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(37, '休闲裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(38, '牛仔裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(39, '外套', '', '车载电源 GPS导航 汽车护理 ', 21, 50, '', '', 0, '', 1, 0, ''),
(40, '卫衣', '', '汽车护理 车内饰品 车载电源', 39, 50, '', '', 0, '', 1, 0, ''),
(41, '西装', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(42, '羽绒服', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(43, '棉服', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(44, '鞋靴', '', '', 0, 13, '', '', 0, '', 1, 0, ''),
(45, '家居用品', '', '卫浴用品 家纺毛巾', 44, 50, '', '', 0, '', 1, 0, '0'),
(46, '被子', '', '', 45, 50, '', '', 0, '', 1, 0, '0'),
(47, '枕头', '', '', 45, 50, '', '', 0, '', 1, 0, '0'),
(48, '家纺毛巾', '', '', 45, 50, '', '', 0, '', 1, 0, '0'),
(49, '卫浴用品', '', '', 45, 50, '', '', 0, '', 1, 0, '0'),
(50, '女鞋', '', '童鞋 腰带 休闲鞋 ', 44, 50, '', '', 0, '', 1, 0, ''),
(51, '休闲鞋', '', '', 50, 50, '', '', 0, '', 1, 0, '0'),
(52, '童鞋', '', '', 50, 50, '', '', 0, '', 1, 0, '0'),
(53, '腰带', '', '', 50, 50, '', '', 0, '', 1, 0, '0'),
(54, '礼品箱包', '', '瑞士军刀 工艺藏品 烟具 ', 44, 50, '', '', 0, '', 1, 0, '0'),
(55, '烟具', '', '', 54, 50, '', '', 0, '', 1, 0, '0'),
(56, '瑞士军刀', '', '', 54, 50, '', '', 0, '', 1, 0, '0'),
(57, '工艺藏品', '', '', 54, 50, '', '', 0, '', 1, 0, '0'),
(58, '钟表首饰', '', '国产表店 日本表店 流行饰品 ', 44, 50, '', '', 0, '', 1, 0, ''),
(59, '日本表店', '', '', 58, 50, '', '', 0, '', 1, 0, '0'),
(60, '流行饰品', '', '', 58, 50, '', '', 0, '', 1, 0, '0'),
(61, '国产表店', '', '', 58, 50, '', '', 0, '', 1, 0, '0'),
(62, '运动健康', '', '室内球类 运动器材 户外装备 ', 44, 50, '', '', 0, '', 1, 0, '0'),
(63, '运动器材', '', '', 62, 50, '', '', 0, '', 1, 0, '0'),
(64, '户外装备', '', '', 62, 50, '', '', 0, '', 1, 0, '0'),
(65, '室内球类', '', '', 62, 50, '', '', 0, '', 1, 0, '0'),
(66, '趣味玩具', '', '遥控玩具 电动玩具 ', 44, 50, '', '', 0, '', 1, 0, '0'),
(67, '电动玩具', '', '', 66, 50, '', '', 0, '', 1, 0, '0'),
(68, '遥控玩具', '', '', 66, 50, '', '', 0, '', 1, 0, '0'),
(69, '母婴童', '', '', 0, 12, '', '', 0, '', 1, 0, ''),
(70, '童装', '', '台式机 服务器 笔记本 ', 69, 50, '', '', 0, '', 1, 0, ''),
(71, '笔记本', '', '', 70, 50, '', '', 0, '', 1, 0, '0'),
(72, '台式机', '', '', 70, 50, '', '', 0, '', 1, 0, '0'),
(73, '服务器', '', '', 70, 50, '', '', 0, '', 1, 0, '0'),
(74, '婴童洗护', '', '光驱 显卡 CPU 主板', 69, 50, '', '', 0, '', 1, 0, ''),
(75, 'CPU', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(76, '硬盘', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(77, '内存', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(78, '显卡', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(79, '主板', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(80, '声卡', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(81, '光驱', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(82, '散热器', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(83, '孕妈专区', '', '显示器 电源 主机箱 ', 69, 50, '', '', 0, '', 1, 0, ''),
(84, '显示器', '', '', 83, 50, '', '', 0, '', 1, 0, '0'),
(111, '硒鼓', '', '', 101, 50, '', '个', 0, '', 1, 5, '230'),
(86, '鼠标', '', '', 83, 50, '', '', 0, '', 1, 0, '0'),
(87, '键盘', '', '', 83, 50, '', '', 0, '', 1, 0, '0'),
(88, '电源', '', '', 83, 50, '', '', 0, '', 1, 0, '0'),
(89, '婴儿装', '', '一体机  复印机 打印机 ', 69, 50, '', '', 0, '', 1, 0, ''),
(90, '打印机', '', '', 89, 50, '', '', 0, '', 1, 0, '0'),
(91, '一体机', '', '', 89, 50, '', '', 0, '', 1, 0, '0'),
(92, '复印机', '', '', 89, 50, '', '', 0, '', 1, 0, '0'),
(93, '玩具/早教', '', '路由器  网卡 交换机 ', 69, 50, '', '', 0, '', 1, 0, ''),
(94, '路由器', '', '', 93, 50, '', '', 0, '', 1, 0, '0'),
(95, '网卡', '', '', 93, 50, '', '', 0, '', 1, 0, '0'),
(96, '交换机', '', '', 93, 50, '', '', 0, '', 1, 0, '0'),
(97, '喂养用品', '', '游戏软件 杀毒软件 办公软件 ', 69, 50, '', '', 0, '', 1, 0, ''),
(98, '杀毒软件', '', '', 97, 50, '', '', 0, '', 1, 0, '0'),
(99, '办公软件', '', '', 97, 50, '', '', 0, '', 1, 0, '0'),
(100, '游戏软件', '', '', 97, 50, '', '', 0, '', 1, 0, '0'),
(101, '童鞋', '', ' 色带  墨盒 墨粉 ', 69, 50, '', '', 0, '', 1, 0, ''),
(102, '墨盒', '', '', 101, 50, '', '', 0, '', 1, 0, '0'),
(103, '墨粉', '', '', 101, 50, '', '', 0, '', 1, 0, '0'),
(104, '色带', '', '', 101, 50, '', '', 0, '', 1, 0, '0'),
(117, '便携相机', '', '', 116, 50, '', '', 0, '', 1, 0, ''),
(118, '单反相机', '', '', 116, 50, '', '', 0, '', 1, 0, ''),
(119, '数码摄像机', '', '', 116, 50, '', '', 0, '', 1, 0, ''),
(120, '运动服', '', 'MP3/MP4  MP3/MP4配件 苹果配件 录音笔', 16, 1, '', '', 0, '', 1, 0, ''),
(110, '针织衫', '', '电吹风 电蚊香', 21, 50, '', '3', 0, '', 1, 0, ''),
(112, 'UPS电源', '', '', 74, 50, '', '', 0, '', 1, 0, '0'),
(217, '衬衫', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(625, '夹克', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(116, '运动包', '', '便携相机\r\n单反相机\r\n数码摄像机', 16, 3, '', '', 0, '', 1, 0, ''),
(201, 'MP3/MP4', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(132, '男装', '', '', 0, 9, '', '', 1, '', 1, 0, ''),
(114, '套头衫', '', '', 110, 50, '', '', 0, '', 1, 0, ''),
(115, '开衫', '', '', 110, 50, '', '', 0, '', 1, 0, ''),
(121, '男鞋', '', '乳液/面霜 身体护理 彩妆 香水', 44, 50, '', '', 0, '', 1, 0, ''),
(122, '乳液/面霜', '', '', 121, 50, '', '', 0, '', 1, 0, ''),
(123, '身体护理', '', '', 121, 50, '', '', 0, '', 1, 0, ''),
(124, '裙', '', '动漫人物 遥控玩具 毛绒布艺 益智玩具', 21, 50, '', '', 0, '', 1, 0, ''),
(125, '半裙', '', '', 124, 50, '', '', 0, '', 1, 0, ''),
(126, '连衣裙', '', '', 124, 50, '', '', 0, '', 1, 0, ''),
(127, '吊带裙', '', '', 124, 50, '', '', 0, '', 1, 0, ''),
(216, '男装', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(215, '箱包', '', '', 0, 14, '', '', 0, '', 1, 0, ''),
(634, '西裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(627, '大衣', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(626, '风衣', '', '', 39, 50, '', '', 0, '', 1, 0, ''),
(138, '针织衫', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(139, '针织背心', '', '', 138, 50, '', '', 0, '', 1, 0, ''),
(140, '套头衫', '', '', 138, 50, '', '', 0, '', 1, 0, ''),
(141, '开衫', '', '', 138, 50, '', '', 0, '', 1, 0, ''),
(628, '短袖针织衫', '', '', 110, 50, '', '', 0, '', 1, 0, ''),
(629, '休闲分裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(630, '休闲短裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(631, '哈伦裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(632, '连身裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(633, '打底裤', '', '', 34, 50, '', '', 0, '', 1, 0, ''),
(154, '内衣', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(635, '中老年服装', '', '', 21, 50, '', '', 0, '', 1, 0, ''),
(156, '内衣/套装', '', '', 154, 50, '', '', 0, '', 1, 0, ''),
(157, '袜子', '', '', 154, 50, '', '', 0, '', 1, 0, ''),
(158, '家居服', '', '', 154, 50, '', '', 0, '', 1, 0, ''),
(159, '内裤', '', '', 154, 50, '', '', 0, '', 1, 0, ''),
(160, '外套', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(161, '皮衣/皮草', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(162, '卫衣', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(163, '风衣', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(164, '大衣', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(166, '西服', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(167, '棉服', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(168, '羽绒服', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(169, '夹克', '', '', 160, 50, '', '', 0, '', 1, 0, ''),
(170, '裤子', '', '', 132, 50, '', '', 1, '', 1, 9, '246,245,242,244,243'),
(171, '西裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(172, '牛仔中裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(173, '休闲裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(174, '牛仔裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(175, 'T恤', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(176, '长袖T恤', '', '', 175, 50, '', '', 0, '', 1, 0, ''),
(178, '短袖T恤', '', '', 175, 50, '', '', 0, '', 1, 0, ''),
(179, '背心', '', '', 175, 50, '', '', 0, '', 1, 0, ''),
(639, '裤装', '', '', 635, 50, '', '', 0, '', 1, 0, ''),
(638, '衬衫', '', '', 635, 50, '', '', 0, '', 1, 0, ''),
(182, 'POLO衫', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(185, '长袖POLO衫', '', '', 182, 50, '', '', 0, '', 1, 0, ''),
(636, 'T恤', '', '', 635, 50, '', '', 0, '', 1, 0, ''),
(188, '短袖POLO衫', '', '', 182, 50, '', '', 0, '', 1, 0, ''),
(637, '针织衫', '', '', 635, 50, '', '', 0, '', 1, 0, ''),
(190, '衬衫', '', '', 132, 50, '', '', 0, '', 1, 0, ''),
(193, '短袖衬衫', '', '', 190, 50, '', '', 0, '', 1, 0, ''),
(194, '长袖衬衫', '', '', 190, 50, '', '', 0, '', 1, 0, ''),
(623, '休闲短裤', '', '', 170, 50, '', '', 0, '', 1, 0, ''),
(202, 'MID', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(203, '耳机', '', '', 116, 50, '', '', 0, '', 1, 0, ''),
(204, '音箱', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(205, '高清播放器', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(206, '电子书', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(207, '电子词典', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(208, 'MP3/MP4配件', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(209, '录音笔', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(210, '麦克风', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(211, '专业音频', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(212, '电子教育', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(213, '数码相框', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(214, '苹果配件', '', '', 120, 50, '', '', 0, '', 1, 0, ''),
(218, 'T恤', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(219, '针织', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(220, '外套', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(221, '羽绒服', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(222, '裤子', '', '', 216, 50, '', '', 0, '', 1, 0, ''),
(223, '女装', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(224, '衬衫', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(225, 'T恤', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(226, '针织', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(227, '外套', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(228, '裙子', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(229, '羽绒服', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(230, '裤子', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(231, '孕妇装', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(232, '皮衣', '', '', 223, 50, '', '', 0, '', 1, 0, ''),
(233, '运动', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(234, '运动装', '', '', 233, 50, '', '', 0, '', 1, 0, ''),
(235, '运动鞋', '', '', 233, 50, '', '', 0, '', 1, 0, ''),
(236, '运动配件', '', '', 233, 50, '', '', 0, '', 1, 0, ''),
(237, '内衣', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(238, '文胸', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(239, '内裤', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(240, '背心', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(241, '塑身', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(242, '睡衣', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(243, '家居', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(244, '袜子', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(245, '情趣', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(246, '保暖', '', '', 237, 50, '', '', 0, '', 1, 0, ''),
(247, '配饰', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(248, '眼镜', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(249, '腰带', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(250, '帽子', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(251, '围巾', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(252, '手套', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(253, '领带', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(254, '袖扣', '', '', 247, 50, '', '', 0, '', 1, 0, ''),
(255, '鞋靴', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(256, '男鞋', '', '', 255, 50, '', '', 0, '', 1, 0, ''),
(257, '女鞋', '', '', 255, 50, '', '', 0, '', 1, 0, ''),
(258, '拖鞋', '', '', 255, 50, '', '', 0, '', 1, 0, ''),
(259, '童鞋', '', '', 255, 50, '', '', 0, '', 1, 0, ''),
(260, '童装', '', '', 215, 50, '', '', 0, '', 1, 0, ''),
(261, '女童', '', '', 260, 50, '', '', 0, '', 1, 0, ''),
(262, '男童', '', '', 260, 50, '', '', 0, '', 1, 0, ''),
(263, '宝宝服饰', '', '', 260, 50, '', '', 0, '', 1, 0, ''),
(264, '亲子装', '', '', 260, 50, '', '', 0, '', 1, 0, ''),
(265, '配饰', '', '', 0, 15, '', '', 0, '', 1, 0, ''),
(266, '饰品', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(267, '洁面乳', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(268, '爽肤水', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(269, '精华露', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(270, '乳液面霜', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(271, '面膜面贴', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(272, '眼部护理', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(273, '颈部护理', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(274, 'T区护理', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(275, '护肤套装', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(276, '防晒隔离', '', '', 266, 50, '', '', 0, '', 1, 0, ''),
(277, '配饰', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(278, '洗发护发', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(279, '染发/造型', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(280, '沐浴', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(281, '磨砂/浴盐', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(282, '身体乳', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(283, '手工/香皂', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(284, '香薰精油', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(285, '纤体瘦身', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(286, '脱毛膏', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(287, '手足护理', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(288, '洗护套装', '', '', 277, 50, '', '', 0, '', 1, 0, ''),
(289, '手表', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(290, '牙膏/牙粉', '', '', 289, 50, '', '', 0, '', 1, 0, ''),
(291, '漱口水', '', '', 289, 50, '', '', 0, '', 1, 0, ''),
(292, '牙刷/牙线', '', '', 289, 50, '', '', 0, '', 1, 0, ''),
(293, '女性护理', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(294, '卫生巾', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(295, '卫生护垫', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(296, '洗液', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(297, '美容食品', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(298, '其它', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(299, '男士护理', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(300, '脸部', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(301, '眼部', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(302, '身体护理', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(303, '男士香水', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(304, '剃须', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(305, '防脱洗护', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(306, '唇膏', '', '', 299, 50, '', '', 0, '', 1, 0, ''),
(307, '魅力彩妆', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(308, '粉底/遮瑕', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(309, '腮红', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(310, '眼影/眼线', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(311, '眉笔', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(312, '睫毛膏', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(313, '唇膏唇彩', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(314, '彩妆组合', '', '', 307, 50, '', '', 0, '', 1, 0, ''),
(315, '卸妆', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(316, '美甲', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(317, '彩妆工具', '', '', 293, 50, '', '', 0, '', 1, 0, ''),
(318, '帽子', '', '', 265, 50, '', '', 0, '', 1, 0, ''),
(319, '女士香水', '', '', 318, 50, '', '', 0, '', 1, 0, ''),
(320, '男士香水', '', '', 318, 50, '', '', 0, '', 1, 0, ''),
(321, '组合套装', '', '', 318, 50, '', '', 0, '', 1, 0, ''),
(322, '迷你香水', '', '', 318, 50, '', '', 0, '', 1, 0, ''),
(323, '香体走珠', '', '', 318, 50, '', '', 0, '', 1, 0, ''),
(324, '美妆', '', '', 0, 16, '', '', 0, '', 1, 0, ''),
(325, '个人洗护', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(326, '钱包/卡包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(327, '手拿包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(328, '单肩包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(329, '双肩包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(330, '手提包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(331, '斜挎包', '', '', 325, 50, '', '', 0, '', 1, 0, ''),
(332, '时尚男包', '', '', 324, 50, '', '', 0, '', 0, 0, ''),
(333, '钱包/手包', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(334, '男士手包', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(335, '腰带/礼盒', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(336, '商务公文包', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(337, '休闲包', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(338, '腰包', '', '', 332, 50, '', '', 0, '', 1, 0, ''),
(339, '功能箱包', '', '', 324, 50, '', '', 0, '', 0, 0, ''),
(340, '电脑数码包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(341, '拉杆箱', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(342, '旅行包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(343, '旅行配件', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(344, '运动包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(345, '登山包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(346, '妈咪包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(347, '书包', '', '', 339, 50, '', '', 0, '', 1, 0, ''),
(348, '香水精油', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(349, '火机烟具', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(350, '礼品文具', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(351, '瑞士军刀', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(352, '收藏品', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(353, '工艺摆件', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(354, '创意礼品', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(355, '礼卡礼券', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(356, '鲜花速递', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(357, '婚庆用品', '', '', 348, 50, '', '', 0, '', 1, 0, ''),
(358, '奢侈品', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(359, 'GUCCI', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(360, 'PRADA', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(361, 'FENDI', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(362, 'BURBERRY', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(363, 'BOTTEGA VENETA', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(364, 'DIOR', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(365, 'Ferragamo', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(366, 'MONTBLANC', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(367, 'ARMANI', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(368, 'RIMOWA', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(369, 'MIUMIU', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(370, 'BALENCIAGA', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(371, 'Dolce&Gabbana', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(372, 'MARC JACOBS', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(373, 'COACH', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(374, '更多品牌', '', '', 358, 50, '', '', 0, '', 1, 0, ''),
(375, '面部护理', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(376, '瑞士品牌', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(377, '国产品牌', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(378, '日本品牌', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(379, '时尚品牌', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(380, '闹钟挂钟', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(381, '儿童手表', '', '', 375, 50, '', '', 0, '', 1, 0, ''),
(382, '彩妆', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(383, '纯金K金饰品', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(384, '金银投资', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(385, '银饰', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(386, '钻石饰品', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(387, '翡翠玉石', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(388, '水晶玛瑙', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(389, '宝石珍珠', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(390, '时尚饰品', '', '', 382, 50, '', '', 0, '', 1, 0, ''),
(391, '家居', '', '', 0, 17, '', '', 0, '', 1, 0, ''),
(392, '户外鞋服', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(393, '户外服装', '', '', 392, 50, '', '', 0, '', 1, 0, ''),
(394, '户外鞋袜', '', '', 392, 50, '', '', 0, '', 1, 0, ''),
(395, '户外配饰', '', '', 392, 50, '', '', 0, '', 1, 0, ''),
(396, '户外装备', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(397, '帐篷', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(398, '睡袋', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(399, '登山攀岩', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(400, '户外背包', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(401, '户外照明', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(402, '户外垫子', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(403, '户外仪表', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(404, '户外工具', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(405, '望远镜', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(406, '垂钓用品', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(407, '旅游用品', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(408, '便携桌椅床', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(409, '烧烤用品', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(410, '野餐炊具', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(411, '军迷用品', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(412, '游泳用具', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(413, '泳衣', '', '', 396, 50, '', '', 0, '', 1, 0, ''),
(414, '运动器械', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(415, '健身器械', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(416, '运动器材', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(417, '防护器具', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(418, '骑行运动', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(419, '极限运动', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(420, '武术搏击', '', '', 414, 50, '', '', 0, '', 1, 0, ''),
(421, '纤体瑜伽', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(422, '瑜伽垫', '', '', 421, 50, '', '', 0, '', 1, 0, ''),
(423, '瑜伽服', '', '', 421, 50, '', '', 0, '', 1, 0, ''),
(424, '瑜伽配件', '', '', 421, 50, '', '', 0, '', 1, 0, ''),
(425, '瑜伽套装', '', '', 421, 50, '', '', 0, '', 1, 0, ''),
(426, '舞蹈鞋服', '', '', 421, 50, '', '', 0, '', 1, 0, ''),
(427, '体育娱乐', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(428, '羽毛球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(429, '乒乓球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(430, '篮球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(431, '足球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(432, '网球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(433, '排球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(434, '高尔夫球', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(435, '棋牌麻将', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(436, '其他', '', '', 427, 50, '', '', 0, '', 1, 0, ''),
(437, '成人用品', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(438, '安全避孕', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(439, '验孕测孕', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(440, '人体润滑', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(441, '情爱玩具', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(442, '情趣内衣', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(443, '组合套装', '', '', 437, 50, '', '', 0, '', 1, 0, ''),
(444, '保健器械', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(445, '养生器械', '', '', 444, 50, '', '', 0, '', 1, 0, ''),
(446, '保健用品', '', '', 444, 50, '', '', 0, '', 1, 0, ''),
(447, '康复辅助', '', '', 444, 50, '', '', 0, '', 1, 0, ''),
(448, '家庭护理', '', '', 444, 50, '', '', 0, '', 1, 0, ''),
(449, '急救卫生', '', '', 391, 50, '', '', 0, '', 1, 0, ''),
(450, '跌打损伤', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(451, '烫伤止痒', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(452, '防裂抗冻', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(453, '口腔咽部', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(454, '眼部保健', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(455, '鼻炎健康', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(456, '风湿骨痛', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(457, '生殖泌尿', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(458, '美体塑身', '', '', 449, 50, '', '', 0, '', 1, 0, ''),
(459, '手机数码', '', '', 0, 19, '', '', 0, '', 0, 0, ''),
(460, '奶粉', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(461, '1段', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(462, '2段', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(463, '3段', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(464, '4段', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(465, '羊奶粉', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(466, '特殊配方', '', '', 460, 50, '', '', 0, '', 1, 0, ''),
(467, '营养辅食', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(468, '营养品', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(469, '初乳', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(470, '米粉/菜粉', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(471, '泥糊/果汁', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(472, '肉松/饼干', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(473, '辅食/零食', '', '', 467, 50, '', '', 0, '', 1, 0, ''),
(474, '尿裤湿巾', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(475, '新生儿', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(476, 'S号', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(477, 'M号', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(478, 'L号', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(479, 'XL/XXL号', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(480, '裤型尿裤', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(481, '湿巾纸巾', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(482, '尿布/尿垫', '', '', 474, 50, '', '', 0, '', 1, 0, ''),
(483, '喂养用品', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(484, '奶瓶/奶嘴', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(485, '辅助用品', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(486, '吸奶器', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(487, '消毒用具', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(488, '餐具饮具', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(489, '牙胶', '', '', 483, 50, '', '', 0, '', 1, 0, ''),
(490, '洗护用品', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(491, '护肤用品', '', '', 490, 50, '', '', 0, '', 1, 0, ''),
(492, '洗浴用品', '', '', 490, 50, '', '', 0, '', 1, 0, ''),
(493, '洗发沐浴', '', '', 490, 50, '', '', 0, '', 1, 0, ''),
(494, '清洁用品', '', '', 490, 50, '', '', 0, '', 1, 0, ''),
(495, '护理用品', '', '', 490, 50, '', '', 0, '', 1, 0, ''),
(496, '童车童床', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(497, '婴儿推车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(498, '餐椅摇椅', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(499, '婴儿床', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(500, '学步车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(501, '三轮车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(502, '自行车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(503, '电动车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(504, '健身车', '', '', 496, 50, '', '', 0, '', 1, 0, ''),
(505, '寝具服饰', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(506, '婴儿服装', '', '', 505, 50, '', '', 0, '', 1, 0, ''),
(507, '婴儿鞋袜', '', '', 505, 50, '', '', 0, '', 1, 0, ''),
(508, '婴儿床品', '', '', 505, 50, '', '', 0, '', 1, 0, ''),
(509, '安全用品', '', '', 505, 50, '', '', 0, '', 1, 0, ''),
(510, '其他', '', '', 505, 50, '', '', 0, '', 1, 0, ''),
(511, '妈妈专区', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(512, '妈妈食品', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(513, '妈妈护理', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(514, '孕服/内衣', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(515, '防辐射服', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(516, '洗护/祛纹', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(517, '产后塑身', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(518, '包/背婴带', '', '', 511, 50, '', '', 0, '', 1, 0, ''),
(519, '玩具乐器', '', '', 459, 50, '', '', 0, '', 1, 0, ''),
(520, '适用年龄', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(521, '遥控/电动', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(522, '毛绒布艺', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(523, '娃娃玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(524, '模型玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(525, '健身玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(526, '动漫玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(527, '益智玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(528, '积木拼插', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(529, 'DIY玩具', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(530, '创意减压', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(531, '乐器相关', '', '', 519, 50, '', '', 0, '', 1, 0, ''),
(532, '食品酒饮', '', '', 0, 19, '', '', 0, '', 0, 0, ''),
(533, '进口食品', '', '', 532, 1, '', '', 0, '', 1, 0, ''),
(534, '饼干蛋糕', '', '', 533, 50, '', '', 0, '', 1, 0, ''),
(535, '糖果巧克力', '', '', 533, 50, '', '', 0, '', 1, 0, ''),
(536, '休闲零食', '', '', 533, 50, '', '', 0, '', 1, 0, ''),
(537, '冲调饮品', '', '', 533, 50, '', '', 0, '', 1, 0, ''),
(538, '粮油调味', '', '', 533, 50, '', '', 0, '', 1, 0, ''),
(539, '地方特产', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(540, '华北', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(541, '西北', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(542, '西南', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(543, '东北', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(544, '华南', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(545, '华东', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(546, '华中', '', '', 539, 50, '', '', 0, '', 1, 0, ''),
(547, '休闲食品', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(548, '休闲零食', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(549, '坚果炒货', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(550, '肉干肉松', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(551, '蜜饯果脯', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(552, '糖果/巧克力', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(553, '饼干蛋糕', '', '', 547, 50, '', '', 0, '', 1, 0, ''),
(554, '粮油调味', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(555, '米面杂粮', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(556, '食用油', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(557, '调味品', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(558, '南北干货', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(559, '方便食品', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(560, '有机食品', '', '', 554, 50, '', '', 0, '', 1, 0, ''),
(561, '酒饮冲调', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(562, '白酒/黄酒', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(563, '葡萄酒', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(564, '洋酒', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(565, '啤酒', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(566, '饮料', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(567, '冲调', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(568, '咖啡/奶茶', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(569, '茗茶', '', '', 561, 50, '', '', 0, '', 1, 0, ''),
(570, '营养健康', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(571, '基础营养', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(572, '美体养颜', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(573, '滋补调养', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(574, '骨骼健康', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(575, '保健茶饮', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(576, '成分保健', '', '', 570, 50, '', '', 0, '', 1, 0, ''),
(577, '亚健康', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(578, '调节三高', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(579, '心脑养护', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(580, '改善睡眠', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(581, '肝肾养护', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(582, '免疫调节', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(583, '更多调理', '', '', 577, 50, '', '', 0, '', 1, 0, ''),
(584, '健康礼品', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(585, '参茸礼品', '', '', 584, 50, '', '', 0, '', 1, 0, ''),
(586, '更多礼品', '', '', 584, 50, '', '', 0, '', 1, 0, ''),
(587, '生鲜食品', '', '', 532, 50, '', '', 0, '', 1, 0, ''),
(588, '水果', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(589, '蔬菜', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(590, '海鲜水产', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(591, '禽蛋', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(592, '鲜肉', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(593, '加工类肉食', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(594, '冻品', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(595, '半成品', '', '', 587, 50, '', '', 0, '', 1, 0, ''),
(596, '电脑办公', '', '', 0, 20, '', '', 0, '', 0, 0, ''),
(597, '彩票', '', '', 596, 50, '', '', 0, '', 1, 0, ''),
(598, '双色球', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(599, '大乐透', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(600, '福彩3D', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(601, '排列三', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(602, '排列五', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(603, '七星彩', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(604, '七乐彩', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(605, '竞彩足球', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(606, '竞彩篮球', '', '', 597, 50, '', '', 0, '', 1, 0, ''),
(607, '机票', '', '', 596, 50, '', '', 0, '', 1, 0, ''),
(608, '国内机票', '', '', 607, 50, '', '', 0, '', 1, 0, ''),
(609, '酒店', '', '', 596, 50, '', '', 0, '', 1, 0, ''),
(610, '国内酒店', '', '', 609, 50, '', '', 0, '', 1, 0, ''),
(611, '充值', '', '', 596, 50, '', '', 0, '', 1, 0, ''),
(612, '手机充值', '', '', 611, 50, '', '', 0, '', 1, 0, ''),
(613, '游戏充值', '', '', 611, 50, '', '', 0, '', 1, 0, ''),
(614, 'QQ充值', '', '', 611, 50, '', '', 0, '', 1, 0, ''),
(615, '票务', '', '', 596, 50, '', '', 0, '', 1, 0, ''),
(616, '音乐会', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(617, '演唱会', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(618, '话剧歌剧', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(619, '舞蹈芭蕾', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(620, '戏曲综艺', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(621, '体育赛事', '', '', 615, 50, '', '', 0, '', 1, 0, ''),
(622, '家电', '', '', 0, 50, '', '', 0, '', 0, 0, ''),
(640, '裙装', '', '', 635, 50, '', '', 0, '', 1, 0, ''),
(641, '内衣', '', '', 21, 50, '', '', 0, '', 1, 0, ''),
(642, '文胸', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(643, '内裤', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(644, '睡衣', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(645, '美体内衣', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(646, '套装/打底', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(647, '丝袜/裤袜', '', '', 641, 50, '', '', 0, '', 1, 0, ''),
(648, '日用', '', '', 622, 50, '', '', 0, '', 1, 0, ''),
(649, '厨房', '', '', 622, 50, '', '', 0, '', 1, 0, ''),
(650, '个人护理', '', '', 622, 50, '', '', 0, '', 1, 0, ''),
(651, '电饭煲', '', '', 648, 50, '', '', 0, '', 1, 0, ''),
(652, '豆浆机', '', '', 648, 50, '', '', 0, '', 1, 0, ''),
(653, '电压力锅', '', '', 648, 50, '', '', 0, '', 1, 0, ''),
(654, '榨汁机', '', '', 648, 50, '', '', 0, '', 1, 0, ''),
(655, '煮蛋器', '', '', 648, 50, '', '', 0, '', 1, 0, ''),
(656, '电风扇', '', '', 649, 50, '', '', 0, '', 1, 0, ''),
(657, '加湿器/净化', '', '', 649, 50, '', '', 0, '', 1, 0, ''),
(658, '挂烫机/烘干', '', '', 649, 50, '', '', 0, '', 1, 0, ''),
(659, '照明', '', '', 649, 50, '', '', 0, '', 1, 0, ''),
(660, '美容/美发', '', '', 650, 50, '', '', 0, '', 1, 0, ''),
(661, '剃须刀', '', '', 650, 50, '', '', 0, '', 1, 0, ''),
(662, '美妆团购', '', '', 324, 50, '', '', 0, '', 1, 0, ''),
(663, '面部护理', '', '', 662, 50, '', '', 0, '', 1, 0, ''),
(664, '时尚彩妆', '', '', 662, 50, '', '', 0, '', 1, 0, ''),
(665, '个人洗护', '', '', 662, 50, '', '', 0, '', 1, 0, ''),
(666, '其他护理', '', '', 662, 50, '', '', 0, '', 1, 0, ''),
(667, '洁面', '', '', 665, 50, '', '', 0, '', 1, 0, ''),
(668, '爽肤水', '', '', 665, 50, '', '', 0, '', 1, 0, ''),
(669, '乳液面霜', '', '', 665, 50, '', '', 0, '', 1, 0, ''),
(670, '精华', '', '', 665, 50, '', '', 0, '', 1, 0, ''),
(671, '隔离/BB霜', '', '', 663, 50, '', '', 0, '', 1, 0, ''),
(672, '粉底粉饼', '', '', 663, 50, '', '', 0, '', 1, 0, ''),
(673, '眼影/眼线', '', '', 663, 50, '', '', 0, '', 1, 0, ''),
(674, '睫毛膏', '', '', 663, 50, '', '', 0, '', 1, 0, ''),
(675, '沐浴/润肤', '', '', 666, 50, '', '', 0, '', 1, 0, ''),
(676, '洗发/护发', '', '', 666, 50, '', '', 0, '', 1, 0, ''),
(677, '美发造型', '', '', 666, 50, '', '', 0, '', 1, 0, ''),
(678, '口腔护理', '', '', 666, 50, '', '', 0, '', 1, 0, ''),
(679, '眉笔眉粉', '', '', 664, 50, '', '', 0, '', 1, 0, ''),
(680, '唇部彩妆', '', '', 664, 50, '', '', 0, '', 1, 0, ''),
(681, '腮红', '', '', 664, 50, '', '', 0, '', 1, 0, ''),
(682, '美甲', '', '', 664, 50, '', '', 0, '', 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods`
--

CREATE TABLE IF NOT EXISTS `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=208 ;

--
-- 转存表中的数据 `ecs_goods`
--

INSERT INTO `ecs_goods` (`goods_id`, `cat_id`, `goods_sn`, `goods_name`, `goods_name_style`, `click_count`, `brand_id`, `provider_name`, `goods_number`, `goods_weight`, `market_price`, `shop_price`, `promote_price`, `promote_start_date`, `promote_end_date`, `warn_number`, `keywords`, `goods_brief`, `goods_desc`, `goods_thumb`, `goods_img`, `original_img`, `is_real`, `extension_code`, `is_on_sale`, `is_alone_sale`, `integral`, `add_time`, `sort_order`, `is_delete`, `is_best`, `is_new`, `is_hot`, `is_promote`, `bonus_type_id`, `last_update`, `goods_type`, `seller_note`, `give_integral`, `rank_integral`, `suppliers_id`, `is_check`, `is_shipping`) VALUES
(134, 29, 'ECS000000', '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', '+', 624, 11, '', 97, '0.000', '144.00', '120.00', '110.00', 1380614400, 1948608000, 1, '', '国庆大促，下单再减10%', '<p>&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_1.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg" alt="韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_2.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg" alt="韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://imgtest.meiliworks.com/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_3.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg" alt="韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_4.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg" alt="韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p>&nbsp;</p>', 'images/201410/thumb_img/134_thumb_G_1413930635678.jpg', 'images/201410/goods_img/134_G_1413930635959.jpg', 'images/201410/source_img/134_G_1413930635467.jpg', 1, '', 1, 1, 1, 1380647163, 1, 0, 1, 0, 1, 1, 0, 1413930698, 14, '', -1, -1, 0, NULL, 0),
(136, 29, 'ECS000136', '米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴', '+', 8, 2, '', 99, '0.000', '144.00', '120.00', '110.00', 1380614400, 1980230400, 1, '', '国庆大促，下单再减10%', '<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/e2/d3/187ad3bec2bc300be51107797424_640_900_2_1.cc.jpg_c844f589_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/e2/d3/187ad3bec2bc300be51107797424_640_900_2_2.cc.jpg_c844f589_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/db/70/8bb143ec35d816ad456074996d1f_640_900_2_1.cc.jpg_67be050a_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/db/70/8bb143ec35d816ad456074996d1f_640_900_2_2.cc.jpg_67be050a_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/1e/73/3340eb562c754bbb7c692fbea130_640_900_2_1.cc.jpg_7d057ebb_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/1e/73/3340eb562c754bbb7c692fbea130_640_900_2_2.cc.jpg_7d057ebb_q0_1_1_0_710_710.jpg" alt="米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>', 'images/201410/thumb_img/136_thumb_G_1413930502490.jpg', 'images/201410/goods_img/136_G_1413930502218.jpg', 'images/201410/source_img/136_G_1413930502372.jpg', 1, '', 1, 1, 1, 1380647873, 2, 0, 1, 0, 1, 1, 0, 1413930542, 14, '', -1, -1, 0, NULL, 0),
(137, 29, 'ECS000137', '蜜糖家 METIME 秋季新品 自制薄毛呢西装长马甲', '+', 2, 3, '', 99, '0.000', '144.00', '120.00', '0.00', 0, 0, 1, '', '国庆大促，下单再减10%', '<p>&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/5a/1b/0b94da7cecba6dd72ead532854e5_640_1260_2_1.cg.jpg_94fbf1f5_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/5a/1b/0b94da7cecba6dd72ead532854e5_640_1260_2_2.cg.jpg_94fbf1f5_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d03.res.meilishuo.net/pic/a/5a/c2/d87c5e88bb170a482932ec6e6803_800_1125_2_1.cg.jpg_9efd5827_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/5a/c2/d87c5e88bb170a482932ec6e6803_800_1125_2_2.cg.jpg_9efd5827_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/9d/7f/e45412a45aefd9319480325d0a32_800_1125_2_1.ch.jpg_94b4eafe_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/9d/7f/e45412a45aefd9319480325d0a32_800_1125_2_2.ch.jpg_94b4eafe_q0_1_1_0_710_710.jpg" alt="薄毛呢西装长马甲" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>', 'images/201410/thumb_img/137_thumb_G_1413930199355.jpg', 'images/201410/goods_img/137_G_1413930199852.jpg', 'images/201410/source_img/137_G_1413930199712.jpg', 1, '', 1, 1, 1, 1380647890, 100, 0, 0, 1, 1, 0, 0, 1413930269, 14, '', -1, -1, 0, NULL, 0),
(138, 29, 'ECS000138', '现货发售 马海毛保暖毛衣', '+', 0, 4, '', 99, '0.000', '144.00', '120.00', '0.00', 0, 0, 1, '', '国庆大促，下单再减10%', '<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/94/06/952aec152f113d236c94888aceee_640_1260_2_1.ch.jpg_6606d987_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/94/06/952aec152f113d236c94888aceee_640_1260_2_2.ch.jpg_6606d987_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/51/d2/a95786fa4a551a9688339517ba1c_800_1125_2_1.cf.jpg_c096dbd1_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/51/d2/a95786fa4a551a9688339517ba1c_800_1125_2_2.cf.jpg_c096dbd1_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/49/68/046750acfae28bd0396fea6a2559_800_1125_2_1.cf.jpg_287145f6_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/49/68/046750acfae28bd0396fea6a2559_800_1125_2_2.cf.jpg_287145f6_q0_1_1_0_710_710.jpg" alt="马海毛保暖毛衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div>&nbsp;</div>', 'images/201410/thumb_img/138_thumb_G_1413929827659.jpg', 'images/201410/goods_img/138_G_1413929827627.jpg', 'images/201410/source_img/138_G_1413929827744.jpg', 1, '', 1, 1, 1, 1380647918, 100, 0, 1, 1, 1, 0, 0, 1413929868, 14, '', -1, -1, 0, NULL, 0),
(139, 29, 'ECS000139', '秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装', '+', 3, 5, '', 99, '0.000', '144.00', '120.00', '110.00', 1381219200, 1633680000, 1, '', '国庆大促，下单再减10%', '<p>&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/24/ee/261b146a498fdcf84e42ce957331_640_900_2_1.cc.jpg_e8b99d4f_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/24/ee/261b146a498fdcf84e42ce957331_640_900_2_2.cc.jpg_e8b99d4f_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/12/39/80dbaa86f15556efa4a623b5d2ca_824_1000_2_1.cc.jpg_e362251b_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/12/39/80dbaa86f15556efa4a623b5d2ca_824_1000_2_2.cc.jpg_e362251b_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 151px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/19/cc/0a2998ed6d7ba254d0fd60ac8801_809_1000_2_1.cc.jpg_ec4ef9ec_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/19/cc/0a2998ed6d7ba254d0fd60ac8801_809_1000_2_2.cc.jpg_ec4ef9ec_q0_1_1_0_710_710.jpg" alt="秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 167px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>', 'images/201410/thumb_img/139_thumb_G_1413929154297.jpg', 'images/201410/goods_img/139_G_1413929154772.jpg', 'images/201410/source_img/139_G_1413929154930.jpg', 1, '', 1, 1, 1, 1380647936, 100, 0, 1, 1, 0, 1, 0, 1413929318, 14, '', -1, -1, 0, NULL, 0),
(140, 29, 'ECS000140', '毛貂毛边卫衣套装', '+', 11, 6, '', 99, '0.000', '144.00', '120.00', '110.00', 1380614400, 1664611200, 1, '', '国庆大促，下单再减10%', '<p>&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/7a/54/de9cee1a3fce50be001fdb161b69_640_1260_2_1.cf.jpg_2a15cebf_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/7a/54/de9cee1a3fce50be001fdb161b69_640_1260_2_2.cf.jpg_2a15cebf_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/d2/fb/9c0b542ad856214e6ca2b818909d_800_1125_2_1.cg.jpg_64f6b7a3_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d03.res.meilishuo.net/pic/a/d2/fb/9c0b542ad856214e6ca2b818909d_800_1125_2_2.cg.jpg_64f6b7a3_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/e2/a5/65d4a6fbc66d92b90958edf56648_800_1125_2_1.ch.jpg_eacf50ed_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/e2/a5/65d4a6fbc66d92b90958edf56648_800_1125_2_2.ch.jpg_eacf50ed_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/04/69/e21a0c3a15b37de005b6b1f9b69e_800_1125_2_1.cg.jpg_da5b3260_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/04/69/e21a0c3a15b37de005b6b1f9b69e_800_1125_2_2.cg.jpg_da5b3260_q0_1_1_0_710_710.jpg" alt="毛貂毛边卫衣套装" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>', 'images/201410/thumb_img/140_thumb_G_1413928959052.jpg', 'images/201410/goods_img/140_G_1413928959785.jpg', 'images/201410/source_img/140_G_1413928959907.jpg', 1, '', 1, 1, 1, 1380647948, 3, 0, 0, 1, 1, 1, 0, 1413928959, 14, '', -1, -1, 0, NULL, 0),
(141, 29, 'ECS000141', '高质感毛呢大衣', '+', 46, 7, '', 99, '0.000', '144.00', '120.00', '110.00', 1381219200, 1633680000, 1, '', '国庆大促，下单再减10%', '<p>&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/0a/7d/8b71d164b6d2646705412ffb4aa9_640_1260_2_1.cg.jpg_cb75fa30_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d05.res.meilishuo.net/pic/a/0a/7d/8b71d164b6d2646705412ffb4aa9_640_1260_2_2.cg.jpg_cb75fa30_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d04.res.meilishuo.net/pic/a/36/ad/2b9ee7382ba0542810239bcc70a6_800_1125_2_1.ch.jpg_54c0cd5e_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d03.res.meilishuo.net/pic/a/36/ad/2b9ee7382ba0542810239bcc70a6_800_1125_2_2.ch.jpg_54c0cd5e_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d02.res.meilishuo.net/pic/a/10/4d/4dda4d3ed817afaed6cc6365d182_800_1125_2_1.ch.jpg_ac5149a5_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/10/4d/4dda4d3ed817afaed6cc6365d182_800_1125_2_2.ch.jpg_ac5149a5_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<p class="pro_txt" style="margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;">&nbsp;</p>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/65/cd/5406b7ab4fa92ba8910d7cf0f613_800_1125_2_1.cg.jpg_7bbd614f_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>\r\n<div class="more_pic" style="margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;"><img src="http://d06.res.meilishuo.net/pic/a/65/cd/5406b7ab4fa92ba8910d7cf0f613_800_1125_2_2.cg.jpg_7bbd614f_q0_1_1_0_710_710.jpg" alt="高质感毛呢大衣" class="load_img" style="border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;" /></div>', 'images/201410/thumb_img/141_thumb_G_1413926445469.jpg', 'images/201410/goods_img/141_G_1413926445159.jpg', 'images/201410/source_img/141_G_1413926445378.jpg', 1, '', 1, 1, 1, 1380647968, 100, 0, 1, 1, 0, 1, 0, 1413926537, 14, '', -1, -1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_activity`
--

CREATE TABLE IF NOT EXISTS `ecs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `ecs_goods_activity`
--

INSERT INTO `ecs_goods_activity` (`act_id`, `act_name`, `act_desc`, `act_type`, `goods_id`, `goods_name`, `start_time`, `end_time`, `is_finished`, `ext_info`, `product_id`) VALUES
(1, '夺宝奇兵之诺基亚N96', '新一轮的夺宝开始了\n本期是 诺基亚n96', 0, 23, '诺基亚N96', 1242107580, 1242193980, 0, 'a:4:{s:11:"start_price";s:4:"1.00";s:9:"end_price";s:6:"800.00";s:9:"max_price";i:0;s:11:"cost_points";s:1:"1";}', 0),
(2, '夺宝奇兵之夏新N7', '本期的夺宝奖品是 夏新N7', 0, 17, '夏新N7', 1242107820, 1250661420, 0, 'a:4:{s:11:"start_price";s:4:"1.00";s:9:"end_price";s:6:"800.00";s:9:"max_price";i:0;s:11:"cost_points";s:1:"1";}', 0),
(18, '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', '', 1, 134, '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', 1413878400, 1729843200, 0, 'a:4:{s:12:"price_ladder";a:1:{i:0;a:2:{s:6:"amount";i:10;s:5:"price";d:28;}}s:15:"restrict_amount";i:100;s:13:"gift_integral";i:30;s:7:"deposit";d:30;}', 0),
(4, '拍卖活动——索爱C702c', '', 2, 10, '索爱C702c', 1242144000, 1242403200, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:0;s:9:"end_price";i:0;s:9:"amplitude";d:20;s:6:"no_top";i:1;}', 0),
(5, '摩托罗拉E8 大礼包', '礼包大优惠', 4, 31, '摩托罗拉E8 ', 1242110400, 1252046400, 0, 'a:1:{s:13:"package_price";s:4:"1430";}', 0),
(6, '诺基亚N85大礼包', '诺基亚N85超值大礼包', 4, 32, '诺基亚N85', 1242110760, 1248936360, 0, 'a:1:{s:13:"package_price";s:4:"3150";}', 0),
(9, '拍卖活动一', '', 2, 33, '索尼（SONY）32英寸 高清 液晶电视 KLV-32S550A', 1278057600, 1404979200, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:10;s:6:"no_top";i:0;}', 0),
(10, '拍卖活动二', '', 2, 40, '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', 1277971200, 1341561600, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:10;s:6:"no_top";i:0;}', 0),
(11, '拍卖活动三', '', 2, 38, '三星（SAMSUNG）26英寸 高清液晶电视LA32B350F1', 1278057600, 1309939200, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:0;s:6:"no_top";i:0;}', 0),
(12, '拍卖活动四', '', 2, 50, '力开力朗双肩背包-休闲系列324灰色', 1278057600, 1404633600, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:0;s:6:"no_top";i:0;}', 0),
(14, '拍卖活动五', '', 2, 35, '飞利浦 42英寸 全高清 液晶电视 42PFL5609', 1278057600, 1688630400, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:0;s:6:"no_top";i:0;}', 0),
(15, '拍卖活动六', '', 2, 49, '美的（Midea）空气加湿器 S30U-M1', 1278057600, 1783324800, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:100;s:9:"end_price";d:1000;s:9:"amplitude";d:0;s:6:"no_top";i:0;}', 0),
(16, '拍卖活动七', '', 2, 48, '尼康（Nikon）D90 （18-105/3.5-5.6VR）防抖镜头 单反套机', 1278057600, 2035785600, 0, 'a:5:{s:7:"deposit";d:0;s:11:"start_price";d:10;s:9:"end_price";d:1000;s:9:"amplitude";d:0;s:6:"no_top";i:0;}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_attr`
--

CREATE TABLE IF NOT EXISTS `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3791 ;

--
-- 转存表中的数据 `ecs_goods_attr`
--

INSERT INTO `ecs_goods_attr` (`goods_attr_id`, `goods_id`, `attr_id`, `attr_value`, `attr_price`) VALUES
(2291, 141, 246, 'XL', ''),
(2290, 141, 246, 'L', ''),
(2289, 141, 246, 'M', ''),
(2288, 141, 246, 'XXL', ''),
(2287, 141, 245, '红', ''),
(2286, 141, 245, '蓝', ''),
(2285, 141, 245, '黄', ''),
(2833, 141, 244, '撞色', '0'),
(2283, 141, 243, '长袖', '0'),
(2834, 141, 242, '甜美淑女', '0'),
(2271, 140, 246, 'XXL', ''),
(2270, 140, 246, 'M', ''),
(2269, 140, 246, 'L', ''),
(2268, 140, 246, 'XL', ''),
(2267, 140, 245, '黄', ''),
(2266, 140, 245, '蓝', ''),
(2265, 140, 245, '红', ''),
(2835, 140, 244, '小碎花', '0'),
(2836, 140, 243, '短袖', '0'),
(2837, 140, 242, '日韩', '0'),
(2251, 139, 246, 'XL', ''),
(2250, 139, 246, 'L', ''),
(2249, 139, 246, 'M', ''),
(2248, 139, 246, 'XXL', ''),
(2247, 139, 245, '红', ''),
(2246, 139, 245, '蓝', ''),
(2245, 139, 245, '黄', ''),
(2838, 139, 244, '印花/绣花', '0'),
(2839, 139, 243, '七分袖', '0'),
(2840, 139, 242, '简约', '0'),
(2231, 138, 246, 'XXL', ''),
(2230, 138, 246, 'M', ''),
(2229, 138, 246, 'L', ''),
(2228, 138, 246, 'XL', ''),
(2227, 138, 245, '黄', ''),
(2226, 138, 245, '蓝', ''),
(2225, 138, 245, '红', ''),
(2224, 138, 244, '素色', '0'),
(2841, 138, 243, '无袖', '0'),
(2842, 138, 242, '民族', '0'),
(2211, 137, 246, 'XL', ''),
(2210, 137, 246, 'L', ''),
(2209, 137, 246, 'M', ''),
(2208, 137, 246, 'XXL', ''),
(2207, 137, 245, '红', ''),
(2206, 137, 245, '蓝', ''),
(2205, 137, 245, '黄', ''),
(2843, 137, 244, '条纹', '0'),
(2203, 137, 243, '长袖', '0'),
(2844, 137, 242, '街头', '0'),
(2191, 136, 246, 'XXL', ''),
(2190, 136, 246, 'M', ''),
(2189, 136, 246, 'L', ''),
(2188, 136, 246, 'XL', ''),
(2187, 136, 245, '黄', ''),
(2186, 136, 245, '蓝', ''),
(2185, 136, 245, '红', ''),
(2845, 136, 244, '大方格', '0'),
(2846, 136, 243, '短袖', '0'),
(2847, 136, 242, '卡通', '0'),
(3780, 0, 253, '500ml', ''),
(3550, 134, 251, '其他', '0'),
(2151, 134, 246, 'XXL', ''),
(2150, 134, 246, 'M', ''),
(2149, 134, 246, 'L', ''),
(2148, 134, 246, 'XL', ''),
(2147, 134, 245, '黄', ''),
(2146, 134, 245, '蓝', ''),
(2145, 134, 245, '红', ''),
(2850, 134, 244, '波点', '0'),
(2851, 134, 243, '七分袖', '0'),
(2852, 134, 242, '英伦学院', '0'),
(3549, 134, 250, '棉 聚酯纤维', '0'),
(3548, 134, 249, '套头', '0'),
(3547, 134, 248, '印花', '0'),
(3546, 134, 247, '圆领', '0'),
(3779, 0, 253, '600ml', ''),
(3778, 0, 253, '700ml', ''),
(3777, 0, 252, '彩色', ''),
(3776, 0, 252, '红色', ''),
(3775, 0, 252, '蓝色', ''),
(3774, 0, 257, '清洁 清爽', '0'),
(3772, 0, 255, '所有', '0'),
(3773, 0, 256, '润肤露/身体乳', '0'),
(3771, 0, 254, '全身', '0');

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_gallery`
--

CREATE TABLE IF NOT EXISTS `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=286 ;

--
-- 转存表中的数据 `ecs_goods_gallery`
--

INSERT INTO `ecs_goods_gallery` (`img_id`, `goods_id`, `img_url`, `img_desc`, `thumb_url`, `img_original`) VALUES
(276, 138, 'images/201410/goods_img/138_P_1413929842178.jpg', '', 'images/201410/thumb_img/138_thumb_P_1413929842899.jpg', 'images/201410/source_img/138_P_1413929842547.jpg'),
(268, 139, 'images/201410/goods_img/139_P_1413929169416.jpg', '', 'images/201410/thumb_img/139_thumb_P_1413929169547.jpg', 'images/201410/source_img/139_P_1413929169688.jpg'),
(264, 140, 'images/201410/goods_img/140_P_1413928911455.jpg', '', 'images/201410/thumb_img/140_thumb_P_1413928911277.jpg', 'images/201410/source_img/140_P_1413928911522.jpg'),
(261, 141, 'images/201410/goods_img/141_P_1413926538102.jpg', '', 'images/201410/thumb_img/141_thumb_P_1413926538790.jpg', 'images/201410/source_img/141_P_1413926538088.jpg'),
(279, 137, 'images/201410/goods_img/137_P_1413930214240.jpg', '', 'images/201410/thumb_img/137_thumb_P_1413930214488.jpg', 'images/201410/source_img/137_P_1413930214738.jpg'),
(260, 141, 'images/201410/goods_img/141_P_1413926445875.jpg', '', 'images/201410/thumb_img/141_thumb_P_1413926445217.jpg', 'images/201410/source_img/141_P_1413926445082.jpg'),
(263, 140, 'images/201410/goods_img/140_P_1413928892532.jpg', '', 'images/201410/thumb_img/140_thumb_P_1413928892626.jpg', 'images/201410/source_img/140_P_1413928892986.jpg'),
(267, 139, 'images/201410/goods_img/139_P_1413929154557.jpg', '', 'images/201410/thumb_img/139_thumb_P_1413929154414.jpg', 'images/201410/source_img/139_P_1413929154178.jpg'),
(275, 138, 'images/201410/goods_img/138_P_1413929842912.jpg', '', 'images/201410/thumb_img/138_thumb_P_1413929842231.jpg', 'images/201410/source_img/138_P_1413929842536.jpg'),
(278, 137, 'images/201410/goods_img/137_P_1413930199401.jpg', '', 'images/201410/thumb_img/137_thumb_P_1413930199371.jpg', 'images/201410/source_img/137_P_1413930199588.jpg'),
(285, 134, 'images/201410/goods_img/134_P_1413930635444.jpg', '', 'images/201410/thumb_img/134_thumb_P_1413930635465.jpg', 'images/201410/source_img/134_P_1413930635043.jpg'),
(262, 141, 'images/201410/goods_img/141_P_1413926538993.jpg', '', 'images/201410/thumb_img/141_thumb_P_1413926538534.jpg', 'images/201410/source_img/141_P_1413926538134.jpg'),
(265, 140, 'images/201410/goods_img/140_P_1413928911596.jpg', '', 'images/201410/thumb_img/140_thumb_P_1413928911009.jpg', 'images/201410/source_img/140_P_1413928911517.jpg'),
(266, 140, 'images/201410/goods_img/140_P_1413928959652.jpg', '', 'images/201410/thumb_img/140_thumb_P_1413928959255.jpg', 'images/201410/source_img/140_P_1413928959377.jpg'),
(269, 139, 'images/201410/goods_img/139_P_1413929169239.jpg', '', 'images/201410/thumb_img/139_thumb_P_1413929169012.jpg', 'images/201410/source_img/139_P_1413929169238.jpg'),
(274, 138, 'images/201410/goods_img/138_P_1413929827023.jpg', '', 'images/201410/thumb_img/138_thumb_P_1413929827258.jpg', 'images/201410/source_img/138_P_1413929827611.jpg'),
(280, 137, 'images/201410/goods_img/137_P_1413930214982.jpg', '', 'images/201410/thumb_img/137_thumb_P_1413930214448.jpg', 'images/201410/source_img/137_P_1413930214136.jpg'),
(284, 136, 'images/201410/goods_img/136_P_1413930502890.jpg', '', 'images/201410/thumb_img/136_thumb_P_1413930502854.jpg', 'images/201410/source_img/136_P_1413930502437.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `ecs_nav`
--

CREATE TABLE IF NOT EXISTS `ecs_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `ecs_nav`
--

INSERT INTO `ecs_nav` (`id`, `ctype`, `cid`, `name`, `ifshow`, `vieworder`, `opennew`, `url`, `type`) VALUES
(2, '', 0, '选购中心', 1, 2, 0, 'pick_out.php', 'top'),
(3, '', 0, '我的账户', 1, 0, 0, 'user.php', 'top'),
(4, 'c', 21, '女装', 1, 0, 0, 'category.php?id=21', 'middle'),
(6, '', 0, '标签云', 1, 5, 6, 'tag_cloud.php', 'top'),
(7, '', 0, '免责条款', 1, 1, 0, 'article.php?id=1', 'bottom'),
(8, '', 0, '隐私保护', 1, 2, 0, 'article.php?id=2', 'bottom'),
(9, '', 0, '咨询热点', 1, 3, 0, 'article.php?id=3', 'bottom'),
(10, '', 0, '联系我们', 1, 4, 0, 'article.php?id=4', 'bottom'),
(11, '', 0, '公司简介', 1, 5, 0, 'article.php?id=5', 'bottom'),
(12, '', 0, '批发方案', 1, 6, 0, 'wholesale.php', 'bottom'),
(14, '', 0, '配送方式', 1, 7, 0, 'myship.php', 'bottom'),
(18, 'c', 170, '裤子', 1, 2, 0, 'category.php?id=170', 'middle'),
(23, '', 0, '报价单', 1, 6, 0, 'quotation.php', 'top'),
(24, '', 0, '团购', 1, 23, 0, 'group_buy.php', 'middle'),
(26, 'c', 132, '男装', 1, 1, 0, 'category.php?id=132', 'middle'),
(33, '', 0, '品牌专区', 1, 7, 0, 'brand.php', 'middle');

-- --------------------------------------------------------

--
-- 表的结构 `ecs_attribute`
--

CREATE TABLE IF NOT EXISTS `ecs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- 转存表中的数据 `ecs_attribute`
--

INSERT INTO `ecs_attribute` (`attr_id`, `cat_id`, `attr_name`, `attr_input_type`, `attr_type`, `attr_values`, `attr_index`, `sort_order`, `is_linked`, `attr_group`) VALUES
(240, 12, '内置扬声器', 1, 0, '有', 0, 0, 0, 2),
(234, 12, '颜色', 1, 1, '黑色\r\n红色\r\n黄色', 0, 0, 0, 0),
(233, 12, '型号', 1, 0, 'TLM42V66PK', 0, 0, 0, 0),
(232, 12, '品牌', 1, 0, '海信 Hisense', 0, 0, 0, 0),
(243, 14, '袖型', 1, 0, '长袖\r\n短袖\r\n七分袖\r\n无袖', 0, 0, 0, 0),
(242, 14, '风格', 1, 0, '欧美复古\r\n英伦学院\r\n原创\r\n通勤\r\n甜美淑女\r\n日韩\r\n简约\r\n民族\r\n街头\r\n卡通', 0, 0, 0, 0),
(245, 14, '颜色', 1, 1, '红\r\n蓝\r\n黄', 0, 0, 0, 0),
(246, 14, '尺寸', 1, 1, 'XL\r\nL\r\nM\r\nXXL', 0, 0, 0, 0),
(244, 14, '花型', 1, 0, '素色\r\n条纹\r\n大方格\r\n千鸟格\r\n波点\r\n拼接\r\n撞色\r\n小碎花\r\n印花/绣花', 0, 0, 0, 0),
(241, 12, '内置扬声器数量', 1, 0, '2个', 0, 0, 0, 2),
(235, 12, '产品品类', 1, 0, '液晶电视', 0, 0, 0, 0),
(236, 12, '屏幕尺寸', 1, 1, '42英寸\r\n18村\r\n20寸', 0, 0, 0, 1),
(237, 12, '屏幕比例', 1, 0, '16:9', 0, 0, 0, 1),
(238, 12, '分辨率', 1, 0, '1920 x 1080', 0, 0, 0, 1),
(239, 12, '刷屏率', 1, 0, '60HZ', 0, 0, 0, 1),
(247, 14, '领型', 1, 0, '圆领', 0, 0, 0, 0),
(248, 14, '图案', 1, 0, '印花', 0, 0, 0, 0),
(249, 14, '款式', 1, 0, '套头', 0, 0, 0, 0),
(250, 14, '面料', 1, 0, '棉 聚酯纤维', 0, 0, 0, 0),
(251, 14, '衣门襟', 1, 0, '其他', 0, 0, 0, 0),
(252, 15, '颜色', 1, 1, '红色\r\n蓝色\r\n彩色', 0, 0, 0, 0),
(253, 15, '尺寸', 1, 1, '500ml\r\n600ml\r\n700ml', 0, 0, 0, 0),
(254, 15, '使用部位', 1, 0, '全身', 0, 0, 0, 0),
(255, 15, '使用肤质', 1, 0, '所有', 0, 0, 0, 0),
(256, 15, '品类', 1, 0, '润肤露/身体乳', 0, 0, 0, 0),
(257, 15, '功效', 1, 0, '清洁 清爽', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_brand`
--

CREATE TABLE IF NOT EXISTS `ecs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `ecs_brand`
--

INSERT INTO `ecs_brand` (`brand_id`, `brand_name`, `brand_logo`, `brand_desc`, `site_url`, `sort_order`, `is_show`) VALUES
(1, '有讯网络', '1380685184117198956.jpg', '公司网站：http://www.nokia.com.cn/\r\n\r\n客服电话：400-880-0123', 'http://www.nokia.com.cn/', 50, 1),
(2, 'APPLE', '1380685191110433994.jpg', '官方咨询电话：4008105050\r\n售后网点：http://www.motorola.com.cn/service/carecenter/search.asp ', 'http://www.motorola.com.cn', 50, 1),
(3, '方正', '1380685198896536870.jpg', '官方咨询电话：4008201668\r\n售后网点：http://www.dopod.com/pc/service/searchresult2.php ', 'http://www.dopod.com ', 50, 1),
(4, '希捷', '1380685206906148108.jpg', '官方咨询电话：4008800008\r\n售后网点：http://www.philips.com.cn/service/mustservice/index.page ', 'http://www.philips.com.cn ', 50, 1),
(5, '漫步者', '1380685213383629650.jpg', '官方咨询电话：4008875777\r\n售后网点：http://www.amobile.com.cn/service_fwyzc.asp ', 'http://www.amobile.com.cn', 50, 1),
(6, '天翼', '1380685222792305410.jpg', '官方咨询电话：8008105858\r\n售后网点：http://cn.samsungmobile.com/cn/support/search_area_o.jsp ', 'http://cn.samsungmobile.com', 50, 1),
(7, '美的', '1380685232971191371.jpg', '官方咨询电话：4008100000\r\n售后网点：http://www.sonyericsson.com/cws/common/contact?cc=cn&lc=zh ', 'http://www.sonyericsson.com.cn/', 50, 1),
(8, '惠普', '1380685242589017695.jpg', '官方咨询电话：4008199999\r\n售后网点：http://www.lg.com.cn/front.support.svccenter.retrieveCenter.laf?hrefId=9 ', 'http://cn.wowlg.com', 50, 1),
(9, '联想', '1380685252873307833.jpg', '官方咨询电话：4008188818\r\n售后网点：http://www.lenovomobile.com/service/kf-wanglou.asp', 'http://www.lenovomobile.com/', 50, 1),
(10, '金立', '1380685292392455401.jpg', '官方咨询电话：4007796666\r\n售后网点：http://www.gionee.net/service.asp ', 'http://www.gionee.net', 50, 1),
(11, '  恒基伟业', '1380685907063087318.jpg', '官方咨询电话：4008899126\r\n售后网点：http://www.htwchina.com/htwt/wexiu.shtml ', 'http://www.htwchina.com', 50, 1),
(12, '夏普', '1380685309482040868.jpg', '', 'http://', 50, 1),
(13, '索尼', '1380685318966924400.jpg', '', 'http://', 50, 1),
(14, '创维', '1380685327309605456.jpg', '', 'http://', 50, 1),
(15, '乐华', '1380685336300659451.jpg', '', 'http://', 50, 1),
(20, '茵佳妮', '1380685345175448444.jpg', '', 'http://', 50, 1),
(17, '爱普生', '1380685356455900353.jpg', '', 'http://', 50, 1),
(18, 'AMD', '1380685367276048777.jpg', '', 'http://', 50, 1),
(19, 'acer', '1380685373892689456.jpg', '', 'http://', 50, 1),
(21, '白领', '1380685380419928070.jpg', '', 'http://', 50, 1),
(22, 'LILY', '1380685392917690536.jpg', '', 'http://', 50, 1),
(23, 'JNBY 江南布衣', '1380685401225598337.jpg', '', 'http://', 50, 1),
(24, '裂帛', '1380685410377577740.jpg', '', 'http://', 50, 1),
(25, 'O.SA', '1380685418074603841.jpg', '', 'http://', 50, 1),
(26, '太平鸟', '1380685428529409794.jpg', '', 'http://', 50, 1),
(27, '艾夫斯', '1380685437557546263.jpg', '', 'http://', 50, 1),
(28, 'betu百图', '1380685447477195506.jpg', '', 'http://', 50, 1),
(29, '韩都衣舍', '1380685458575185862.jpg', '', 'http://', 50, 1),
(30, '圣迪奥', '1380685469784236028.jpg', '', 'http://', 50, 1),
(31, 'EVENY', '1380685484076765558.jpg', '', 'http://', 50, 1),
(32, '溢彩年华', '1380685493614241250.jpg', '', 'http://', 50, 1),
(33, '空间大师', '1380685501661713371.jpg', '', 'http://', 50, 1),
(34, '美好家', '1380685508100765689.jpg', '', 'http://', 50, 1),
(35, '生活诚品', '1380685517465148857.jpg', '', 'http://', 50, 1),
(36, '宝优妮', '1380685528138540997.jpg', '', 'http://', 50, 1),
(37, '大豪', '1380685537002141945.jpg', '', 'http://', 50, 1),
(38, '美亿佳', '1380685546460187418.jpg', '', 'http://', 50, 1),
(39, '千弘', '1380685554945999090.jpg', '', 'http://', 50, 1),
(40, '好事达', '1380685563264277972.jpg', '', 'http://', 50, 1),
(41, '雅培', '1380685570445734371.jpg', '', 'http://', 50, 1),
(42, '贝亲', '1380685578773247262.jpg', '', 'http://', 50, 1),
(43, '帮宝适', '1380685585445167375.jpg', '', 'http://', 50, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_cat_recommend`
--

CREATE TABLE IF NOT EXISTS `ecs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`,`recommend_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ecs_cat_recommend`
--

INSERT INTO `ecs_cat_recommend` (`cat_id`, `recommend_type`) VALUES
(3, 1),
(3, 2),
(3, 3),
(5, 1),
(5, 2),
(5, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 3),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(16, 3),
(17, 3),
(21, 3),
(22, 3),
(34, 3),
(69, 3),
(70, 3),
(83, 3),
(89, 3),
(101, 3),
(110, 2),
(110, 3),
(111, 1),
(120, 3),
(229, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_collect_goods`
--

CREATE TABLE IF NOT EXISTS `ecs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ecs_collect_goods`
--

INSERT INTO `ecs_collect_goods` (`rec_id`, `user_id`, `goods_id`, `add_time`, `is_attention`) VALUES
(13, 47, 134, 1380778630, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ecs_delivery_goods`
--

CREATE TABLE IF NOT EXISTS `ecs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `extension_code` varchar(30) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ecs_delivery_goods`
--

INSERT INTO `ecs_delivery_goods` (`rec_id`, `delivery_id`, `goods_id`, `goods_name`, `brand_name`, `goods_sn`, `is_real`, `extension_code`, `parent_id`, `send_number`, `goods_attr`, `product_id`, `product_sn`) VALUES
(1, 1, 13, '诺基亚5320 XpressMusic', '诺基亚', 'ECS000013', 1, '', 0, 3, NULL, 0, NULL),
(2, 1, 14, '诺基亚5800XM', '诺基亚', 'ECS000014', 1, '', 0, 1, NULL, 0, NULL),
(3, 2, 24, 'P806', '联想', 'ECS000024', 1, '', 0, 3, NULL, 0, NULL),
(4, 2, 9, '诺基亚E66', '诺基亚', 'ECS000009', 1, '', 0, 1, NULL, 0, NULL),
(5, 3, 24, 'P806', '联想', 'ECS000024', 1, '', 0, 1, NULL, 0, NULL),
(6, 3, 8, '飞利浦9@9v', '飞利浦', 'ECS000008', 1, '', 0, 3, NULL, 0, NULL),
(7, 4, 12, '摩托罗拉A810', '摩托罗拉', 'ECS000012', 1, '', 0, 2, NULL, 0, NULL),
(8, 5, 24, 'P806', '联想', 'ECS000024', 1, '', 0, 1, NULL, 0, NULL),
(9, 6, 42, '乐华(ROWA)32英寸高清液晶电视LCD32M08', '乐华', 'ECS000042', 1, NULL, 0, 1, NULL, 0, NULL),
(10, 7, 91, '富士（FUJIFILM）Z71 数码相机（银色）', '天翼', 'ECS000091', 1, NULL, 0, 1, '', 0, ''),
(11, 7, 90, '富士（FUJIFILM）Z71 数码相机（香槟色）', '漫步者', 'ECS000090', 1, NULL, 0, 1, '', 0, ''),
(12, 8, 38, '三星（SAMSUNG）26英寸 高清液晶电视LA32B350F1', '天翼', 'ECS000038', 1, NULL, 0, 1, '', 0, ''),
(13, 8, 39, '创维（Skyworth）37英寸液晶电视37L05HR（内置底座）', '创维', 'ECS000039', 1, NULL, 0, 1, '', 0, ''),
(14, 9, 55, '三洋（Sanyo）ECJ-DF115MC　微电脑电饭煲', 'AMD', 'ECS000055', 1, NULL, 0, 1, '颜色:黑色 \n屏幕尺寸:42英寸 \n', 0, ''),
(15, 9, 66, '飞科（FLYCO）浮动旋转式剃须刀-FS812', 'AMD', 'ECS000066', 1, NULL, 0, 1, '颜色:黑色 \n屏幕尺寸:42英寸 \n', 0, ''),
(16, 9, 88, '索尼（sony）HDR-XR350E高清数码摄像机', '漫步者', 'ECS000088', 1, NULL, 0, 1, '颜色:黑色 \n屏幕尺寸:42英寸 \n', 0, ''),
(17, 10, 92, '茵佳妮优雅公主风褶边修身轻盈衬衫 送胸花5121-1110045', '白领', 'ECS000092', 1, NULL, 0, 1, '颜色:红 \n尺寸:XL \n', 0, ''),
(18, 10, 123, '美亿佳懒人沙发SF0505咖啡色', '千弘', 'ECS000123', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XL \n', 0, ''),
(19, 10, 121, '宝贝世家 儿童床品套件 海洋乐园 英国设计 精梳全棉 活性环保印染 儿童三件套', '千弘', 'ECS000121', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XL \n', 0, ''),
(20, 11, 49, '美的（Midea）空气加湿器 S30U-M1', '乐华', 'ECS000049', 1, NULL, 0, 1, '颜色:黑色 \n屏幕尺寸:42英寸 \n', 0, ''),
(21, 12, 43, '乐华(ROWA)42英寸高清液晶电视LCD42M19', '乐华', 'ECS000043', 1, NULL, 0, 1, '颜色:黑色 \n屏幕尺寸:42英寸 \n', 0, ''),
(22, 13, 134, '天使之城 新款 手工珍珠金线蕾丝衫雪纺衫LM0304 白色', '  恒基伟业', 'ECS000000', 1, NULL, 0, 3, '颜色:红 \n尺寸:XL \n', 0, ''),
(23, 13, 135, 'JIULALA 久拉拉 2013年夏装新款 女 撞色波浪装', '金立', 'ECS000135', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XXL \n', 0, ''),
(24, 13, 138, 'ANDO STORE 安都韩版显瘦女裙雪纺两件套连衣裙9', '希捷', 'ECS000138', 1, NULL, 0, 1, '颜色:红 \n尺寸:L \n', 0, ''),
(25, 13, 139, 'SDEER 圣迪奥 女夏装拼接感双层裙摆连衣裙22812', '漫步者', 'ECS000139', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XL \n', 0, ''),
(26, 13, 136, 'Souline 素缕 《斑驳》2013秋款新女棉麻刺绣长', 'APPLE', 'ECS000136', 1, NULL, 0, 1, '颜色:红 \n尺寸:XL \n', 0, ''),
(27, 13, 137, '桑缇 2013秋季新款 韩版修身圆领外套ST133W540', '方正', 'ECS000137', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XXL \n', 0, ''),
(28, 13, 140, 'GOLDFARM 高梵 2013夏装新款 雪纺复古印花连衣', '天翼', 'ECS000140', 1, NULL, 0, 1, '颜色:红 \n尺寸:XL \n', 0, ''),
(29, 13, 141, '茵克拉芙 2013夏装女装春款连衣裙碎花雪纺OL气', '美的', 'ECS000141', 1, NULL, 0, 1, '颜色:黄 \n尺寸:XXL \n', 0, '');