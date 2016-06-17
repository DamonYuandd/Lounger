<?php
header("Content-Type:text/html;charset=GB2312");
$users = array("sd110","wk110","hr110");
$user = $_REQUEST["u"];
$is_exsit = false;

if($user == ""){
	echo "用户名不能为空！";
	return;
}

foreach ($users as $u) {
    if($u == $user){
        $is_exsit = true;
	break;
    }
}

if($is_exsit){
   echo "改用户名已被注册！";
}else{
   echo "success";
}
?>