<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="__PUBLIC__/js/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/upload.css">
</head>
<body>
<script>
function del(delName,delId){			//点击删除链接，ajax
    	//var info="__URL__";  //获取url
    	var info="<?php echo U('Index/upload');?>";  //获取url
    	var d='#'+delName;
		var url=info+"/del";		//删除图片的路径
         $.post(url,{'name':delId},function(data){		//ajax后台
            $(d).html(data.info);						//输出后台返回信息
            $(d).hide(3000);							//自动隐藏
        },'json');										//josn格式



		}

function add(data){
var n=parseInt(Math.random()*100);
//$('#image').append("sss");
$('#image').append('<div id="'+n+'" class="photo"><a href="'+data+'"  target="_blank"><img src="'+data+'"  height=80 width=80 /></a><div class="del"><a href="javascript:vo(0)" onclick=del("'+n+'","'+data+'");return false;>删除</a></div></div>');
$('#upLoadFile').html('<input type="file"  name="photo[]" id="photo" onchange="upload();">');
}

function upload(){
	//alert("同时触发了onchange事件");
	//$('#image').html($('#photo').val);
	//$('#image').append('dddd');
		var url="<?php echo U('Index/upload');?>";
		//$('#image').append('s');
		//alert(111);
		$('#form').submit();
		/*
         $.post(url,{},function(data){
            // $('#image').append(data);

            alert(data.data+data.info);
        },'json');
        */
       // $('#image').append('dddd');
}

</script>


<form action="<?php echo U('Index/upload');?>" method="post" enctype="multipart/form-data"  target="upframe" id="form">

<div id="upLoadFile"><input type="file"  name="photo[]" id="photo" onchange="upload();"></div>
<!--
<input type="file"  name="photo[]">
<input type="submit" value="保存">
style="display:none"
-->
</form>
<div id="image" class="image"></div>
<iframe id="upframe" name="upframe" style="display:none"></iframe>
</body>
</html>