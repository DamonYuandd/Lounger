/*-------------------------------------------------------------------- 
*
* Created by Dexter (http://cssclub.ru)
*
--------------------------------------------------------------------*/
function equalHeights(element) {	
		var class_name = '.equal-height';
		var maxHeight = 0;	
		var maxItem = 0;
		var maxItem_adjust = 0;		

		element.find(class_name).each(function(i){	
			$(this).wrapInner('<div></div>');				
		});	
				
		function heightChecker(){			
			element.find(class_name).each(function(i){						
				if($(this).outerHeight() > maxHeight) { 
						maxHeight = $(this).outerHeight();
						maxItem = $(this);
						setHeight(maxHeight);
					}				
			});				
			
			maxItem_adjust = maxItem.outerHeight()-maxItem.height();
			if(maxHeight > (maxItem.children().height() + maxItem_adjust)){
					maxHeight = maxItem.children().height() + maxItem_adjust;
					setHeight(maxHeight);									
				}
				
			setTimeout(function(){heightChecker()}, 1000)			
		 }	
		 
		function setHeight(target){
			element.find(class_name).each(function(i){
						var adjust = $(this).outerHeight()-$(this).height();						
						if($.browser.msie && $.browser.version < 7.0){
								   $(this).css({'height': target - adjust });								   
							}
							else{
  								   $(this).css({'min-height': target - adjust });	
								}
					})
		  }
		
		heightChecker();
}