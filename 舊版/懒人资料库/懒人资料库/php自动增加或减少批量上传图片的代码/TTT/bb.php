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

<?php 
$SQL = "select * from dede_1234aa   order by id asc ";
$attr=($db->SelectSQL($SQL));
$spec = 0;
?>


<!--这个是点击增加或减少要用到的js-->
<table width="90%" id="gallery-table"  align="center">
<form enctype="multipart/form-data" action="" method="post" name="theForm" >
<tr><td>&nbsp;</td></tr>


<?php 

 foreach ($attr AS $key => $val)
 {
  

?>
<tr>
<td>
<?php 
$str= ($spec ==0) ?
	"<a href='javascript:;' onclick='addImg(this)'>[+]</a>" :
	"<a href='javascript:;' onclick='removeImg(this)'>[-]</a>";
    $spec = $val['id'];
	echo $str;
?>
   
 下载名称 
  <input name="title[]" type="text" id="title[]" value="<?php echo $val['title'];?>" size="20" />
  <input type='hidden' name='attr_id_list[]' value='<?php echo $val['id'];?>' />
  (<span style='color:#ff0000'>图片名称不能相同!</span>)&nbsp;&nbsp;上传文件 
  <input name="url[]" type="file" id="url[]" /> <input type='hidden' name='original_url_list[]' value='<?php echo $val['url'];?>' />
  <?php 
  if($val['url']!='')
  {
  	echo "<a href='".$val['url']."' target='_blank'><img src='images/yes.gif' border='0' alt='已上传了文件'></a>";
  }
  else
  {
     echo "<img src='images/no.gif' border='0' alt='还没上传文件'>";
  }
  ?>
  </td>
</tr>

<?php 

 
}

?>
<?php echo $html;?>

<tr><td> <input type="submit" name="upload" value="提交" />
<input name="ac" type="hidden" id="ac" value="modify_ok" />
</td></tr>
  </form>
</table>
说明:在修改时,更新记录的原理是:他是先增加一个记录，然后再删除原来的记录,从而使我们看上去就像是更新了记录一样
<?php 
$Types = array('rar','doc','zip','xls'); //设置上传类型
//$Types = explode(',',strtolower($Types));
$size=10240; //上传文件大小限制(KB)
if($_REQUEST['ac']=='modify_ok')
{     
  $dest_folder   =  "upload/";   
  if(!file_exists($dest_folder))
  { mkdir($dest_folder);}  
  
// 取得原有的属性值
$goods_attr_list = array();
$sql = "SELECT * FROM dede_1234aa  WHERE parentid='2' ";
$res=$db->SelectSQL($sql);

//$res = mysql_query($sql);
//while ($row = mysql_fetch_array($res,MYSQL_ASSOC))
foreach($res as $i => $row )
{
	$goods_attr_list[$row['title']] = array('sign' => 'delete', 'id' => $row['id']);
}   

 //开始判断 
  if(isset($_POST['attr_id_list']))
  {  
	$i=0;
	foreach ($_POST['attr_id_list'] AS $key => $attr_id)
	{
		$attr_value = $_POST['title'][$key];
		if (empty($attr_value)) //如果中上传了图片，但是没有填写图片名称，那么就把图片名title称设为1,不然，图片是存不到数据库里，也就是title必须有值，url才能存
		{$attr_value=$attr_id;}		
		$original_url = $_POST['original_url_list'][$key];
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
		
		if (!empty($attr_value))
		{    
			if (isset($goods_attr_list[$attr_value]))
			{
			   // 如果原来有，标记为更新
				$goods_attr_list[$attr_value]['sign'] = 'update';
				$goods_attr_list[$attr_value]['title'] = $attr_value;
				$goods_attr_list[$attr_value]['url'] = $url;  //我加的
				
			}
			else
			{
				// 如果原来没有，标记为新增
				$goods_attr_list[$attr_value]['sign'] = 'insert';
				$goods_attr_list[$attr_value]['title'] = $attr_value;
				if ($url=='')//表示你没有上传或是没有改动上传文件,只是改了一下标题
				{
					$goods_attr_list[$attr_value]['url'] = $original_url; //就把原来数据库的url的值赋给他
				}
				else
				{
					$goods_attr_list[$attr_value]['url'] = $url;  //我加的
				}
			}
		 }	
		
	   
	}
 /* 插入、更新、删除数据 */	
   $key=0;
	foreach ($goods_attr_list as $attr_id => $info)
    {     
   		if ($info['sign'] == 'insert')
		{  
			$sql = "INSERT INTO dede_1234aa (parentid,title, url, dtime)".
					"VALUES ('2', '$info[title]','$info[url]',NOW())";
		}
		elseif ($info['sign'] == 'update')
		{  
			 
			if ($info[url]=='')//表示修改时，你没有传新的图片
			
			{
				$SQL = "update  `dede_1234aa` set  parentid='2',title='$info[title]',dtime=NOW() where id= " . $_POST['attr_id_list'][$key] . "" ;
			}
			else
			{
				 $SQL = "update  `dede_1234aa` set  parentid='2',title='$info[title]',url='$info[url]',dtime=NOW() where id= " . $_POST['attr_id_list'][$key] . "" ;
			}
		   
		}
		else
		{
			$sql = "DELETE FROM `dede_1234aa` WHERE id = '$info[id]' LIMIT 1";
		}
		$key +=1 ;
		if($db->ExecuteSQL($sql))
		{
			echo "<script>alert('恭喜您,修改成功!');location.href='bb.php';</script>"; 
		} 
		else 
		{
			echo "<script>alert('对不起,修改失败!');history.go(-1);</script>"; 
		}
			
     }  
  }
  
  
 
  
 }  
 ?>
 
 
</body>
</html>