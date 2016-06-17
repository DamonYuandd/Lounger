<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网络营销管理</title>
<link rel="stylesheet" type="text/css" href="__ADMIN__/Public/css/base.css" />
<script src="__ADMIN__/Public/js/jquery-1.7.1.min.js"></script>
<script src="__ADMIN__/Public/js/base.js"></script>
<script>
function Data(){
	this._APP_ = "__APP__";
	this.actionName = "<?php echo $actionName;?>";
}
</script>
<script src="__ADMIN__/Public/js/index.js"></script>

</head>
<body>
<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?></div>

<form action="__APP__/Admin/Market" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
<table class="grid-function" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="600">
				<div class="qw-fl grid-add-data">
					<input type="button" value="添加网点" class="button-img-add" onclick="goToUrl('__APP__/Admin/Market/edit/lang/<?php echo $_GET["lang"];?>/cid/<?php echo $_GET["cid"];?>')"/>
				</div>
				<div class="qw-fl grid-batch-operate">					
					<a href="#" id="on_ordernum" title="数字排序"><img src="__ADMIN__/Public/imgs/sort.png" align="top" /></a>&nbsp;&nbsp;
					<a href="#" id="on_delete" title="彻底删除"><img src="__ADMIN__/Public/imgs/delete.png" align="top" /></a>&nbsp;&nbsp;
				</div>
				<div class="qw-fr">
					
				</div>
			</th>
		</tr>
	</thead>
</table>
<table class="grid-table" border="1" cellpadding="0" cellspacing="0"> 
	<thead> 
		<tr>
			<th width="15"><input type="checkbox" id="chk_all"></th>
			<th width="25">排序</th>
		    <th>标题</th>
		    <th width="110">分类</th>
		    
		    <th width="80">发布时间</th>
		    <th width="25">发布</th>
		    <th width="50">操作</th>
		</tr> 
	</thead> 
	<?php if(!empty($dataList)): ?><tbody>
		<?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr> 
			<td><input type="checkbox" name="ids[]" id="ids<?php echo ($vo["id"]); ?>" value="<?php echo ($i); ?>,<?php echo ($vo["id"]); ?>"></td>
			<td><input style="width:35px" name="ordernums[]" id="ordernum<?php echo ($vo["id"]); ?>" value="<?php echo ($vo["ordernum"]); ?>"></td>
			<td><?php getLangTextTitle($vo['lang']);?> <a href="__APP__/Admin/Market/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo $_GET["cid"];?>"><?php echo ($vo["title"]); ?></a>
				<?php if(!empty($vo["image"])): ?><img alt="有封面图片" src="__ADMIN__/Public/imgs/gtk-image.png"><?php endif; ?>
			</td>
		    <td><?php getCategoryTitle($vo['category_id']);?></td>
		    <td><?php echo (date('Y-m-d',$vo["create_time"])); ?></td>
		    <td align="center"><?php getCheckboxState($vo['id'],'is_publish',$vo['is_publish']);?></td>
		    <td><a href="__APP__/Admin/Market/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo $_GET["cid"];?>"><img src="__ADMIN__/Public/imgs/edit.png" /></a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:deleteData('__APP__/Admin/Market/deleteById/id/<?php echo ($vo["id"]); ?>');"><img src="__ADMIN__/Public/imgs/cross.png" /></a></td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
	</tbody>
			<?php else: ?>
	<tbody>
		<tr>
			<td colspan="10" align="center" style="color:red;">没有找到数据！！！<a href="__APP__/Admin/Market/edit/cid/<?php echo $_GET["cid"];?>/lang/<?php echo empty($_GET['lang'])?$custom['def_lang']:$_GET['lang']; ?>">添加</a></td>
		</tr>
	</tbody><?php endif; ?>
	<tfoot>
		<tr>
			<td colspan="10">
				<div class="qw-fl" style="visibility:hidden;">
					<select name="rowpage" id="rowpage">
						 
					</select>
				</div>
				<div class="qw-fr">
					<div class="grid-pagination">
					<?php echo ($pageBar); ?>
					</div>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</form>

</body>
</html>