<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
</head>
<body>
<div data-role="page">
	<!-- layout::Inc:edit_head::0 -->
     <div data-role="content">
	 <form action="__APP__/Admin/News" method="post" id="form_list">
		<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
        <ul data-role="listview" data-divider-theme="a" data-inset="true" data-filter="true" data-filter-placeholder="请出入标题">
            <li data-role="list-divider" role="heading">
                    当前位置：<?php getNavSite($nav_site,$_GET['cid']);?>
            </li>
        <?php if(!empty($dataList)): ?><?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
               	  <a href="__APP__/Admin/News/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo ($vo["category_id"]); ?>" data-ajax="false"><?php getLangTextTitle($vo['lang']);?><?php echo ($vo["title"]); ?></a> 
                 </li><?php endforeach; endif; else: echo "" ;endif; ?>
           <?php else: ?>
           <li>没有找到数据！！！</li><?php endif; ?>
        </ul>
         <ul id="goodsList" data-role="listview" data-divider-theme="a" data-inset="true" >
               <li style="text-align:center;"><?php echo ($pageBar); ?></li>
         </ul>
        </form>
     </div>
<!-- layout::Inc:edit_footer::0 -->
</div>
</body>
</html>