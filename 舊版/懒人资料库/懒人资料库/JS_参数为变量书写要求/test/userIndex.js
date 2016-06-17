$(document).ready(function(){
	$(".glitzBody ul li").ready(function(){
		var kk = $(".glitzBody ul li").length;
		for (i=1;i<=kk;i++)
		{
			if(i%3==0)
			{    var iii = i;
				 $(".glitzBody ul li:eq("+i+")").removeClass('kkk1').addClass('kkk2');
				}
			
			}
		});
	});
