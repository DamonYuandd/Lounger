 function getAjax()
{
    var ajax=false; 
    try 
    { 
     ajax = new ActiveXObject("Msxml2.XMLHTTP"); 
    } 
    catch (e)
     { 
      try 
      { 
      ajax = new ActiveXObject("Microsoft.XMLHTTP"); 
      } 
     catch (E)
      { 
      ajax = false; 
      } 
    }
    if (!ajax && typeof XMLHttpRequest!='undefined') 
    { 
     ajax = new XMLHttpRequest(); 
    } 
    return ajax;
}
  function sends(url, method, callback, data, urlencoded, callback2){  
    
    var req=getAjax();  //得到一个XMLHTTP的实例
    //如果以POST方式回发服务器
    if (method=="POST")
     {
        req.open("POST", url, true);
        //请求需要编码
        if (urlencoded) 
        req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');        
        req.send(data);
        Request.reqList.push(req);
    }
    //以GET方式请求
     else 
    {
        req.open("GET", url, true);
        req.send(null);
         //Request.reqList.push(req);
    }
    //正在向服务器发送请求，页面显示正在加载的提示
  loading();    
 return req;
    
  }