<?php
return array(

	/* 项目设定 */
	'APP_DEBUG'             => 1,
	'SHOW_PAGE_TRACE'       => 0,
	'TMPL_CACHE_ON'			=> false,
	'APP_GROUP_LIST'        => 'Admin',
	'DEFAULT_GROUP'         => 'Admin',
	'DEFAULT_ACTION'        => 'index',
	'TMPL_PARSE_STRING'     => array('__ADMIN__'=>__ROOT__.'/'.APP_NAME.'/Tpl/default/Admin',
									'__HOME__'=>__ROOT__.'/'.APP_NAME.'/Tpl/default/Home/Public'),


	'DB_TYPE'               => 'mysql',     // 数据库类型
	'DB_HOST'               => 'localhost', // 服务器地址
	'DB_NAME'               => 'dd_cms_v2',          // 数据库名
	'DB_USER'               => 'root',      // 用户名
	'DB_PWD'                => '',          // 密码
	'DB_PORT'               => '3306',        // 端口
	'DB_PREFIX'             => 'y_',

		
	/* URL设置 */
	'URL_ROUTER_ON'         => true,
	'URL_MODEL'             => 1,
	'URL_HTML_SUFFIX'       => '.html',

		
		
		
	'APP_ROOT_PATH'  => 'D:/wamp/www',
	'UPLOAD_FILE_RULE'      => '/yupload',
	'IMG_URL'      => '/yupload',

	/* RBAC */
    'USER_AUTH_KEY'             =>'admin',	// 用户认证SESSION标记
);
?>