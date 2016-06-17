var newlist = 0;

function GetNewHtml(typ, id, pageindex, list, num){
    //document.getElementById("ajaxcontent").style.display = "none";
    //document.getElementById("DisplaySettings").style.display = "none";
    
    var nowurl = location.href;
    var reg = new RegExp("http\:\/\/.*/list\-([0-9]*)\.html","gi");
    var cid = nowurl.replace(reg, "$1");
    var pageid = 0;
    
    if(nowurl.indexOf("page") != -1){
        reg = new RegExp("http\:\/\/.*/list\-([0-9]*)\_page\-([0-9]*)\.html","gi");
        pageid = nowurl.replace(reg, "$2");
        cid = nowurl.replace(reg, "$1");
    }
    
    var url = path + "list.aspx?id="+cid+"&"+typ+"="+id;
    
    if(list != "0"){
        url += "&listt=" + list;
    }
	newlist = list;
    
    if(num != "0"){
        url += "&num=" + num;
    }    
    
    if(pageindex != "0"){
        url += "&page=" + pageindex;
    }else{
        if(pageid != "0")
            url += "&page=" + pageid;
    }
    
	//Ajax请求
	new Request.HTML({
	url:url,
	update:"ajaxcontent",
	evalScripts:false,
	onComplete:replaceHTML}).get();    
    
    //更换图标状态
    switch(typ){
        case "ot" :
            //childs(obj.childNodes)[0].src = "images/sortby_time_up_act.gif";
            break;
    }
}

//取得商品部分正则
function replaceHTML(){
	
    var content = document.getElementById("ajaxcontent").innerHTML;
    //头部导航
    var reg = new RegExp("(([^\^]*)<!--titlestart-->([^\^]*)<!--titleend-->([^\^]*))","gi");
    var titlecontent = content.replace(reg, "$3");
    titlecontent = AspxToHtml(titlecontent);
    document.getElementById("DisplaySettings").innerHTML = titlecontent;
    //商品内容
    var reg = new RegExp("(([^\^]*)<!--contentstart-->([^\^]*)<!--contentend-->([^\^]*))","gi");
    var procontent = content.replace(reg, "$3");
    procontent = AspxToHtml(procontent);
    document.getElementById("ajaxcontent").innerHTML = procontent;
	
	if(newlist == 0){
		$("listcss").href = "css/css_list.css";
	}else{
		$("listcss").href = "css/css_list"+newlist+".css";
	}
    //document.getElementById("ajaxcontent").style.display = "block";
    //document.getElementById("DisplaySettings").style.display = "block";
}

//替换JS
function ConvertTag(str){
    var queryArray = str.split(".html");
	
	if(queryArray == null){
		queryArray = str.split(".aspx");
	}else if(queryArray.length == 1){
		queryArray = str.split(".aspx");
	}
	
	try{
		if(queryArray != null){
			queryArrayStr =queryArray[1].split("&amp;");
		}
	}catch(e){
		return;
	}
	
    //function GetNewHtml(typ, id, pageindex, list, num){
 	var tmpStr = "";
	
    if(queryArrayStr != null){
	    tmpStr = "javascript:GetNewHtml('ot','"+ GetQueryValue("ot", queryArrayStr) +"','"+ GetQueryValue("page", queryArrayStr) +"','"+ GetQueryValue("listt", queryArrayStr) +"','"+ GetQueryValue("num", queryArrayStr) +"')";
	}
    return tmpStr;
}


function GetQueryValue(key, array){
    for(var i=1;i<array.length;i++){
        //alert(array[i]);
        //alert(key + "=");
        if(array[i].indexOf(key + "=") != -1){
            return array[i].replace(key + "=", "");
        }
    }
    return "0";
}

//ASPX连接转HTML
function AspxToHtml(str){
    var reg = new RegExp("(product\.aspx\[?]id\=([0-9]*))","gi");
    str = str.replace(reg, "html/ms/product-$2.html");

    
    /*
    reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx\[?]id\=([0-9]*)\&amp\;num=([0-9]*)\&amp\;page=([0-9]*)\&amp\;ot=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$5','$4','0','$3')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx\[?]id\=([0-9]*)\&amp\;ot=([0-9]*)\&amp\;num=([0-9]*)\&amp;page=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','$5','0','$4')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx\[?]id\=([0-9]*)\&amp\;ot=([0-9]*)\&amp;page=([0-9]*)\&amp\;num=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','$4','0','$5')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx\[?]id\=([0-9]*)\&amp\;num=([0-9]*)\&amp\;ot=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$4','0','0','$3')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx\[?]id\=([0-9]*)\&amp\;ot=([0-9]*)\&amp\;num=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','0','0','$4')");  */
    
    //document.write(str);
    
    
	reg = new RegExp("http\:\/\/([^\<\>]*)/list\.aspx([^\"\>]*)","gi");
	result = str.match(reg);

	if(result != null){
		for(var i=0;i<result.length;i++){
			str = str.replace(result[i], ConvertTag(result[i]));
		}
	}
	
	reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*)\.html([^\"\>]*)","gi");
	result = str.match(reg);

	if(result != null){
		//alert(result.length);
		for(var i=0;i<result.length;i++){
			str = str.replace(result[i], ConvertTag(result[i]));
		}
	}
	
	//alert(str);
	return str;
    
    
	
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*)\.html\&amp\;num=([0-9]*)\&amp\;page=([0-9]*)\&amp\;ot=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$5','0','$4','$3')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*)\.html\&amp\;ot=([0-9]*)\&amp\;num=([0-9]*)\&amp;listt=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','0','$5','$4')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)list-([0-9]*)\.html\&amp\;ot=([0-9]*)\&amp;listt=([0-9]*)\&amp\;num=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','0','$4','$5')");
	
	
	
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*).html\&amp\;num=([0-9]*)\&amp\;ot=([0-9]*)\&amp\;listt=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$4','0','$5','$3')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*).html\&amp\;ot=([0-9]*)\&amp\;num=([0-9]*)\&amp\;listt=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','0','$5','$4')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*).html\&amp\;num=([0-9]*)\&amp\;ot=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$4','0','0','$3')");
	
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*).html\&amp\;listt=([0-9]*)\&amp\;num=([0-9]*)\&amp\;ot=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$5','0','$3','$4')");
    
    reg = new RegExp("http\:\/\/([^\<\>]*)/list-([0-9]*).html\&amp\;ot=([0-9]*)\&amp\;num=([0-9]*)","gi");
    str = str.replace(reg, "javascript:GetNewHtml('ot','$3','0','0','$4')");
	
	
	
	
    
    reg = new RegExp("(list\.aspx\[?]id=\([0-9]*)\&amp\;ot\=([0-9]*)\&amp\;page\=([0-9]*))","gi");
    str = str.replace(reg, "html/ms/list-$2_page-$4.html");
    
    //alert(str);
    return str;
}

//兼容FF下的childNodes
function childs(nodes)
{
    if(!nodes.length) 
        return [];
    var ret=[];
    for(var i=0;i<nodes.length;i++)
    {
        if(nodes[i].nodeType!=1) 
            continue;
        ret.push(nodes[i]);
    }
    return ret;
}