<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ҳ</title>
<link   href="css/layout.css"rel="stylesheet" type="text/css" />
<script type=text/javascript><!--//--><![CDATA[//><!--
function menuFix() {
var sfEls = document.getElementById("nav_main").getElementsByTagName("li");
for (var i=0; i<sfEls.length; i++) {
sfEls[i].onmouseover=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseDown=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseUp=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onmouseout=function() {
this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
"");
}
}
}
window.onload=menuFix;
//--><!]]></script>

</head>

<body>
<div id="container">
  <div id="header">
    
    <div id="logo"><img src="" alt="LOGO" width="181" height="50" /></div>
    <div id="search">
      <form id="form1" name="form1" method="post" action="">
        ������Ʒ
        <input class="inp_srh" type="text" name="textfield" id="textfield" />
        <input class="btn_srh" type="submit" name="button" id="button" value="��ѯ" />
      </form>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div id="nav_main">
      <ul>
        <li><a href="#">��ҳ��Ϣ</a>
          <ul>
            <li> <a href="#">��Ϣ����</a></li>
          </ul>
        </li>
        <li><a href="#">�ֻ�����</a>
          <ul>
            <li><a href="#">���¶�̬</a></li>
            <li><a href="#">ǿ���Ƽ�</a></li>
          </ul>
        </li>
        <li><a href="#">������Ϣ1</a>
        <ul> <li><a href="#">����1</a></li>
        <li><a href="#">����2</a></li>
        <li><a href="#">����3</a></li></ul>
        </li>
        <li><a href="#">������Ϣ2</a></li>
        <li><a href="#">������Ϣ3</a></li>
        <li><a href="#">������Ϣ4</a></li>
        <li><a href="#">������Ϣ5</a></li>
      </ul>
    </div>
  <div class="clearfloat"></div>
  <div id="maincontent">
    <div id="main">
      <div id="index_top">
        <div id="pic">
		  <script language='javascript' type="text/javascript">
            linkarr = new Array();
            picarr = new Array();
            textarr = new Array();
            var swf_width=269;
            var swf_height=249;
            var files = "images/01.jpg|images/02.jpg|images/03.jpg|images/04.jpg|images/05.jpg";
            var links = "#|#|#|#|#";
            var texts = "";
            for(i=1;i<picarr.length;i++){
              if(files=="") files = picarr[i];
              else files += "|"+picarr[i];
            }
            for(i=1;i<linkarr.length;i++){
              if(links=="") links = linkarr[i];
              else links += "|"+linkarr[i];
            }
            for(i=1;i<textarr.length;i++){
              if(texts=="") texts = textarr[i];
              else texts += "|"+textarr[i];
            }
            document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
            document.write('<param name="movie" value="images/indexpic.swf"><param name="quality" value="high">');
            document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
            document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
            document.write('<embed src="images/indexpic.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>');
          </script>
 
        </div>
        <div id="hot_news">
          <div id="news_top">
            <h1>�ֻ�������Ŀ</h1>
            <p>�˴�Ϊ�ֻ���������</p>
          </div>  
		  <div id="news_list"> 
		  
		  <?
          include ("conn.php");
             $sql="select * from news order by id desc limit 0,6";
             $query=mysql_query($sql);
             while($row=mysql_fetch_array($query)){
             ?>
             <ul><li><span><?=date('m-d',strtotime($row['add_time']))?></span><a href="#">
               <? $row['title']?>
             </a>
             </li></ul>
             <? }?> 
         
		  <!--
            <<ul>
              <li><span>����1</span><a href="#">����1</a></li>
              <li><span>����2</span><a href="#">����2</a></li>
              <li><span>����3</span><a href="#">����3</a></li>
              <li><span>����4</span><a href="#">����4</a></li>
              <li><span>����5</span><a href="#">����5</a></li>
              <li><span>����6</span><a href="#">����6</a></li>   
		    </ul>-->
        </div>   
        </div>
      </div>
      <div id="index_pic">
        <h2><span></span></h2>
        <ul>
        	<li><a href="#"><img  src="images/01.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����1</a></li>
          <li><a href="#"><img  src="images/02.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����2</a></li>
          <li><a href="#"><img  src="images/03.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����3</a></li>
          <li><a href="#"><img  src="images/04.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����4</a></li>
          <li><a href="#"><img  src="images/05.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����5</a></li>
          <li><a href="#"><img   src="images/06.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����6</a></li>
          <li><a href="#"><img  src="images/07.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����7</a></li>
          <li><a href="#"><img  src="images/08.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����8</a></li>
          <li><a href="#"><img  src="images/09.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����9</a></li>
          <li><a href="#"><img  src="images/10.jpg" alt="��Ʒ����" width="107" height="87" />��Ʒ����10</a></li>
        </ul>
      </div>
      <div id="index_box">
        <div class="box">
          <h2><a class="more" href="#">����..</a><span>ŵ����ר��</span></h2>
          <div class="box_con">
            <dl>
              <dt><a href="#"><img src="images/02.jpg" alt="����" width="91" height="70" /></a></dt>
              <dd><a href="#"><strong>�˴�Ϊ������</strong></a>
               ����&hellip;</dd>
            </dl>
            <ul>
            	<li><a href="#">����1</a></li>
              <li><a href="#">����2</a></li>
              <li><a href="#">����3</a></li>
              <li><a href="#">����4</a></li>
              <li><a href="#">����5</a></li>
              <li><a href="#">����6</a></li>
              <li><a href="#">����7</a></li>
            </ul>
          </div>
        </div>
        <div class="box box1">
          <h2><a class="more" href="#">����..</a><span>HTCר��</span></h2>
          <div class="box_con">
            <dl>
              <dt><a href="#"><img  src="images/06.jpg" alt="������" width="91" height="70" /></a></dt>
              <dd><a href="#"><strong>�˴�Ϊ������</strong></a>
              ����&hellip;</dd>
            </dl>
            <ul>
            	<li><a href="#">����1</a></li>
              <li><a href="#">����2</a></li>
              <li><a href="#">����3</a></li>
              <li><a href="#">����4</a></li>
              <li><a href="#">����5</a></li>
              <li><a href="#">����6</a></li>
              <li><a href="#">����7</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="side">
      <div class="side_box">
        <h2><strong>��Ʒ</strong>�Ƽ�</h2>
        <div class="product">
          <ul>
            <li><strong>�Ƽ���Ʒ1:</strong><a href="#">��ϸ����..</a></li>
            <li><strong>�Ƽ���Ʒ2</strong><a href="#">��ϸ����..</a></li>
            <li><strong>�Ƽ���Ʒ3</strong><a href="#">��ϸ����..</a></li>
          </ul>
        </div>
      </div>
      <div class="side_box">
        <h2><strong>����</strong>����</h2>
        <div class="side_con ask">
          <dl>
            <dt><a href="#">��Ŀ1</a></dt>
            <dd>�������1...</dd>
          </dl>
          <dl>
            <dt><a href="#">��Ŀ2</a></dt>
            <dd>�������2...</dd>
          </dl>
          <dl>
            <dt><a href="#">��Ŀ3</a></dt>
            <dd>�������3...</dd>
          </dl>
          <dl>
            <dt><a href="#">��Ŀ4</a></dt>
            <dd>�������...</dd>
          </dl>
          
        </div>
      </div>
      <div class="side_box">
        <h2><strong>��ϵ</strong>����</h2>
        <div class="side_con contact"><a href="#"><img src="images/tel.gif" alt="��ϵ����" width="222" height="112" /></a></div>
      </div>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div id="footer">
    <dl>
    <dt><a href="#">��������</a>��||��<a href="#">��ƷĿ¼</a>��||��<a href="#">��ϵ����</a>��||��<a href="#">��������</a>��||��<a href="#">��������</a>��||��<a href="#">������</a></dt>
      <dd>Copyright &copy; 2010 - 2011 xinyi.com   All Rights Reserved<br />
            ��Ȩ����  ��ɽ������Ϣ�Ƽ����޹�˾</dd>
    </dl>
  </div>
</div>
</body>
</html>
