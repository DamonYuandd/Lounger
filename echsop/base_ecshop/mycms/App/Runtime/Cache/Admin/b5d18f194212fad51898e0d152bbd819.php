<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>编辑产品</title>

<!-- layout::Inc:edit_page::0 -->
<!-- layout::Inc:ueditor::0 -->
<style>
	.photos li{float:left;margin-right:5px;position:relative;}
	.photos li a{position:absolute;top:0px;left:0px;display:none;width:16px;height:16px;background:url(__ADMIN__/Public/imgs/clear.jpg) ;}
</style>
</head>
<body>
<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?> > 编辑产品</div>
<form action="__APP__/Admin/Goods/<?php echo $obj==null?'add':'update'; ?>" method="post" enctype="multipart/form-data" class="form">  
	<input type="hidden" id="id" name="id" value="<?php echo ($obj["id"]); ?>">
	<input type="hidden" name="category_id" value="<?php echo $_GET["cid"];?>">
	<input type="hidden" name="is_publish" value="1">
	<input type="hidden" name="hardware" value="<?php echo ($_SESSION['hardware']); ?>">
	<input type="hidden" name="lang" value="<?php echo $_GET["lang"];?>">
   <fieldset>
       <ul class="align-list">
		   <li>
               <label>当前分类</label>
               <?php getCurCategoryNav($_GET['cid']);?>
           </li>
           <li>
               <label>产品标题</label>
               <input type="text" id="title" name="title" value="<?php echo ($obj["title"]); ?>" class="type-text">
           </li>
           <li>
               <label>产品描述</label>
               <textarea id="content" name="content" style="margin-left:200px;margin-left: 140px;margin-top: -25px;margin-bottom: 10px;"><?php echo (htmlspecialchars_decode($obj["content"])); ?></textarea>
           	   <script type="text/javascript">
				    var editor = new baidu.editor.ui.Editor();
				    editor.render("content");
				</script>
		   </li>
           <li>
               <label>产品摘要</label>
               <textarea id="summary" name="summary" cols="100" rows="3"><?php echo ($obj["summary"]); ?></textarea>
           </li>
           <li>
               <label>产品图片管理</label>
               <input type="button" value="上传图片" style="padding:5px 10px;" onclick="PopupWindow('__APP__/Admin/Goods/imgsLoad', 880, 440);" />
           <li>
           		<label>产品封面</label>
           		<img id="image1" src="__PUBLIC__/images/product/<?php echo ($obj["image"]); ?>" width="100" height="100" title="点击选择图片" onclick="PopupWindow('__APP__/Admin/System/index/cid/img/imgPath/product/is_only/1/save/image', 880, 440);" />
           		
           		<input id="image" value="<?php echo ($obj["image"]); ?>" type="hidden" name="image"/>
           </li>
           <li style="float: left;width: 100%;">
               <label>产品相册</label>
			   <div style="margin-left:140px;margin-top:-35px;line-height:38px;">
				    <ul class="photos">
				    <?php $goodsphoto = get_GoodsPhotos($obj['id']); ?>
				    	<li>
				    	<img id="imageList1" src="__PUBLIC__/images/product/<?php echo ($goodsphoto['0']['image']); ?>" width="100" height="100" title="点击选择图片" onclick="PopupWindow('__APP__/Admin/System/index/cid/img/imgPath/product/is_only/1/save/imageList', 880, 440);" />
           				<input id="imageList" value="<?php echo ($goodsphoto['0']['image']); ?>" type="hidden" name="imageList[]"/>
           				<a href="javascript:void(0)" title="点击清除"></a>
           				</li>
           				<li>
				    	<img id="imageList21" src="__PUBLIC__/images/product/<?php echo ($goodsphoto['1']['image']); ?>" width="100" height="100" title="点击选择图片" onclick="PopupWindow('__APP__/Admin/System/index/cid/img/imgPath/product/is_only/1/save/imageList2', 880, 440);" />
           		<input id="imageList2" value="<?php echo ($goodsphoto['1']['image']); ?>" type="hidden" name="imageList[]"/>
           				<a href="javascript:void(0)" title="点击清除"></a>
           				</li>
           				
           				<li>
				    	<img id="imageList31" src="__PUBLIC__/images/product/<?php echo ($goodsphoto['2']['image']); ?>" width="100" height="100" title="点击选择图片" onclick="PopupWindow('__APP__/Admin/System/index/cid/img/imgPath/product/is_only/1/save/imageList3', 880, 440);" />
           		<input id="imageList3" value="<?php echo ($goodsphoto['2']['image']); ?>" type="hidden" name="imageList[]"/>
           				<a href="javascript:void(0)" title="点击清除"></a>
           				</li>
           				
           				<li>
				    	<img id="imageList41" src="__PUBLIC__/images/product/<?php echo ($goodsphoto['3']['image']); ?>" width="100" height="100" title="点击选择图片" onclick="PopupWindow('__APP__/Admin/System/index/cid/img/imgPath/product/is_only/1/save/imageList4', 880, 440);" />
           		<input id="imageList4" value="<?php echo ($goodsphoto['3']['image']); ?>" type="hidden" name="imageList[]"/>
           				<a href="javascript:void(0)" title="点击清除"></a>           				
           				</li>
				    </ul>
				</div>
           </li>
           
           <li>
           		<label>更多可选项</label>
				<input type="checkbox" id="more_options"> <small class="fc-999"> --您还可以对这个产品填写更多的相关信息</small>
		   </li>
           <div id="more_options_box" class="more-box hide">
           <li>
               <label>产品标签<a href="#" class="issue" title="增加产品更多的关键字搜索">?</a></label>
               <input type="text" id="tag" name="tag" value="<?php echo ($obj["tag"]); ?>" class="type-text">
           </li>
           <li>
               <label>更新时间</label>
               <input type="text" id="update_time" name="update_time" onClick="WdatePicker()" value="<?php echo (!isset($obj['update_time'])) ? date('Y-m-d') : date('Y-m-d', $obj['update_time']);?>" class="type-text">
           </li>
           <li>
               <label>发布时间</label>
               <input type="text" id="create_time" name="create_time" onClick="WdatePicker()" value="<?php echo (!isset($obj['create_time'])) ? date('Y-m-d') : date('Y-m-d', $obj['create_time']);?>" class="type-text">
           </li>
           </div>
           <li>
	           	<label>SEO优化</label>
				<input type="checkbox" id="more_seo"> <small class="fc-999"> --您还可以单独设置这个产品搜索引擎关键字收录</small>
		    </li>
           <div id="more_seo_box" class="more-box hide">
           <li>
               <label>页面标题<br>(Title)</label>
               <input type="text" id="seo_title" name="seo_title" value="<?php echo ($obj["seo_title"]); ?>" class="type-text">
           </li>
           <li>
               <label>页面关键字<br>(Keywords)</label>
               <input type="text" id="seo_keywords" name="seo_keywords" value="<?php echo ($obj["seo_keywords"]); ?>" class="type-text">
           </li>
           <li>
               <label>页面描述<br>(Description)</label>
               <input type="text" id="seo_description" name="seo_description" value="<?php echo ($obj["seo_description"]); ?>" class="type-text">
           </li>
           </div>

		   <?php if( $_SESSION['hardware']=='pcfff' ) { ?>
            <li id="li_synch_mobile">
                <label>手机同步</label>
                <input type="checkbox" name="synch_mobile" id="synch_mobile" value="1"> <small class="fc-999"> --如果手机版对应栏目也有这个产品，您还可以同步过去</small>
            </li>
			<li id="li_mobile_category">
                <label>手机分类</label>
                <select id="one_mobile_category_id" name="one_mobile_category_id" style="width:200px;" onchange="changeMobileCategory(this,'two_mobile_category_id')">
                	<option value="-1" selected="">请选择手机分类</option>
					<?php selectCateoryOptions($_SESSION['c_root'], 'all');?>
                </select>
				<select id="two_mobile_category_id" name="two_mobile_category_id" style="width:200px;display:none;" onchange="changeMobileCategory(this,'three_mobile_category_id')"><option value="-1" selected="">请选择手机分类</option></select>
            	<select id="three_mobile_category_id" name="three_mobile_category_id" style="width:200px;display:none;" onchange="changeMobileCategory(this,'')"><option value="-1" selected="">请选择手机分类</option></select>
			</li>
			<script>$('#li_mobile_category').hide();</script>
            <?php } ?>
			
			<?php isComment($category_is_comment);?>
           
		   <li>
               <label></label>
            </li>
           <li>
               <label></label>
               <input type="submit" value="确定并保存" name="save" class="button button-green button-big" />
               <input type="button" value="返回列表" onclick="javascript:history.go(-1);" class="button button-big" />
            </li>
        </ul>
    </fieldset>
