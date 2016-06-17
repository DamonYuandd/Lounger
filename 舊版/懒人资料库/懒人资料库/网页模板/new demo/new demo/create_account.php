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
                <div class="languages fl_right"><a href="file:///D:/匼第/demo/new demo/create_account.php"><img src="includes/languages/english/images/icon.gif" alt="English" title=" English " width="28" height="20" /></a></div>
                    <div class="currencies fl_right">
                        <label class="fl_left">Currencies: </label><form name="currencies" action="http://livedemo00.template-help.com/osc_33478/create_account.php" method="get"><select name="currency" onChange="this.form.submit();" class="select fl_right"><option value="USD" selected="selected">U.S. Dollar</option><option value="EUR">Euro</option></select></form></div>
                
                    
                
                </div>
                              <div class="cl_both ofh">
                <div class="sub fl_right">
                    <ul class="navigation cl_both">
                        <li class="navigation_item un "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/advanced_search.php'">Advanced Search</a></li>
                                                                                                 
                         <li class="navigation_item "><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/login.php'">Log In</a></li>                                                                                             
                                                  
                        <li class="navigation_item selected"><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/create_account.php'">Create an Account</a></li>
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
           <div class="grid_24"><div class="breadcrumb">&nbsp;&nbsp;<a href="http://livedemo00.template-help.com" class="headerNavigation">Top</a> &raquo; <a href="file:///D:/匼第/demo/new demo/index.php" class="headerNavigation">Catalog</a> &raquo; <a href="file:///D:/匼第/demo/new demo/create_account.php" class="headerNavigation">Create an Account</a></div></div>
    </div>
</div>
                                <div class="banner_block">
        		            
             
     
</div>

<div class="bg_body row_3">
<div class="wrapper-padd">
<div id="bodyWrapper" class="container_24 ofh">


<div id="bodyContent" class="grid_18 push_6">



<script type="text/javascript"><!--
var form = "";
var submitted = false;
var error = false;
var error_message = "";

