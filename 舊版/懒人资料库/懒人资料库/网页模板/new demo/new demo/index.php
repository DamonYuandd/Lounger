<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Flooring</title>
<base href="file:///D:/匼第/demo/new demo/" />
<link rel="stylesheet" type="text/css" href="ext/jquery/ui/redmond/jquery-ui-1.8.6-osc.css" />
<script type="text/javascript" src="ext/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="ext/jquery/ui/jquery-ui-1.8.6.min.js"></script>

<script type="text/javascript" src="ext/jquery/bxGallery/jquery.bxGallery.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ext/jquery/fancybox/jquery.fancybox-1.3.4.css" />
<script type="text/javascript" src="ext/jquery/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="ext/jquery/jquery.equalheights.js"></script>
<script type="text/javascript" src="ext/jquery/jquery.corner.js"></script>
<script type="text/javascript" src="ext/js/jcarousellite.js"></script>
<script type="text/javascript" src="ext/js/coin-slider.js"></script>
<link rel="stylesheet" type="text/css" href="ext/960gs/960_24_col.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="css/constants.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/style_boxes.css">
<link rel="stylesheet" type="text/css" href="css/coin-slider-styles.css">
<link rel="stylesheet" type="text/css" href="css/css3.css">
<script type="text/javascript" src="ext/js/js.js"></script>

<!--[if lt IE 7]>
<div style='border: 1px solid #F7941D; background: #FEEFDA; text-align: center; clear: both; height: 75px; position: relative; z-index:5000' id="forie6"> 
	<div style='position: absolute; right: 3px; top: 3px; font-family: courier new; font-weight: bold;'>
		<a href="#" onclick="document.getElementById('forie6').style['display'] = 'none'"><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-cornerx.jpg" alt="Close this notice" title=" Close this notice "  style=\'border: none;\' /></a>
	</div> 
	<div style='width: 740px; margin: 0 auto; text-align: left; padding: 0; overflow: hidden; color: black;'> 
		<div style='width: 75px; float: left;'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-warning.jpg" alt="Warning" title=" Warning " /></div> 
		<div style='width: 275px; float: left; font-family: Arial, sans-serif; color:#000'> 
			<div style='font-size: 14px; font-weight: bold; margin-top: 12px; color:#000'>You are using an outdated browser</div> 
			<div style='font-size: 12px; margin-top: 6px; line-height: 12px; color:#000'>For a better experience using this site, please upgrade to a modern web browser.</div> 
		</div>
		<div style='width: 75px; float: left;'>
			<a href='http://www.firefox.com' target='_blank'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-firefox.jpg" alt="Get Firefox 3.5" title=" Get Firefox 3.5 "  style=\'border: none;\' /></a>
		</div>
		<div style='width: 75px; float: left;'>
			<a href='http://www.browserforthebetter.com/download.html' target='_blank'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-ie8.jpg" alt="Get Internet Explorer 8" title=" Get Internet Explorer 8 "  style=\'border: none;\' /></a>
		</div> 
		<div style='width: 73px; float: left;'>
			<a href='http://www.apple.com/safari/download/' target='_blank'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-safari.jpg" alt="Get Safari 4" title=" Get Safari 4 "  style=\'border: none;\' /></a>
		</div> 
		<div style='float: left; width: 73px;'>
			<a href='http://www.google.com/chrome' target='_blank'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-chrome.jpg" alt="Get Google Chrome" title=" Get Google Chrome "  style=\'border: none;\' /></a>
		</div>
		<div style='float: left;'>
			<a href='http://www.opera.com/' target='_blank'><img src="file:///D:/匼第/demo/new demo/ext/js/ie6/ie6nomore-opera.jpg" alt="Opera" title=" Opera "  style=\'border: none;\' /></a>
		</div> 
	</div>
</div>
<![endif]-->


<script>
$(function() {
 //carousel begin
 $(".carouse2").jCarouselLite({
 btnNext: ".next",
 btnPrev: ".prev",
 			speed: 500,
			crossfade: false,
			autopagination:false,
 			autoplay: 5000
 });

 //rollover hover
 $(".carousel li").hover(function() { //On hover...

 var thumbOver = $(this).find("img").attr("src"); //Get image url and assign it to 'thumbOver'

 $(this).find("span").css({'background' : 'url(' + thumbOver + ') no-repeat center bottom'});

 //Animate the image to 0 opacity (fade it out)
 $(this).find("b").stop().fadeTo('normal', 1 , function() {
 // $(this).hide() //Hide the image after fade
 });
 } , function() { //on hover out...
 //Fade the image to full opacity
 $(this).find("b").stop().fadeTo('normal', 1).show();
 });
 }); 
