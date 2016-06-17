<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台用户管理</title>
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
</script>
<script src="__ADMIN__/Public/js/index.js"></script>

</head>
<body>

<div class="nav-site"><?php getNavSite($nav_site,2);?> &gt; 系统设置 &gt; 网站管理员</div>

<form action="" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
<table class="grid-function" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="600">
				<div class="qw-fl grid-add-data">
					<input type="button" value="添加管理员" onclick="goToUrl('__APP__/Admin/User/edit/cid/<?php echo $_GET["cid"];?>');" class="button-img-add" />
				</div>
				<div class="qw-fl grid-batch-operate">
					
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
			<th width="35">编号</th>
		    <th>用户名</th>
		    <th>昵称</th>
		    <th>添加时间</th>
		    <th>上次登录</th>
		    <th width="50">登录次数</th>
		    <th width="25">状态</th>
		    <th width="100">操作</th>
		</tr> 
	</thead> 
	<tbody>
		<?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr> 
			<td><?php echo ($vo["id"]); ?></td>
		    <td><a href="#"><?php echo ($vo["username"]); ?></a></td>
		    <td><?php echo ($vo["realname"]); ?></td>
		    <td><?php echo (date('Y-m-d',$vo["create_time"])); ?></td>
		    <td><?php echo (date('Y-m-d',$vo["last_login_time"])); ?></td>
		    <td align="center"><?php echo ($vo["login_count"]); ?></td>
		    <td align="center"><?php getCheckboxState($vo['id'],'is_publish',$vo['is_publish']);?></td>
		    <td><!--<a href="__APP__/Admin/User/accredit/id/<?php echo ($vo["id"]); ?>/cid/<?php echo $_GET["cid"];?>">授权</a>&nbsp;&nbsp;-->
		    <a href="__APP__/Admin/User/edit/id/<?php echo ($vo["id"]); ?>/cid/<?php echo $_GET["cid"];?>">编辑</a>&nbsp;&nbsp;
		    <a href="#" onclick="javascript:deleteData('__APP__/Admin/User/deleteById/id/<?php echo ($vo["id"]); ?>');"">删除</a></td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10">
				<div class="qw-fl">
					<select name="rowpage" id="rowpage">
						<option value="10">显示10条</option>
						<option value="25">显示25条</option>
						<option value="50">显示50条</option>
						<option value="99999">显示所有</option>
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