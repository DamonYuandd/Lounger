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
                <div class="languages fl_right"><a href="file:///D:/匼第/demo/new demo/login.php"><img src="includes/languages/english/images/icon.gif" alt="English" title=" English " width="28" height="20" /></a></div>
                    <div class="currencies fl_right">
                        <label class="fl_left">Currencies: </label><form name="currencies" action="http://livedemo00.template-help.com/osc_33478/login.php" method="get"><select name="currency" onChange="this.form.submit();" class="select fl_right"><option value="USD" selected="selected">U.S. Dollar</option><option value="EUR">Euro</option></select></form></div>
                
                    
                
                </div>
                              <div class="cl_both ofh">
                <div class="sub fl_right">
                    <ul class="navigation cl_both">
                        <li class="navigation_item un "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/advanced_search.php'">Advanced Search</a></li>
                                                                                                 
                         <li class="navigation_item selected"><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/login.php'">Log In</a></li>                                                                                             
                                                  
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

            <li class="menu_item un " onClick="document.location='http://livedemo00.template-help.com/osc_33478/index.php'"><div class="wrapper_menu-t"><a> Homepage</a></div></li>
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
    <div id="bodyWrapper" class="container_24 ofh">
           <div class="grid_24"><div class="breadcrumb">&nbsp;&nbsp;<a href="http://livedemo00.template-help.com" class="headerNavigation">Top</a> &raquo; <a href="file:///D:/匼第/demo/new demo/index.php" class="headerNavigation">Catalog</a> &raquo; <a href="file:///D:/匼第/demo/new demo/login.php" class="headerNavigation">Login</a></div></div>
    </div>
</div>
                                <div class="banner_block">
        		            
             
     
</div>

<div class="bg_body row_3">
<div class="wrapper-padd">
<div id="bodyWrapper" class="container_24 ofh">


<div id="bodyContent" class="grid_18 push_6">






<div class="title-t">	<div class="title-r">		<div class="title-b">			<div class="title-l">				<div class="title-tl">					<div class="title-tr">						<div class="title-bl">							<div class="title-br"><h1>Welcome, Please Sign In</h1>
</div>						</div>					</div>				</div>			</div>		</div>	</div></div>
<div class="contentContainer ">
  <div class="contentPadd loginPage">

<div style="width: 49.5%; float: left;">
<h3>New Customer</h3>
<div class="contentInfoText" style="position:relative; height:160px;">
 	 


    <p class="small_title">I am a new customer.</p>
    <p>By creating an account at Flooring you will be able to shop faster, be up to date on an orders status, and keep track of the orders you have previously made.</p>
    
  <div class="buttonSet btn_position">
    <span class="buttonAction"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><span class="tdbLink"><a id="tdb1" href="file:///D:/匼第/demo/new demo/create_account.php">Continue</a></span><script type="text/javascript">$("#tdb1").button({icons:{primary:"ui-icon-triangle-1-e"}}).addClass("ui-priority-secondary").parent().removeClass("tdbLink");</script></div></div></div></div></div></div></div></div></div></span>
  </div>

</div>
</div>
<div style="width: 49.5%; float: right; border-left: 0px solid #e5e5e5;">
<h3>Returning Customer</h3>
<div class="contentInfoText" style="position:relative; height:160px;">
  


    <p class="small_title">I am a returning customer.</p>

    <form name="login" action="http://livedemo00.template-help.com/osc_33478/login.php?action=process" method="post"><input type="hidden" name="formid" value="23f83765fb7dcd303e36509e7e0a2714" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td class="fieldKey"><div class="crosspiece100"></div>E-Mail Address:</td>
        <td class="fieldValue" width="100%"><input type="text" name="email_address" class="input" /></td>
      </tr>
      <tr>
        <td class="fieldKey">Password:</td>
        <td class="fieldValue"><input type="password" name="password" class="input" /></td>
      </tr>
    </table>

  <div class="buttonSet btn_position">
    <span class="buttonAction"><div class="bg_button22" onMouseOut="this.className='bg_button22';" onMouseOver="this.className='bg_button22-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><span class="tdbLink"><button id="tdb2" type="submit">Sign In</button></span><script type="text/javascript">$("#tdb2").button({icons:{primary:"ui-icon-key"}}).addClass("ui-priority-primary").parent().removeClass("tdbLink");</script></div></div></div></div></div></div></div></div></div></span>
  </div>

    <p class="forgotten"><a href="file:///D:/匼第/demo/new demo/password_forgotten.php">Password forgotten? Click here.</a></p>

    </form>

</div>
</div>
</div>
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
</div>  <div class="infoBoxContents"><div class="box-t">	<div class="box-r">		<div class="box-b">			<div class="box-l">				<div class="box-tl">					<div class="box-tr">						<div class="box-bl">							<div class="box-br">		<div class="pic_padd wrapper_pic_div" align="center" style="width:187px;height:149px;"><a class="prods_pic_bg" href="file:///D:/匼第/demo/new demo/product_info.php" style="width:187px;height:149px;"><img src="images/products/calabria_in_biscotti_12x_12_field_tile_1.png" alt="Calabria in Biscotti 12x 12 field tile" title=" Calabria in Biscotti 12x 12 field tile " width="187" height="149"  style="width:187px;height:149px;" /></a></div>
		<div class="box-padd">
			<div class="name name_padd"><span><a href="file:///D:/匼第/demo/new demo/product_info.php">Calabria in Biscotti 12x 12 field tile</a></span></div>
			<div class="price_padd"><b>Our Price:&nbsp;&nbsp;&nbsp;</b><span class="productSpecialPrice fl_left">$30.00</span>&nbsp;&nbsp;<del class="fl_left">$39.99</del></div>
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
                                             
            <li class="footer_item selected"><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/login.php'">Log In</a></li>
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
