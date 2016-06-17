<?php
if (!function_exists('json_decode'))
{
	throw new Exception('API needs the JSON PHP extension.');
}
define('IN_ECS', true);
require('../../includes/init.php');
include_once('../../includes/lib_transaction.php');
include_once('../../includes/lib_passport.php');
session_start();
require_once('config.php');
require_once('oauth.php');
require_once('opent.php');
require_once('json.class.php');


$o = new MBOpenTOAuth( QQ_AKEY , QQ_SKEY , $_SESSION['keys']['oauth_token'] , $_SESSION['keys']['oauth_token_secret']);
$last_key = $o->getAccessToken(  $_REQUEST['oauth_vericode'] ) ;
$me=$o->getUserInfo($last_key['openid']);



if($me['nickname']!==""){
  $username=$me['nickname'];
  $password=time();//随便弄个密码 反正没有用
  $email=$password.'@qq.com';//QQG开放平台没有返回邮箱 所以随便弄个 其他的可以根据返回情况而定
  $back_act ="/user.php";
  
  if (check_user($username)!==false){
  		 $GLOBALS['user']->set_session($username);
         $GLOBALS['user']->set_cookie($username);
         header("Location: /user.php\n");
   		 exit;
   }else{
	   $reg_date = time();
	   $password =md5($password);
	   $ip=real_ip();
	   $GLOBALS['db']->query('INSERT INTO ' . $GLOBALS['ecs']->table("users") . "(`email`, `user_name`, `password`, `reg_time`, `last_login`, `last_ip`) VALUES ('$email', '$username', '$password', '$reg_date', '$reg_date', '$ip')");
	   $GLOBALS['user']->set_session($username);
	   $GLOBALS['user']->set_cookie($username);
	   header("Location: /user.php\n");
	   exit;
   }
}else{
  echo 'fail';
  exit;
}



function check_user($username){
   $sql = "SELECT user_id, password, salt " .
                   " FROM " . $GLOBALS['ecs']->table("users").
                   " WHERE user_name='$username'";
   $row = $GLOBALS['db']->getRow($sql);
   if(!empty($row)){
    	return true;
   }else{
   		return false;
   }
}
?> 