</form>

<!-- layout::Inc:edit_seo_option::0 -->
<script>
$('input[name=photo_def]').click(function(){
	$.get(data._APP_+'/Admin/'+data.actionName+'/photoDef',{'id':data.get_id,'image':$(this).val()},function(bool){
		
	});
});
$("input[name=photo_def][value='<?php echo $obj['image'];?>']").attr('checked', true);
$('.delete_photo').click(function(){
	var elem = $(this);
	if( $("input[name=photo_def][value='"+elem.attr('image')+"']").is(':checked') ) {
		alert('封面图片不能删除！');
	} else {
		if (confirm('确定要删除图片吗？删除后无法恢复')) {
			$.get(data._APP_ + '/Admin/' + data.actionName + '/deleteImage', {'gp_id': $(this).attr('gpid')}, function(bool){
				if( bool==1 ) {
					elem.parent().hide();
				} else {
					alert('删除图片失败');
				}
			});
		}
	}
	
});
$('.photos li a').click(function(){
	$(this).siblings('img').attr({src : ''});
	$(this).siblings('input').attr("value",'');
	//$(this).siblings('input').val();
})
$('.photos li').hover(function(){
	$(this).find("a").show(0);
},function(){
	$(this).find("a").hide(0);
})
</script>

</body>
</html>