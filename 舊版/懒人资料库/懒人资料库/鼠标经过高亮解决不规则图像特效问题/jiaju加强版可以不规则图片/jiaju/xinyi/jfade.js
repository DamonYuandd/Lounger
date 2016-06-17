/*
特效鼠标经过高亮，其他隐藏
作者 袁德民
*/
$(function($) {

	$.fn.jfade = function(settings) {
   //download by http://www.codefans.net
	var defaults = {
		start_opacity: "1",
		high_opacity: "1", //选中调整的透明度
		low_opacity: ".1", //选中其他位置调整的透明度
		timing: "500"
	};
	var settings = $.extend(defaults, settings);
	settings.element = $(this);
			
	//set opacity to start
	$(settings.element).css("opacity",settings.start_opacity);
	//mouse over
	$(settings.element).hover(
	
		//mouse in
		function () {												  
			$(this).stop().animate({opacity: settings.high_opacity}, settings.timing); //100% opacity for hovered object
			$(this).siblings().stop().animate({opacity: settings.low_opacity}, settings.timing); //dimmed opacity for other objects
		},
		
		//mouse out
		function () {
			$(this).stop().animate({opacity: settings.start_opacity}, settings.timing); //return hovered object to start opacity
			$(this).siblings().stop().animate({opacity: settings.start_opacity}, settings.timing); // return other objects to start opacity
		}
	);
	return this;
	}
	
})(jQuery);


/*搜索TAB的代码*/
function selectTag(showContent,selfObj){
	// 操作标签
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 操作内容
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	}
/*搜索TAB代码结束*/	