</script>
</head>
<body>
<div class="bg_center">
<div class="bg_body row_1">
        <div id="bodyWrapper" class="container_24 ofh">
        		
<div id="header" class="grid_24">
	<div class="cl_both">
            <a class="logo fl_left" href="file:///D:/匼第/demo/new demo/index.php"><img src="images/logo.png" alt="Flooring" title=" Flooring " width="310" height="127" /></a>
            <div class="fl_right navigation_block" align="right">
                
                <div class="cl_both ofh">
                <div class="search fl_right ">
    	
    <form name="search" action="http://livedemo00.template-help.com/osc_33478/advanced_search_result.php" method="get">		<div class="input-width fl_left">
			<div class="width-setter">        
        <input type=text name="keywords" class="go"  value="Enter search keywords here" onblur="if(this.value=='') this.value='Enter search keywords here'" onfocus="if(this.value =='Enter search keywords here' ) this.value=''">
			</div>
        </div>
		<input type="image" src="includes/languages/english/images/buttons/button_search_prod.png" alt=""  class="button_search_prod fl_left" /></form>                                        
    </div>
                <div class="languages fl_right"><a href="file:///D:/匼第/demo/new demo/index.php"><img src="includes/languages/english/images/icon.gif" alt="English" title=" English " width="28" height="20" /></a></div>
                    <div class="currencies fl_right">
                        <label class="fl_left">Currencies: </label><form name="currencies" action="http://livedemo00.template-help.com/osc_33478/index.php" method="get"><select name="currency" onChange="this.form.submit();" class="select fl_right"><option value="USD" selected="selected">U.S. Dollar</option><option value="EUR">Euro</option></select></form></div>
                
                    
                
                </div>
                              <div class="cl_both ofh">
                <div class="sub fl_right">
                    <ul class="navigation cl_both">
                        <li class="navigation_item un "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/advanced_search.php'">Advanced Search</a></li>
                                                                                                 
                         <li class="navigation_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/login.php'">Log In</a></li>                                                                                             
                                                  
                        <li class="navigation_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/create_account.php'">Create an Account</a></li>
                        <li class="navigation_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/shipping.php'">Shipping &amp; Returns</a></li>  
                    </ul>
                </div> </div>
                <div class="cl_both ofh">
    				<div class="cart_bg fl_right">
            			<div>
 Now in your cart &nbsp;<a href="file:///D:/匼第/demo/new demo/shopping_cart.php"><strong>0</strong> items</a>
                        </div>
   					</div>                                
                </div>
                
            </div>
	</div>


</div>

		

        </div>
</div>
<div class="bg_body row_2">
        <div id="bodyWrapper" class="container_24 ofh">
        		
<div class="tail_menu grid_24">
<!-- menu cart END-->
  	<ul class="menu fl_left">		

            <li class="menu_item un selected" onClick="document.location='http://livedemo00.template-help.com/osc_33478/index.php'"><div class="wrapper_menu-t"><a> Homepage</a></div></li>
            <li class="menu_item " onClick="document.location='http://livedemo00.template-help.com/osc_33478/products_new.php'"><div class="wrapper_menu-t"><a>What's New?</a></div></li>     
            <li class="menu_item " onClick="document.location='http://livedemo00.template-help.com/osc_33478/specials.php'"><div class="wrapper_menu-t"><a>Specials</a></div></li>
            <li class="menu_item " onClick="document.location='http://livedemo00.template-help.com/osc_33478/reviews.php'"><div class="wrapper_menu-t"><a>Reviews</a></div></li>
            <li class="menu_item " onClick="document.location='http://livedemo00.template-help.com/osc_33478/contact_us.php'"><div class="wrapper_menu-t"><a>Contact Us</a></div></li>
  	</ul>
<!-- menu cart END--> 
    
   
</div>

        </div>
</div>

				
	
