<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
</head>
<body>
<div data-role="page" >
	<div data-role="header" data-theme="a"><h1>请选择系统设置</h1></div> 
    <div data-role="content">
    	<ul data-role="listview" data-divider-theme="a" data-inset="true">
            <li>
                <a href="__APP__/System/index/cid/base" data-transition="slide" data-inline="true" id="System1" data-ajax="false">网站基本信息</a>
            </li> 
            <li>
                <a href="__APP__/System/index/cid/seo"  data-transition="slide" data-inline="true" id="System2" data-ajax="false">网站SEO设置</a>
            </li> 
        </ul>
    </div> 
</div>
</body>
</html>