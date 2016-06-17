<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>默认数据表格</title>
<link rel="stylesheet" type="text/css" href="__ADMIN__/Public/css/base.css" />
<link rel="stylesheet" type="text/css" href="__ADMIN__/Public/css/guestbook.css" />
<script src="__ADMIN__/Public/js/jquery-1.7.1.min.js"></script>

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

	$('.show_toggle').click(function(){		
		$this = $(this);
		var guestbook_content = $this.parent().parent().next();

		if(guestbook_content.is(":hidden")){			
			$this.text('收起');

			var hidden = $this.next()
			var guestbook_id = hidden.val();

			if(guestbook_id.length > 0){				
				$.get("__APP__/Admin/Guestbook/mark_read/id/"+guestbook_id);
				hidden.val('');
			} 

			//标记已读
			var already_read = $this.parent().next();
			already_read.text('是');
			guestbook_content.show(300);
		} else {
			$this.text('查看');
			guestbook_content.hide(300);
		}
		return false;
	});
	
});
</script>
<script src="__ADMIN__/Public/js/index.js"></script>

</head>
<body>
<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?></div>
<form action="__APP__/Admin/Guestbook" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
<table class="grid-function" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="600">
<!-- 				<div class="qw-fl grid-add-data">
					<a href="__APP__/Admin/Guestbook/edit/cid/<?php echo $_GET["cid"];?>"><input type="button" value="添加招聘" class="button button-red" /></a>
				</div> -->
				<div class="qw-fl grid-batch-operate">
					<a href="#" id="on_delete" title="彻底删除"><img src="__ADMIN__/Public/imgs/delete.png" align="top" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<?php 
					function decide_selected($status,$val){
						if($_GET['status'] === $status && $_GET['val'] === $val ) {
							echo 'selected';
						}
					} ?>
					过滤：
				<select id="select-filter">
					<option value="__APP__/Admin/Guestbook/index/cid/<?php echo $_GET["cid"];?>" >所有状态</option>
					<option value="__APP__/Admin/Guestbook/query/status/reply/val/0/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('reply','0');?> >未回复</option>
					<option value="__APP__/Admin/Guestbook/query/status/reply/val/1/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('reply','1');?> >已回复</option>
					<option value="__APP__/Admin/Guestbook/query/status/varify/val/0/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('varify','0');?> >未审核</option>
					<option value="__APP__/Admin/Guestbook/query/status/varify/val/1/cid/<?php echo $_GET["cid"];?>" <?php echo decide_selected('varify','1');?> >已审核</option>
				</select>					
				</div>
				<div class="qw-fr">
					
				</div>
			</th>
		</tr>
	</thead>
</table>
<table class="grid-table" border="1" cellpadding="0" cellspacing="0"> 
	<thead> 
		<tr >
			<th width="15"><input type="checkbox" id="chk_all"></th>			
		    <th style="text-align:center">标题</th>
		    <th width="50">详细信息</th>
		    <th width="30" align="center">已读</th>
		    <th width="30" align="center">审核</th>
		    <th width="50" align="center">操作</th>
		</tr> 
	</thead> 
	<tbody>
		<?php if(!empty($dataList)): ?><?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr> 
					<td><input type="checkbox" name="ids[]" id="ids<?php echo ($vo["id"]); ?>" value="<?php echo ($i); ?>,<?php echo ($vo["id"]); ?>"></td>
				    <td>
				    	<?php getLangTextTitle($vo['lang']);?> <?php echo ($vo["title"]); ?>
				    </td>
				    <td align="center" >
				    	<a href=""  style="color:red;" class="show_toggle"  >查看</a>
				    	<input type="hidden" value="<?php echo ($vo["id"]); ?>">
				    </td>
				    <td align="center">
				    	<?php if($vo["read"] == 0): ?>否 <?php else: ?> 是<?php endif; ?>
				    </td>
				 
				    <td align="center"><?php getCheckboxState($vo['id'],'is_publish',$vo['is_publish']);?></td>
				    <td>
				      <a href="__APP__/Admin/Guestbook/edit/id/<?php echo ($vo["id"]); ?>"><img src="__ADMIN__/Public/imgs/edit.png" /></a>&nbsp;&nbsp;
				   
				    	<a href="#" onclick="javascript:deleteData('__APP__/Admin/Guestbook/deleteById/id/<?php echo ($vo["id"]); ?>');"><img src="__ADMIN__/Public/imgs/cross.png" /></a>
				    </td>
				</tr>
				<tr id="tr_<?php echo ($vo["id"]); ?>"  style="display:none;">
					<td colspan="2">
						<div class="guest-content">
							<p><strong>内容：</strong></p>
							<?php echo ($vo["content"]); ?>
							<div class="guest-date" >发表于: <strong><?php echo (date("Y-m-d",$vo["create_time"])); ?> </strong></div>
						</div>
						<?php if(!empty($vo['reply'])): ?><div class="guest-reply" >
								<strong>回复:</strong>
								<?php echo ($vo["reply"]); ?>
								<div class="guest-date" >回复于:<strong><?php echo (date("Y-m-d",$vo["reply_time"])); ?></strong></div>
							</div><?php endif; ?>
					</td>
					<td colspan="5" valign="top">
						<ul class="guest-detail guest-detail-item" style="width:220px;margin-left:0px;">
							<li> 发表人：<?php echo ($vo["linkman"]); ?></li>
							<li> 性别：<?php echo ($vo["sex"]); ?></li>
							<li> 公司名称：<?php echo ($vo["company_name"]); ?></li>
							<li> 联系地址：<?php echo ($vo["address"]); ?></li>
							<li> 邮政编码：<?php echo ($vo["code"]); ?></li>
							<li> 电话：<?php echo ($vo["tel"]); ?></li>
							<li> 传真：<?php echo ($vo["fax"]); ?></li>
							<li> 手机：<?php echo ($vo["mobile"]); ?></li>
							<li> 邮箱：<?php echo ($vo["email"]); ?></li>
						</ul>
						 

					</td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php else: ?>
			<tr>
				<td colspan="10" align="center" style="color:red;">没有找到留言。</td>
			</tr><?php endif; ?>
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