/**
 * @author lb
 * 获得系统、分辨率等手机参数，设置meta
 */
var appVersion = window.navigator.appVersion;   //客户端信息
var isSystem=appVersion.indexOf("Android")>-1 || appVersion.indexOf("android")>-1?"android":false;
if(isSystem!="android"){
	isSystem=appVersion.indexOf("iPhone")>-1 || appVersion.indexOf("iPod")>-1?"iphone":false;
}
//switch (isSystem){
//    case "android":
//        var windowWidth=window.screen.width;    //设备独立像素
//        var devicePixelRatio = window.devicePixelRatio; //物理像素和设备独立像素的比例，多数为1/2/3
//        var targetDensitydpi = 640 / windowWidth * devicePixelRatio * 160;
//        document.writeln('<meta name="viewport" content="width=device-width, target-densitydpi='+targetDensitydpi+', user-scalable=no">');
//        break;
//    case "iphone":
//        document.writeln('<meta name="viewport" content="width=640, target-densitydpi=320, initial-scale=0.5, minimum-scale=0.5, maximum-scale=0.5, user-scalable=no" />');
//        break;
//    default :
//}



/**
 * 实现AppCan跳转方式
 */
var isAppCan = true;
$(function(){
    //为所有带地址的url设置appcan跳转
    $(document).on('click', 'a', function (e) {
        var href = $(this) .attr('href');
        if (isAppCan) {
            if (href.indexOf('javascript:') < 0) {
                if ($(this) .hasClass('icon_48_arrow_l')) {
                    uexWindow.open(href, '0', href, '1', '', '', 4, 300);
                }
                uexWindow.open(href, '0', href, '2', '', '', 4, 300);
            }else if (href == 'index.html') {
                uexWindow.open(href, '0', 'index.html', '1', '', '', 4, 300);
                if (isSystem != 'iphone') {
                    setTimeout(function () {
                        uexWindow.close(1);
                    }, 1000);
                }
            }else if (href == '#') {
                return false;
            }
            return false;
        }
    });
});


/**
 * IScroll
 */
var myScroll;
function loadIScroll(){
	myScroll = new IScroll("#wrapper",{
		mouseWheel:true,		//鼠标滚轮
		tap:true,				//触控设备的触摸事件
		click:true,				//普通onClick事件
		probeType:3
	});
}
//window.onload=function(){
//	loadIScroll();
//};


$(function(){
	//底部导航
	$("#footer").on("click","ul li",function(){
		$(this).addClass("on").siblings("li").removeClass("on");	
	});
	
	
	//条件筛选
	$(".pbd_filter").on("click","li.attr",function(){
		$(this).addClass("on").siblings("li").removeClass("on");
		$(".attr_box").css({"display":"none"});
	});
	$(".pbd_filter").on("click","li.attr_more",function(){
		$(this).toggleClass("on").children(".attr_box").animate({height:"toggle"},"fast");
	});
	$(".attr_box").on("click","span",function(){
		$(".pbd_filter li.attr").removeClass("on");
	});
	
	
	
})