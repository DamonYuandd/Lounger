<?php if (!defined('THINK_PATH')) exit();?><?php 
	$lastPath = "/Public/images/".$_GET['imgPath']."/";
	$dir=  dirname(dirname(dirname(dirname(dirname(__FILE__))))).$lastPath;
	echo $dir;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理图片</title>
<style type="text/css">
<!--
body,td,th {
font-family: Arial, Helvetica, sans-serif;
font-size: 12px;
color: #6D7070;
font-weight: bold;
}
body {
margin-left: 5px;
margin-top: 10px;
margin-right: 0px;
margin-bottom: 0px;
background-image: url();

}
.inner{
border:1px solid #999999;
float:left;
margin:5px;
text-align:center;
}
.moveDiv{
border:1px solid #FF0000;
float:left;
margin:5px;
cursor:pointer;
}
-->
</style>
<script language="javascript" src="__PUBLIC__/js/jquery-1.7.1.min.js"></script>
<script language="javascript">
$(document).ready(function(){
	$(".delectImg").click(function(){
		if(confirm('确认删除图片吗？删除后无法恢复！')) {
				var img = $(this).attr('imgs');
				var path = $(this).attr('path');
				window.location.href="__APP__/Admin/Index/delectImgs?imgs="+ img +"&path="+path;
			} else {
				return false;
			}
	})
	$("#selectPath").change(function(){
		var now = $(this).val();
		window.location.href="__APP__/Admin/System/index/cid/img/imgPath/"+now+"";
	})
	$(".selectImgs").click(function(){
		var img = $(this).attr('imgs');
		//self.opener.document.getElementById('ren').src='".__ROOT__.'/'.$uploaddir.$_POST['file']."';
		self.opener.document.getElementById('<?php echo $_GET['save']; ?>').value= img;
		self.opener.document.getElementById('<?php echo $_GET['save'].'img'; ?>').src= '__ROOT__<?php echo $lastPath; ?>'+img;
		window.close();
	})
	$("#clear").click(function(){
		self.opener.document.getElementById('<?php echo $_GET['save']; ?>').value= '';
		self.opener.document.getElementById('<?php echo $_GET['save'].'img'; ?>').src= '';
		window.close();
	})
	$("#closeWin").click(function(){
		window.close();
	})
})
function setImgBorder(obj)
{
obj.style.marginTop="10px";
obj.style.marginLeft="10px";
obj.style.marginRight="10px";
obj.style.marginBottom="10px";
obj.width=obj.width+=10;
obj.height=obj.height+=10;

obj.parentNode.className="moveDiv";
}
function clearBorder(obj)
{
obj.style.marginTop="15px";
obj.style.marginLeft="15px";
obj.style.marginRight="15px";
obj.style.marginBottom="15px";
obj.width=obj.width-=10;
obj.height=obj.height-=10;
obj.parentNode.className="inner";
}


</script>
</head>
<div style="width:100%;">
<strong>选择其他文件夹</strong>
<select id="selectPath">
  <option value ="images" <?php if(($_GET['imgPath'])  ==  "images"): ?>selected="true"<?php endif; ?>>产品图片</option>
  <option value="color" <?php if(($_GET['imgPath'])  ==  "color"): ?>selected="true"<?php endif; ?>>颜色图片</option>
  <option value="smarty" <?php if(($_GET['imgPath'])  ==  "smarty"): ?>selected="true"<?php endif; ?>>缩略图</option>
</select>

</div>
<?php
$dir_res=opendir($dir);
$fileFormat=array(0=>".jpg",1=>".gif",2=>".png",3=>".bmp");
while($filen=readdir($dir_res))
{
for($i=0;$i<count($fileFormat);$i++)
{
   if(substr($filen,strpos($filen,"."))==$fileFormat[$i])
   {
    echo '<div class="inner"><img src="'.__ROOT__.$lastPath.$filen.'" width="120" height="90" border="0" align="absmiddle" onmouseover="setImgBorder(this)" onmouseout="clearBorder(this)" style="margin:15px;" />
<a href="javascript:void(0);" class="selectImgs" imgs="'.$filen.'">选择该图</a>
<a href="javascript:void(0);" class="delectImg" imgs="'.$filen.'" path="'.$dir.'">删除该图</a></div>';   
    break ;
   }
}
}
closedir($dir_res);
?>
<div style="width:100%;text-align:center;clear:both;">
	<input type="button" value="清空" id="clear" /> &nbsp;&nbsp;&nbsp; <input type="button" value="关闭" id="closeWin" />
</div>