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
	this.get_cid = "<?php echo $_GET['cid']; ?>"
	this.rowpage = "<?php echo $rowpage; ?>";
	this.actionName = "GoodsInquire";
}

$(document).ready(function(){

	$('#select-filter').change(function(){
		window.location.href = $(this).val();
	});	

	$('.show_toggle').click(function(){		
		$this = $(this);
		var inquire_content = $this.parent().parent().next();

		if(inquire_content.is(":hidden")){			
			$this.text('收起');
			inquire_content.show(300);
		} else {
			$this.text('查看');
			inquire_content.hide(300);
		}
		return false;
	});

	$('.status').change(function(){
		$this = $(this);
		var id = $this.attr('name');
		$.get("__APP__/Admin/GoodsInquire/set_inquire_status/id/"+id+'/status/'+ $this.val(),function(){
			$('#status_show_'+id).text($this.find("option:selected").text());
		});
	});

	$('#status-filter').change(function() {
		$this = $(this);
		window.location.href = '__APP__/Admin/GoodsInquire/index/rowpage/'+$('#rowpage').val()+'/status/'+$this.val();
	});
});
</script>
<script src="__ADMIN__/Public/js/index.js"></script>

</head>
<body>	
<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?> > 产品询价</div>
<form action="__APP__/Admin/Guestbook" method="post" id="form_list">
<input type="hidden" name="cid" value="<?php echo $_GET["cid"];?>" />
<table class="grid-function" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="600">
				<div class="qw-fl grid-batch-operate">
					<a href="#" id="on_delete" title="彻底删除"><img src="__ADMIN__/Public/imgs/delete.png" align="top" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					过滤：
					<select name="" id="status-filter">
						<option value="未处理" <?php if($_GET['status'] == '未处理'): ?>selected<?php endif; ?>>未处理</option>
						<option value="已跟进" <?php if($_GET['status'] == '已跟进'): ?>selected<?php endif; ?>>已跟进</option>
						<option value="忽略" <?php if($_GET['status'] == '忽略'): ?>selected<?php endif; ?>>忽略</option>
					</select>
				</div>
			</th>
		</tr>
	</thead>
</table>
<table class="grid-table" border="1" cellpadding="0" cellspacing="0"> 
	<thead> 
		<tr>
			<th width="15"><input type="checkbox" id="chk_all"></th>			
		    <th style="text-align:center">询价产品</th>
		    <th width="50">详细信息</th>
		    <th width="50" align="center">跟进情况</th>
		    <th width="50" align="center">操作</th>		    
		</tr> 
	</thead> 
	<tbody>	
		<?php if(!empty($dataList)): ?><?php if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr> 
					<td>
						<input type="checkbox" name="ids[]" id="ids<?php echo ($vo["id"]); ?>" value="<?php echo ($i); ?>,<?php echo ($vo["id"]); ?>">
					</td>
				    <td>
				    	<?php getLangTextTitle($vo['lang']);?> <?php echo ($vo["goods_title"]); ?>
				    </td>
				    <td align="center" >
				    	<a href=""  style="color:red;" class="show_toggle">查看</a>
				    </td>
				    <td align="center">
				    	<div id="status_show_<?php echo ($vo["id"]); ?>"><?php echo ($vo["status"]); ?></div>	
				    </td>
				    <td>
				    	<a href="#" onclick="javascript:deleteData('__APP__/Admin/GoodsInquire/deleteById/id/<?php echo ($vo["id"]); ?>');">
				    		<img src="__ADMIN__/Public/imgs/cross.png" />				    	
				    	</a>				   
				    </td>
				</tr>
				<tr id="tr_<?php echo ($vo["id"]); ?>"  style="display:none;">
					<td colspan="5">
						<div class="guest-content" style="float:left;width:60%;">
							<p><strong>内容：</strong></p>
							<?php echo ($vo["content"]); ?>
							<div class="guest-date" >发表于: <strong><?php echo (date("Y-m-d",$vo["create_time"])); ?> </strong></div>
							<div style="border-top:1px solid #606060;margin-top:15px;padding-top:10px">
							设置状态：
								<select class="status" name="<?php echo ($vo["id"]); ?>" >
									<option value="0" <?php if($vo["status"] == '未处理' ): ?>selected<?php endif; ?> >未处理</option>
									<option value="1" <?php if($vo["status"] == '已跟进' ): ?>selected<?php endif; ?> >已跟进</option>
									<option value="2" <?php if($vo["status"] == '忽略' ): ?>selected<?php endif; ?> >忽略</option>
								</select>
							</div>
						</div>
						<div style="float:left;margin: 10px 5px;">
							<table>
								<tr>
									<td>发表人：</td>
									<td><?php echo ($vo["linkman"]); ?></td>
								</tr>
								<?php if(!empty($vo["email"])): ?><tr>
									<td>邮箱地址：</td>
									<td><?php echo ($vo["email"]); ?></td>
								</tr><?php endif; ?>
								<?php if(!empty($vo["mobile"])): ?><tr>
									<td>手机号码：</td>
									<td><?php echo ($vo["mobile"]); ?></td>
								</tr><?php endif; ?>
								<?php if(!empty($vo["tel"])): ?><tr>
									<td>联系电话：</td>
									<td><?php echo ($vo["tel"]); ?></td>
								</tr><?php endif; ?>
								<?php if(!empty($vo["address"])): ?><tr>
									<td>购买地点：</td>
									<td><?php echo ($vo["address"]); ?></td>
								</tr><?php endif; ?>
							</table>
						</div>
					</td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php else: ?>
			<tr>
				<td colspan="10" align="center" style="color:red;">没有找到数据</td>
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