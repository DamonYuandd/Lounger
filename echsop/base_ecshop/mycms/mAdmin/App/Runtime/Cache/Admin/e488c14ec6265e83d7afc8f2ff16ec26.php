<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
</head>
<body>
<div data-role="page" class="pageShow">
	<!-- layout::Inc:edit_head::0 -->
    <div data-role="content">
                <ul data-role="listview" data-divider-theme="a" data-inset="true"> 
             		  <li data-role="list-divider" role="heading">
                   		 当前位置：<?php getNavSite($headTitle,$_GET['pid']);?>
           	      	  </li>
                  <?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one): $mod = ($i % 2 );++$i;?><li <?php if(!empty($one['_child'])): ?><?php endif; ?>>
                    <a href="<?php getSideMenuUrl($module,$one['id'],$one['burl']);?>/lang/<?php echo ($_SESSION['lang']); ?>" <?php if(($one["tpl_one"])  ==  "one"): ?>data-ajax="false"<?php else: ?>  data-transition="slide"<?php endif; ?>>
                   <?php echo ($one['title']); ?>
                    </a>
           		  </li><?php endforeach; endif; else: echo "" ;endif; ?>
            <?php if(($module == 'About') OR  ($module == 'News')  OR  ($module == 'Goods')): ?><li>
              	  <a href="__APP__/Index/sidemenu/sort/sel/pid/<?php echo ($_GET['pid']); ?>"data-transition="slide" id="System" ata-transition="pop" data-rel="dialog">分类管理</a>
          		  </li><?php endif; ?>        
                </ul>
    </div> 
　 	<!-- layout::Inc:edit_footer::0 -->
</div>
</body>
</html>