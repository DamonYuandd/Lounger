<?php 
@session_start();
require_once(dirname(__FILE__)."/include/function_kgl.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>php图片批量上传 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--这个是点击增加或减少要用到的js-->
<script type="text/javascript" src="js/utils.js"></script>
<script language="JavaScript">
  /**
   * 新增一个图片
   */
  function addImg(obj)
  {
      var src  = obj.parentNode.parentNode;
      var idx  = rowindex(src);
      var tbl  = document.getElementById('gallery-table');
      var row  = tbl.insertRow(idx + 1);
      var cell = row.insertCell(-1);
      cell.innerHTML = src.cells[0].innerHTML.replace(/(.*)(addImg)(.*)(\[)(\+)/i, "$1removeImg$3$4-");
  }

  /**
   * 删除图片上传
   */
  function removeImg(obj)
  {
      var row = rowindex(obj.parentNode.parentNode);
      var tbl = document.getElementById('gallery-table');

      tbl.deleteRow(row);
  }

  /**
   * 删除图片
   */
  function dropImg(imgId)
  {
    Ajax.call('goods.php?is_ajax=1&act=drop_image', "img_id="+imgId, dropImgResponse, "GET", "JSON");
  }

  function dropImgResponse(result)
  {
      if (result.error == 0)
      {
          document.getElementById('gallery_' + result.content).style.display = 'none';
      }
  }

</script>
<!--这个是点击增加或减少要用到的js-->
<table width="90%" id="gallery-table"  align="center">
<form enctype="multipart/form-data" action="" method="post" name="theForm" >
<tr><td>&nbsp;</td></tr>
<tr>
<td>
  <a href="javascript:;" onclick="addImg(this)">[+]</a>
  下载名称 
  <input name="title[]" type="text" id="title[]" size="20" />
  
  上传文件 
  <input name="url[]" type="file" id="url[]" /></td>
</tr>
<tr><td> <input type="submit" name="upload" value="提交" />
<input name="ac" type="hidden" id="ac" value="add_ok" />
</td></tr>
  </form>
</table>

<?php 
$Types = array('rar','doc','zip','xls'); //设置上传类型
//$Types = explode(',',strtolower($Types));
$size=10240; //上传文件大小限制(KB)
if($_REQUEST['ac']=='add_ok')
{     
  $dest_folder   =  "upload/";   
  if(!file_exists($dest_folder))
  { mkdir($dest_folder);}   
  
 //----------------------------------------------- 
  
 //开始判断 
  if(isset($_POST['title']))
  {  
	$i=0;
	foreach ($_POST['title'] AS $key => $attr_id)
	{
		$attr_value = $_POST['title'][$key];
		if (empty($attr_value)) //如果中上传了图片，但是没有填写图片名称，那么就把图片名title称设为1,不然，图片是存不到数据库里，也就是title必须有值，url才能存
		{$attr_value=1;}
		if ($_FILES['url']['tmp_name'][$i] != '' && $_FILES['url']['tmp_name'][$i] != 'none')  //如果某一个传了图片
		{
			$flag = false;
			if (isset($_FILES['url']['error']))
			{
				if ($_FILES['url']['error'][$i] == 0)
				{
					$flag = true;
				}
			}
			else
			{
				if ($_FILES['url']['tmp_name'][$i] != 'none')
				{ 
					$flag = true;
				}
			}
	 
			if ($flag)
			{
				 $filename = $_FILES["url"]["name"][$key]; //原文件名
				 $Suffix = strtolower(ltrim(strrchr($filename,"."),".")); //获取文件后缀
				 //建立新的文件名-------------------------------------------------------------------
				 $NewName =  gettimeofday(); //获取当前微秒数
				 $NewName = date("YmdHis") . ($NewName[sec] + $NewName[usec]);  //新文件名(命名方式:年月日时分秒毫秒微秒)
				 $NewName = $dest_folder . $NewName . '.' . $Suffix; //保存目录.新文件名.文件后缀
				 //判断文件类型
				 if(!in_array($Suffix,$Types)) 
				 { 
				   echo '<script>alert("不能上传此文件!\n点确定返回!");</script>'; 
				   exit; 
				 } 
				 //判断上传文件大小
				 $filesize = $_FILES['url']['size'][$key] /= 1024; //获取当前文件实际大小(KB)
				// $size > $filesize ? $Provisions = true : $Provisions = false;;  //比较文件大小是否在规定范围内
				 if($size < $filesize) 
				 { 
				   echo '<script>alert("文件过大!上传不得超过' . $size . ' KB!\n点确定返回!");</script>'; 
				   exit; 
				 } 
				 
				  $tmp_name = $_FILES["url"]["tmp_name"][$key];           
				  $name    = $_FILES["url"]["name"][$key];       
				  $uploadfile = $dest_folder.$name;           
				  // move_uploaded_file($tmp_name, $uploadfile); //这是获得以前的文件名     
				  move_uploaded_file($tmp_name, $NewName);
			$url=$NewName;
			}  
			
		}
		else
		{
			$url='';
		}
	    $i +=1;	//如果有属性值有图片的，就让其i加1 
		//添加记录
		if (!empty($attr_value) && !empty($url))
		{
			$SQL = "INSERT INTO `dede_1234aa` (`parentid`,`title`,`url`,`dtime`)";
			$SQL .= "VALUES ('2','" . $_POST['title'][$key] . "','" . $url . "',NOW());";
			  
			  if($db->ExecuteSQL($SQL))
			  {
					echo "<script>alert('恭喜您,上传成功');location.href='aa.php';</script>"; 
			  } 
			  else 
			  {
					echo "<script>alert('对不起,上传失败');history.go(-1);</script>"; 
			  }
			   unset($uN,$SQL);  
		}	   
	} 
   }	
/****************************************************************  
  foreach ($_FILES["url"]["error"] as $key => $error) 
  {       
     if ($error == UPLOAD_ERR_OK) 
     {  
		 $filename = $_FILES["url"]["name"][$key]; //原文件名
		 $Suffix = strtolower(ltrim(strrchr($filename,"."),".")); //获取文件后缀
		 //建立新的文件名-------------------------------------------------------------------
		 $NewName =  gettimeofday(); //获取当前微秒数
		 $NewName = date("YmdHis") . ($NewName[sec] + $NewName[usec]);  //新文件名(命名方式:年月日时分秒毫秒微秒)
		 $NewName = $dest_folder . $NewName . '.' . $Suffix; //保存目录.新文件名.文件后缀
		 //判断文件类型
		 if(!in_array($Suffix,$Types)) 
		 { 
		   echo '<script>alert("不能上传此文件!\n点确定返回!");</script>'; 
		   exit; 
		 } 
		 //判断上传文件大小
		 $filesize = $_FILES['url']['size'][$key] /= 1024; //获取当前文件实际大小(KB)
		// $size > $filesize ? $Provisions = true : $Provisions = false;;  //比较文件大小是否在规定范围内
		 if($size < $filesize) 
		 { 
		   echo '<script>alert("文件过大!上传不得超过' . $size . ' KB!\n点确定返回!");</script>'; 
		   exit; 
		 } 
		 
		  $tmp_name = $_FILES["url"]["tmp_name"][$key];           
		  $name    = $_FILES["url"]["name"][$key];       
		  $uploadfile = $dest_folder.$name;           
		  // move_uploaded_file($tmp_name, $uploadfile); //这是获得以前的文件名
		  move_uploaded_file($tmp_name, $NewName);    
		  $SQL = "INSERT INTO `dede_1234aa` (`parentid`,`title`,`url`,`dtime`)";
		  $SQL .= "VALUES ('2','" . $_POST['title'][$key] . "','" . $NewName . "',NOW());";
		  
		  if($db->ExecuteSQL($SQL))
		  {
				echo "<script>alert('恭喜您,上传成功');location.href='aa.php';</script>"; 
		  } 
		  else 
		  {
				echo "<script>alert('对不起,上传失败');history.go(-1);</script>"; 
		  }
		   unset($uN,$SQL);   
	 }   
	
  }  
  *******************************/
}  
 ?>
 
 
</body>
</html>