<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
<!-- layout::Inc:common_js::0 -->
<script>
$(function(){
	var mobile_theme = "<?php echo $obj['mobile_theme']; ?>";
	var nowStyle = "<?php echo $nowTplStyle['title'] ;?>";
	var aa = $("#category_tpl").prev('span').find('.ui-btn-text').html(nowStyle);
//	$("#"+mobile_theme).css({'border':'3px solid red'});
//	$("select[name=mobile_theme] option[value="+ mobile_theme +"]").attr("selected",true);
	$('#category_tpl').change(function() {
       window.location.href='__APP__/System/theme/ctplid/'+$(this).val();
    });
	var cid="<?php echo $_GET['ctplid']; ?>";
    if( cid ) {
        $('#category_tpl').val(cid);
    }
	$("#select-choice-1").change(function(){
		var val = $(this).val();
		$.ajax({
			type:'POST',
			dataType:'json', 
			url:'__APP__/System/themeShow',
			data:'mobile_theme='+val,
			success:imgaeChange
		})
	})
	//保存
	$("#submint").click(function(){
		var tp_num = $('#select-choice-1').val();
		$.ajax({
			type:'POST',
			url:'__APP__/Admin/System/saveTheme',
			data:'mobile_theme='+ tp_num,
			success:ajaxTips
		})
	})
	//弹出系统设置
	$("#backSystem").click(function(){
		$("#systemShow").click();
	})
});
//改变缩略图
function imgaeChange(json){
	var mobile_theme = "<?php echo $obj['mobile_theme']; ?>";
	$("#Thumbnail").html('loading');
	if(mobile_theme != json['number']){
		$("#Thumbnail").html('<img src="http://img.huyionline.cn/tplimg/'+ json['image']+'" id="'+ json['mobile_theme'] +'"><h5>'+ json['number'] +'</h5>');
		}else{
		$("#Thumbnail").html('<img src="http://img.huyionline.cn/tplimg/'+ json['image']+'" id="'+ json['mobile_theme'] +'"><h5><span style="color:#F00">(已在使用)</span>'+ json['number'] +'</h5>');
	}
}
</script>
</head>
<body>
<div data-role="page">
<!-- layout::Inc:edit_head::0 -->
    <div data-role="content">
    		<!-- <h4>当前使用模板编号:<span style="color:#F00"><?php echo ($obj["mobile_theme"]); ?></span></h4> -->
    		<label for="category_tpl" class="select">选择模板风格:</label>
            <select name="category_tpl" id="category_tpl">
                <option value="">全部风格</option>
                <?php if(is_array($ctplList)): $i = 0; $__LIST__ = $ctplList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
            <label for="select-choice-1" class="select">选择模板编号:</label>
            <select name="mobile_theme"  id="select-choice-1">
                    <?php if(is_array($templateList)): $i = 0; $__LIST__ = $templateList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["number"]); ?>"><?php echo ($vo["number"]); ?><?php if(($vo["number"])  ==  $obj["mobile_theme"]): ?>(使用中)<?php endif; ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
            <?php if(($templateList[0]['number'])  !=  "暂无该资料"): ?><label>模板缩略图:</label>
                <div data-role="fieldcontain" style="text-align:center;" id="Thumbnail" > 
                        <img src="http://img.huyionline.cn/tplimg/<?php echo ($templateList["0"]["image"]); ?>" id="<?php echo ($obj['id']); ?>">
                        <h5><?php if(($templateList["0"]["number"])  ==  $common["mobile_theme"]): ?><span style="color:#F00">(已在使用)</span><?php endif; ?><?php echo ($templateList["0"]["number"]); ?></h5>    
                </div>
                <?php else: ?>
               <label>&nbsp;</label><?php endif; ?>
            <?php if(($templateList[0]['number'])  !=  "暂无该资料"): ?><a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">立刻使用该主题</a><?php endif; ?>
             <a data-role="button" href="javascript:void(0)"  id="backSystem"  data-theme="c">返回系统管理</a>
        <fieldset style="margin:30px;">
            <legend style="font-size: 14px;font-weight: bold;margin-bottom: 10px;color:red;">备注</legend>
            <h4 style="color:#F00;">1.更换模板有可能导致页面内容不能正常显示<br>
            2.更新后需根据选中的模板调整页面内容</h4>
        </fieldset>
 	</div>
　 	<!-- layout::Inc:edit_footer::0 -->
</div>
</body>
</html>