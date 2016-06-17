<?php
$conn = mysql_connect ("localhost","root","") or die ("数据库连接出错" . mysql_error());
mysql_select_db ("jiaocheng",$conn);
mysql_query("set names 'gbk'");
?>
