<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>主页</title>
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
        搜索产品
        <input class="inp_srh" type="text" name="textfield" id="textfield" />
        <input class="btn_srh" type="submit" name="button" id="button" value="查询" />
      </form>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div id="nav_main">
      <ul>
        <li><a href="#">首页信息</a>
          <ul>
            <li> <a href="#">信息发布</a></li>
          </ul>
        </li>
        <li><a href="#">手机新闻</a>
          <ul>
            <li><a href="#">最新动态</a></li>
            <li><a href="#">强势推荐</a></li>
          </ul>
        </li>
        <li><a href="#">其他信息1</a>
        <ul> <li><a href="#">分类1</a></li>
        <li><a href="#">分类2</a></li>
        <li><a href="#">分类3</a></li></ul>
        </li>
        <li><a href="#">其他信息2</a></li>
        <li><a href="#">其他信息3</a></li>
        <li><a href="#">其他信息4</a></li>
        <li><a href="#">其他信息5</a></li>
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
            <h1>手机新闻栏目</h1>
            <p>此处为手机新闻内容</p>
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
              <li><span>日期1</span><a href="#">标题1</a></li>
              <li><span>日期2</span><a href="#">标题2</a></li>
              <li><span>日期3</span><a href="#">标题3</a></li>
              <li><span>日期4</span><a href="#">标题4</a></li>
              <li><span>日期5</span><a href="#">标题5</a></li>
              <li><span>日期6</span><a href="#">标题6</a></li>   
		    </ul>-->
        </div>   
        </div>
      </div>
      <div id="index_pic">
        <h2><span></span></h2>
        <ul>
        	<li><a href="#"><img  src="images/01.jpg" alt="产品名称" width="107" height="87" />产品名称1</a></li>
          <li><a href="#"><img  src="images/02.jpg" alt="产品名称" width="107" height="87" />产品名称2</a></li>
          <li><a href="#"><img  src="images/03.jpg" alt="产品名称" width="107" height="87" />产品名称3</a></li>
          <li><a href="#"><img  src="images/04.jpg" alt="产品名称" width="107" height="87" />产品名称4</a></li>
          <li><a href="#"><img  src="images/05.jpg" alt="产品名称" width="107" height="87" />产品名称5</a></li>
          <li><a href="#"><img   src="images/06.jpg" alt="产品名称" width="107" height="87" />产品名称6</a></li>
          <li><a href="#"><img  src="images/07.jpg" alt="产品名称" width="107" height="87" />产品名称7</a></li>
          <li><a href="#"><img  src="images/08.jpg" alt="产品名称" width="107" height="87" />产品名称8</a></li>
          <li><a href="#"><img  src="images/09.jpg" alt="产品名称" width="107" height="87" />产品名称9</a></li>
          <li><a href="#"><img  src="images/10.jpg" alt="产品名称" width="107" height="87" />产品名称10</a></li>
        </ul>
      </div>
      <div id="index_box">
        <div class="box">
          <h2><a class="more" href="#">更多..</a><span>诺基亚专区</span></h2>
          <div class="box_con">
            <dl>
              <dt><a href="#"><img src="images/02.jpg" alt="标题" width="91" height="70" /></a></dt>
              <dd><a href="#"><strong>此处为标题栏</strong></a>
               内容&hellip;</dd>
            </dl>
            <ul>
            	<li><a href="#">标题1</a></li>
              <li><a href="#">标题2</a></li>
              <li><a href="#">标题3</a></li>
              <li><a href="#">标题4</a></li>
              <li><a href="#">标题5</a></li>
              <li><a href="#">标题6</a></li>
              <li><a href="#">标题7</a></li>
            </ul>
          </div>
        </div>
        <div class="box box1">
          <h2><a class="more" href="#">更多..</a><span>HTC专区</span></h2>
          <div class="box_con">
            <dl>
              <dt><a href="#"><img  src="images/06.jpg" alt="标题栏" width="91" height="70" /></a></dt>
              <dd><a href="#"><strong>此处为标题栏</strong></a>
              内容&hellip;</dd>
            </dl>
            <ul>
            	<li><a href="#">标题1</a></li>
              <li><a href="#">标题2</a></li>
              <li><a href="#">标题3</a></li>
              <li><a href="#">标题4</a></li>
              <li><a href="#">标题5</a></li>
              <li><a href="#">标题6</a></li>
              <li><a href="#">标题7</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="side">
      <div class="side_box">
        <h2><strong>产品</strong>推荐</h2>
        <div class="product">
          <ul>
            <li><strong>推荐产品1:</strong><a href="#">详细内容..</a></li>
            <li><strong>推荐产品2</strong><a href="#">详细内容..</a></li>
            <li><strong>推荐产品3</strong><a href="#">详细内容..</a></li>
          </ul>
        </div>
      </div>
      <div class="side_box">
        <h2><strong>常见</strong>问题</h2>
        <div class="side_con ask">
          <dl>
            <dt><a href="#">题目1</a></dt>
            <dd>相关内容1...</dd>
          </dl>
          <dl>
            <dt><a href="#">题目2</a></dt>
            <dd>相关内容2...</dd>
          </dl>
          <dl>
            <dt><a href="#">题目3</a></dt>
            <dd>相关内容3...</dd>
          </dl>
          <dl>
            <dt><a href="#">题目4</a></dt>
            <dd>相关内容...</dd>
          </dl>
          
        </div>
      </div>
      <div class="side_box">
        <h2><strong>联系</strong>我们</h2>
        <div class="side_con contact"><a href="#"><img src="images/tel.gif" alt="联系我们" width="222" height="112" /></a></div>
      </div>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div id="footer">
    <dl>
    <dt><a href="#">关于我们</a>　||　<a href="#">产品目录</a>　||　<a href="#">联系我们</a>　||　<a href="#">友情链接</a>　||　<a href="#">反馈问题</a>　||　<a href="#">广告合作</a></dt>
      <dd>Copyright &copy; 2010 - 2011 xinyi.com   All Rights Reserved<br />
            版权所有  佛山新易信息科技有限公司</dd>
    </dl>
  </div>
</div>
</body>
</html>
