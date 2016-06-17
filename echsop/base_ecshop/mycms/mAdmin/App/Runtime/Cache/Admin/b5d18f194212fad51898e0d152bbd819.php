<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
<!-- layout::Inc:common_js::0 -->
</head>
<body>
<div data-role="page">
	<!-- layout::Inc:edit_head::0 -->
     <div data-role="content">
<form action="__APP__/Admin/Goods/<?php echo $obj==null?'add':'update'; ?>" method="post" enctype="multipart/form-data" class="form">  
	<input type="hidden" id="id" name="id" value="<?php echo ($obj["id"]); ?>">
	<input type="hidden" name="category_id" value="<?php echo $_GET["cid"];?>">
	<input type="hidden" name="hardware" value="<?php echo ($_SESSION['hardware']); ?>">
	<input type="hidden" name="lang" value="<?php echo $_GET["lang"];?>">
    <input type="hidden" name="dbName" value="Goods">
   <fieldset>
     <ul data-role="listview" data-divider-theme="c" data-inset="true">
		   <li>
               <label>当前位置：</label>
               <?php getNavSite($nav_site,$_GET['cid']);?> > 编辑产品
           </li>
           <li>
               <label>产品标题</label>
               <input type="text" id="title" name="title" value="<?php echo ($obj["title"]); ?>" class="type-text">
           </li>
         
           <li>
               <div data-role="fieldcontain">
                    <h3>产品描述</h3>
                     <textarea id="content" name="content"><?php echo (htmlspecialchars_decode($obj["content"])); ?></textarea>
               </div>
		   </li>
        </ul>
        <?php if(!empty($photos)): ?><label for="select-choice-1" class="select">选择封面图片:</label>
        <select name="photos"  id="select-choice-1">
                    <?php if(is_array($photos)): $i = 0; $__LIST__ = $photos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["image"]); ?>" <?php if(($vo["image"])  ==  $obj["image"]): ?>selected<?php endif; ?>><?php echo ($vo["image"]); ?><?php if(($vo["image"])  ==  $obj["image"]): ?>(使用中)<?php endif; ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
         </select>
         <div data-role="fieldcontain" style="text-align:center;" >
         	<img id="goodsImage" info="<?php echo $obj['image']; ?>" src="<?php echo $upload_root_path.'images/product/s_'.$obj['image']; ?>" />
         </div><?php endif; ?>
         <div data-role="collapsible" data-theme="c" data-content-theme="d">
         	<h4>更多可选项</h4>
          
            	<label>产品摘要</label>
                <textarea id="summary" name="summary" cols="100" rows="3"><?php echo ($obj["summary"]); ?></textarea>
            
            
            	  <label>产品标签</label>
                  <input type="text" id="tag" name="tag" value="<?php echo ($obj["tag"]); ?>">
           
            	  <label>页面标题</label>
                  <input type="text" id="seo_title" name="seo_title" value="<?php echo ($obj["seo_title"]); ?>">
           
          		  <label>页面关键字</label>
                  <input type="text" id="seo_keywords" name="seo_keywords" value="<?php echo ($obj["seo_keywords"]); ?>" class="type-text">
            
           		    <label>页面描述</label>
                    <input type="text" id="seo_description" name="seo_description" value="<?php echo ($obj["seo_description"]); ?>" class="type-text">
            
            <fieldset data-role="controlgroup">
            <input type="checkbox" name="is_publish" id="is_publish" class="custom"   value="1" <?php if(($obj["is_publish"])  ==  "1"): ?>checked<?php endif; ?> />
            <label for="is_publish">是否发布</label>
       </fieldset>
         </div>
            <div data-role="navbar" data-iconpos="top" id="submitDiv">
         <ul>
            <li id="submitButton">
            <a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">保存</a>
        </li>
            <li id="resetButton">
         <input type="button" value="返回列表" onclick="javascript:history.go(-1);" />
               </li>
            </ul>
        </div>
    </fieldset>
</form>
</div>
<!-- layout::Inc:edit_footer::0 -->
<script type="text/javascript">
	$(document).ready(function(){
		var objImage = "<?php echo $obj['image']; ?>" ;
		$("#select-choice-1").prev('span').find('.ui-btn-text').html( objImage +'(使用中)');
		$("#select-choice-1").change(function(){
			var img = $(this).val();
			$("#goodsImage").attr
			({
				info:img,
				src:"<?php echo $upload_root_path.'images/product/s_'; ?>"+img
			});
		})
		//处理信息
		$("#submint").click(function(){
			var params = $('input,textarea').serialize(); //序列化表单的值
			$.mobile.loadingMessageTextVisible = true;
			var im = $("#goodsImage").attr('info');
			params = params  + '&image=' + im ; 
			$.ajax({
				type:'POST',
				url:'__APP__/Index/sortUpdate',
				data:params ,
				beforeSend:$.mobile.showPageLoadingMsg('a','正在提交....'),
				success:ajaxTips,
				complete:$.mobile.hidePageLoadingMsg()
				})
		})
	})
</script>
</div>
</body>
</html>