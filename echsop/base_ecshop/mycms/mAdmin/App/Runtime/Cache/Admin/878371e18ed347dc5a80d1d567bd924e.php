<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
</head>
<body>
<div data-role="page"  class="pageShow">
	<!-- layout::Inc:edit_head::0 -->
    <div data-role="content">
    	<ul data-role="listview" data-divider-theme="a" data-inset="true">
            <li data-role="list-divider" role="heading">
                选择栏目：
            </li>
            <?php if(is_array($moduleList)): $i = 0; $__LIST__ = $moduleList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li data-theme="<?php if(($_SESSION["D_lang"]["title"])  ==  $vo["title"]): ?>d<?php else: ?>c<?php endif; ?>">
                    <a href="__APP__/Admin/Index/sidemenu/pid/<?php echo ($vo["id"]); ?>" data-transition="slide">
                      <?php getDefNavTitle(json_decode($vo['title'],true),$_SESSION['lang']);?>
                    </a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>     
             	<li>
                	<a href="__APP__/System/index/cid/sel" data-transition="slide" id="System" ata-transition="pop" data-rel="dialog">系统设置</a>
                </li>   
        </ul>
    </div> 
　 	<!-- layout::Inc:edit_footer::0 -->
</div>
</body>
</html>