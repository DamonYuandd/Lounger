<?php
header("Content-Type:text/html;charset=GB2312");
$users = array("sd110","wk110","hr110");
$user = $_REQUEST["u"];
$is_exsit = false;

if($user == ""){
	echo "�û�������Ϊ�գ�";
	return;
}

foreach ($users as $u) {
    if($u == $user){
        $is_exsit = true;
	break;
    }
}

if($is_exsit){
   echo "���û����ѱ�ע�ᣡ";
}else{
   echo "success";
}
?>