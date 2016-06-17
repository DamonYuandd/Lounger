<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
</head>
<body>
<div data-role="page">
	<div data-role="header" data-theme="a"><h1>请选择分类</h1></div> 
    <div data-role="content">
    	<ul data-role="listview" data-divider-theme="a" data-inset="true">
        	 <?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one): $mod = ($i % 2 );++$i;?><li <?php if(!empty($one['_child'])): ?><?php endif; ?>>
                    <a href="__APP__/Index/sortEdit/id/<?php echo ($one["id"]); ?>" data-transition="slide" data-ajax="false">
                    <?php echo ($one['title']); ?>
                    </a>
           		  </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div> 
</div>
</body>
</html>