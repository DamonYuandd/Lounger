// JavaScript Document
/*single_product_second_project.html ��ͼƬ��ЧJS
����:??
ʹ����:Ԭ����



*/

$(document).ready(function (){
var the_item_li = $("#list_in li");
var the_num = the_item_li.length;
$("#list_in").width(the_num*100);
var count = 0;
var iMax = the_num-4;

 $('#the_control_l').click(
   function()
   {
       if(count <= 0){
          $(this).attr({title:""});
        }else{
         count--;
	     $("#list_in").animate({left:count*(-100)},100);
        }
   }
 );
 $('#the_control_r').click(
   function()
   {
     if(count >=iMax){
       $(this).attr({title:""});
     }else{
       count++;
	   $('#list_in').animate({left:count*(-100)},100);
    } 
   }
 );
 $('#list_in li').mouseover(
    function(){
	
	 $(this).find('img').addClass('imgcurt');
	 $(this).siblings().find('img').removeClass('imgcurt');
	 var bigimg = $(this).find('img').attr('name');
	
	 //��ʾ��ͼsrc
	 $('.ImgBar img').attr("src",bigimg);
	 //�滻��ͼԤ��ͼlarge
	 var largeImg = $(this).find('img').attr('big')
	 $('.ImgBar .ShowZoom').attr("href",largeImg);
	}
 );

});
 

<!---��ƷͼƬ�Ŵ�js -->

$(document).ready(function()
{

	var options = {
		    zoomWidth: 400,
		    zoomHeight:270,
	        xOffset: 20,
	        yOffset: 0,
	        position: "right", 
			title: false
	};
		$('.ShowZoom').jqzoom(options);
});









