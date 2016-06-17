$(function(){
	$('body').append('<div class="bottom-copyright bottom-fixed">版权所有.<a href="http://www.huyi.cn" target="_blank">环球互易</a>. 技术支持.<a href="http://www.16show.net" target="_blank">网建中心</a>&nbsp;&nbsp;&nbsp;</div>');
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