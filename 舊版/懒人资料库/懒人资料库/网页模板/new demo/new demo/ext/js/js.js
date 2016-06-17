$(function(){
	$('.infoBoxContents .categories li').last().addClass('last_list');
	$('.infoBoxContents .information li').last().addClass('last_list');
	$('.infoBoxContents .bestsellers li').last().addClass('last_list');
	$('.contentPadd h3').first().addClass('first_h3');
		$('.blocks .list_scroll li').first().addClass('first_price');
	$('.contentPadd.loginPage h3').addClass('first_h3');
	$('.contentInfoText, .contentInfoBlock').last().addClass('marg-bottom');
	$('.loginPage .contentInfoText').addClass('marg-top');
	
	//$('#piGal ul.thumbs li').remove()//first().css('margin-left','0px');
	//$('.thumbs li').eq(0).css('margin-left','0px')

	$('.cart th').last().css('border-right','0px');
	$('.cart_prods').css('border-width','0px 1px 1px 0px');
	$('.cart_update').css('border-width','0px 1px 1px 0px');
	$('.cart_price').css('border-width','0px 0px 1px 0px');	
	$('.cart_total td:nth-child(2)').css('border-width','0px 1px 0px 0px');
	$('.desc p').first().css('padding-top','0px');
});

	
