$.fn.autoTip = function(G){
/**
 +------------------------------------------------------------------------------
 * input用户名自动提示插件
 +------------------------------------------------------------------------------
 * @author    飞飞
 * @version   1.0
 * @QQ        276230416
 +------------------------------------------------------------------------------
 * 参数
 * @input 入参
 *     json对象
 *     @ dvalue       input表单提示默认值
 *     @ tip          默认提示信息样式名class
 *     @ tipnone      在指定的input执行click时替换的样式名class
 +------------------------------------------------------------------------------
 *使用方法:
 * $("#xxx").autotip();
 * @ #xxx 为需要提示的input的id
 */
	var D;
	D = {
		dvalue:"用户名/电子邮箱",//表单默认值
		tip:"tip",             //默认提示信息样式名class
		tipnone:"tipnone"      //在指定的input执行click时替换的样式名class
	};
	$.extend(D,G);
	if ($(this).val()==""){
		$(this).val(D.dvalue)
			   .addClass(D.tip)
		       .click(function(){
				if($(this).val()==D.dvalue){
						 $(this).val("");
						 $(this).removeClass(D.tip);
						 $(this).addClass(D.tipnone);
				}
				})
				.blur(function(){
				if($(this).val()==""){
				  $(this).removeClass(D.tipnone);
				  $(this).addClass(D.tip);
				  $(this).val(D.dvalue);
				}
				});
	};
}