<div class="bg_body row_3">
		<div id="bodyWrapper" class="container_24 ofh"><!-- header slider -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#coin-slider').coinslider({ 
		width: 930, 
		navigation: false, 
		delay: 5000, // delay between images in ms
		height: 494, // height of slider panel
		spw: 7, // squares per width
		sph: 5, // squares per height
		sDelay: 30, // delay beetwen squares in ms
		opacity: 0.7, // opacity of title and navigation
		titleSpeed: 500, // speed of title appereance in ms
		effect: '', // random, swirl, rain, straight
		navigation: true, // prev next and buttons
		links : true, // show images as links 
		hoverPause: true // pause on hover		
		});		
	});
</script><!-- header slider -->
<div class="js">
<div id="coin-slider">
	<a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/slide_banner_02.jpg" alt="Banner2" title=" Banner2 " width="930" height="494" /></a>	<a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/slide_banner_03.jpg" alt="Banner3" title=" Banner3 " width="930" height="494" /></a>    <a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/slide_banner_04.jpg" alt="Banner4" title=" Banner4 " width="930" height="494" /></a></div>
</div></div>
</div>
                                <div class="banner_block">
        			
			<div class="cl_both ofh boxes_banner_header">
<a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/banner_1.jpg" alt="Banner5" title=" Banner5 " width="317" height="136" /></a><a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/banner_2.jpg" alt="Banner6" title=" Banner6 " width="317" height="136" /></a><a href="file:///D:/匼第/demo/new demo/redirect.php" target="_self"><img src="images/banners/banner_3.jpg" alt="Banner7" title=" Banner7 " width="316" height="136" /></a>			
            </div>
             
     
</div>

<div class="bg_body row_3">
<div class="wrapper-padd">
<div id="bodyWrapper" class="container_24 ofh">


<div id="bodyContent" class="grid_18 push_6">





<div class="none">
<div class="title-t">	<div class="title-r">		<div class="title-b">			<div class="title-l">				<div class="title-tl">					<div class="title-tr">						<div class="title-bl">							<div class="title-br"><h1>Welcome to Flooring</h1>
</div>						</div>					</div>				</div>			</div>		</div>	</div></div><br />
</div >

<div class="contentContainer page_un">
  <div class="contentText none">
    Welcome <span class="greetUser">Guest!</span> Would you like to <a href="file:///D:/匼第/demo/new demo/login.php"><u>log yourself in</u></a>? Or would you prefer to <a href="file:///D:/匼第/demo/new demo/create_account.php"><u>create an account</u></a>?  </div>

             					
   
<div class="special_block">

<div class="inner">
<h5>Popular Products</h5>
        <button class="prev"></button>
        <button class="next"></button>
<div class="carouse2">
<div style=" display:none"><div class="slogan">/per square meter</div></div>
 
