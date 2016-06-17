
<!---鼠标移动到箭头图片切换js---->
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->


<!--图片左右滚动js---->

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
	
	 //显示大图src
	 $('.ImgBar img').attr("src",bigimg);
	 //替换大图预览图large
	 var largeImg = $(this).find('img').attr('big')
	 $('.ImgBar .ShowZoom').attr("href",largeImg);
	}
 );

});


<!---商品图片放大js -->

$(document).ready(function()//设置jqzoom.pack的参数

{

	var options = {
		    zoomWidth: 320,
		    zoomHeight:230,
	        xOffset: 20,
	        yOffset: 0,
	        position: "right", 
			title: false
	};
		$('.ShowZoom').jqzoom(options);
});
