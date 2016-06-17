// JavaScript Document
function hideTips(){
	$.mobile.hidePageLoadingMsg();
}
function ajaxTips(json){
	if(json == 1){
		$.mobile.showPageLoadingMsg('a','保存成功',true);
		setTimeout(hideTips,3000);
		//$.mobile.hidePageLoadingMsg();
		//alert('保存成功！');
	}else{
		$.mobile.showPageLoadingMsg('a','保存失败',true);
		setTimeout(hideTips,3000);
	//	alert('保存失败！！');
	}
}