<div class="blocks"><ul class="list_scroll"><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/img_1.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipisicing" title=" Lorem ipsum dolor sit amet, consectetur adipisicing " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Lorem ipsum dolor sit amet, consectetur adipisicing</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$29.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/img_2.jpg" alt="Dolor sit amet, consectetur adipisicing" title=" Dolor sit amet, consectetur adipisicing " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Dolor sit amet, consectetur adipisicing</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$49.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/img_3.jpg" alt="Set ipsum dolor sit amet, consectetur lorem" title=" Set ipsum dolor sit amet, consectetur lorem " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Set ipsum dolor sit amet, consectetur lorem</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$39.99</span> <div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/beige_ocher_limestone_flooring_1.png" alt="Beige Ocher Limestone Flooring" title=" Beige Ocher Limestone Flooring " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Beige Ocher Limestone Flooring</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$42.00</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/berber_carpet_1.png" alt="Berber Carpet" title=" Berber Carpet " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Berber Carpet</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$30.00</span> <div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/calabria_in_biscotti_12x_12_field_tile_1.png" alt="Calabria in Biscotti 12x 12 field tile" title=" Calabria in Biscotti 12x 12 field tile " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Calabria in Biscotti 12x 12 field tile</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$30.00</span> <div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/domo_mila_autumn_leaf_inspiration_vinyl_1.png" alt="Domo Mila Autumn Leaf Inspiration Vinyl" title=" Domo Mila Autumn Leaf Inspiration Vinyl " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Domo Mila Autumn Leaf Inspiration Vinyl</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$34.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/donegal_in_sabbia_16x_16_field_tile_1.png" alt="Donegal in Sabbia 16x 16 field tile" title=" Donegal in Sabbia 16x 16 field tile " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Donegal in Sabbia 16x 16 field tile</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$35.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/edgefield_in_beige_16x_16_field_tile_1.png" alt="Edgefield in Beige 16x 16 field tile" title=" Edgefield in Beige 16x 16 field tile " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Edgefield in Beige 16x 16 field tile</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$29.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/elka_heartwood_maple_v_groove_8_mm_laminate_1.png" alt="Elka Heartwood Maple V-groove 8 mm Laminate" title=" Elka Heartwood Maple V-groove 8 mm Laminate " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Elka Heartwood Maple V-groove 8 mm Laminate</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$29.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/gerflor_cassiopee_grass_super_solar_vinyl_1.png" alt="Gerflor Cassiopee Grass Super Solar Vinyl" title=" Gerflor Cassiopee Grass Super Solar Vinyl " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Gerflor Cassiopee Grass Super Solar Vinyl</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$29.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/gerflor_damier_black_white_super_solar_vinyl_1.png" alt="Gerflor Damier Black & White Super Solar Vinyl" title=" Gerflor Damier Black & White Super Solar Vinyl " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Gerflor Damier Black & White Super Solar Vinyl</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$5.99</span> <div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/gerflor_jurassic_nuage_super_solar_vinyl_1.png" alt="Gerflor Jurassic Nuage Super Solar Vinyl" title=" Gerflor Jurassic Nuage Super Solar Vinyl " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Gerflor Jurassic Nuage Super Solar Vinyl</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$34.99</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/indib_branches_orange_rug_1.png" alt="IndiB - Branches Orange Rug" title=" IndiB - Branches Orange Rug " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">IndiB - Branches Orange Rug</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$32.00</span><div class="slogan">/per square meter</div></div>

			
			</li><li class="scroll-interval">
			<div class="part">
			<div class="txt_area"><a class="pic" href="file:///D:/匼第/demo/new demo/product_info.php"><img src="images/products/kaleidoscope_style_from_the_tufted_wool_carpet_collection_1.png" alt="Kaleidoscope style from the Tufted Wool carpet collection" title=" Kaleidoscope style from the Tufted Wool carpet collection " width="187" height="149" /></a></div></div>
					<div class="name"><a class="link" href="file:///D:/匼第/demo/new demo/product_info.php">Kaleidoscope style from the Tufted Wool carpet collection</a></div>
			<div class="price_scroll"><span class="productSpecialPrice">$35.00</span><div class="slogan">/per square meter</div></div>

			
			</li></ul></div>
    </div>
</div>
</div>                   
<div class="title-t">	<div class="title-r">		<div class="title-b">			<div class="title-l">				<div class="title-tl">					<div class="title-tr">						<div class="title-bl">							<div class="title-br"><h1 class="cl_both ">New Products For May</h1>
</div>						</div>					</div>				</div>			</div>		</div>	</div></div>  <div class="contentPadd extra-2">
    <div class="prods_content prods_table"><ul class="row" id="row-0"><li style="width:230px;" class="wrapper_prods"><div class="box_2">
   <div class="border-top2">
    <div class="border-right2">
     <div class="border-bot2">
      <div class="border-left2">
       <div class="left-top-corner2">
        <div class="right-top-corner2">
         <div class="right-bot-corner2">
          <div class="left-bot-corner2">
           <div class="inner3">
		<div class="pic_padd wrapper_pic_div" style="width:187px;height:149px;"><a class="prods_pic_bg" href="file:///D:/匼第/demo/new demo/product_info.php" style="width:187px;height:149px;"><img src="images/products/043.jpg" alt="Dolor sit amet, consectetur adipisicing" title=" Dolor sit amet, consectetur adipisicing " width="187" height="149"  style="width:187px;height:149px;" /></a></div>
		<div class="box-padd">
			<div class="name name_padd  equal-height"><span><a href="file:///D:/匼第/demo/new demo/product_info.php">Dolor sit amet, consectetur adipisicing</a></span></div>
			<h2 class="price price_padd un"><b>Our Price:&nbsp;&nbsp;&nbsp;</b><span class="productSpecialPrice">$23.99</span></h2>
			<div class="button__padd"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/products_new.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-cart"></span><span class="ui-button-text">Add&nbsp;to&nbsp;cart</span></a></div></div></div></div></div></div></div></div></div><div class="bg_button22" onMouseOut="this.className='bg_button22';" onMouseOver="this.className='bg_button22-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/product_info.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-e"></span><span class="ui-button-text">Details</span></a></div></div></div></div></div></div></div></div></div></div>
		</div>
