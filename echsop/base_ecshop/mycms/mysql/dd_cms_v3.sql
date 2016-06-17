-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+08:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `y_access`;
CREATE TABLE `y_access` (
  `nodes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_admin`;
CREATE TABLE `y_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_publish` int(1) DEFAULT '0',
  `create_time` int(11) unsigned DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `last_login_time` int(11) unsigned DEFAULT '0',
  `login_count` int(11) unsigned DEFAULT '0',
  `username` varchar(50) DEFAULT '',
  `realname` varchar(50) DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_admin` (`id`, `is_publish`, `create_time`, `update_time`, `last_login_time`, `login_count`, `username`, `realname`, `password`, `last_login_ip`, `email`, `remark`) VALUES
(2,	1,	1346841710,	1346841710,	1385428537,	401,	'admin',	'管理员',	'd8fa8c9756c2e8bcb7b704c746ae5f84',	'127.0.0.1',	'',	'备注信息');

DROP TABLE IF EXISTS `y_advert`;
CREATE TABLE `y_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `is_publish` int(1) DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT '999',
  `type` int(1) DEFAULT NULL,
  `begin_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `flash_img2` varchar(255) DEFAULT NULL,
  `flash_img1` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `net_image` varchar(255) DEFAULT NULL,
  `flash` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `code` text,
  `target` varchar(10) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `content` text,
  `my_id` int(11) NOT NULL,
  `is_top` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_category`;
CREATE TABLE `y_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `is_publish` int(1) DEFAULT '1',
  `is_default` int(1) NOT NULL DEFAULT '0',
  `is_nav` int(1) NOT NULL DEFAULT '0',
  `is_comment` int(1) DEFAULT '0',
  `is_delete` int(1) DEFAULT '1',
  `is_fixed` int(1) DEFAULT '0',
  `ordernum` int(11) DEFAULT '50',
  `list_count` int(11) DEFAULT '1',
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(10) NOT NULL,
  `levels` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '无标题',
  `image` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `color` varchar(10) NOT NULL,
  `burl` varchar(255) NOT NULL,
  `furl` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `tpl_one` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `my_id` int(11) NOT NULL,
  `is_mobile` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_category` (`id`, `pid`, `is_publish`, `is_default`, `is_nav`, `is_comment`, `is_delete`, `is_fixed`, `ordernum`, `list_count`, `hardware`, `lang`, `levels`, `title`, `image`, `alias`, `module`, `color`, `burl`, `furl`, `tag`, `tpl_one`, `description`, `my_id`, `is_mobile`) VALUES
(20,	12,	1,	0,	1,	0,	0,	1,	12,	36,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u4ea7\\u54c1\\u5c55\\u793a\"},\"zh-tw\":{\"title\":\"\\u7523\\u54c1\\u5c55\\u793a\"},\"en-us\":{\"title\":\"Product\"},\"ja-jp\":{\"title\":\"\\u88fd\\u54c1\\u5c55\\u793a\"},\"ko-kr\":{\"title\":\"\\uc0c1 \\ud488\\uc744 \\uc804\\uc2dc\"}}',	'',	'Goods',	'Goods',	'',	'',	'',	'',	'auto',	'',	20,	1),
(19,	12,	1,	0,	1,	0,	0,	1,	13,	19,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u65b0\\u95fb\\u52a8\\u6001\"},\"zh-tw\":{\"title\":\"\\u65b0\\u805e\\u52d5\\u614b\"},\"en-us\":{\"title\":\"News\"},\"ja-jp\":{\"title\":\"\\u30cb\\u30e5\\u30fc\\u30b9\\u306e\\u52d5\\u304d\"},\"ko-kr\":{\"title\":\"\\ub274\\uc2a4 \\ub3d9\\ud0dc\"}}',	'',	'News',	'News',	'',	'',	'',	'',	'auto',	'',	19,	1),
(36,	12,	1,	0,	1,	0,	0,	1,	14,	1,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u4f01\\u4e1a\\u7b80\\u4ecb\"},\"zh-tw\":{\"title\":\"\\u4f01\\u696d\\u7c21\\u4ecb\"}}',	'',	'About',	'About',	'',	'',	'',	'',	'auto',	'',	36,	0),
(34,	30000,	0,	0,	0,	0,	0,	1,	46,	0,	'pc',	'zh-cn',	'12|30',	'邮箱设置',	'',	'Email',	'',	'',	'',	'',	'',	'',	'',	34000,	0),
(205,	27,	1,	0,	0,	0,	0,	0,	30,	2,	'pc',	'zh-cn',	'12|27',	'人才招聘',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	205,	0),
(469,	22,	1,	0,	0,	0,	0,	0,	31,	6,	'pc',	'zh-cn',	'12|22',	'添加网点',	'',	'Market/index',	'',	'',	'',	'',	'',	'list',	'',	469,	1),
(21,	12,	1,	0,	1,	0,	0,	1,	9,	-7,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u5728\\u7ebf\\u7559\\u8a00\"},\"zh-tw\":{\"title\":\"\\u5728\\u7dda\\u7559\\u8a00\"},\"en-us\":{\"title\":\"Message\"},\"ja-jp\":{\"title\":\"\\u30e1\\u30e2\"},\"ko-kr\":{\"title\":\"\\uc778\\ud130\\ub137 \\ub313 \\uae00\"}}',	'',	'Guestbook',	'Guestbook',	'',	'',	'',	'',	'auto',	'',	21,	1),
(220,	21,	1,	0,	0,	0,	0,	0,	30,	-6,	'pc',	'zh-cn',	'12|21',	'回复留言',	'',	'Guestbook/view',	'',	'',	'',	'',	'',	'list',	'',	220,	1),
(499,	497,	1,	0,	0,	0,	0,	1,	3,	0,	'pc',	'zh-cn',	'12|19|497',	'置顶',	'',	'news_istop',	'',	'',	'',	'',	'',	'list',	'',	499,	0),
(498,	497,	1,	0,	0,	0,	0,	1,	4,	0,	'pc',	'zh-cn',	'12|19|497',	'首页',	'',	'news_ishome',	'',	'',	'',	'',	'',	'list',	'',	498,	0),
(22,	12,	1,	0,	1,	0,	0,	1,	11,	31,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u670d\\u52a1\\u7f51\\u70b9\"},\"zh-tw\":{\"title\":\"\\u670d\\u52d9\\u7db2\\u9ede\"},\"en-us\":{\"title\":\"Market\"},\"ja-jp\":{\"title\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u62e0\\u70b9\"},\"ko-kr\":{\"title\":\"\\uc11c\\ube44\\uc2a4 \\uc810\\ud3ec\"}}',	'',	'Market',	'Market',	'',	'',	'',	'',	'auto',	'',	22,	1),
(467,	25,	1,	0,	0,	0,	0,	1,	30,	0,	'pc',	'zh-cn',	'12|25',	'加盟申请',	'',	'Join/apply',	'',	'',	'',	'',	'',	'list',	'',	467,	0),
(12,	0,	1,	0,	0,	0,	0,	1,	50,	127,	'pc',	'zh-cn',	'',	'网站后台',	'',	'Module',	'',	'',	'',	'',	'',	'auto',	'',	12,	1),
(479,	24,	1,	0,	0,	0,	0,	1,	1,	0,	'pc',	'',	'12|24',	'分类管理',	'',	'link_category',	'',	'',	'',	'',	'',	'list',	'',	479,	0),
(500,	497,	1,	0,	0,	0,	0,	1,	2,	0,	'pc',	'zh-cn',	'12|19|497',	'已发布',	'',	'news_ispublish1',	'',	'',	'',	'',	'',	'list',	'',	500,	0),
(501,	497,	1,	0,	0,	0,	0,	1,	1,	0,	'pc',	'zh-cn',	'12|19|497',	'未发布',	'',	'news_ispublish0',	'',	'',	'',	'',	'',	'list',	'',	501,	0),
(1211,	23,	1,	0,	0,	0,	1,	0,	30,	4,	'mobile',	'zh-cn',	'12|23',	'首页多图片切换',	'',	'adv/m_list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(513,	512,	1,	0,	0,	0,	0,	1,	3,	0,	'pc',	'zh-cn',	'12|20|512',	'置顶',	'',	'goods_istop',	'',	'',	'',	'',	'',	'list',	'',	513,	0),
(514,	512,	1,	0,	0,	0,	0,	1,	4,	0,	'pc',	'zh-cn',	'12|20|512',	'首页',	'',	'goods_ishome',	'',	'',	'',	'',	'',	'list',	'',	514,	0),
(515,	512,	1,	0,	0,	0,	0,	1,	2,	0,	'pc',	'zh-cn',	'12|20|512',	'已发布',	'',	'goods_ispublish1',	'',	'',	'',	'',	'',	'list',	'',	515,	0),
(516,	512,	1,	0,	0,	0,	0,	1,	1,	0,	'pc',	'zh-cn',	'12|20|512',	'未发布',	'',	'goods_ispublish0',	'',	'',	'',	'',	'',	'list',	'',	516,	0),
(11,	0,	1,	0,	0,	0,	0,	0,	50,	0,	'pc',	'zh-cn',	'',	'多语言',	'',	'Lang',	'',	'',	'',	'',	'',	'auto',	'',	11,	0),
(26,	12,	1,	0,	0,	0,	0,	1,	0,	1,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u4e0b\\u8f7d\\u6587\\u4ef6\"}}',	'',	'Download',	'Download',	'',	'',	'',	'',	'auto',	'',	26,	1),
(37,	12,	1,	0,	0,	0,	0,	1,	0,	21,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\"}}',	'',	'Video',	'Video',	'',	'',	'',	'',	'auto',	'',	37,	1),
(1503,	28,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-cn',	'12|28',	'分公司',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(775,	35,	1,	0,	0,	0,	0,	1,	4,	0,	'pc',	'zh-cn',	'12|30|35',	'手机主题',	'',	'MobileTheme',	'',	'',	'Mobile/index',	'',	'',	'list',	'',	775,	0),
(749,	35,	1,	0,	0,	0,	0,	1,	1,	8,	'pc',	'zh-cn',	'12|30|35',	'联系方式',	'',	'MobileContact',	'',	'',	'Mobile/index',	'',	'',	'list',	'',	749,	0),
(750,	35,	1,	0,	0,	0,	0,	1,	5,	0,	'pc',	'zh-cn',	'12|30|35',	'基本信息',	'',	'MobileBase',	'',	'',	'Mobile/index',	'',	'',	'list',	'',	750,	0),
(751,	35,	1,	0,	0,	0,	0,	1,	2,	0,	'pc',	'zh-cn',	'12|30|35',	'移动SEO设置',	'',	'MobileSEO',	'',	'',	'Mobile/index',	'',	'',	'list',	'',	751,	0),
(774,	35,	1,	0,	0,	0,	0,	1,	3,	0,	'pc',	'zh-cn',	'12|30|35',	'多域名绑定',	'',	'MobileDomain',	'',	'',	'Mobile/index',	'',	'',	'list',	'',	774,	0),
(781,	4,	1,	1,	0,	0,	0,	1,	29,	0,	'mobile',	'zh-cn',	'4',	'简体',	'',	'zh-cn',	'',	'',	'',	'',	'',	'',	'',	781,	0),
(615,	469,	1,	0,	0,	0,	1,	0,	30,	10,	'pc',	'zh-cn',	'12|22|469',	'广东',	'512ade93dfa5a.jpg',	'Guangdong',	'',	'',	'',	'',	'',	'list',	'',	615,	0),
(618,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'青海',	'',	'Qinghai',	'',	'',	'',	'',	'',	'list',	'',	618,	1),
(619,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'甘肃',	'',	'Gansu',	'',	'',	'',	'',	'',	'list',	'',	619,	1),
(620,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'内蒙古',	'',	'InnerMongolia',	'',	'',	'',	'',	'',	'list',	'',	620,	1),
(621,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'宁夏',	'',	'Ningxia',	'',	'',	'',	'',	'',	'list',	'',	621,	1),
(622,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'陕西',	'',	'Shanxi',	'',	'',	'',	'',	'',	'list',	'',	622,	0),
(623,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'山西',	'',	'Shanxi2',	'',	'',	'',	'',	'',	'list',	'',	623,	0),
(624,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'河北',	'',	'Hebei',	'',	'',	'',	'',	'',	'list',	'',	624,	0),
(625,	469,	1,	0,	0,	0,	1,	0,	30,	4,	'pc',	'zh-cn',	'12|22|469',	'北京',	'',	'Beijing',	'',	'',	'',	'',	'',	'list',	'',	625,	0),
(626,	469,	1,	0,	0,	0,	1,	0,	30,	3,	'pc',	'zh-cn',	'12|22|469',	'天津',	'',	'Tianjin',	'',	'',	'',	'',	'',	'list',	'',	626,	0),
(627,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'辽宁',	'',	'Liaoning',	'',	'',	'',	'',	'',	'list',	'',	627,	0),
(628,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'吉林',	'',	'Jilin',	'',	'',	'',	'',	'',	'list',	'',	628,	0),
(629,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'黑龙江',	'',	'Heilongjiang',	'',	'',	'',	'',	'',	'list',	'',	629,	0),
(630,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'山东',	'',	'Shandong',	'',	'',	'',	'',	'',	'list',	'',	630,	0),
(631,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'河南',	'',	'Henan',	'',	'',	'',	'',	'',	'list',	'',	631,	0),
(632,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'云南',	'',	'Yunnan',	'',	'',	'',	'',	'',	'list',	'',	632,	0),
(633,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'广西',	'',	'Guangxi',	'',	'',	'',	'',	'',	'list',	'',	633,	0),
(634,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'海南',	'',	'Hainan',	'',	'',	'',	'',	'',	'list',	'',	634,	0),
(635,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'湖南',	'',	'Hunan',	'',	'',	'',	'',	'',	'list',	'',	635,	0),
(636,	469,	1,	0,	0,	0,	1,	0,	30,	3,	'pc',	'zh-cn',	'12|22|469',	'重庆',	'',	'Chongqing',	'',	'',	'',	'',	'',	'list',	'',	636,	0),
(637,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'安徽',	'',	'Anhui',	'',	'',	'',	'',	'',	'list',	'',	637,	0),
(638,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'江苏',	'',	'Jiangsu',	'',	'',	'',	'',	'',	'list',	'',	638,	0),
(639,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'上海',	'',	'Shanghai',	'',	'',	'',	'',	'',	'list',	'',	639,	0),
(640,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'台湾',	'',	'Taiwan',	'',	'',	'',	'',	'',	'list',	'',	640,	0),
(641,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'贵州',	'',	'Guizhou',	'',	'',	'',	'',	'',	'list',	'',	641,	0),
(642,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'湖北',	'',	'Hubei',	'',	'',	'',	'',	'',	'list',	'',	642,	0),
(643,	469,	1,	0,	0,	0,	1,	0,	30,	3,	'pc',	'zh-cn',	'12|22|469',	'四川',	'',	'Sichuan',	'',	'',	'',	'',	'',	'list',	'',	643,	0),
(644,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'福建',	'',	'Fujian',	'',	'',	'',	'',	'',	'list',	'',	644,	0),
(645,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'江西',	'',	'Jiangxi',	'',	'',	'',	'',	'',	'list',	'',	645,	0),
(17,	3,	1,	1,	0,	0,	0,	1,	29,	0,	'pc',	'zh-cn',	'3',	'简体',	'',	'zh-cn',	'',	'',	'',	'',	'',	'',	'',	17,	0),
(18,	3,	0,	0,	0,	0,	0,	1,	27,	0,	'pc',	'en-us',	'3',	'英文',	'',	'en-us',	'',	'',	'',	'',	'',	'',	'',	18,	0),
(428,	3,	1,	0,	0,	0,	0,	1,	28,	0,	'pc',	'zh-tw',	'3',	'繁体',	'',	'zh-tw',	'',	'',	'',	'',	'',	'',	'',	428,	0),
(429,	3,	0,	0,	0,	0,	0,	1,	26,	0,	'pc',	'ja-jp',	'3',	'日文',	'',	'ja-jp',	'',	'',	'',	'',	'',	'',	'',	429,	0),
(430,	3,	0,	0,	0,	0,	0,	1,	25,	0,	'pc',	'ko-kr',	'3',	'韩文',	'',	'ko-kr',	'',	'',	'',	'',	'',	'',	'',	430,	0),
(1191,	37,	1,	0,	0,	0,	1,	0,	30,	2,	'pc',	'zh-cn',	'12|37',	'视频列表',	'',	'Video/Index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1168,	23,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|23',	'首页多图片切换',	'',	'index/adList',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(23,	12,	1,	0,	0,	0,	0,	1,	0,	8,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u5e7f\\u544a\\u53d1\\u5e03\"},\"zh-tw\":{\"title\":\"\\u5ee3\\u544a\\u767c\\u5e03\"},\"en-us\":{\"title\":\"Advert\"},\"ja-jp\":{\"title\":\"cm\\u767a\\u8868\"},\"ko-kr\":{\"title\":\"cf \\ubaa8\\ub378\"}}',	'',	'Advert',	'Advert',	'',	'',	'',	'',	'auto',	'',	23,	1),
(1207,	19,	1,	0,	0,	0,	1,	0,	30,	3,	'mobile',	'zh-cn',	'12|19',	'最新活动',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1169,	24,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|24',	'友情列表',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1170,	36,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|36',	'公司简介',	'',	'About/indexInfo',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1171,	36,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|36',	'经营理念',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1172,	36,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|36',	'荣誉资质',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1175,	19,	1,	0,	0,	0,	1,	0,	30,	-4,	'pc',	'zh-cn',	'12|19',	'最新活动',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1176,	19,	1,	0,	0,	0,	1,	0,	30,	2,	'pc',	'zh-cn',	'12|19',	'公司新闻',	'',	'News/company',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1177,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-cn',	'12|19',	'行业资讯',	'',	'News/dynamic',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(24,	12,	0,	0,	0,	0,	0,	1,	0,	0,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u53cb\\u60c5\\u94fe\\u63a5\"},\"zh-tw\":{\"title\":\"\\u53cb\\u60c5\\u93c8\\u63a5\"},\"en-us\":{\"title\":\"Link\"},\"ja-jp\":{\"title\":\"\\u53cb\\u60c5\\u306e\\u30ea\\u30f3\\u30af\"},\"ko-kr\":{\"title\":\"\\uc6b0\\uc815 \\ub9c1\\ud06c\"}}',	'',	'Link',	'Link',	'',	'',	'',	'',	'auto',	'',	24,	1),
(1198,	36,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|36',	'公司简介',	'',	'About/introduction',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1238,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-cn',	'12|36',	'经营理念',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1208,	19,	1,	0,	0,	0,	1,	0,	30,	3,	'mobile',	'zh-cn',	'12|19',	'公司新闻',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1209,	19,	1,	0,	0,	0,	1,	0,	30,	10,	'mobile',	'zh-cn',	'12|19',	'行业资讯',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1212,	22,	1,	0,	0,	0,	1,	0,	30,	25,	'mobile',	'zh-cn',	'12|22',	'添加网点',	'',	'Market/index',	'',	'',	'',	'',	'',	'auto',	'',	0,	0),
(1213,	1212,	1,	0,	0,	0,	1,	0,	30,	6,	'mobile',	'zh-cn',	'12|22|1212',	'广州分公司',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1214,	1212,	1,	0,	0,	0,	1,	0,	30,	6,	'mobile',	'zh-cn',	'12|22|1212',	'东莞分公司',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1215,	1212,	1,	0,	0,	0,	1,	0,	30,	5,	'mobile',	'zh-cn',	'12|22|1212',	'北京分公司',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1217,	27,	1,	0,	0,	0,	1,	0,	30,	7,	'mobile',	'zh-cn',	'12|27',	'人才招聘',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1218,	37,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|37',	'视频列表',	'',	'Video/Index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1224,	220,	1,	0,	0,	0,	1,	0,	30,	-5,	'pc',	'zh-cn',	'12|21|220',	'建议',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1223,	21,	1,	0,	0,	0,	1,	0,	30,	-2,	'mobile',	'zh-cn',	'12|21',	'回复留言',	'',	'Guestbook/view',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1225,	1223,	1,	0,	0,	0,	1,	0,	30,	-3,	'mobile',	'zh-cn',	'12|21|1223',	'反馈',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1226,	1223,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|21|1223',	'建议',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1227,	1223,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|21|1223',	'咨询',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1228,	220,	1,	0,	0,	0,	1,	0,	30,	-1,	'pc',	'zh-cn',	'12|21|220',	'咨询',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1229,	220,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|21|220',	'反馈',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1253,	20,	1,	0,	0,	0,	1,	0,	30,	6,	'mobile',	'zh-cn',	'12|20',	'LED筒灯',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED筒灯',	0,	0),
(1232,	25,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|25',	'加盟信息',	'',	'Join/index',	'',	'',	'',	'',	'',	'auto',	'',	0,	0),
(1233,	1232,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|25|1232',	'加盟支持',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1234,	1232,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|25|1232',	'加盟优势',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1235,	1232,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|25|1232',	'投资前景',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1252,	20,	1,	0,	0,	0,	1,	0,	30,	8,	'pc',	'zh-cn',	'12|20',	'LED筒灯',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED筒灯',	0,	0),
(1237,	23,	1,	0,	0,	0,	1,	0,	30,	3,	'mobile',	'zh-cn',	'12|23',	'首页列表图片',	'',	'indexad/list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1239,	1212,	1,	0,	0,	0,	1,	0,	30,	4,	'mobile',	'zh-cn',	'12|22|1212',	'深圳分公司',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1261,	36,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|36',	'荣誉资质',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1242,	28,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|28',	'电子地图',	'',	'Contact/map',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1243,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-cn',	'12|23',	'内页图片广告',	'',	'Inside/ad',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1251,	20,	1,	0,	0,	0,	1,	0,	30,	8,	'mobile',	'zh-cn',	'12|20',	'LED球泡灯',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED球泡灯',	0,	0),
(1249,	20,	1,	0,	0,	0,	1,	0,	30,	4,	'mobile',	'zh-cn',	'12|20',	'LED日光管',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED日光管',	0,	0),
(1255,	20,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|20',	'LED天花灯',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED天花灯',	0,	0),
(1257,	20,	1,	0,	0,	0,	1,	0,	30,	0,	'mobile',	'zh-cn',	'12|20',	'LED豆胆灯',	'',	'',	'',	'',	'',	'',	'',	'list',	'LED豆胆灯',	0,	0),
(25,	12,	0,	0,	0,	0,	0,	1,	0,	0,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u5728\\u7ebf\\u52a0\\u76df\"},\"zh-tw\":{\"title\":\"\\u5728\\u7dda\\u52a0\\u76df\"},\"en-us\":{\"title\":\"Joinin\"},\"ja-jp\":{\"title\":\"\\u30aa\\u30f3\\u30e9\\u30a4\\u30f3\\u306e\\u52a0\\u76df\"},\"ko-kr\":{\"title\":\"\\uc628\\ub77c\\uc778 \\uc5d0 \\uc785\\ub2e8\"}}',	'',	'Joinin',	'Joinin',	'',	'',	'',	'',	'auto',	'',	25,	1),
(1262,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'新疆',	'',	'Xinjiang',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1263,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'西藏',	'',	'Tibet',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1264,	469,	1,	0,	0,	0,	1,	0,	30,	0,	'pc',	'zh-cn',	'12|22|469',	'浙江',	'',	'Zhejiang',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1266,	1252,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-cn',	'12|20|1161|1252',	'LED-001',	'512ade9c43369.jpg',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	'',	'',	'',	'终端',	'',	'Hardware',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(3,	1,	1,	0,	0,	0,	0,	0,	0,	0,	'',	'',	'',	'电脑版',	'',	'pc',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(4,	1,	1,	0,	0,	0,	0,	0,	0,	0,	'',	'',	'',	'手机版',	'',	'mobile',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(27,	12,	1,	0,	1,	0,	0,	1,	10,	9,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u4eba\\u624d\\u62db\\u8058\"},\"zh-tw\":{\"title\":\"\\u4eba\\u624d\\u62db\\u8058\"},\"en-us\":{\"title\":\"Job\"},\"ja-jp\":{\"title\":\"\\u4eba\\u6750\\u52df\\u96c6\"},\"ko-kr\":{\"title\":\"\\uc778\\uc7ac \\ucc44\"}}',	'',	'Job',	'Job',	'',	'',	'',	'',	'auto',	'',	27,	1),
(28,	12,	1,	0,	1,	0,	1,	0,	8,	1,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u8054\\u7cfb\\u6211\\u4eec\"}}',	'',	'Contact',	'About',	'',	'',	'',	'',	'auto',	'',	0,	0),
(29,	12,	1,	0,	1,	0,	1,	0,	7,	1,	'',	'',	'12',	'{\"zh-cn\":{\"title\":\"\\u4f01\\u4e1a\\u5fae\\u535a\"},\"zh-tw\":{\"title\":\"\\u4f01\\u696d\\u5fae\\u535a\"},\"en-us\":{\"title\":\"Weibo\"},\"ja-jp\":{\"title\":\"\\u4f01\\u696d\\u306e\\u5fae\\u535a\"},\"ko-kr\":{\"title\":\"\\uae30\\uc5c5 \\ubbf8\\ub2c8 \\ube14 \\ub85c\\uadf8\"}}',	'',	'Weibo',	'About',	'',	'System/index/cid/tertiarycode',	'',	'',	'auto',	'',	0,	0),
(1391,	4,	1,	0,	0,	0,	1,	0,	28,	1,	'mobile',	'zh-tw',	'4',	'繁体',	'',	'zh-tw',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1392,	4,	0,	0,	0,	0,	1,	0,	27,	1,	'mobile',	'en-us',	'4',	'英文',	'',	'en-us',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1393,	4,	0,	0,	0,	0,	1,	0,	26,	1,	'mobile',	'ja-jp',	'4',	'日文',	'',	'ja-jp',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1394,	4,	0,	0,	0,	0,	1,	0,	25,	1,	'mobile',	'ko-kr',	'4',	'韩文',	'',	'ko-kr',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1395,	28,	1,	0,	0,	0,	1,	0,	31,	1,	'pc',	'zh-cn',	'12|28',	'联系方式',	'',	'Contact/mode',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1397,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|36',	'Company',	'',	'About/indexInfo',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1398,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|36',	'Honors',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1399,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|19',	'Company News',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1400,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|19',	'Industry News',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1401,	20,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|20',	'Category1',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1402,	20,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|20',	'Category2',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1403,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|36',	'公司簡介',	'',	'About/indexInfo',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1404,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|36',	'經營理念',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1405,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|36',	'榮譽資質',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1406,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|19',	'最新活動',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1407,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|19',	'公司新聞',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1408,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|19',	'公司新聞',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1409,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20',	'LED筒燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1410,	0,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'',	'',	'无标题',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1411,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20',	'LED球泡燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1412,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20',	'LED日光管',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1413,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20',	'LED天花燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1414,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20',	'LED豆膽燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1415,	28,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|28',	'電子地圖',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1416,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|36',	'会社の概要',	'',	'About/indexInfo',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1417,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|36',	'ビジネス哲学',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1418,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|36',	'優等',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1419,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|19',	'活動',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1420,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|19',	'企業ニュース',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1421,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|19',	'ニュース',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1422,	20,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|20',	'製品カテゴリ',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1423,	20,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|20',	'製品カテゴリ',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1424,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|23',	'首頁多圖片切換',	'',	'index/adList',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1425,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|23',	'內頁圖片廣告',	'',	'Inside/ad',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1426,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|23',	'home banner ',	'',	'index/adList',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1427,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|23',	'page ads',	'',	'Inside/ad',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1428,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|23',	'ホーム広告',	'',	'index/adList',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1429,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|23',	'広告のページの中の',	'',	'Inside/ad',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1430,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|23',	'홈 스위치',	'',	'index/adList',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1431,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|23',	'광고 페이지 내에',	'',	'Inside/ad',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1432,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|36',	'회사 소개',	'',	'About/indexInfo',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1433,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|36',	'경영 철학',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1434,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|36',	'영예',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1435,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|19',	'회사 소개',	'',	'News/company',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1436,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|19',	'경영 철학',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1437,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|19',	'영예',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1438,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'en-us',	'12|27',	'Job',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1439,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ko-kr',	'12|27',	'신병 모집',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1440,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'ja-jp',	'12|27',	'募集',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1441,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'pc',	'zh-tw',	'12|27',	'人才招聘',	'',	'Job/index',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1442,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|23',	'首頁多圖片切換',	'',	'adv/m_list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1443,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|23',	'首頁列表圖片',	'',	'indexad/list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1444,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|23',	'home banner',	'',	'adv/m_list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1445,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|23',	'Page ads',	'',	'indexad/list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1446,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|23',	'ホーム広告',	'',	'adv/m_list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1447,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|23',	'広告のページの中の',	'',	'indexad/list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1448,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|23',	'광고 페이지 내에',	'',	'indexad/list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1449,	23,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|23',	'홈 스위치',	'',	'adv/m_list',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1450,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|36',	'公司簡介',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1451,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|36',	'經營理念',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1452,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|36',	'榮譽資質',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1453,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|36',	'Company',	'',	'About/introduction',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1454,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|36',	'Honors',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1455,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|36',	'会社の概要',	'',	'About/introduction',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1456,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|36',	'ビジネス哲学',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1457,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|36',	'회사 소개',	'',	'About/introduction',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1458,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|36',	'경영 철학',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1459,	36,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|36',	'영예',	'',	'',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1460,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|19',	'最新活動',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1461,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|19',	'公司新聞',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1462,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|19',	'公司新聞',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1463,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|19',	'Company News',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1464,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|19',	' Industry News',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1465,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|19',	'活動',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1466,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|19',	'企業ニュース',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1467,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|19',	'ニュース',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1468,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'zh-tw',	'12|20',	'LED筒燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1469,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'zh-tw',	'12|20',	'LED球泡燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1470,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'zh-tw',	'12|20',	'LED日光管',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1471,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'zh-tw',	'12|20',	'LED天花燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1472,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'zh-tw',	'12|20',	'LED豆膽燈',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1473,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'en-us',	'12|20',	' Category1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1474,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'en-us',	'12|20',	'Category2',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1475,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'ja-jp',	'12|20',	'製品カテゴリ',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1476,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'ja-jp',	'12|20',	' 製品カテゴリ',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1477,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'ko-kr',	'12|20',	'LED 전구',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1478,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'ko-kr',	'12|20',	'LED 형광등',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1479,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'mobile',	'ko-kr',	'12|20',	'LED 천장',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1480,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'zh-tw',	'12|27',	'人才招聘',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1481,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|27',	'Job',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1482,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|27',	'募集',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1483,	27,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|27',	'신병 모집',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1490,	20,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'ko-kr',	'12|20',	'LED 전구',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0),
(1491,	22,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ja-jp',	'12|22',	'ブランチ',	'',	'Market/index',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1492,	22,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|22',	'지사',	'',	'Market/index',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1493,	22,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'en-us',	'12|22',	'Branch',	'',	'Market/index',	'',	'',	'',	'',	'',	'one',	'',	0,	0),
(1495,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|19',	'활동',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1498,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|19',	'기업 뉴스',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1497,	19,	1,	0,	0,	0,	1,	0,	30,	1,	'mobile',	'ko-kr',	'12|19',	'뉴스',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0),
(1504,	1409,	1,	0,	0,	0,	1,	0,	50,	1,	'pc',	'zh-tw',	'12|20|1409',	'rrr',	'',	'',	'',	'',	'',	'',	'',	'list',	'',	0,	0);

DROP TABLE IF EXISTS `y_comment`;
CREATE TABLE `y_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `reply` text,
  `reply_time` int(11) DEFAULT NULL,
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_common`;
CREATE TABLE `y_common` (
  `id` int(1) NOT NULL DEFAULT '1',
  `weibo_type` varchar(255) DEFAULT NULL,
  `weibo_plug` text,
  `is_share` int(1) DEFAULT NULL,
  `share_plug` text,
  `flow_code` text,
  `mobile_theme` varchar(255) DEFAULT NULL,
  `web_theme` varchar(255) DEFAULT NULL,
  `my_id` int(11) DEFAULT NULL,
  `is_customer` int(1) DEFAULT '0',
  `customer_code` text,
  `is_qq` int(1) DEFAULT '0',
  `qq_nums` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_common` (`id`, `weibo_type`, `weibo_plug`, `is_share`, `share_plug`, `flow_code`, `mobile_theme`, `web_theme`, `my_id`, `is_customer`, `customer_code`, `is_qq`, `qq_nums`) VALUES
(1,	'sina',	'<iframe width=\"100%\" height=\"550\" class=\"share_self\"  frameborder=\"0\" scrolling=\"no\" src=\"http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=1&ptype=1&speed=300&skin=1&isTitle=1&noborder=0&isWeibo=1&isFans=1&uid=2050491212&verifier=f583b339&dpc=1\"></iframe>',	1,	'',	'<img  style=\"CURSOR: pointer\" onclick=\"javascript:window.open(\'http://b.qq.com/webc.htm?new=0&sid=790005994&o=移动&q=7\', \'_blank\', \'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no\');\"  border=\"0\" SRC=http://wpa.qq.com/pa?p=1:790005994:1 alt=\"点击这里给我发消息\">',	'YM04001',	'YP30002',	0,	0,	NULL,	0,	NULL);

DROP TABLE IF EXISTS `y_domain`;
CREATE TABLE `y_domain` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `target` varchar(255) DEFAULT '',
  `domain_name` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_domain` (`id`, `target`, `domain_name`, `remark`, `my_id`) VALUES
(1,	'手机',	'ASD',	'ASDASD',	0);

DROP TABLE IF EXISTS `y_download`;
CREATE TABLE `y_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `my_id` int(11) DEFAULT NULL,
  `is_publish` int(1) DEFAULT '0',
  `is_comment` int(1) DEFAULT NULL,
  `is_top` int(1) DEFAULT NULL,
  `is_home` int(1) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL,
  `imgwidth` varchar(20) DEFAULT NULL,
  `imgheight` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_goods`;
CREATE TABLE `y_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `is_publish` int(1) DEFAULT '0',
  `is_comment` int(1) DEFAULT '0',
  `is_top` int(1) DEFAULT '0',
  `is_home` int(1) DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `content` text,
  `click_count` int(11) NOT NULL DEFAULT '1',
  `my_id` int(11) DEFAULT NULL,
  `imgwidth` int(11) DEFAULT NULL,
  `imgheight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_goods` (`id`, `category_id`, `is_publish`, `is_comment`, `is_top`, `is_home`, `ordernum`, `update_time`, `create_time`, `hardware`, `lang`, `title`, `tag`, `image`, `summary`, `seo_title`, `seo_keywords`, `seo_description`, `content`, `click_count`, `my_id`, `imgwidth`, `imgheight`) VALUES
(56,	1266,	1,	0,	0,	0,	999,	1970,	1970,	'pc',	'zh-cn',	'ss',	'',	'13849131907189b9c5gw1e31smt2yrmj.jpg',	'',	'',	'',	'',	'<p>sdsfs</p>',	1,	NULL,	NULL,	NULL),
(58,	1412,	1,	0,	0,	0,	999,	1385395200,	1385395200,	'pc',	'zh-tw',	'',	'',	'1385428950clear.jpg',	'',	'',	'',	'',	'',	1,	NULL,	NULL,	NULL),
(57,	1266,	1,	0,	0,	0,	999,	1970,	1970,	'pc',	'zh-cn',	'kk',	'',	'1384913230base3.jpg',	'fdgfd',	'',	'',	'',	'<p>kkffggffg</p>',	1,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `y_goods_inquire`;
CREATE TABLE `y_goods_inquire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `ordernum` int(11) NOT NULL,
  `hardware` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '未处理',
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_goods_photo`;
CREATE TABLE `y_goods_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned DEFAULT NULL,
  `is_publish` int(1) DEFAULT '0',
  `ordernum` int(11) DEFAULT '30',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_goods_photo` (`id`, `goods_id`, `is_publish`, `ordernum`, `lang`, `title`, `image`, `description`, `my_id`) VALUES
(97,	58,	0,	30,	NULL,	'',	'1384929230safari.png',	NULL,	0),
(96,	58,	0,	30,	NULL,	'',	'1384929230ie8.png',	NULL,	0),
(91,	56,	0,	30,	NULL,	'',	'13849131907189b9c5gw1e31smt2yrmj.jpg',	NULL,	0),
(92,	56,	0,	30,	NULL,	'',	'1384913708pppimg22.jpg',	NULL,	0),
(95,	58,	0,	30,	NULL,	'',	'1385428950AF087166-40C1-49A1-AE5F-0B3223B69B22.jpg',	NULL,	0),
(93,	57,	0,	30,	NULL,	'',	'1384913708pppimg11.jpg',	NULL,	0),
(94,	57,	0,	30,	NULL,	'',	'1384913708pppimg22.jpg',	NULL,	0),
(98,	58,	0,	30,	NULL,	'',	'1384929230opera.png',	NULL,	0);

DROP TABLE IF EXISTS `y_guestbook`;
CREATE TABLE `y_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `is_top` int(1) DEFAULT '0',
  `is_publish` int(1) DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `create_time` int(11) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `content` text,
  `reply` text,
  `email` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `read` int(4) DEFAULT '0',
  `my_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_guestbook` (`id`, `category_id`, `is_top`, `is_publish`, `ordernum`, `create_time`, `reply_time`, `hardware`, `lang`, `title`, `content`, `reply`, `email`, `linkman`, `mobile`, `tel`, `fax`, `read`, `my_id`) VALUES
(2,	1228,	0,	1,	999,	2012,	1352195802,	'pc',	'zh-cn',	'灯光分层是什么意思？',	'最近在看关于室内灯光设计分层的书籍？对灯光分层很模糊？劳烦各位给详细解答？',	'室内灯光设计',	'chen@domain.com',	'李先生',	NULL,	'18620500111',	NULL,	1,	0),
(17,	1224,	0,	1,	999,	1352948166,	1352948211,	'pc',	'zh-cn',	'测试内容',	'测试内容',	'yyyyyyyyy',	'888888@qq.com',	'测试内容',	NULL,	'158215655',	NULL,	1,	0),
(15,	1224,	0,	1,	999,	1352366821,	NULL,	'pc',	'zh-CN',	'测试',	'测试',	NULL,	'4524254@qq.com',	'测试',	NULL,	'15454876545',	NULL,	1,	NULL);

DROP TABLE IF EXISTS `y_job`;
CREATE TABLE `y_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_publish` int(1) DEFAULT NULL,
  `is_top` int(1) DEFAULT NULL,
  `is_home` int(1) DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `position_id` int(11) DEFAULT '0',
  `department` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `ordernum` int(11) DEFAULT '999',
  `number` int(11) DEFAULT NULL,
  `begin_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT '',
  `ask` text,
  `content` text,
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_job` (`id`, `is_publish`, `is_top`, `is_home`, `category_id`, `position_id`, `department`, `education`, `salary`, `ordernum`, `number`, `begin_time`, `end_time`, `create_time`, `hardware`, `lang`, `title`, `site`, `ask`, `content`, `my_id`) VALUES
(1,	1,	NULL,	NULL,	205,	0,	'市场部',	'大专',	'面议',	999,	1,	1351180800,	1351180800,	1351180800,	'pc',	'zh-cn',	'市场公关专员',	'广州',	'',	'&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;color:#FF0000;&quot;&gt;更新此内容登录后台选择：互易移动&amp;nbsp;&amp;gt;&amp;nbsp;人才招聘&amp;nbsp;&amp;gt;&amp;nbsp;人才招聘&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;职位信息：&lt;/p&gt;&lt;p&gt;1、协助进行市场公关活动执行；&lt;/p&gt;&lt;p&gt;2、针对公司的活动及日常宣传需要，撰写新闻稿，并对外发布；&lt;/p&gt;&lt;p&gt;3、建立和维护媒体关系，负责媒体公关活动的策划和实施；&lt;/p&gt;&lt;p&gt;4、能够对合作项目进行有效的内外部跟踪，保证项目进度达成。&amp;nbsp;&lt;/p&gt;&lt;p&gt;任职资格：：&lt;/p&gt;&lt;p&gt;1、大专以上学历，形象气质佳；&lt;/p&gt;&lt;p&gt;2、有一年以上市场策划及市场公关工作经验；&lt;/p&gt;&lt;p&gt;3、具备一定的沟通和协调能力，工作积极主动；&lt;/p&gt;&lt;p&gt;4、具备良好的文案功底，文字表达能力强；&lt;/p&gt;&lt;p&gt;5、熟悉广东省媒体，有媒体相关工作经验者优先。&lt;/p&gt;',	0),
(2,	1,	NULL,	NULL,	1217,	0,	'市场部',	'大专',	'面议',	999,	1,	1351180800,	1351180800,	1351180800,	'mobile',	'zh-cn',	'市场公关专员',	'广州',	'',	'&lt;p&gt;职位信息：&lt;/p&gt;&lt;p&gt;1、协助进行市场公关活动执行；&lt;/p&gt;&lt;p&gt;2、针对公司的活动及日常宣传需要，撰写新闻稿，并对外发布；&lt;/p&gt;&lt;p&gt;3、建立和维护媒体关系，负责媒体公关活动的策划和实施；&lt;/p&gt;&lt;p&gt;4、能够对合作项目进行有效的内外部跟踪，保证项目进度达成。&amp;nbsp;&lt;/p&gt;&lt;p&gt;任职资格：：&lt;/p&gt;&lt;p&gt;1、大专以上学历，形象气质佳；&lt;/p&gt;&lt;p&gt;2、有一年以上市场策划及市场公关工作经验；&lt;/p&gt;&lt;p&gt;3、具备一定的沟通和协调能力，工作积极主动；&lt;/p&gt;&lt;p&gt;4、具备良好的文案功底，文字表达能力强；&lt;/p&gt;&lt;p&gt;5、熟悉广东省媒体，有媒体相关工作经验者优先。&lt;/p&gt;',	0),
(3,	1,	NULL,	NULL,	205,	0,	'法务部',	'本科',	'面议',	999,	1,	1351180800,	1351180800,	1351180800,	'pc',	'zh-cn',	'专利推广经理',	'广州',	'',	'&lt;p&gt;职位信息：&lt;/p&gt;&lt;p&gt;1、参与知识产权专利业务的发展策略规划，提供知识产权专利专业咨询服务和解决方案；&lt;/p&gt;&lt;p&gt;2、开展对销售团队知识产权专利方面的知识培训，提高其理论知识和专业度；&lt;/p&gt;&lt;p&gt;3、与知识产权专利局保持紧密沟通，及时掌握国家有关知识产权专利政策和动向；&lt;/p&gt;&lt;p&gt;4、协助处理分公司在当地的专利诉讼案件。&amp;nbsp;&lt;/p&gt;&lt;p&gt;任职资格：：&lt;/p&gt;&lt;p&gt;1、本科以上学历，3年以上工作经验，有专利处理实战经验为佳；&lt;/p&gt;&lt;p&gt;2、熟悉专利相关法律、法规和业务流程；&lt;/p&gt;&lt;p&gt;3、具知识产权市场敏锐的嗅觉，出色的分析与研究能力；&lt;/p&gt;&lt;p&gt;4、良好的个人品德和职业操守，优秀的执行力和沟通协调技巧；&lt;/p&gt;&lt;p&gt;5、工作富激情，能承受较大的工作压力，适应快节奏的工作环境；&lt;/p&gt;&lt;p&gt;6、具大型知识产权代理公司相关工作经验者优先。&lt;/p&gt;',	0),
(4,	1,	NULL,	NULL,	1217,	0,	'法务部',	'本科',	'面议',	999,	1,	1351180800,	1351180800,	1351180800,	'mobile',	'zh-cn',	'专利推广经理',	'广州',	'',	'&lt;p&gt;职位信息：&lt;/p&gt;&lt;p&gt;1、参与知识产权专利业务的发展策略规划，提供知识产权专利专业咨询服务和解决方案；&lt;/p&gt;&lt;p&gt;2、开展对销售团队知识产权专利方面的知识培训，提高其理论知识和专业度；&lt;/p&gt;&lt;p&gt;3、与知识产权专利局保持紧密沟通，及时掌握国家有关知识产权专利政策和动向；&lt;/p&gt;&lt;p&gt;4、协助处理分公司在当地的专利诉讼案件。&amp;nbsp;&lt;/p&gt;&lt;p&gt;任职资格：：&lt;/p&gt;&lt;p&gt;1、本科以上学历，3年以上工作经验，有专利处理实战经验为佳；&lt;/p&gt;&lt;p&gt;2、熟悉专利相关法律、法规和业务流程；&lt;/p&gt;&lt;p&gt;3、具知识产权市场敏锐的嗅觉，出色的分析与研究能力；&lt;/p&gt;&lt;p&gt;4、良好的个人品德和职业操守，优秀的执行力和沟通协调技巧；&lt;/p&gt;&lt;p&gt;5、工作富激情，能承受较大的工作压力，适应快节奏的工作环境；&lt;/p&gt;&lt;p&gt;6、具大型知识产权代理公司相关工作经验者优先。&lt;/p&gt;',	0);

DROP TABLE IF EXISTS `y_job_resume`;
CREATE TABLE `y_job_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) unsigned DEFAULT NULL,
  `position_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `linkname` varchar(255) NOT NULL DEFAULT '',
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `intro` text,
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_job_resume` (`id`, `job_id`, `position_id`, `create_time`, `linkname`, `sex`, `age`, `email`, `phone`, `address`, `file`, `intro`, `my_id`) VALUES
(1,	1,	0,	1350980513,	'yyyy',	'男',	NULL,	'13123@qq.com',	'132432413213',	'13213212',	'',	'3213213213',	0),
(4,	4,	0,	1351511875,	'张三',	'男',	NULL,	'888888@qq.com',	'020-8888888',	'地址',	NULL,	'联系内容',	0),
(5,	NULL,	0,	1351622619,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(8,	1,	0,	1352947854,	'测试',	'男',	18,	'45452452@qq.com',	'158202369',	'测试地址',	'50a4588e3d154.docx',	'简历',	0),
(7,	1,	0,	1352366676,	'tttt',	'男',	12,	'1213425@qq.com',	'132435434',	'地址',	'509b7a54d43b9.doc',	'dszfdsfdsfsfd',	0);

DROP TABLE IF EXISTS `y_joinin`;
CREATE TABLE `y_joinin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `registered_capital` varchar(255) DEFAULT NULL,
  `employee_number` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `read` tinyint(4) DEFAULT '0',
  `content` text,
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_link`;
CREATE TABLE `y_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `my_id` int(11) DEFAULT NULL,
  `is_publish` int(1) DEFAULT '0',
  `is_home` int(1) DEFAULT '0',
  `is_top` int(1) DEFAULT '0',
  `ordernum` int(11) DEFAULT '30',
  `update_time` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_market`;
CREATE TABLE `y_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `is_publish` int(1) NOT NULL DEFAULT '0',
  `is_top` int(11) NOT NULL DEFAULT '0',
  `is_home` int(11) NOT NULL DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `create_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mapcode` varchar(255) DEFAULT NULL,
  `content` text,
  `content_type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `imgwidth` varchar(20) DEFAULT NULL,
  `imgheight` varchar(20) DEFAULT NULL,
  `traffic1` varchar(255) DEFAULT NULL,
  `traffic2` varchar(255) DEFAULT NULL,
  `office_location` varchar(255) DEFAULT NULL,
  `point_x` varchar(255) DEFAULT NULL,
  `point_y` varchar(255) DEFAULT NULL,
  `address_title` varchar(255) DEFAULT NULL,
  `address_content` varchar(255) DEFAULT NULL,
  `email_title` varchar(255) DEFAULT NULL,
  `email_content` varchar(255) DEFAULT NULL,
  `tel_title` varchar(255) DEFAULT NULL,
  `tel_content` varchar(255) DEFAULT NULL,
  `weibo_title` varchar(255) DEFAULT NULL,
  `weibo_content` varchar(255) DEFAULT NULL,
  `fax_title` varchar(255) DEFAULT NULL,
  `fax_content` varchar(255) DEFAULT NULL,
  `sms_title` varchar(255) DEFAULT NULL,
  `sms_content` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `code_content` varchar(255) DEFAULT NULL,
  `other_title` varchar(255) DEFAULT NULL,
  `code_title` varchar(255) DEFAULT NULL,
  `web_content` varchar(255) DEFAULT NULL,
  `contact_content` varchar(255) DEFAULT NULL,
  `web_title` varchar(255) DEFAULT NULL,
  `other_content` varchar(255) DEFAULT NULL,
  `my_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_market` (`id`, `category_id`, `is_publish`, `is_top`, `is_home`, `ordernum`, `create_time`, `hardware`, `lang`, `title`, `tag`, `email`, `linkman`, `tel`, `fax`, `postcode`, `address`, `mapcode`, `content`, `content_type`, `image`, `imgwidth`, `imgheight`, `traffic1`, `traffic2`, `office_location`, `point_x`, `point_y`, `address_title`, `address_content`, `email_title`, `email_content`, `tel_title`, `tel_content`, `weibo_title`, `weibo_content`, `fax_title`, `fax_content`, `sms_title`, `sms_content`, `contact_title`, `code_content`, `other_title`, `code_title`, `web_content`, `contact_content`, `web_title`, `other_content`, `my_id`) VALUES
(2,	615,	1,	0,	0,	999,	1351233718,	'pc',	'zh-cn',	'广州办事处',	NULL,	'chen@domain.com',	'陈先生',	'020-88888888',	'020-88888887',	'510610',	'广东省广州市天河区天河北路366号',	'',	'负责分公司业务销售。',	NULL,	'',	'300',	'300',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(3,	615,	1,	0,	0,	999,	1351233706,	'pc',	'zh-cn',	'深圳办事处',	NULL,	'lili@domain.com',	'李先生',	'18688888888',	'075525981888',	'510610',	'罗湖区深南东路4003号世界金融中心1楼',	'',	'负责分公司业务销售。',	NULL,	'',	'300',	'300',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(4,	615,	1,	0,	0,	999,	1351233842,	'pc',	'zh-cn',	'东莞办事处',	NULL,	'chen126@domain.com',	'陈先生',	'07692039888',	'07692039887',	'',	'广东省东莞市东城中路达鑫创富中心',	'',	'',	NULL,	'',	'300',	'300',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(5,	625,	1,	0,	0,	999,	1351234364,	'pc',	'zh-cn',	'北京办事处',	NULL,	'lilis@domain.com',	'李先生',	'01084047312',	'01084047388',	'',	'北京市东城区隆福寺街95号',	'',	'',	NULL,	'',	'300',	'300',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(26,	1215,	1,	0,	0,	999,	1362044617,	'mobile',	'zh-tw',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	'cxvcxv',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	NULL),
(25,	1215,	1,	0,	0,	999,	1362044606,	'mobile',	'zh-cn',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	'gffgdg',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	NULL),
(24,	1214,	1,	0,	0,	999,	1362044068,	'mobile',	'zh-tw',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	'繁.....',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	NULL),
(23,	1213,	1,	0,	0,	999,	1362043678,	'mobile',	'zh-tw',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ffff广东省广州市天河客运站',	'113.349508',	'23.17719',	'hgghgjhg地址标题',	'地址内容',	'邮箱标题',	'邮箱内容',	'电话标题',	'电话内容',	'微博标题',	'微博内容',	'传真标题',	'传真内容',	'短信标题',	'短信内容',	'联系人标题',	'编码内容',	'其他标题',	'邮政编码',	'网站详情',	'联系人详情',	'网站主页',	'ggg其他信息',	NULL),
(22,	1214,	1,	0,	0,	999,	1367328158,	'mobile',	'zh-cn',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	'东莞',	'东莞公司地址',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	NULL),
(21,	1213,	1,	0,	0,	999,	1362042894,	'mobile',	'zh-cn',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'广东省广州市天河客运站',	'113.349508',	'23.17719',	'地址标题',	'地址内容',	'邮箱标题',	'邮箱内容',	'电话标题',	'电话内容',	'微博标题',	'微博内容',	'传真标题',	'传真内容',	'短信标题',	'短信内容',	'联系人标题',	'编码内容',	'其他标题',	'邮政编码',	'网站详情',	'联系人详情',	'网站主页',	'其他信息',	NULL);

DROP TABLE IF EXISTS `y_member`;
CREATE TABLE `y_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_publish` int(1) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_mobile_contact`;
CREATE TABLE `y_mobile_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `is_home` int(1) DEFAULT NULL,
  `is_contact` int(1) DEFAULT NULL,
  `is_publish` int(1) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `address_title` varchar(255) DEFAULT NULL,
  `address_content` varchar(255) DEFAULT NULL,
  `office_location` varchar(255) DEFAULT NULL,
  `point_x` varchar(255) DEFAULT NULL,
  `point_y` varchar(255) DEFAULT NULL,
  `email_title` varchar(255) DEFAULT NULL,
  `email_content` varchar(255) DEFAULT NULL,
  `tel_title` varchar(255) DEFAULT NULL,
  `tel_content` varchar(255) DEFAULT NULL,
  `weibo_title` varchar(255) DEFAULT NULL,
  `weibo_content` varchar(255) DEFAULT NULL,
  `fax_title` varchar(255) DEFAULT NULL,
  `fax_content` varchar(255) DEFAULT NULL,
  `sms_title` varchar(255) DEFAULT NULL,
  `sms_content` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `contact_content` varchar(255) DEFAULT NULL,
  `web_content` varchar(255) DEFAULT NULL,
  `web_title` varchar(255) DEFAULT NULL,
  `other_content` varchar(255) DEFAULT NULL,
  `other_title` varchar(255) DEFAULT NULL,
  `code_content` varchar(255) DEFAULT NULL,
  `code_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_mobile_contact` (`id`, `category_id`, `is_home`, `is_contact`, `is_publish`, `hardware`, `lang`, `address_title`, `address_content`, `office_location`, `point_x`, `point_y`, `email_title`, `email_content`, `tel_title`, `tel_content`, `weibo_title`, `weibo_content`, `fax_title`, `fax_content`, `sms_title`, `sms_content`, `contact_title`, `contact_content`, `web_content`, `web_title`, `other_content`, `other_title`, `code_content`, `code_title`) VALUES
(19,	1,	NULL,	NULL,	1,	'mobile',	'zh-cn',	'地址标题gggg',	'地址详细内容',	'广东省广州市天河客运站',	'113.349508',	'23.17719',	'邮箱标题',	'邮箱内容',	'电话标题',	'电话内容',	'微博标题',	'微博内容',	'传真标题',	'传真内容',	'短信标题',	'短信内容',	'联系人标题',	'联系人详情',	'网站详情',	'网站标题',	'其他内容',	'其他标题',	'邮政内容',	'邮政标题'),
(20,	1,	NULL,	NULL,	1,	'mobile',	'zh-tw',	't地址标题gfgfgfgf',	'tt地址详细内容',	'ttt广东省广州市天河客运站',	'113.349508',	'23.17719',	'邮箱标题',	'邮箱内容',	'电话标题',	'电话内容',	'微博标题',	'微博内容',	'传真标题',	'传真内容',	'短信标题',	'短信内容',	'联系人标题',	'联系人详情',	'网站详情',	'网站标题',	'其他内容',	'其他标题',	'邮政内容',	'邮政标题');

DROP TABLE IF EXISTS `y_news`;
CREATE TABLE `y_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `is_publish` int(1) DEFAULT '0',
  `is_comment` int(1) DEFAULT '0',
  `is_top` int(1) DEFAULT '0',
  `is_home` int(1) DEFAULT '0',
  `click_count` int(11) DEFAULT '1',
  `ordernum` int(11) DEFAULT '999',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `content` text,
  `my_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_news` (`id`, `category_id`, `is_publish`, `is_comment`, `is_top`, `is_home`, `click_count`, `ordernum`, `update_time`, `create_time`, `hardware`, `lang`, `title`, `tag`, `image`, `author`, `source`, `summary`, `seo_title`, `seo_keywords`, `seo_description`, `content`, `my_id`) VALUES
(3,	1170,	1,	0,	0,	0,	6,	999,	1367239403,	1362486781,	'pc',	'zh-cn',	'公司简介',	NULL,	NULL,	NULL,	NULL,	' 公司简介 公司简介 公司简介1111',	'',	'',	'',	'&lt;p&gt;&amp;nbsp;公司简介&amp;nbsp;公司简介&amp;nbsp;公司简介PC版本&lt;img src=&quot;/dd_cms_v2/Public/ueditor/server/upload/php/Public/images/ueditor/35101367200248.jpg&quot; style=&quot;float:none;&quot; title=&quot;1329120026.jpg&quot; hspace=&quot;0&quot; vspace=&quot;0&quot; border=&quot;0&quot; /&gt;&lt;br /&gt;&lt;/p&gt;',	NULL),
(4,	1198,	1,	0,	0,	0,	1,	999,	1367200358,	1367199485,	'mobile',	'zh-cn',	'公司简介',	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	'',	'&lt;p&gt;公司简介21sda&lt;br&gt;&lt;/p&gt;\r\n',	NULL);

DROP TABLE IF EXISTS `y_part`;
CREATE TABLE `y_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `orderNum` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `is_publish` int(11) NOT NULL DEFAULT '0',
  `nowModule` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `y_part` (`id`, `pid`, `orderNum`, `lang`, `title`, `url`, `description`, `is_publish`, `nowModule`, `alias`) VALUES
(17,	0,	10,	'zh-cn',	'网站首页',	'__APP__',	'',	1,	'',	''),
(18,	0,	10,	'zh-cn',	'企业简介',	'__APP__/About',	'',	1,	'',	''),
(19,	0,	10,	'zh-cn',	'新闻动态',	'__APP__/News',	'',	1,	'',	''),
(20,	0,	10,	'zh-cn',	'产品展示',	'__APP__/Goods',	'',	1,	'',	''),
(21,	0,	10,	'zh-cn',	'服务网点',	'__APP__/Market',	'',	1,	'',	''),
(22,	0,	10,	'zh-cn',	'人才招聘',	'__APP__/Job/show',	'',	1,	'Job',	''),
(23,	0,	10,	'zh-cn',	'招商加盟',	'__APP__/Join',	'',	0,	'',	''),
(24,	0,	10,	'zh-cn',	'在线留言',	'__APP__/Guestbook',	'',	1,	'',	''),
(25,	0,	10,	'zh-cn',	'联系我们',	'__APP__/Contact',	'',	1,	'',	''),
(26,	0,	10,	'zh-cn',	'经营理念',	'/index.php/About/index/cid/1171.html',	'',	0,	'',	''),
(27,	0,	10,	'mobile',	'关于我们',	'__APP__/About',	'',	1,	'',	'About/index'),
(29,	0,	10,	'mobile',	'产品展示',	'__APP__/Goods',	'',	1,	'',	'Goods/index'),
(30,	0,	10,	'mobile',	'新闻动态',	'__APP__/News',	'',	1,	'',	'News/index'),
(31,	0,	10,	'mobile',	'营销网络',	'__APP__/Market',	'',	1,	'',	''),
(32,	0,	10,	'mobile',	'在线留言',	'__APP__/Message',	'',	1,	'',	''),
(33,	0,	10,	'mobile',	'联系方式',	'__APP__/Contact',	'',	1,	'',	''),
(34,	0,	10,	'mobile',	'企业微博',	'__APP__/Weibo',	'',	1,	'',	''),
(35,	0,	10,	'zh-cn',	'企业微博',	'__APP__/Weibo',	'',	1,	'',	''),
(37,	0,	10,	'mobile',	'人才招聘',	'__APP__/Job',	'',	1,	'',	'');

DROP TABLE IF EXISTS `y_survey`;
CREATE TABLE `y_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `my_id` int(11) DEFAULT NULL,
  `issue_type` int(1) DEFAULT NULL,
  `validity_time` int(11) DEFAULT NULL,
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `ques_num` int(11) NOT NULL DEFAULT '0',
  `is_publish` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_survey_answer`;
CREATE TABLE `y_survey_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ques_id` int(11) NOT NULL DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '999',
  `answer_type` tinyint(3) NOT NULL DEFAULT '0',
  `answer_title` varchar(250) NOT NULL DEFAULT '0',
  `my_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_survey_question`;
CREATE TABLE `y_survey_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '0',
  `answer_type` tinyint(3) NOT NULL DEFAULT '0',
  `ques_title` varchar(255) NOT NULL DEFAULT '',
  `text_answer` varchar(255) NOT NULL DEFAULT '',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_survey_result`;
CREATE TABLE `y_survey_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `ques_id` int(11) NOT NULL DEFAULT '0',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `answer_text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `y_system`;
CREATE TABLE `y_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `app_logo` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `copyright` varchar(50) DEFAULT NULL,
  `credible` varchar(255) DEFAULT NULL,
  `icpnumber` varchar(255) DEFAULT NULL,
  `seo_title` varchar(100) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `email_smtp_host` varchar(20) DEFAULT NULL,
  `email_smtp_port` varchar(10) DEFAULT NULL,
  `email_username` varchar(20) DEFAULT NULL,
  `email_password` varchar(20) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `email_auto` varchar(50) DEFAULT NULL,
  `is_twoCode` int(11) DEFAULT '1',
  `my_id` int(11) DEFAULT NULL,
  `sina_wb_url` varchar(255) DEFAULT NULL,
  `qq_wb_url` varchar(255) DEFAULT NULL,
  `weibo_type` int(11) DEFAULT NULL,
  `is_share` int(11) DEFAULT NULL,
  `share_plug` text,
  `weibo_plug` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `y_system` (`id`, `theme`, `hardware`, `lang`, `linkman`, `company`, `telephone`, `fax`, `postcode`, `address`, `image`, `app_logo`, `email`, `website`, `domain`, `copyright`, `credible`, `icpnumber`, `seo_title`, `seo_keywords`, `seo_description`, `email_smtp_host`, `email_smtp_port`, `email_username`, `email_password`, `email_subject`, `email_address`, `email_auto`, `is_twoCode`, `my_id`, `sina_wb_url`, `qq_wb_url`, `weibo_type`, `is_share`, `share_plug`, `weibo_plug`) VALUES
(1,	NULL,	'pc',	'zh-cn',	'',	'Supeviouity Hotel Service',	'020-28264979',	'020-28264979',	'510610',	'中国广东省广州市体育西路107号',	'',	NULL,	'admin@Abc.com',	'Supeviouity Service',	'Supeviouity Service',	'2012  Supeviouity  Service',	'<img  style=\"CURSOR: pointer\" onclick=\"javascript:window.open(\'http://b.qq.com/webc.htm?new=0&sid=790005994&o=移动&q=7\', \'_blank\', \'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no\');\"  border=\"0\" SRC=http://wpa.qq.com/pa?p=1:790005994:1 ',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(4,	NULL,	'pc',	'zh-tw',	'',	'Supeviouity Hotel Service',	'020-28264979',	'020-28264979',	'510610',	'中國廣東省廣州市體育西路107號',	'50b5ac41c0cbc.jpg',	NULL,	'admin@Abc.com',	'Supeviouity Service',	'Supeviouity Service',	'2012  Supeviouity  Service',	NULL,	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	NULL,	'pc',	'en-us',	'',	'Supeviouity Hotel Service',	'020-28264979',	'020-28264979',	'510610',	'Guangzhou City, Guangdong Province, China Sports 107 West No.',	'50b5ac41c0cbc.jpg',	NULL,	'admin@Abc.com',	'Supeviouity Service',	'Supeviouity Service',	'2012  Supeviouity  Service',	NULL,	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	NULL,	'pc',	'ja-jp',	'',	'Supeviouity Hotel Service',	'020-28264979',	'020-28264979',	'510610',	'広州市、広東省、中国スポーツ107ウェスト号',	'50b5ac41c0cbc.jpg',	NULL,	'admin@Abc.com',	'Supeviouity Service',	'Supeviouity Service',	'2012  Supeviouity  Service',	NULL,	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	NULL,	'pc',	'ko-kr',	'',	'Supeviouity Hotel Service',	'020-28264979',	'020-28264979',	'510610',	'광주 도시, 광동성, 중국 스포츠 107 서쪽 번호',	'50b5ac41c0cbc.jpg',	NULL,	'admin@Abc.com',	'Supeviouity Service',	'Supeviouity Service',	'2012  Supeviouity  Service',	NULL,	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	'Supeviouity Service',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	NULL,	'pc',	'zh-cn',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	NULL,	'mobile',	'zh-cn',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'网站名称',	'网站域名',	'网站版权',	'可信认证',	'ICP备案号',	'网站名称',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	NULL,	'mobile',	'zh-tw',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'网站名称',	'网站域名',	'网站版权',	'可信认证',	'ICP备案号',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `y_theme`;
CREATE TABLE `y_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pc` int(11) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `ipad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `y_theme` (`id`, `pc`, `mobile`, `ipad`) VALUES
(1,	2,	1,	1);

DROP TABLE IF EXISTS `y_video`;
CREATE TABLE `y_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `is_publish` int(11) unsigned DEFAULT '0',
  `is_comment` int(11) unsigned DEFAULT NULL,
  `is_top` int(11) unsigned DEFAULT NULL,
  `is_home` int(11) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `ordernum` int(11) unsigned DEFAULT '999',
  `update_time` int(11) unsigned DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `hardware` varchar(255) NOT NULL DEFAULT 'pc',
  `lang` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `imgwidth` varchar(255) DEFAULT NULL,
  `imgheight` varchar(255) DEFAULT NULL,
  `downfile` varchar(255) DEFAULT NULL,
  `url` text,
  `tag` varchar(255) DEFAULT NULL,
  `is_show` int(11) DEFAULT '0',
  `is_online` int(11) DEFAULT NULL,
  `y_or_t` int(11) DEFAULT NULL,
  `vWidth` varchar(255) DEFAULT NULL,
  `vHeight` varchar(255) DEFAULT NULL,
  `is_phone` int(11) DEFAULT NULL,
  `my_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2013-11-26 15:58:22