function check_input(field_name, field_size, message) {
  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    var field_value = form.elements[field_name].value;

    if (field_value.length < field_size) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_radio(field_name, message) {
  var isChecked = false;

  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    var radio = form.elements[field_name];

    for (var i=0; i<radio.length; i++) {
      if (radio[i].checked == true) {
        isChecked = true;
        break;
      }
    }

    if (isChecked == false) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_select(field_name, field_default, message) {
  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    var field_value = form.elements[field_name].value;

    if (field_value == field_default) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_password(field_name_1, field_name_2, field_size, message_1, message_2) {
  if (form.elements[field_name_1] && (form.elements[field_name_1].type != "hidden")) {
    var password = form.elements[field_name_1].value;
    var confirmation = form.elements[field_name_2].value;

    if (password.length < field_size) {
      error_message = error_message + "* " + message_1 + "\n";
      error = true;
    } else if (password != confirmation) {
      error_message = error_message + "* " + message_2 + "\n";
      error = true;
    }
  }
}

function check_form(form_name) {
  if (submitted == true) {
    alert("This form has already been submitted. Please press Ok and wait for this process to be completed.");
    return false;
  }

  error = false;
  form = form_name;
  error_message = "Errors have occured during the process of your form.\n\nPlease make the following corrections:\n\n";

  check_radio("gender", "Please select your Gender.");

  check_input("firstname", 2, "Your First Name must contain a minimum of 2 characters.");
  check_input("lastname", 2, "Your Last Name must contain a minimum of 2 characters.");

  check_input("dob", 10, "Your Date of Birth must be in this format: MM/DD/YYYY (eg 05/21/1970)");

  check_input("email_address", 6, "Your E-Mail Address must contain a minimum of 6 characters.");
  check_input("street_address", 5, "Your Street Address must contain a minimum of 5 characters.");
  check_input("postcode", 4, "Your Post Code must contain a minimum of 4 characters.");
  check_input("city", 3, "Your City must contain a minimum of 3 characters.");

  check_input("state", 2, "Your State must contain a minimum of 2 characters.");

  check_select("country", "", "You must select a country from the Countries pull down menu.");

  check_input("telephone", 3, "Your Telephone Number must contain a minimum of 3 characters.");

  check_password("password", "confirmation", 5, "Your Password must contain a minimum of 5 characters.", "The Password Confirmation must match your Password.");
  check_password("password_new", "password_confirmation", 5, "Your new Password must contain a minimum of 5 characters.", "The Password Confirmation must match your new Password.");

  if (error == true) {
    alert(error_message);
    return false;
  } else {
    submitted = true;
    return true;
  }
}
//--></script>



<div class="title-t">	<div class="title-r">		<div class="title-b">			<div class="title-l">				<div class="title-tl">					<div class="title-tr">						<div class="title-bl">							<div class="title-br"><h1>My Account Information</h1>
</div>						</div>					</div>				</div>			</div>		</div>	</div></div>

<p class="infoString">&nbsp;&nbsp;<font color="#FF0000"><small><strong>NOTE:</strong></small></font> If you already have an account with us, please login at the <a href="file:///D:/匼第/demo/new demo/login.php"><u>login page</u></a>.</p>

<form name="create_account" action="http://livedemo00.template-help.com/osc_33478/create_account.php" method="post" onsubmit="return check_form(create_account);"><input type="hidden" name="formid" value="23f83765fb7dcd303e36509e7e0a2714" /><input type="hidden" name="action" value="process" />
<div class="contentContainer">
  <div class="contentPadd">
  <div>
    
    <h3><span class="inputRequirement" style="float: right;">* Required information</span>Your Personal Details</h3>
  </div>

  <div class="contentInfoText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">


      <tr>
        <td class="fieldKey">Gender:</td>
        <td class="fieldValue radio"><div><input type="radio" name="gender" value="m"  style="background:none;border:0px;" />&nbsp;&nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;</div><div><input type="radio" name="gender" value="f"  style="background:none;border:0px;" />&nbsp;&nbsp;Female</div>&nbsp;<span class="inputRequirement">*</span></td>
      </tr>


      <tr>
        <td class="fieldKey">First Name:</td>
        <td class="fieldValue"><input type="text" name="firstname" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
      <tr> 
        <td class="fieldKey">Last Name:</td>
        <td class="fieldValue"><input type="text" name="lastname" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>


      <tr>
        <td class="fieldKey">Date of Birth:</td>
        <td class="fieldValue"><input type="text" name="dob" id="dob" class="input" />&nbsp;<span class="inputRequirement">* (eg. 05/21/1970)</span><script type="text/javascript">$('#dob').datepicker({dateFormat: 'mm/dd/yy', changeMonth: true, changeYear: true, yearRange: '-100:+0'});</script></td>
      </tr>


      <tr>
        <td class="fieldKey">E-Mail Address:</td>
        <td class="fieldValue"><input type="text" name="email_address" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
    </table>
  </div>


  <h3>Company Details</h3>

  <div class="contentInfoText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey">Company Name:</td>
        <td class="fieldValue"><input type="text" name="company" class="input" />&nbsp;</td>
      </tr>
    </table>
  </div>


  <h3>Your Address</h3>

  <div class="contentInfoText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey">Street Address:</td>
        <td class="fieldValue"><input type="text" name="street_address" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>


      <tr>
        <td class="fieldKey">Suburb:</td>
        <td class="fieldValue"><input type="text" name="suburb" class="input" />&nbsp;</td>
      </tr>


      <tr>
        <td class="fieldKey">Post Code:</td>
        <td class="fieldValue"><input type="text" name="postcode" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
      <tr>
        <td class="fieldKey">City:</td>
        <td class="fieldValue"><input type="text" name="city" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>


      <tr>
        <td class="fieldKey">State/Province:</td>
        <td class="fieldValue">
<input type="text" name="state" class="input" />&nbsp;<span class="inputRequirement">*</span>        </td>
      </tr>


      <tr>
        <td class="fieldKey">Country:</td>
        <td class="fieldValue"><select name="country" class="input"><option value="" selected="selected">Please Select</option><option value="1">Afghanistan</option><option value="2">Albania</option><option value="3">Algeria</option><option value="4">American Samoa</option><option value="5">Andorra</option><option value="6">Angola</option><option value="7">Anguilla</option><option value="8">Antarctica</option><option value="9">Antigua and Barbuda</option><option value="10">Argentina</option><option value="11">Armenia</option><option value="12">Aruba</option><option value="13">Australia</option><option value="14">Austria</option><option value="15">Azerbaijan</option><option value="16">Bahamas</option><option value="17">Bahrain</option><option value="18">Bangladesh</option><option value="19">Barbados</option><option value="20">Belarus</option><option value="21">Belgium</option><option value="22">Belize</option><option value="23">Benin</option><option value="24">Bermuda</option><option value="25">Bhutan</option><option value="26">Bolivia</option><option value="27">Bosnia and Herzegowina</option><option value="28">Botswana</option><option value="29">Bouvet Island</option><option value="30">Brazil</option><option value="31">British Indian Ocean Territory</option><option value="32">Brunei Darussalam</option><option value="33">Bulgaria</option><option value="34">Burkina Faso</option><option value="35">Burundi</option><option value="36">Cambodia</option><option value="37">Cameroon</option><option value="38">Canada</option><option value="39">Cape Verde</option><option value="40">Cayman Islands</option><option value="41">Central African Republic</option><option value="42">Chad</option><option value="43">Chile</option><option value="44">China</option><option value="45">Christmas Island</option><option value="46">Cocos (Keeling) Islands</option><option value="47">Colombia</option><option value="48">Comoros</option><option value="49">Congo</option><option value="50">Cook Islands</option><option value="51">Costa Rica</option><option value="52">Cote D&#039;Ivoire</option><option value="53">Croatia</option><option value="54">Cuba</option><option value="55">Cyprus</option><option value="56">Czech Republic</option><option value="57">Denmark</option><option value="58">Djibouti</option><option value="59">Dominica</option><option value="60">Dominican Republic</option><option value="61">East Timor</option><option value="62">Ecuador</option><option value="63">Egypt</option><option value="64">El Salvador</option><option value="65">Equatorial Guinea</option><option value="66">Eritrea</option><option value="67">Estonia</option><option value="68">Ethiopia</option><option value="69">Falkland Islands (Malvinas)</option><option value="70">Faroe Islands</option><option value="71">Fiji</option><option value="72">Finland</option><option value="73">France</option><option value="74">France, Metropolitan</option><option value="75">French Guiana</option><option value="76">French Polynesia</option><option value="77">French Southern Territories</option><option value="78">Gabon</option><option value="79">Gambia</option><option value="80">Georgia</option><option value="81">Germany</option><option value="82">Ghana</option><option value="83">Gibraltar</option><option value="84">Greece</option><option value="85">Greenland</option><option value="86">Grenada</option><option value="87">Guadeloupe</option><option value="88">Guam</option><option value="89">Guatemala</option><option value="90">Guinea</option><option value="91">Guinea-bissau</option><option value="92">Guyana</option><option value="93">Haiti</option><option value="94">Heard and Mc Donald Islands</option><option value="95">Honduras</option><option value="96">Hong Kong</option><option value="97">Hungary</option><option value="98">Iceland</option><option value="99">India</option><option value="100">Indonesia</option><option value="101">Iran (Islamic Republic of)</option><option value="102">Iraq</option><option value="103">Ireland</option><option value="104">Israel</option><option value="105">Italy</option><option value="106">Jamaica</option><option value="107">Japan</option><option value="108">Jordan</option><option value="109">Kazakhstan</option><option value="110">Kenya</option><option value="111">Kiribati</option><option value="112">Korea, Democratic People&#039;s Republic of</option><option value="113">Korea, Republic of</option><option value="114">Kuwait</option><option value="115">Kyrgyzstan</option><option value="116">Lao People&#039;s Democratic Republic</option><option value="117">Latvia</option><option value="118">Lebanon</option><option value="119">Lesotho</option><option value="120">Liberia</option><option value="121">Libyan Arab Jamahiriya</option><option value="122">Liechtenstein</option><option value="123">Lithuania</option><option value="124">Luxembourg</option><option value="125">Macau</option><option value="126">Macedonia, The Former Yugoslav Republic of</option><option value="127">Madagascar</option><option value="128">Malawi</option><option value="129">Malaysia</option><option value="130">Maldives</option><option value="131">Mali</option><option value="132">Malta</option><option value="133">Marshall Islands</option><option value="134">Martinique</option><option value="135">Mauritania</option><option value="136">Mauritius</option><option value="137">Mayotte</option><option value="138">Mexico</option><option value="139">Micronesia, Federated States of</option><option value="140">Moldova, Republic of</option><option value="141">Monaco</option><option value="142">Mongolia</option><option value="143">Montserrat</option><option value="144">Morocco</option><option value="145">Mozambique</option><option value="146">Myanmar</option><option value="147">Namibia</option><option value="148">Nauru</option><option value="149">Nepal</option><option value="150">Netherlands</option><option value="151">Netherlands Antilles</option><option value="152">New Caledonia</option><option value="153">New Zealand</option><option value="154">Nicaragua</option><option value="155">Niger</option><option value="156">Nigeria</option><option value="157">Niue</option><option value="158">Norfolk Island</option><option value="159">Northern Mariana Islands</option><option value="160">Norway</option><option value="161">Oman</option><option value="162">Pakistan</option><option value="163">Palau</option><option value="164">Panama</option><option value="165">Papua New Guinea</option><option value="166">Paraguay</option><option value="167">Peru</option><option value="168">Philippines</option><option value="169">Pitcairn</option><option value="170">Poland</option><option value="171">Portugal</option><option value="172">Puerto Rico</option><option value="173">Qatar</option><option value="174">Reunion</option><option value="175">Romania</option><option value="176">Russian Federation</option><option value="177">Rwanda</option><option value="178">Saint Kitts and Nevis</option><option value="179">Saint Lucia</option><option value="180">Saint Vincent and the Grenadines</option><option value="181">Samoa</option><option value="182">San Marino</option><option value="183">Sao Tome and Principe</option><option value="184">Saudi Arabia</option><option value="185">Senegal</option><option value="186">Seychelles</option><option value="187">Sierra Leone</option><option value="188">Singapore</option><option value="189">Slovakia (Slovak Republic)</option><option value="190">Slovenia</option><option value="191">Solomon Islands</option><option value="192">Somalia</option><option value="193">South Africa</option><option value="194">South Georgia and the South Sandwich Islands</option><option value="195">Spain</option><option value="196">Sri Lanka</option><option value="197">St. Helena</option><option value="198">St. Pierre and Miquelon</option><option value="199">Sudan</option><option value="200">Suriname</option><option value="201">Svalbard and Jan Mayen Islands</option><option value="202">Swaziland</option><option value="203">Sweden</option><option value="204">Switzerland</option><option value="205">Syrian Arab Republic</option><option value="206">Taiwan</option><option value="207">Tajikistan</option><option value="208">Tanzania, United Republic of</option><option value="209">Thailand</option><option value="210">Togo</option><option value="211">Tokelau</option><option value="212">Tonga</option><option value="213">Trinidad and Tobago</option><option value="214">Tunisia</option><option value="215">Turkey</option><option value="216">Turkmenistan</option><option value="217">Turks and Caicos Islands</option><option value="218">Tuvalu</option><option value="219">Uganda</option><option value="220">Ukraine</option><option value="221">United Arab Emirates</option><option value="222">United Kingdom</option><option value="223">United States</option><option value="224">United States Minor Outlying Islands</option><option value="225">Uruguay</option><option value="226">Uzbekistan</option><option value="227">Vanuatu</option><option value="228">Vatican City State (Holy See)</option><option value="229">Venezuela</option><option value="230">Viet Nam</option><option value="231">Virgin Islands (British)</option><option value="232">Virgin Islands (U.S.)</option><option value="233">Wallis and Futuna Islands</option><option value="234">Western Sahara</option><option value="235">Yemen</option><option value="236">Yugoslavia</option><option value="237">Zaire</option><option value="238">Zambia</option><option value="239">Zimbabwe</option></select>&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
    </table>
  </div>

  <h3>Your Contact Information</h3>

  <div class="contentInfoText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey">Telephone Number:</td>
        <td class="fieldValue"><input type="text" name="telephone" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
      <tr>
        <td class="fieldKey">Fax Number:</td>
        <td class="fieldValue"><input type="text" name="fax" class="input" />&nbsp;</td>
      </tr>
      <tr>
        <td class="fieldKey">Newsletter:</td>
        <td class="fieldValue"><input type="checkbox" name="newsletter" value="1" checked="checked"  style="background:none;border:0px;" />&nbsp;</td>
      </tr>
    </table>
  </div>

  <h3>Your Password</h3>

  <div class="contentInfoText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey">Password:</td>
        <td class="fieldValue"><input type="password" name="password" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
      <tr>
        <td class="fieldKey">Password Confirmation:</td>
        <td class="fieldValue"><input type="password" name="confirmation" class="input" />&nbsp;<span class="inputRequirement">*</span></td>
      </tr>
    </table>
  </div>

  <div class="buttonSet fl_right">
    <span class="buttonAction"><div class="bg_button2" onMouseOut="this.className='bg_button2';" onMouseOver="this.className='bg_button2-act';"><div class="button-b"><div class="button-r"><div class="button-l"><div class="button-t"><div class="button-tl"><div class="button-tr"><div class="button-bl"><div class="button-br"><span class="tdbLink"><button id="tdb1" type="submit">Continue</button></span><script type="text/javascript">$("#tdb1").button({icons:{primary:"ui-icon-person"}}).addClass("ui-priority-primary").parent().removeClass("tdbLink");</script></div></div></div></div></div></div></div></div></div></span>
  </div>

</div>
</div>
</form>




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
            
                        
            <li class="footer_item selected"><a onClick="document.location='http://livedemo00.template-help.com/osc_33478/create_account.php'">Create an Account</a></li>
                                             
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
