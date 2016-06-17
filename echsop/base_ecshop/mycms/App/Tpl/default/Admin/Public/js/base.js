$(function(){
	$('body').append('<div class="bottom-copyright bottom-fixed">欢迎使用网站后台</div>');
});


//URL跳转
function goToUrl( url ) {
	window.location.href = url;
}

function set_publish(){
	if($('#publish').attr('checked') == 'checked'){
			$('#is_publish').val('1');
	}else{
			$('#is_publish').val('0');
	}
	
}
//弹出新的窗口
function PopupWindow(strUrl, intWidth, intHeight)
{
  window.open(strUrl, (new Date()).getSeconds(), 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width='+intWidth+',height='+intHeight);
	return false;
}
$('input[name=photo_def]').click(function(){
	$.get(data._APP_+'/Admin/'+data.actionName+'/photoDef',{'id':data.get_id,'image':$(this).val()},function(bool){
		
	});
});