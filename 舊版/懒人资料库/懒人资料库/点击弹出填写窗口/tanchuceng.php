<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>点击按钮弹出可以移动的层</title>

<script>
function sss(){ 
table1.style.height=(window.document.body.clientHeight>window.document.body.scrollHeight)?window.document.body.clientHeight:window.document.body.scrollHeight;
table1.style.width="100%";
table1.style.display='block'
table2.style.left=window.document.body.scrollWidth/2-100;
table2.style.top=window.document.body.offsetHeight/2-100
table2.style.display='block'
}

function freset(){
document.all.aa.value=document.all.mm.value;
table1.style.display='none'
table2.style.display='none'
}

</script>

</head>

<body>

<div id="table1" style=" background:#FFFFFF; display: none; position: absolute;z-index:1;filter:alpha(opacity=40)" oncontextmenu="return false">

</div>

<div class="table2" id="table2" style="position:absolute; onmousedown=MDown(table2);background:#CCCCCC; display:none; z-index:2; width:300; height:200; border-left:solid #000000 1px; border-top:solid #000000 1px; border-bottom:solid #000000 1px; border-right:solid #000000 1px; cursor:move;" cellspacing="0" cellpadding="0" oncontextmenu="return false">
<input type="text" value="" name = "mm"/><br>
<input type="button" onClick="freset()" value='确定'> <input type="button" onClick="freset()" value='取消'>

</div>
<center>

<input type="text" onClick="sss()" value="评价买家" name = "aa"/>
<!--<input name="button" type="button" onClick="sss()" value='申请提交'>-->
</center>
</body>
</html>

