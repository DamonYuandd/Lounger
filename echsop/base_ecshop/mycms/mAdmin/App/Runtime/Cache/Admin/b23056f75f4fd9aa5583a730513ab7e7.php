<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
<script>
function Data(){
	this._APP_ = "__APP__";
	this.c_root = "<?php echo $_SESSION['c_root']; ?>";
	this.get_cid = "<?php echo $_GET['cid']; ?>"
	this.rowpage = "<?php echo $rowpage; ?>";
	this.actionName = "<?php echo $actionName;?>";
}
</script>
</head>
<body>
<div data-role="page">
	<!-- layout::Inc:edit_head::0 -->
      <div data-role="content">
<form action="" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
	<ul id="goodsList" data-role="listview" data-divider-theme="a" data-inset="true" data-filter="true" data-filter-placeholder="请出入标题" >
     		<li data-role="list-divider" role="heading">
                    当前位置：<?php getNavSite($nav_site,$_GET['cid']);?>
            </li>
	<?php if(!empty($dataList)): ?><?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
            <a href="__APP__/Admin/Goods/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo ($vo["category_id"]); ?>" data-ajax="false">
             <img src="<?php if(!empty($vo["image"])): ?><?php echo $upload_root_path.'images/product/s_'.$vo['image']; ?>
             <?php else: ?><?php echo ($sysImage); ?><?php endif; ?>"
             />
		     <h3> <?php getLangTextTitle($vo['lang']);?><?php echo ($vo["title"]); ?></h3>
           	 <p><?php echo ($vo["summary"]); ?></p>
           </a>
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