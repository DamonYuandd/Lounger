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
<form action="__APP__/Admin/<?php echo $actionName;?>/<?php echo $obj==null?'add':'update'; ?>" method="post" enctype="multipart/form-data" class="form">  
	<input type="hidden" id="id" name="id" value="<?php echo ($obj["id"]); ?>">
	<input type="hidden" name="category_id" value="<?php echo $_GET["cid"];?>">
	<input type="hidden" name="hardware" value="<?php echo ($_SESSION['hardware']); ?>">
	<input type="hidden" name="lang" value="<?php echo $_GET["lang"];?>">
    <input type="hidden" name="dbName" value="Job">
   <fieldset>
       <ul data-role="listview" data-divider-theme="c" data-inset="true">
        	<li data-role="list-divider" role="heading">
               <label>当前位置：</label>
               <?php getNavSite('',$_GET['cid']);?> > <?php echo ($obj["title"]); ?>
           </li>
           <li>
               <label>标题</label>
               <input type="text" id="title" name="title" value="<?php echo ($obj["title"]); ?>" class="type-text">
           </li>
           <li>
               <div data-role="fieldcontain">
                    <h3>正文描述</h3>
                    <textarea id="content" name="content"><?php echo (htmlspecialchars_decode($obj["content"])); ?></textarea>
                </div>
           </li>
        </ul>
         <div data-role="collapsible" data-theme="c" data-content-theme="d">
         	 <h4>更多可选项</h4>
           	 <label>部门</label>
             <input type="text" id="department" name="department" value="<?php echo ($obj["department"]); ?>" class="type-text">
           
           	 <label>学历</label>
             <input type="text" id="education" name="education" value="<?php echo ($obj["education"]); ?>" class="type-text">
           
           	 <label>薪水</label>
             <input type="text" id="salary" name="salary" value="<?php echo ($obj["salary"]); ?>" class="type-text">
          
               <label>工作地点</label>
               <textarea id="site" name="site" cols="100" rows="3"><?php echo ($obj["site"]); ?></textarea>
           
               <label>招聘人数</label>
               <input type="text" id="number" name="number" value="<?php echo ($obj["number"]); ?>" class="type-text">
          
               <label>职位要求</label>
               <input type="text" id="ask" name="ask" value="<?php echo ($obj["ask"]); ?>" class="type-text">
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
		$("#submint").click(function(){
			var params = $('input,textarea').serialize(); //序列化表单的值
			$.mobile.loadingMessageTextVisible = true;
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