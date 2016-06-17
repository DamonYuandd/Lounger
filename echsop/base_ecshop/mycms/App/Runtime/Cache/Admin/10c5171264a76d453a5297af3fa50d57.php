<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>默认数据表格</title>
<link rel="stylesheet" type="text/css" href="__ADMIN__/Public/css/base.css" />
<script src="__ADMIN__/Public/js/jquery-1.7.1.min.js"></script>
<script src="__ADMIN__/Public/js/base.js"></script>

<script>
function Data(){
	this._APP_ = "__APP__";
	this.c_root = "<?php echo $c_root; ?>";
	this.get_cid = "<?php echo $_GET['cid']; ?>"
	this.rowpage = "<?php echo $rowpage; ?>";
	this.actionName = "<?php echo $actionName;?>";
}

function showResume( tr_id ) {
	var tr_ele = $('#tr_'+tr_id);
	if(tr_ele.is(":hidden")) {
		tr_ele.show();
	} else {
		tr_ele.hide();
	}
}
</script>
<script src="__ADMIN__/Public/js/index.js"></script>

</head>
<body>

<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?></div>
<form action="__APP__/Admin/Job" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
<table class="grid-function" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="600">
				<div class="qw-fl grid-add-data">
					<input type="button" value="添加招聘" onclick="goToUrl('__APP__/Admin/Job/edit/lang/<?php echo $_GET["lang"];?>/cid/<?php echo $_GET["cid"];?>');" class="button-img-add" /></a>
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
			<th width="35">排序</th>
		    <th>标题</th>
		    <th width="80">职位</th>
		    <th width="60">收到简历</th>
		    <th width="50">招聘人数</th>
		    <th width="75">截止日期</th>
		    <th width="25">发布</th>
		    <th width="50">操作</th>
		</tr> 
	</thead> 
	<tbody>
		<?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr> 
			<td><input type="checkbox" name="ids[]" id="ids<?php echo ($vo["id"]); ?>" value="<?php echo ($i); ?>,<?php echo ($vo["id"]); ?>"></td>
			<td><input style="width:35px" name="ordernums[]" id="ordernum<?php echo ($vo["id"]); ?>" value="<?php echo ($vo["ordernum"]); ?>"></td>
		    <td><?php getLangTextTitle($vo['lang']);?>&nbsp;<a href="__APP__/Admin/Job/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo $_GET["cid"];?>"><?php echo ($vo["title"]); ?></a></td>
		    <td><?php getCategoryTitle($vo['category_id'],$vo['lang']);?></td>
		    <td><a href="#" onclick="showResume('<?php echo ($vo["id"]); ?>')" style="color:red;">(<?php getJobResumeCount($vo['id']);?>) 查看</a></td>
		    <td><?php echo ($vo["number"]); ?></td>
		    <td><?php echo (date('Y-m-d',$vo["end_time"])); ?></td>
		    <td align="center"><?php getCheckboxState($vo['id'],'is_publish',$vo['is_publish']);?></td>
		    <td><a href="__APP__/Admin/Job/edit/id/<?php echo ($vo["id"]); ?>/lang/<?php echo ($vo["lang"]); ?>/cid/<?php echo $_GET["cid"];?>"><img src="__ADMIN__/Public/imgs/edit.png" /></a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:deleteData('__APP__/Admin/Job/deleteById/id/<?php echo ($vo["id"]); ?>');"><img src="__ADMIN__/Public/imgs/cross.png" /></a></td>
		</tr>
		<tr id="tr_<?php echo ($vo["id"]); ?>" style="display:none;">
			<td colspan="12"><br>
				<table class="grid-table" border="1" cellpadding="0" cellspacing="0"> 
					<thead> 
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>联系电话</th>
							<th>联系地址</th>
							<th>电子邮箱</th>
							<th>自我简介</th>
							<th>上传简历</th>
							<th>提交时间</th>
							<th width="25">操作</th>
						</tr>
					</thead>
					<tbody>
						<?php findJobResume($vo['id'],$upload_root_path);?>
					</tbody>
				</table>
				
			</td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="12">
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