</div>
   </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li><li class="prods_vseparator"><img src="images/spacer.gif" alt="" width="1" height="1" /><li style="width:230px;" class="wrapper_prods"><div class="box_2">
   <div class="border-top2">
    <div class="border-right2">
     <div class="border-bot2">
      <div class="border-left2">
       <div class="left-top-corner2">
        <div class="right-top-corner2">
         <div class="right-bot-corner2">
          <div class="left-bot-corner2">
           <div class="inner3">
		<div class="pic_padd wrapper_pic_div" style="width:187px;height:149px;"><a class="prods_pic_bg" href="file:///D:/匼第/demo/new demo/product_info.php" style="width:187px;height:149px;"><img src="images/products/042.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipisicing" title=" Lorem ipsum dolor sit amet, consectetur adipisicing " width="187" height="149"  style="width:187px;height:149px;" /></a></div>
		<div class="box-padd">
			<div class="name name_padd  equal-height"><span><a href="file:///D:/匼第/demo/new demo/product_info.php">Lorem ipsum dolor sit amet, consectetur adipisicing</a></span></div>
			<h2 class="price price_padd un"><b>Our Price:&nbsp;&nbsp;&nbsp;</b><span class="productSpecialPrice">$49.99</span></h2>
			<div class="button__padd"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/products_new.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-cart"></span><span class="ui-button-text">Add&nbsp;to&nbsp;cart</span></a></div></div></div></div></div></div></div></div></div><div class="bg_button22" onMouseOut="this.className='bg_button22';" onMouseOver="this.className='bg_button22-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/product_info.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-e"></span><span class="ui-button-text">Details</span></a></div></div></div></div></div></div></div></div></div></div>
		</div>
</div>
   </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li><li class="prods_vseparator"><img src="images/spacer.gif" alt="" width="1" height="1" /><li style="width:230px;" class="wrapper_prods"><div class="box_2">
   <div class="border-top2">
    <div class="border-right2">
     <div class="border-bot2">
      <div class="border-left2">
       <div class="left-top-corner2">
        <div class="right-top-corner2">
         <div class="right-bot-corner2">
          <div class="left-bot-corner2">
           <div class="inner3">
		<div class="pic_padd wrapper_pic_div" style="width:187px;height:149px;"><a class="prods_pic_bg" href="file:///D:/匼第/demo/new demo/product_info.php" style="width:187px;height:149px;"><img src="images/products/041.jpg" alt="Ipsum dolor sit amet, consectetur adipisicing" title=" Ipsum dolor sit amet, consectetur adipisicing " width="187" height="149"  style="width:187px;height:149px;" /></a></div>
		<div class="box-padd">
			<div class="name name_padd  equal-height"><span><a href="file:///D:/匼第/demo/new demo/product_info.php">Ipsum dolor sit amet, consectetur adipisicing</a></span></div>
			<h2 class="price price_padd un"><b>Our Price:&nbsp;&nbsp;&nbsp;</b><span class="productSpecialPrice">$29.99</span></h2>
			<div class="button__padd"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/products_new.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-cart"></span><span class="ui-button-text">Add&nbsp;to&nbsp;cart</span></a></div></div></div></div></div></div></div></div></div><div class="bg_button22" onMouseOut="this.className='bg_button22';" onMouseOver="this.className='bg_button22-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/product_info.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-e"></span><span class="ui-button-text">Details</span></a></div></div></div></div></div></div></div></div></div></div>
		</div>
</div>
   </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</ul></div>  </div>
<script type="text/javascript">
        $(document).ready(function(){ 			
			 var row_list = $('.row');
			 row_list.each(function(){
				 new equalHeights($('#' + $(this).attr("id")));
			  });			 			 			  			  			  			  			   
        })      
</script>
</div>


</div> <!-- bodyContent //-->

<div id="columnLeft" class="grid_6 pull_18">
  <div><div class="infoBoxWrapper list">  <div class="infoBoxHeading">Categories
