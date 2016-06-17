// JavaScript Document

$.fn.extend({
	/**
	 * 选项卡
	 * 
	 */
	Tabs: function(fn){
		var _this=$(this);
		this.each(function(){
			_this.find(".tabs_nav>li.tabs_btn").on("click",function(){
				$(this).addClass("on").siblings("li.tabs_btn").removeClass("on");
				var index=$(this).index();
				$(this).closest(".tabs_nav").siblings(".tabs_bd").children(".tabs_item").removeClass("show").eq(index).addClass("show");
				//调用其它函数
				if(fn){
					fn($(this));
				}
			});
		});
	},	
	
	/**
	 * 焦点图
	 * @param options
	 * 		arrow		显示箭头
	 *		dots		显示原点导航
	 *		autoplay	开启自动播放
	 *		delay		自动播放时的滑动延迟
	 *		speed		滑动速度
	 */
	slideBox: function(options){
		//默认值
		var defaults={
			arrow:true,		//显示箭头
			dots:true,		//显示原点导航
			autoplay:true,	//开启自动播放
			delay:2500,		//自动播放时的滑动延迟
			speed:300,		//滑动速度	
			num:1,			//相册显示图片的数量，不包含隐藏部分
			hammer:true
		}
		options=$.extend(defaults,options);	//以传参覆盖
		var _this=$(this);
		_this.each(function() {
			//var width  =window.document.width();
			var sWidth =$("#container").width();
			var len    =_this.find("li").length;
			var index  =0;
			var picTimer;
			
				
			//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
			_this.find("li").css({width:sWidth});
			_this.find("ul").css({width:len*sWidth});
			
			//显示左右箭头
			if(defaults.arrow){
				//追加按钮
				var _btn=$('<span class="arrow pre"></span><span class="arrow next"></span>').appendTo(this);
				
				//点击左按钮
				_this.find(".arrow.pre").on("click",function(){
					index-=defaults.num;
					if(index==-defaults.num){
						index=len-defaults.num;
					}else if(index<0&&index>-defaults.num){
						index=0;	
					}
					showPic(index);
				});
				//点击右按钮
				_this.find(".arrow.next").on("click",function(){
					index+=defaults.num;
					if(index>=len){
						index=0;
					}
					showPic(index);
				});	
							
			}
			
			if(defaults.hammer){
				//滑动焦点图
				var element=_this.find("ul")[0];
				var hammertime=Hammer(element,{
					drag:false,
					transform:false	
				});
				hammertime.on('swiperight',function(){
					index-=defaults.num;
					if(index==-defaults.num){
						index=len-defaults.num;
					}else if(index<0&&index>-defaults.num){
						index=0;	
					}
					showPic(index);
				});
				hammertime.on('swipeleft',function(){
					index+=defaults.num;
					if(index>=len){
						index=0;
					}
					showPic(index);
				});		
			}
			
			//显示原点导航
			if(defaults.dots){
				var dots='<div class="dots">'
				for(i=0;i<len;i++){
					dots+='<span></span>';
				}
				dots+='</div>';
				_this.append(dots); 
				
				//为小圆点添加鼠标移入事件
				_this.find(".dots span").on("mouseenter",function(){
					index=$(this).index();
					showPic(index);
				}).eq(0).trigger("mouseenter");
			}
			
			//自动播放
			if(defaults.autoplay){
				_this.hover(function(){
					clearInterval(picTimer);
				},function(){
					
					picTimer=setInterval(function(){
						showPic(index);
						index+=defaults.num;
						if(index>=len){
							index=0;
						}
					},defaults.delay);	
				}).trigger("mouseleave");	
				
			}
			
			//显示图片函数，根据接收的index值显示相应的内容
			function showPic(index){
				var nowLeft=-index*sWidth;
				_this.find("ul").animate({
					left:nowLeft
				},defaults.speed);
				_this.find(".dots span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
			}
		});
	}
});