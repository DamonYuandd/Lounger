<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
<script>
function Data(){
	this._APP_ = "__APP__";
	this.c_root = "<?php echo $_SESSION['c_root']; ?>";
	this.get_cid = ""
	this.rowpage = "<?php echo $rowpage; ?>";
	this.actionName = "<?php echo $actionName;?>";
}
$(document).ready(function(){

	$('#select-filter').change(function(){
		window.location.href = $(this).val();
	});	
	
});
</script>
</head>
<body>
<div data-role="page">
	<!-- layout::Inc:edit_head::0 -->
      <div data-role="content">
<form action="__APP__/Admin/Guestbook" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
		<?php 
					function decide_selected($status,$val){
						if($_GET['status'] === $status && $_GET['val'] === $val ) {
							echo 'selected';
						}
					} ?>
<ul data-role="listview" data-role="listview" data-divider-theme="a" data-inset="true">
     		<li data-role="list-divider" role="heading">
                    当前位置：<?php getNavSite($nav_site,$_GET['cid']);?>
            </li>		
            <li>
            	<select id="select-filter" style="margin-bottom:30px;">
					<option value="__APP__/Admin/Guestbook/index/cid/<?php echo $_GET["cid"];?>" >所有状态</option>
					<option value="__APP__/Admin/Guestbook/query/status/reply/val/0/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('reply','0');?> >未回复</option>
					<option value="__APP__/Admin/Guestbook/query/status/reply/val/1/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('reply','1');?> >已回复</option>
					<option value="__APP__/Admin/Guestbook/query/status/varify/val/0/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('varify','0');?> >未审核</option>
					<option value="__APP__/Admin/Guestbook/query/status/varify/val/1/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('varify','1');?> >已审核</option>
				</select>	
            </li>		
		<?php if(!empty($dataList)): ?><?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="__APP__/Admin/Guestbook/edit/id/<?php echo ($vo["id"]); ?>" data-ajax="false"><?php getLangTextTitle($vo['lang']);?><?php echo ($vo["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php else: ?>
				<li>没有找到留言。</li><?php endif; ?>
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