</div>  <div class="infoBoxContents"><div class="box-t">	<div class="box-r">		<div class="box-b">			<div class="box-l">				<div class="box-tl">					<div class="box-tr">						<div class="box-bl">							<div class="box-br"><ul class="categories"><li ><a href="file:///D:/匼第/demo/new demo/index.php">Carpet</a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Hardwood<span class="category_arrow"></span></a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Tile</a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Stone</a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Laminate</a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Vinyl</a>
</li><li ><a href="file:///D:/匼第/demo/new demo/index.php">Area Rugs</a>
</li></ul></div>						</div>					</div>				</div>			</div>		</div>	</div></div></div>
</div>
<div class="infoBoxWrapper box2">  <div class="infoBoxHeading"><a href="file:///D:/匼第/demo/new demo/specials.php">Specials</a>
</div>  <div class="infoBoxContents"><div class="box-t">	<div class="box-r">		<div class="box-b">			<div class="box-l">				<div class="box-tl">					<div class="box-tr">						<div class="box-bl">							<div class="box-br">		<div class="pic_padd wrapper_pic_div" align="center" style="width:187px;height:149px;"><a class="prods_pic_bg" href="file:///D:/匼第/demo/new demo/product_info.php" style="width:187px;height:149px;"><img src="images/products/img_3.jpg" alt="Set ipsum dolor sit amet, consectetur lorem" title=" Set ipsum dolor sit amet, consectetur lorem " width="187" height="149"  style="width:187px;height:149px;" /></a></div>
		<div class="box-padd">
			<div class="name name_padd"><span><a href="file:///D:/匼第/demo/new demo/product_info.php">Set ipsum dolor sit amet, consectetur lorem</a></span></div>
			<div class="price_padd"><b>Our Price:&nbsp;&nbsp;&nbsp;</b><span class="productSpecialPrice fl_left">$39.99</span>&nbsp;&nbsp;<del class="fl_left">$49.99</del></div>
			<div class="button__padd"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/products_new.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-cart"></span><span class="ui-button-text">Add&nbsp;to&nbsp;cart</span></a></div></div></div></div></div></div></div></div></div> <div class="bg_button22" onMouseOut="this.className='bg_button22';" onMouseOver="this.className='bg_button22-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><a href="file:///D:/匼第/demo/new demo/product_info.php" id="tdb1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-priority-secondary" role="button"><span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-e"></span><span class="ui-button-text">Details</span></a></div></div></div></div></div></div></div></div></div></div>
		</div>
</div>						</div>					</div>				</div>			</div>		</div>	</div></div></div>

</div></div>
</div>

</div>
</div>
</div>
</div>
<div class="bg_body row_4">
<div class="wrapper-padd">
<div id="bodyWrapper" class="container_24 ofh">

<div class="grid_24 footer_menu  footer">

  	<ul>		
            <li class="footer_item un "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/specials.php'">Specials</a></li>
            <li class="footer_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/advanced_search.php'">Advanced Search</a></li>
            <li class="footer_item " ><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/reviews.php'">Reviews</a></li>
            
                        
            <li class="footer_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/create_account.php'">Create an Account</a></li>
                                             
            <li class="footer_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/login.php'">Log In</a></li>
            <li class="footer_item " ><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/shipping.php'">Shipping &amp; Returns</a></li>
            <li class="footer_item " ><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/contact_us.php'">Contact Us</a></li>
  	</ul>
    <p>Copyright &copy; 2011 <a href="file:///D:/匼第/demo/new demo/index.php">Flooring</a><b>&nbsp; <a href="file:///D:/匼第/demo/new demo/privacy.php">Privacy Notice</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="file:///D:/匼第/demo/new demo/conditions.php">Conditions of Use</a></b><!-- {%FOOTER_LINK} --> </p>
</div>


<script type="text/javascript">
$('.productListTable tr:nth-child(even)').addClass('alt');
</script>

</div> <!-- bodyWrapper //-->
</div>	
</div>
</body>
<!--[if IE]>
  <link href="css/ie_style.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if gt IE 7]>
  <link href="css/ie8_style.css" rel="stylesheet" type="text/css" />
<![endif]-->
  <script type="text/javascript" src="ext/js/imagepreloader.js"></script>
  <script type="text/javascript">
		preloadImages([
			'images/wrapper_pic.png',
			'images/wrapper_pic-act.png',			
			'images/bg_button2.png',
			'images/bg_button2-act.png',
			'images/banners/slide_banner_02.jpg',
			'images/banners/slide_banner_03.jpg',
			'images/banners/slide_banner_04.jpg']);
	</script>
    
</html>
<script type="text/javascript">
 var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-7078796-5']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();</script>