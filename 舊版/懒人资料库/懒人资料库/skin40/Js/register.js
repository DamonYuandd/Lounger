//-------------------------------------------------------------
// 文件名称: register.js
// 描   述: 脚本语言
// 修改标识: Modify By 李传 2008-11-17
// 修改内容: 名字长度不符合也会成功注册 
//          function VaildData()中tmp.length < 5 || tmp.length < 16
//          改为tmp.value.length < 5 || tmp.value.length > 16;
//-------------------------------------------------------------
//判断配送方式
function changecat(obj, level){
	var id = obj.options[obj.options.selectedIndex].value;
	if(id == "") return;

	level = level + 1;
	url = path + "register.aspx?action=area&id=" + id + "&level=" + level + "&d=" + escape(Date());

	$('#areafid_' + level)[0].style.display = "";
	$('#areafid_' + level)[0].innerHTML = "loading...";
	if(level == 2){
		$('#areafid_' + (level+1))[0].style.display = "none";
	}
	
	templevel = level;
	//ajax请求
	$('#areafid_' + level).load(url);
}
function getobj(id){
	return document.getElementById(id);	
}
//错误处理  
function ErrDisp(e)
{
    var errMsg = "";
    /*if(e!=null)
    {
        errMsg = "Number:" + e.number + "\n" +
                 "Message:" + e.message + "\n";
    }*/
    alert(errMsg);
}
//验证界面提交数据
function VaildData()
{
    var tmp = null;
    var tmp2 = null;

    try
    {
		//判断同意按钮是否选中
		tmp = getobj("agree");
		if(tmp){
			if(tmp.checked == false){
				alert("不同意协议，无法注册！");
				return false;
			}
		}
		
        //用户名
        tmp = getobj("txtUID");
        if(tmp==null||tmp.value=="")
        {
            alert("请输入用户名！");
            tmp.select();
            return false;
        }
		//李传 2008-11-17
		//判断用户名长度
		if(tmp.value.length < 1 || tmp.value.length > 15)
        {
            alert("用户名必须在1~16字符之间！");
            tmp.select();
            return false;
        }
        //密码
        tmp = getobj("txtPass01");
        if(tmp==null||tmp.value=="")
        {
            alert("请输入密码！");
            tmp.select();
            return false;
        }
        //请再输入一次密码.
        tmp2 = getobj("txtPass02");
        if(tmp2==null||tmp2.value=="")
        {
            alert("请再输入一次密码！");
            tmp2.select();
            return false;
        }
        //两次输入密码不一致
        if(tmp.value!=tmp2.value)
        {
            alert("两次输入密码不一致！");
            tmp2.select();
            return false;
        }
        //EMAIL不能为空
        tmp = getobj("txtEmail");
        if(tmp==null||tmp.value=="")
        {
            alert("请输入EMAIL！");
            tmp.select();
            return false;
        }
 		//EMAIL格式验证
		if(!ValidateEmail(tmp.value)){
			alert("邮件格式不正确");	
			tmp.select();
			return false;
		}
		//地区选择判断
		/*tmp = getobj("txtAreaID_2");
		if(tmp){	
			if(tmp.value == "0"){
				alert("请选择地区");	
				tmp.focus();
				return false;	
			}
		}else{
			alert("请选择地区");	
			return false;
		}*/
		
        return true;
    }
    catch(e)
    {
        ErrDisp(e);
        return false;
    }
    return true;
}


function   ValidateEmail(j) 
{ 
	var   emailReg=/^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 
	return   emailReg.test(j); 
}

//确定按钮按下时
function imgSubMit_onclick()
{
    try
    {
        var op = getobj("_OP");
        if(VaildData()!=true) return false;

        getobj('frmRegister').action = path + "Register.aspx";
        getobj('frmRegister').method = "POST";
        op.value = "OP_Register";
        getobj('frmRegister').submit();
    }
    catch(e)
    {
        ErrDisp(e);
    }
}
//确定按钮提交后返回事件
function VaildUID_Return(strReturn)
{
    var uid = getobj("txtUID");
	
    if(strReturn=="-1")
    {
        alert("验证成功，您可以使用该用户名！");
    }
    else if(strReturn == "0")
    {
        alert("验证失败，对不起该用户名可能已经被人使用了！");
        uid.select();
        uid.focus();
    }
    else
    {
        alert(strReturn);
    }
	$('#btnVaildUID')[0].disabled = false;
}
//确定按钮按下时
function btnVaildUID_onclick() {
    //try
    //{
        var txtUid = getobj('txtUID');
        var Url = path + "Register.aspx";
        var PostData = "";

		if(txtUid==null||txtUid.value=="")
		{
			alert("请输入用户名！");
			txtUid.select();
			return false;
		}
		//判断用户名长度
		if(txtUid.value.length < 1 || txtUid.value.length > 16)
		{
			alert("用户名必须在2~16字符之间！");
			txtUid.select();
			return false;
		}
        
        PostData = 
            "_OP=OP_VaildUID" +
            "&txtUID=" + encodeURI(txtUid.value) ;
        AjaxSubmit(Url, PostData, VaildUID_Return);
        $('#btnVaildUID')[0].disabled = true;
        return true;
    //}
   // catch(e)
    //{
    //    ErrDisp(e);
    //}
}

//取得XmlHttp对象
function CreateXMLHttpRequest()//这里是构造XMLHttpRequest对象的方法
{
    var xmlHttpRequest = null;//这里是大家都常用的IE，firefox中取得XMLHttpRequest对象的方法
    try 
    {
        xmlHttpRequest = new XMLHttpRequest(); 
    }
    catch(e)
    {
        try
        {
            xmlHttpRequest=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e)
        {
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
    }

    return xmlHttpRequest;
}
//----------------------------------------
// 用Ajax提交数据
//
// Url指定跳转页,
// data是要post的数据。
// EventHander 函数指针
//----------------------------------------
function AjaxSubmit(url, data, EventHander)
{
    var xmlHttpResquest = CreateXMLHttpRequest();

    xmlHttpResquest.open("POST", url, true);
    xmlHttpResquest.setRequestHeader("Content-Length", data.length);
    xmlHttpResquest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlHttpResquest.send(data);
    xmlHttpResquest.onreadystatechange = function ()
    {
        if (xmlHttpResquest.readyState == 4)
        {
            try
            {
                if(xmlHttpResquest.status == 200)
                {
                    //alert(xmlHttpResquest.responseText);      //DEBUG用
                    EventHander(xmlHttpResquest.responseText);  //这里可以调用想要的函数
                }
            }
            catch(e)
            {
                var errMsg = "";
                if(e!=null)
                {
                    errMsg = "Number:" + e.number +
                             "Message:" + e.message;
                }
                alert(errMsg);
            }
        }
    }

}