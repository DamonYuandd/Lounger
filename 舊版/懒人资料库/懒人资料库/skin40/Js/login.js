function CheckLogin(){
	if(document.getElementById("username").value == ""){
		alert("请输入用户名!");	
		document.getElementById("username").focus();
		return false;
	}
	if(document.getElementById("password").value == ""){
		alert("请输入密码!");	
		document.getElementById("password").focus();
		return false;
	}
	var checkcodeFrm=$("form[name='loginform']:has('#checkcode')");
	if(checkcodeFrm){
		if(checkcodeFrm.value=="")
		{
			alert("请输入验证码!");	
			checkcodeFrm.focus();
			return false;
		}
	}
	return true;
}