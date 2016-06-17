// JavaScript Document
/*----------------------------{
 * Open source under the BSD License. 
 * Copyright 2010 Mr.Zhao XiaoDong
 * All rights reserved.
 * Supported by jQuery
}----------------------------*/
(function($){
	$.fn.extend({
		z_lrSwing:function(opts){
			var defaults = {
				z_range:20,
				z_range_i:5,
				z_range_t:100
			};
			var opts = $.extend(defaults, opts);
			this.each(function(){
				
				var d_offset = $(this).offset();
				var d_offset_l = d_offset.left;
				var d_offset_t = d_offset.top;
				var z_lrSwing_div_h = $(this).height();
				var z_lrSwing_div_w = $(this).width();
				var z_lrSwing_div_var = $(this).html();
				
				$(this).after('<div id="z_lrSwing_div_z" style="visibility:hidden"></div>');
				$("#z_lrSwing_div_z").css({width:z_lrSwing_div_w,height:z_lrSwing_div_h});
				
				$(this).css({position:'absolute',left:d_offset_l,top:d_offset_t});
				
				for(var i=0; i<opts.z_range_i; i++){
					$(this).animate({left: d_offset_l+opts.z_range, top:d_offset_t}, {duration:opts.z_range_t,easing:'swing'});
					$(this).animate({left: d_offset_l-opts.z_range, top:d_offset_t}, {duration:opts.z_range_t,easing:'swing'});
				};
				
				$(this).animate({left: d_offset_l, top:d_offset_t}, {duration:opts.z_range_t,easing:'swing'});
			});
		}
	})
})(jQuery);