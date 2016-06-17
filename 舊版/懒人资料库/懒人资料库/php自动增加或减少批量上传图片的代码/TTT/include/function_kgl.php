<?php
/*  */
include_once('common.inc.php'); 
class db{
	private $Coding,$conn;
	public function __construct(){
		$this->cfg_dbhost = "localhost";
		$this->cfg_dbuser = "root";
		$this->cfg_dbpwd = ""; 
		$this->cfg_dbname = "pama";
		$this->cfg_dbprefix = 'dede_';
       $this->cfg_db_language = 'utf8'; //数据库读、写所采用的编码
	}
	function conn(){
		$conn = mysql_connect ($this->cfg_dbhost,$this->cfg_dbuser,$this->cfg_dbpwd);
		mysql_query("set names $this->cfg_db_language");	
		return $conn;
	}
	//====================================================
	//数据库查询(以两维数组[行/列]的形式返回查询的结果)
	//$SQL：执行查询的SQL语句
	//$ResultType：返回结果类型，1:返回以字段名作为键名的数组，0:返回以数字索引方式储存的数组，2:以数字索引值及以字段名为键值的两种方式同时返回, 默认值为2，以数字索引值及以字段名为键值的两种方式同时返回
	//如：print_r (SelectSQL("SELECT * FROM `" . $cfg_dbprefix . "admin` ORDER BY `" . $cfg_dbprefix . "admin`.`ID` DESC LIMIT 0 , 30"));
	//====================================================
	function SelectSQL($SQL,$ResultType=2){
		switch ($ResultType){
			case 0:$ResultType=MYSQL_NUM;break; 
			case 1:$ResultType=MYSQL_ASSOC;break; 
			default:$ResultType=MYSQL_BOTH;break; 
		}
		$conn = $this->conn(); //$this表示引用内部的对象，要是在外面就可以调用 $db->conn();
		//$result = mysql_db_query($this->cfg_dbname,$SQL,$conn);	
		//$result = mysql_db_query($this->cfg_dbname,$SQL,$conn);	自 PHP 4.0.6 起不提倡使用此mysql_db_query函数。不要用此函数，可用下面的用 mysql_select_db() 和 mysql_query() 来替代。
		mysql_select_db($this->cfg_dbname,$conn);	 
		$result = mysql_query($SQL);	
		while(@$row = mysql_fetch_array($result,$ResultType)){$array[] = $row;}
		//mysql_free_result($result);		
		mysql_close($conn);	
		if(!is_array($array)){$array=array();} 	
		return $array;
	}
	//====================================================
	//执行数据库增、删、改操作
	//$SQL：执行的SQL语句
	//$ResultType：返回结果，0返回执行结果(false或true)，1返回当前插入的ID号(只对INSERT添加数据时有效)
	//如：ExecuteSQL(DELETE FROM `" . $cfg_dbprefix . "admin` WHERE `ID` = 6");
	//====================================================
	function ExecuteSQL($SQL,$ResultType=0){
		$conn = $this->conn();
		mysql_select_db($this->cfg_dbname,$conn);
		@$result = mysql_query($SQL);
		if($ResultType==1) $result = mysql_insert_id();
		mysql_close($conn);		
		return $result;
	}
	
	
}
function GetDateMk($mktime)
{
	return MyDate("Y-m-d",$mktime);
}
//返回格林威治标准时间
function MyDate($format='Y-m-d H:i:s',$timest=0)
{
	global $cfg_cli_time;
	$addtime = $cfg_cli_time * 3600;
	if(empty($format))
	{
		$format = 'Y-m-d H:i:s';
	}
	return gmdate ($format,$timest+$addtime);
}

//====================================================
//HTML转文本
//用法html2text($str)
//====================================================

function Html2Text($str,$r=0)
{
	
	if($r==0)
	{
		return SpHtml2Text($str);
	}
	else
	{
		$str = SpHtml2Text(stripslashes($str));
		return addslashes($str);
	}
}

function SpHtml2Text($str)
{
	$str = preg_replace("/<sty(.*)\\/style>|<scr(.*)\\/script>|<!--(.*)-->/isU","",$str);
	$alltext = "";
	$start = 1;
	for($i=0;$i<strlen($str);$i++)
	{
		if($start==0 && $str[$i]==">")
		{
			$start = 1;
		}
		else if($start==1)
		{
			if($str[$i]=="<")
			{
				$start = 0;
				$alltext .= " ";
			}
			else if(ord($str[$i])>31)
			{
				$alltext .= $str[$i];
			}
		}
	}
	$alltext = str_replace("　"," ",$alltext);
	$alltext = preg_replace("/&([^;&]*)(;|&)/","",$alltext);
	$alltext = preg_replace("/[ ]+/s"," ",$alltext);
	return $alltext;
}
//====================================================
//文本转HTML
//====================================================
function Text2Html($txt)
{
	$txt = str_replace("  ","　",$txt);
	$txt = str_replace("<","&lt;",$txt);
	$txt = str_replace(">","&gt;",$txt);
	$txt = preg_replace("/[\r\n]{1,}/isU","<br/>\r\n",$txt);
	return $txt;
}
//====================================================
//截取指定长度字符串
//$title：要截取的字串
//$start：从第几个字符开始截取
//$len：截取的字串长度
//$magic：是否将两个半角字符做一个全角字符计算(true或false)
//如：echo FSubstr('中china华人民共和国',0,3,true); //返回"中chin"
//====================================================
function FSubstr($title,$start,$len,$magic=true){
	$length = 0;
	if($len == "") $len = strlen($title);
	if($start > 0){
		$cnum = 0;
		for($i=0;$i<$start;$i++) {if(ord(substr($title,$i,1)) >= 128) $cnum ++;}
		if($cnum%2 != 0) $start--;	  
		unset($cnum);
	}	
	if(strlen($title)<=$len) return substr($title,$start,$len);
	$alen   = 0;
	$blen = 0;
	$realnum = 0;
	for($i=$start;$i<strlen($title);$i++){
		$ctype = 0;
		$cstep = 0;
		$cur = substr($title,$i,1);
		if($cur == "&") {
			if(substr($title,$i,4) == "&lt;"){
				$cstep = 4;
				$length += 4;
				$i += 3;
				$realnum ++;
				if($magic) {$alen ++;}
			} else if(substr($title,$i,4) == "&gt;"){
				$cstep = 4;
				$length += 4;
				$i += 3;
				$realnum ++;
				if($magic) {$alen ++;}
			} else if(substr($title,$i,5) == "&amp;"){
				$cstep = 5;
				$length += 5;
				$i += 4;
				$realnum ++;
				if($magic){$alen ++;}
			} else if(substr($title,$i,6) == "&quot;"){
				$cstep = 6;
				$length += 6;
				$i += 5;
				$realnum ++;
				if($magic){$alen ++;}
			} else if(substr($title,$i,6) == "&#039;"){
				$cstep = 6;
				$length += 6;
				$i += 5;
				$realnum ++;
				if($magic){$alen ++;}
			} else if(preg_match("/&#(\d+);/i",substr($title,$i,8),$match)){
				$cstep = strlen($match[0]);
				$length += strlen($match[0]);
				$i += strlen($match[0])-1;
				$realnum ++;
				if($magic){
					$blen ++;
					$ctype = 1;
				}
			}
		}else{
			if(ord($cur)>=128){
				$cstep = 2;
				$length += 2;
				$i += 1;
				$realnum ++;
				if($magic){
					$blen ++;
					$ctype = 1;
				}
			}else{
				$cstep = 1;
				$length +=1;
				$realnum ++;
				if($magic){$alen++;}
			}
		}
		if($magic){
			if(($blen*2+$alen) == ($len*2)) break;
			if(($blen*2+$alen) == ($len*2+1)){
				if($ctype == 1){
					$length -= $cstep;
					break;
				}else{
					break;
				}
			}
		}else{
			if($realnum == $len) break;
		}
	}
	unset($cur);
	unset($alen);
	unset($blen);
	unset($realnum);
	unset($ctype);
	unset($cstep);
	return substr($title,$start,$length);
}
//====================================================
//页面重定向
//$Dialog 是否弹出对话框,(0不弹,1弹出对话框)
//$Text 弹出的对话框文字内容
//$Url 转向的页面地址 ("-1"后退一步[不会重载页面],"0"跳到当前页[不含GET变量参数并重载当前页],"1"跳到当前页[包含GET变量参数并重载当前页],其它参数为跳转的Url地址) 
//NewUrl (1,'返回上一步','-1'); NewUrl (0,'','http://www.sina.com.cn');
//====================================================
function NewUrl($Dialog,$Text,$Url){
	if ($Url == '1') {$Url = $_SERVER['REQUEST_URI'];} else if ($Url == '0'){$Url = $_SERVER['SCRIPT_NAME'];}
	echo '<script language="javascript">';
	if ($Dialog == 1){echo 'alert("' . $Text . '");';}  
	if ($Url == '-1'){echo 'history.back(-1);';} else {echo 'location="' . $Url . '";';}
	echo '</script>';
	exit;
}
//====================================================
//读取网站全局设定信息
//$Field：读取系统全局设置表[song_system]中的字段名,多个字段名用","隔开
//$Field为一个字段时返回的是值,为多个字段时返回的是二维数组
//如(单字段)：echo WebSystem('WebHost'); 
//如(多字段): print_r (WebSystem('WebMailName,WebMailWord'));
//====================================================
function WebSystem($Field){
	global $db,$cfg_dbprefix;
	$WebConfig = $db->SelectSQL("SELECT " . $Field . " FROM `" . $cfg_dbprefix . "system`");
	return strstr($Field,',') ? $WebConfig : $WebConfig[0][0];
}
//====================================================
//读取网站基本配置信息
//$Field：读取网站基本信息配置表[song_webconfig]中的字段名,多个字段名用","隔开
//$Lang：第几种语言(无参数时表示第一种语言)
//$Field为一个字段时返回的是值,为多个字段时返回的是二维数组
//如(单字段)：echo WebConfig('Web_Url'); 
//如(多字段)：print_r (WebConfig('WebTitle,WebLogo'));
//====================================================
function WebConfig($Field,$Lang=1){
	global $db,$cfg_dbprefix;  
	$WebConfig = $db->SelectSQL("SELECT " . $Field . " FROM `" . $cfg_dbprefix . "webconfig` WHERE WebLang = " . $Lang);
	return strstr($Field,',') ? $WebConfig : $WebConfig[0][0];
}
//====================================================
//检测是否是本站内部提交(返回true或false)
//====================================================
function External(){
	$Host1 = strtolower($_SERVER['SERVER_NAME']); //当前站点域名
	$Host2 = strtolower($_SERVER['HTTP_REFERER']); //上一页完整Url
	$Host2 = parse_url($Host2); //解析Url
	$Host2 = $Host2['host']; //获取上一页域名
	if ($Host1==$Host2){return true;} else {return false;}
}
//====================================================
//通过当前栏目完整路径获取该栏目根栏目或父级栏目ID,当前栏目为根栏目时将返回空值
//$Rela:当前栏目的完整栏目路径[ColumnRela字段]
//$head:返回该栏目一级栏目ID或父级ID(为0时返回父级栏目ID,为1时返回该栏目根栏目ID)
//如:echo '该栏目根栏目ID:' . ParentID($ColumnRela,1);
//如:echo '该栏目父级栏目ID:' . ParentID($ColumnRela);
//====================================================
function ParentID($Rela,$head=0){
	$Rela = explode('|',$Rela);
	return $head==0 ? count($Rela)<=1 ?  '' : $Rela[count($Rela)-2] : $Rela[0];
}
//====================================================
//后台操作/登录日志
//$LogType:日志类型(1修改数据、2添加数据、3删除数据、4登录日志、5其它)
//$LogLang 相关语言站点(第几种语言)
//$LogDetails:操作详情
//如:AdminLog(1,$Lang,'试用以用户名为xx,密码为xx登录失败')
//====================================================
function AdminLog($LogType=1,$LogLang=1,$LogDetails=''){
	global $ConfigAdminLog,$_SERVER,$db,$cfg_dbprefix;
	if($ConfigAdminLog!==1){return;} //没开通日志功能时退出function
	$LogUser = $_SESSION['UserName'];
	$LogIP = $_SERVER['REMOTE_ADDR'];
	$LogPage = $_SERVER['REQUEST_URI'];
	$SQL = "INSERT INTO `" . $cfg_dbprefix . "adminlog` (`LogType`,`LogLang` ,`LogUser`,`LogIP`,`LogTime`,`LogDetails`,`LogPage`) ";
	$SQL .= "VALUES ('$LogType','$LogLang','$LogUser','$LogIP',NOW() ,'$LogDetails','$LogPage');";
	$db->ExecuteSQL($SQL);
}
//====================================================
//分页
//参数说明:
//$Urlpar:链接参数,多个参数以&分开,为空是表示无参数(如:ID=3&Type=2&Lang=En)
//$aColor:不可用链接颜色
//$Lang:语言(Cn中文,En英文)
//例:pages()
//====================================================
function pages($Urlpar='',$Lang='Cn',$aColor='#999999'){
	global $page,$PageCount,$RsCount;
	$RsCount % $PageCount != 0 ? $TotalPages = (int)($RsCount/$PageCount+1) : $TotalPages = $RsCount/$PageCount; //总页数
	if($page>$TotalPages){$page=$TotalPages;}
	$Urlpar=='' ? $Url='?page=' : $Url='?' . $Urlpar . '&page=';
	switch ($Lang){
		case 'Cn' :
			$pages = '共<font color="#FF0000">' . $RsCount . '</font>条&nbsp;|&nbsp;';
			$First='首页'; $Previous='上一页'; $Next='下一页'; $Last='尾页';
			$Records = '<font color="#FF0000">' . $PageCount . '</font>条/页&nbsp;|&nbsp;';
			$sDpage = '共<font color="#FF0000">' . $TotalPages . '</font>页' . "\n";
			$sDpage .= '<select name="spage" id="spage" OnChange="window.open(this.options[this.selectedIndex].value,\'_self\')">' . "\n";
			for ($i=1;$i<=$TotalPages;$i++){
				if ($i!=$page){
					$sDpage .= '<option value="' . $Url . $i . '">第' . $i . '页</option>' . "\n";
				}else{
					$sDpage .= '<option selected value="' . $Url . $i . '">第' . $i . '页</option>' . "\n";
				}
			}
			$sDpage .= '</select>';
			break;
		case 'En' :
			$pages = 'Total <font color="#FF0000">' . $RsCount . '</font> Records&nbsp;|&nbsp;';
			$First='First'; $Previous='Previous'; $Next='Next'; $Last='Last';
			$Records = '<font color="#FF0000">' . $PageCount . '</font>/page&nbsp;|&nbsp;';
			$sDpage = 'Page';
			$sDpage .= '<select name="spage" id="spage" OnChange="window.open(this.options[this.selectedIndex].value,\'_self\')">' . "\n";
			for ($i=1;$i<=$TotalPages;$i++){
				if ($i!=$page){
					$sDpage .= '<option value="' . $Url . $i . '">' . $i . '</option>' . "\n";
				}else{
					$sDpage .= '<option selected value="' . $Url . $i . '">' . $i . '</option>' . "\n";
				}
			}
			$sDpage .= '</select>' . "\n";	
			$sDpage .= 'Of ' . $TotalPages;
			break;		
	}
	$page <= 1 ? $pages .= '<font color="' . $aColor . '">' . $First . '</font>&nbsp;|&nbsp;' : $pages .= '<a href="' . $Url . '1">' . $First . '</a>&nbsp;|&nbsp;' . "\n"; //首页
	$page <= 1 ? $pages .= '<font color="' . $aColor . '">' . $Previous . '</font>&nbsp;|&nbsp;' : $pages .= '<a href="' . $Url . ($page-1) . '">' . $Previous . '</a>&nbsp;|&nbsp;' . "\n"; //上一页
	$page >= $TotalPages ? $pages .= '<font color="' . $aColor . '">' . $Next . '</font>&nbsp;|&nbsp;' : $pages .= '<a href="' . $Url . ($page+1) . '">' . $Next . '</a>&nbsp;|&nbsp;' . "\n"; //下一页
	$page >= $TotalPages ? $pages .= '<font color="' . $aColor . '">' . $Last . '</font>&nbsp;|&nbsp;' : $pages .= '<a href="' . $Url . $TotalPages . '">' . $Last . '</a>&nbsp;|&nbsp;' . "\n"; //尾页
	return $pages .= $Records . $sDpage;
	unset($page,$PageCount,$RsCount,$First,$Previous,$Next,$Last,$Records,$sDpage,$i,$TotalPages);
}
//====================================================
//通过栏目路径ID获取栏目名称(将"000209|000212|000214"形式换成"一极栏目→二级栏目→三级栏目"的形式)
//$aArray:栏目路径ID (000209|000212|000214)
//$blank:栏目间隔符号 (→)
//如:ArticleName('000209|000212|000214') //返回:栏目一名称→栏目二名称→栏目三名称
//====================================================
function ArticleName($aArray,$blank='<font color="#0000FF"> → </font>'){
	global $db,$cfg_dbprefix;
	$aArray = explode('|',$aArray);
	$nRs = @$db->SelectSQL("SELECT `ColumnName` FROM `" . $cfg_dbprefix . "column` WHERE ID IN(". join(',',$aArray) .") ORDER BY `ColumnRela` ASC");
	
	foreach ($aArray as $key => $value){
		if(count($nRs)==($key+1)){unset($blank);} //去掉最后的间隔符
		$ArticleName .= $nRs[$key][0] . $blank;
	}
	unset($aArray,$blank,$nRs,$key,$value);
	return $ArticleName;
}
//====================================================
//数据载入中
//$ImgUrl:载入小图片地址，默认值:'../Inc/images/Loading.gif'
//====================================================
function Loading($ImgUrl='../include/Loading.gif'){echo '<img src="' . $ImgUrl . '" width="16" height="16" /> 数据加载中，请稍候……';}
//====================================================
//莸取指定目录大小(返回目录大小，单位MB)
//$Dir:要获取的目录路径
//====================================================
function DirSize($Dir){
	if(!file_exists($Dir)) return 0;
	$handle = opendir($Dir);
	while (false!==($FolderOrFile = readdir($handle))){
		if($FolderOrFile != "." && $FolderOrFile != "..") {  
			if(is_dir("$Dir/$FolderOrFile")){ 
				$sizeResult += getDirSize("$Dir/$FolderOrFile"); 
			} else { 
				$sizeResult += filesize("$Dir/$FolderOrFile"); 
			}
		}  
	}
	closedir($handle);
	return number_format(($sizeResult/1048576),2); //MB
}
//====================================================
//莸取文件扩展(后缀)名
//Extend('xn.jpg.gif'); //gif
//====================================================
function Extend($file_name){
	$Extend = pathinfo($file_name);
	$Extend = strtolower($Extend["extension"]);  
	return $Extend;
}
/*====================================================
新闻标题调用(带搜索功能)
参数说明：
1、$Lang：要调用第几种语言的新闻列表
2、$Class：采用的CSS样式名，默认为NewsTitle
3、$Small：标题前的小图片，为NULL时无图片，其它为图片路径，路径须用单引号
4、$IsPage：是否分页，0不显示分页，其它数字为每页要显示的新闻数量
5、$Record：调用多少条记录，该参数在不分页时有效
6、$Url：点击后的链接页面，显示新闻内页的文件,可以附带其它链接参数，如：test.php?Cid=9&Text=ABC，无附带参数时只填写文件名：test.php
7、$Cid：是否显示类别，0不显示，1显示(默认值为1)
8、$Rela：调用的新闻类别路径，以"|"隔开，为0时显示所有类别中的新闻；如$_GET['Cid']：可将该参数接收GET值从而显示指定的类别下的新闻列表
9、$Sort：排序，0按指定数字排序，1按最新发表，2按点击次数，3按推荐新闻排序(可用在调用推荐新闻)[默认值为0]
10、$Urlpar：翻页链接参数，该参数在显示分页时有效，如调用指定类别下的新闻时Cid=$_GET['Cid'],多个参数以&分开,为NULL是表示无参数(如:Type=2&Lang=En)
11、$PageLang：翻页文字语言，Cn为中文，En为英文
12、$Click：是否显示点击数，0不显示，1显示，默认值1
13、$Date：是否显示发布日期，0不显示，1显示发布日期[2009-04-18]，2显示发布日期及时间[2009-04-18 12:55:01]
14、$Target：链接打开方式(链接目标)，_blank:在新窗口中打开链接；_parent:在父窗体中打开链接；_self:在当前窗体打开链接,此为默认值；_top:在当前窗体打开链接，并替换当前的整个窗体(框架页)；其它为框架名,在对应的框架页中打开
15、$Text：截取标题字符串长度，为0时不截取
16、$Search：搜索关键字，为空值时不搜索
实例：<?=NewsTitle(1,'NewsTitle','Inc/images/common4.gif',14,20,'NewsDetail.php?n=9&b=j',1,0,0,'','Cn',1,2,'_blank',0,$_GET['wd'])? >
====================================================*/
function NewsTitle($Lang=1,$Class='NewsTitle',$Small='Inc/images/common4.gif',$IsPage=12,$Record=20,$Url='NewsDetail.php',$Cid=1,$Rela=0,$Sort=0,$Urlpar=NULL,$PageLang='Cn',$Click=1,$Date=2,$Target='_blank',$Text=0,$Search=''){
	global $db,$_GET,$PageCount,$page,$RsCount,$cfg_dbprefix;
	$PageCount = $IsPage;
	$Url .= strstr($Url,'?') ? '&ID=' :  '?ID=';
	!is_numeric($_GET['page']) ? $page = 1 : $page = (int)($_GET['page']);
	if($page<1) $page=1; 
	$result1 = '<div class="' . $Class . '">' . "\n";
	$SQL = "SELECT `ID`,`NewsRela`,`NewsTitle`,`NewsTitleColor`,`NewsExternal`,`NewsContent`,`NewsClick`,`NewsTime` FROM `" . $cfg_dbprefix . "news` ";
	$SQL .= "WHERE `NewsAudit` = 1 && `NewsLang` = $Lang ";
	if ($Rela!=0) $SQL .= "&& `NewsRela` LIKE '%" . $Rela . "%' ";
	if ($Search != '') $SQL .= "&& `NewsTitle` LIKE '%" . $Search . "%' ";
	if ($IsPage!=0) $RsCount = count($db->SelectSQL($SQL)); //总记录数
	if ($Sort==0){$SQL .= "ORDER BY `NewsSort` DESC,`ID` DESC ";} elseif($Sort==1) {$SQL .= "ORDER BY `ID` DESC,`NewsSort` DESC ";} elseif($Sort==2){$SQL .= "ORDER BY `NewsClick` DESC,`ID` DESC ";} elseif($Sort==3){$SQL .= "ORDER BY `NewsRecommended` DESC,`ID` DESC ";}
	$SQL .= $IsPage==0 ? "LIMIT 0,$Record" : "LIMIT " . ($page-1)*$IsPage . "," . $IsPage;
	if(!$dbs = $db->SelectSQL($SQL,1)) return '<br /><strong>没有相关数据！</strong>';
	foreach ($dbs as $i => $n){
		$NewsTitle = $Text==0 ? $n['NewsTitle'] : FSubstr($n['NewsTitle'],0,$Text);
		if ($Search != '') $NewsTitle = str_replace($Search,'<font color="#FF0000">' . $Search . '</font>',$NewsTitle);
		$NewsTitle = $n['NewsTitleColor']=='' ? $NewsTitle : '<font color="' . $n['NewsTitleColor'] . '">' . $NewsTitle . '</font>';
		$NewsTitle = $n['NewsExternal']==0 ? '<a target="' . $Target . '" href="' . $Url . $n['ID'] . '">' . $NewsTitle . '</a>' : '<a target="_blank" href="' . $n['NewsContent'] . '">' . $NewsTitle . '</a>';
		if ($Click==1) $NewsTitle .= ' (' . $n['NewsClick'] . ')';
		$result2 .= '	<ul>' . "\n";
		if ($Small != NULL) $result2 .= '		<li class="Small"><img src="' . $Small . '" /></li>' . "\n";	
		if($Cid==1) {
			$aArray = explode('|',$n['NewsRela']);
			$nRs = $db->SelectSQL("SELECT `ColumnName` FROM `" . $cfg_dbprefix . "column` WHERE ID = '" . $aArray[0] . "'");
			$result2 .= '		<li class="Cid">[' . $nRs[0][0] . ']</li>' . "\n";			
		}		
		$result2 .= '		<li class="Title">' . $NewsTitle . '</li>' . "\n";	
		if($Date==1) {
			$result2 .= '		<li class="Date">' . date('Y-m-d',strtotime($n['NewsTime'])) . '</li>' . "\n";
		}elseif($Date==2){
			$result2 .= '		<li class="Date">' . $n['NewsTime'] . '</li>' . "\n";
		}
		$result2 .= '	</ul>' . "\n";	
	}
	if($IsPage!=0) {
		$result3 = '	<ul class="Page">' . "\n";
		$result3 .= '		<li>' . "\n";
		$result3 .= pages($Urlpar,$PageLang,'#999999');
		$result3 .= '		</li>' . "\n";
		$result3 .= '	</ul>' . "\n";	
	}
	$result3 .= '</div>' . "\n";
	$result = $result1 . $result2 . $result3;
	unset($NewsTitle,$SQL,$aArray,$nRs,$n,$db,$dbs,$result1,$result2,$result3);
	return $result;
}
/*====================================================
新闻详情页面调用
$ID：要调用的新闻的ID号，为0时自动获取地址栏的ID值(默认值)
赋值全局变量：---------------------------------------------
$NewsLang 新闻语言种类(所属第几种语言)
$NewsRela 新闻所属类别路径[可使用ArticleName函数将其转换为栏目名称]
$NewsTitle 新闻标题
$NewsTitleColor 标题字体颜色
$NewsExternal 是否为外部链接(0为内部链接,1为外部链接)
$NewsContent 内部新闻为内容，外部新闻为链接地址
$NewsPhoto 新闻缩略图
$NewsSource 新闻来源
$NewsPublished 发布者
$NewsKeyWord 新闻关键字(关联相关新闻或搜索用)
$NewsClick 点击次数
$NewsTime 添加时间
====================================================*/
function NewsDetails($ID=0){
	global $_GET,$_COOKIE,$db,$NewsLang,$NewsRela,$NewsTitle,$NewsTitleColor,$NewsExternal,$cfg_dbprefix;
	global $NewsContent,$NewsPhoto,$NewsSource,$NewsPublished,$NewsKeyWord,$NewsClick,$NewsTime;
	if ($ID==0) $ID = $_GET['ID']; if (!is_numeric($ID)) return false;
	if($_COOKIE['NewsID_' . $ID] != 'song') $db->ExecuteSQL("UPDATE `" . $cfg_dbprefix . "news` SET `NewsClick` = (`NewsClick` + 1) WHERE `ID` = $ID LIMIT 1"); //更新点击数
	@setcookie('NewsID_' . $ID,'song',time()+7200,"/"); //2H
	if(!$result = $db->SelectSQL("SELECT `NewsLang`,`NewsRela`,`NewsTitle`,`NewsTitleColor`,`NewsExternal`,`NewsContent`,`NewsPhoto`,`NewsSource`,`NewsPublished`,`NewsKeyWord`,`NewsClick`,`NewsTime` FROM `" . $cfg_dbprefix . "news` WHERE id = $ID LIMIT 0,1;",0)) return false;
	list($NewsLang,$NewsRela,$NewsTitle,$NewsTitleColor,$NewsExternal,$NewsContent,$NewsPhoto,$NewsSource,$NewsPublished,$NewsKeyWord,$NewsClick,$NewsTime) = $result[0];
	return true;
}
/*====================================================
栏目(类别)菜单调用
$Lang：语言种类,要调用栏目属于第几种语言
$Type：栏目类型(0文章栏目类别,1新闻类别,2产品类别,3下载分类)
$Colu：是否调用指定栏目下的子菜单列表(为0时调用所有类别,其它为指定栏目ID下的所有子类别)
$Class：列表显示所采用的CSS样式名,默认为Column
$ParImg：一级类别前的小图标地址,为NULL时不显示小图标
$SonImg：子类别前的小图标地址,为NULL时不显示小图标
$Url：点击后的链接文件
$Son：是否显示子类/子栏目,(1显示,0不显示),为0时只显示一级类别
====================================================*/
function Column($Lang=1,$Type=1,$Colu=0,$Class='Column',$ParImg='Inc/images/plus.gif',$SonImg='Inc/images/nofollow.gif',$Url='#',$Son=1){
	global $db,$cfg_dbprefix,$SQL;
	$SQL = "SELECT `ID`,`ColumnRela`,`ColumnName`,`ColumnLevel`,`ColumnTime` FROM `" . $cfg_dbprefix . "column` WHERE ColumnType = $Type && ColumnLang = $Lang ";
	if($Son==0){$SQL .= " && `ColumnLevel` = 1 ";}
	if($Colu!=0){$SQL .= "&& `ColumnRela` LIKE '%" . $Colu . "%' && `ID` != '" . $Colu . "' ";}
	$SQL .= "ORDER BY `ColumnRela` ASC;";
	$Rs = $db->SelectSQL($SQL);
	$result = '	<div class="' . $Class . '">' . "\n";
	for ($i=0;$i<count($Rs);$i++ ) {
		$result .= '		<ul>' . "\n";
		for ($x=1;$x<$Rs[$i][3];$x++){$Spaces .= '　';} //每一级前面加两个全角空格
		if($Rs[$i][3] > 1){ //子类
			$Cname = $SonImg!=NULL ? '<img src="' . $SonImg . '"> ' . $Rs[$i][2] : $Rs[$i][2];
		} else {
			$Cname = $ParImg!=NULL ? '<img src="' . $ParImg . '"> ' . $Rs[$i][2] : $Rs[$i][2]; 
		}
		$result .= '			<li class="ColumnName">' . $Spaces . '<a href="' . $Url . '?Cid=' . $Rs[$i][1] . '">' . $Cname . '</a></li>' . "\n";
		$result .= '		</ul>' . "\n";
		unset($Cname,$Img,$Spaces);
	}
	$result .= '	</div>' . "\n";
	unset($Rs,$i,$x,$SQL);
	return $result;
}
/*====================================================
栏目(文章)内容详情页面调用
$ID：要调用的内容的ID号，为0时自动获取地址栏的ID值(默认值)
赋值全局变量：---------------------------------------------
$ArticleLang 内容(文章)语言种类(所属第几种语言)
$ArticleRela 内容(文章)所属类别路径[可使用ArticleName函数将其转换为栏目名称]
$ArticleTitle 内容(文章)标题
$ArticleImg 文章缩略图地址
$ArticleContent 详细内容
$ArticleClick 点击次数
$ArticleTime 添加时间
====================================================*/
function Article($ID=0){
	global $_GET,$_COOKIE,$ArticleLang,$ArticleRela,$ArticleTitle,$db;
	global $ArticleImg,$ArticleContent,$ArticleClick,$ArticleTime,$cfg_dbprefix;
	if ($ID==0) $ID = $_GET['ID']; if (!is_numeric($ID)) return false;
	if($_COOKIE['ArticleID_' . $ID] != 'song') $db->ExecuteSQL("UPDATE `" . $cfg_dbprefix . "article` SET `ArticleClick` = (`ArticleClick` + 1) WHERE `ID` = $ID LIMIT 1"); //更新点击数
	@setcookie('ArticleID_' . $ID,'song'); 
	if(!$result = $db->SelectSQL("SELECT `ArticleLang`,`ArticleRela`,`ArticleTitle`,`ArticleImg`,`ArticleContent`,`ArticleClick`,`ArticleTime` FROM `" . $cfg_dbprefix . "article` WHERE `ID` = $ID LIMIT 0,1;",0)) return false;
	list($ArticleLang,$ArticleRela,$ArticleTitle,$ArticleImg,$ArticleContent,$ArticleClick,$ArticleTime) = $result[0];
	return true;
}
/*====================================================
留言表单处理函数[GuestBookAdd]
$Code：是否开通验证码功能(0不开通,1开通)，验证码请以名为"SafeCode"的SESSION变量储存,建议使用Inc/GetCode.php默认验证码生成文件
$Lang：留言属于第几种语言
$Time：防止暴力营销软件自动发表留言的间隔时间(单位:分钟),拒绝同一IP地址在指定的时间内重复提交留言信息,为0时无限制
表单中的文本域名：
GuestBookName 留言者昵称[VARCHAR(30)]
GuestBookImg 留言表情ID(为0时无表情)[int(8)]
GuestBookMail 留言者电子邮件[VARCHAR(50)]
GuestBookTel 电话[VARCHAR(20)]
GuestBookFax 公司传真[VARCHAR(20)]
GuestBookCompany 公司名称[VARCHAR(30)]
GuestBookAddress 公司地址[VARCHAR(200)]
GuestBookQQ QQ号[VARCHAR(20)]
GuestBookSex (0女,1男)性别[tinyint(1)]
GuestBookTitle 主题[VARCHAR(30)]
GuestBookContent 留言内容[text]
GuestBookUser 会员ID(0为游客留言)[int(8)]
====================================================*/
function GuestBookAdd($Code=0,$Lang=1,$Time=30){
	if(!isset($_POST['GuestBookContent'])) return false;
	global $db,$cfg_dbprefix,$_POST,$_SESSION,$_SERVER;
	@session_start();
	@date_default_timezone_set('Asia/Shanghai');
	if(!External()) NewUrl (1,'拒绝从站点外部提交数据！','-1');
	if($_POST['GetCode']!=$_SESSION['SafeCode'] && $Code==1) NewUrl (1,'您填写的验证码不正确！','-1');
//	if($_POST['GetCode']==NULL) NewUrl (1,'请填写留言内容！','-1');
	if($Time != 0){
		$uN = $db->SelectSQL("SELECT count(`ID`) FROM `" . $cfg_dbprefix . "guestbook` WHERE `GuestBookTime` >= '" . date('Y-m-d H:i:s',time()-(60*$Time)) . "' LIMIT 0,1");
		if($uN[0][0]!=0) NewUrl (1,'您提交信息过于频繁，请稍候再试！','-1');
	}
	is_numeric($_POST['GuestBookImg']) ? $GuestBookImg = $_POST['GuestBookImg'] : $GuestBookImg = 0; //表情
	is_numeric($_POST['GuestBookSex']) ? $GuestBookSex = $_POST['GuestBookSex'] : $GuestBookSex = 1; //性别
	is_numeric($_POST['GuestBookUser']) ? $GuestBookUser = $_POST['GuestBookUser'] : $GuestBookUser = 0; //会员ID
	$SQL = "INSERT INTO `" . $cfg_dbprefix . "guestbook` (`GuestBookLang`,`GuestBookName`,`GuestBookImg`,`GuestBookMail`,`GuestBookTel`,";
	$SQL .="`GuestBookFax`,`GuestBookCompany`,`GuestBookAddress`,`GuestBookQQ`,`GuestBookSex`,`GuestBookTitle`,`GuestBookContent`,";
	$SQL .= "`GuestBookUser`,`GuestBookIP`,`GuestBookTime`,`GuestBookShow`) VALUES ('" . $Lang . "', '" . $_POST['GuestBookName'] . "',";
	$SQL .= "'" . $GuestBookImg . "', '" . $_POST['GuestBookMail'] . "', '" . $_POST['GuestBookTel'] . "','" . $_POST['GuestBookFax'] . "',";
	$SQL .= "'" . $_POST['GuestBookCompany'] . "', '" . $_POST['GuestBookAddress'] . "', '" . $_POST['GuestBookQQ'] . "','" . $GuestBookSex . "',";
	$SQL .= "'" . $_POST['GuestBookTitle'] . "', '" . $_POST['GuestBookContent'] . "', '" . $GuestBookUser . "','" . $_SERVER['REMOTE_ADDR'] . "',";
	$SQL .= "NOW(), '0');";
	if($db->ExecuteSQL($SQL)){
		NewUrl (1,'提交成功，我们将尽可能在最短时间给予回复；','1');
	} else {
		NewUrl (1,'提交失败，请确认您提交的参数是否正确！','-1');
	}
	unset($uN,$SQL);
}
/*====================================================
留言信息调用[GuestBook]
参数说明：
1、$Lang：要调用第几种语言的留言
2、$Class：采用的CSS样式名，默认为GuestBook
3、$IsPage：是否分页，0不显示分页，其它数字为每页要显示的新闻数量
4、$Record：调用多少条记录，该参数在不分页时有效
5、$PageLang：翻页文字语言，Cn为中文，En为英文
====================================================*/
function GuestBook($Lang=1,$Class='GuestBook',$IsPage=10,$Record=10,$PageLang='Cn'){
	global $db,$_GET,$PageCount,$page,$RsCount,$cfg_dbprefix;
	$PageCount = $IsPage;
	!is_numeric($_GET['page']) ? $page = 1 : $page = (int)($_GET['page']);
	if($page<1) $page=1; 
	$SQL = "SELECT * FROM `" . $cfg_dbprefix . "guestbook` WHERE `GuestBookLang` = $Lang ";
	if(WebSystem('WebGuestBook')==1) $SQL .= "&& `GuestBookShow` = 1 ";
	$SQL .= "ORDER BY `ID` DESC ";
	if ($IsPage!=0) $RsCount = count($db->SelectSQL($SQL,2)); //总记录数
	$SQL .= $IsPage==0 ? "LIMIT 0,$Record" : "LIMIT " . ($page-1)*$IsPage . "," . $IsPage;
	if(!$Gb = $db->SelectSQL($SQL,1)) return '<br /><br /><strong>　　没有相关数据！</strong>';
	$result = '	<div class="' . $Class . '">' . "\n";
	foreach ($Gb as $i => $n){
		$result .= '		<ul class="Basic">' . "\n";
		$result .= '			<li class="Name"><a target="_blank" href="Inc/GetToPost.php?Action=IP&IP=' . $Gb[$i]['GuestBookIP'] . '"><img alt="IP地址：' . $Gb[$i]['GuestBookIP'] . '" src="Inc/images/bname.gif" width="10" height="17" border="0"></a>&nbsp;' . htmlspecialchars($Gb[$i]['GuestBookName']) . '</li>' . "\n";
		$result .= '			<li class="Time"><img alt="时间：' . $Gb[$i]['GuestBookTime'] . '" src="Inc/images/time.gif" width="12" height="13" border="0" />&nbsp;' . $Gb[$i]['GuestBookTime'] . '</li>';
		$result .= '		</ul>' . "\n";
		$result .= '		<ul class="Title">' . "\n";
		$result .= '			<li><img src="Inc/images/title.gif" width="14" height="15" border="0" alt="主题：' . htmlspecialchars($Gb[$i]['GuestBookTitle']) . '" />&nbsp;' . htmlspecialchars($Gb[$i]['GuestBookTitle']) . '</li>' . "\n";
		$result .= '		</ul>' . "\n";
		$result .= '		<ul class="Content">' . "\n";
		$result .= '			<li><pre>' . htmlspecialchars($Gb[$i]['GuestBookContent']) . '</pre></li>' . "\n";
		$result .= '		</ul>' . "\n";
		$result .= '		<ul class="Admin">' . "\n";
		if($Gb[$i]['GuestBookResumes']!=NULL){
			$result .= '			<li><pre><strong>管理员回复</strong>：' . $Gb[$i]['GuestBookResumes'] . '</pre></li>' . "\n";
		}else{
			$result .= '			<li>未曾回复</li>' . "\n";
		}
		$result .= '		</ul>' . "\n";
	}
	if($IsPage!=0) {
		$result .= '		<ul class="page">' . "\n";
		$result .= '			<li>' . "\n";
		$result .= pages('',$PageLang,'#999999');
		$result .= '			</li>' . "\n";
		$result .= '		</ul>' . "\n";	
	}	
	$result .= '	</div>' . "\n";
	unset($SQL,$Gb,$i,$n);
	return $result;
}
/*====================================================
文章(内容)标题调用函数[ContentTitle] 
参数说明：
1、$Lang：要调用第几种语言的文章(内容)列表
2、$Class：采用的CSS样式名，默认为ContentTitle
3、$Small：标题前的小图片，为NULL时无图片，其它为图片路径，路径须用单引号
4、$IsPage：是否分页，0不显示分页，其它数字为每页要显示的文章(内容)数量
5、$Record：调用多少条记录，该参数在不分页时有效
6、$Url：点击后的链接页面，显示文章(内容)内页的文件,可以附带其它链接参数，如：test.php?Cid=9&Text=ABC，无附带参数时只填写文件名：test.php
7、$Cid：是否显示类别，0不显示，1显示(默认值为1)
8、$Rela：调用的文章(内容)类别路径，以"|"隔开，为0时显示所有类别中的文章(内容)；如$_GET['Cid']：可将该参数接收GET值从而显示指定的类别下的文章(内容)列表
9、$Sort：排序，0按指定数字排序，1按最新发表，2按点击次数,[默认值为0]
10、$Urlpar：翻页链接参数，该参数在显示分页时有效，如调用指定类别下的文章(内容)时Cid=$_GET['Cid'],多个参数以&分开,为NULL是表示无参数(如:Type=2&Lang=En)
11、$PageLang：翻页文字语言，Cn为中文，En为英文
12、$Click：是否显示点击数，0不显示，1显示，默认值1
13、$Date：是否显示发布日期，0不显示，1显示发布日期[2009-04-18]，2显示发布日期及时间[2009-04-18 12:55:01]
14、$Target：链接打开方式(链接目标)，_blank:在新窗口中打开链接；_parent:在父窗体中打开链接；_self:在当前窗体打开链接,此为默认值；_top:在当前窗体打开链接，并替换当前的整个窗体(框架页)；其它为框架名,在对应的框架页中打开
15、$Text：截取标题字符串长度，为0时不截取
实例1：<?=ContentTitle(1,'ContentTitle','Inc/images/common4.gif',6,20,'ArticleDetail.php',1,0,0,NULL,'Cn',1,1,'_blank',0)? >
实例2: <?=ContentTitle(1,'ContentTitle','',0,99,'ArticleDetail.php',0,'000315',0,NULL,'Cn',0,0,'_self',0)? >
====================================================*/
function ContentTitle($Lang=1,$Class='ContentTitle',$Small='Inc/images/common4.gif',$IsPage=12,$Record=20,$Url='ArticleDetail.php',$Cid=1,$Rela=0,$Sort=0,$Urlpar=NULL,$PageLang='Cn',$Click=1,$Date=1,$Target='_blank',$Text=0){
	global $db,$_GET,$PageCount,$page,$RsCount,$cfg_dbprefix;
	$PageCount = $IsPage;
	$Url .= strstr($Url,'?') ? '&ID=' :  '?ID=';
	!is_numeric($_GET['page']) ? $page = 1 : $page = (int)($_GET['page']);
	if($page<1) $page=1; 
	$result1 = '<div class="' . $Class . '">' . "\n";
	$SQL = "SELECT `ID`,`ArticleRela`,`ArticleTitle`,`ArticleClick`,`ArticleTime` FROM `" . $cfg_dbprefix . "article` ";
	$SQL .= "WHERE `ArticleLang` = $Lang ";
	if ($Rela!=0) $SQL .= "&& `ArticleRela` LIKE '%" . $Rela . "%' ";
	if ($Search != '') $SQL .= "&& `ArticleTitle` LIKE '%" . $Search . "%' ";
	if ($IsPage!=0) $RsCount = count($db->SelectSQL($SQL)); //总记录数
	if ($Sort==0){$SQL .= "ORDER BY `ArticleSort` DESC,`ID` ASC ";} elseif($Sort==1) {$SQL .= "ORDER BY `ID` DESC,`ArticleSort` DESC ";} elseif($Sort==2){$SQL .= "ORDER BY `ArticleClick` DESC,`ID` DESC ";}
	$SQL .= $IsPage==0 ? "LIMIT 0,$Record" : "LIMIT " . ($page-1)*$IsPage . "," . $IsPage;
	if(!$dbs = $db->SelectSQL($SQL,1)) return '<br /><br /><strong>没有相关数据！</strong>';
	foreach ($dbs as $i => $n){
		$ArticleTitle = $Text==0 ? $n['ArticleTitle'] : FSubstr($n['ArticleTitle'],0,$Text);
		if ($Search != '') $ArticleTitle = str_replace($Search,'<font color="#FF0000">' . $Search . '</font>',$ArticleTitle);
		$ArticleTitle = '<a target="' . $Target . '" href="' . $Url . $n['ID'] . '">' . $ArticleTitle . '</a>';
		if ($Click==1) $ArticleTitle .= ' (' . $n['ArticleClick'] . ')';
		$result2 .= '	<ul>' . "\n";
		if ($Small != NULL) $result2 .= '		<li class="Small"><img src="' . $Small . '" /></li>' . "\n";	
		if($Cid==1) {
			$aArray = explode('|',$n['ArticleRela']);
			$nRs = $db->SelectSQL("SELECT `ColumnName` FROM `" . $cfg_dbprefix . "column` WHERE ID = '" . $aArray[0] . "'");
			$result2 .= '		<li class="Cid">[' . $nRs[0][0] . ']</li>' . "\n";			
		}		
		$result2 .= '		<li class="Title">' . $ArticleTitle . '</li>' . "\n";	
		if($Date==1) {
			$result2 .= '		<li class="Date">' . date('Y-m-d',strtotime($n['ArticleTime'])) . '</li>' . "\n";
		}elseif($Date==2){
			$result2 .= '		<li class="Date">' . $n['ArticleTime'] . '</li>' . "\n";
		}
		$result2 .= '	</ul>' . "\n";	
	}
	if($IsPage!=0) {
		$result3 = '	<ul class="Page">' . "\n";
		$result3 .= '		<li>' . "\n";
		$result3 .= pages($Urlpar,$PageLang,'#999999');
		$result3 .= '		</li>' . "\n";
		$result3 .= '	</ul>' . "\n";	
	}
	$result3 .= '</div>' . "\n";
	$result = $result1 . $result2 . $result3;
	unset($ArticleTitle,$SQL,$aArray,$nRs,$n,$db,$dbs,$result1,$result2,$result3);
	return $result;
}
/*====================================================
产品缩略图调用[ProductPhoto]
参数说明:
1、$Lang：要调用第几种语言的产品
2、$Class：采用的CSS样式名，默认为ContentTitle
3、$Rela：调用的产品类别路径，以"|"隔开，为0时显示所有类别中的产品；如$_GET['Cid']：可将该参数接收GET值从而显示指定的类别下的产品
4、$New：是否调用新产品(一般指新推出、新开发的产品)，0调用所有产品，1只调用新产品，2调用新产品以外的其它产品
5、$Sort：排序，0按指定数字排序，1按最新发表，2按点击次数，3按推荐产品排序(可用在调用推荐产品)
6、$Text：图片下方显示的内容,如产品名称、型号等信息,为NULL时不显示任何信息,其它为要显示的字段名(注意区分大小写),多个字段用数组隔开,具体字段对照见http://www.songcms.com/Support.php?ID=169
7、$Length：截取图片下方显示的字符串长度
8、$IsPage：是否分页,0不显示分页,1显示中文分页,2显示英文分页
9、$Column：显示的列数(每行要显示的缩略图数量)
10、$Row：显示的行数(每列要显示的缩略图数量)
11、$Url：点击后的链接页面，显示产品详细内容的文件,可以附带其它链接参数，如：test.php?Cid=9&Text=ABC，无附带参数时只填写文件名：test.php
12、$Target：链接打开方式(链接目标)，_blank:在新窗口中打开链接；_parent:在父窗体中打开链接；_self:在当前窗体打开链接,此为默认值；_top:在当前窗体打开链接，并替换当前的整个窗体(框架页)；其它为框架名,在对应的框架页中打开
13、$Urlpar：翻页链接附带参数，该参数在显示分页时有效，如调用指定类别下的产品时Cid=$_GET['Cid'],多个参数以&分开,为NULL是表示无参数(如:Type=2&Lang=En)
14、$Search：搜索关键字(对产品名称及型号搜索)，为NULL值时不搜索
注：产品缩略图大小请在配置文件Config.ini中设置(该设置将同时控制前后台的图片大小)
ProductPhoto($Lang,$Class,$Rela,$New,$Sort,$Text,$Length,$IsPage,$Column,$Row,$Url,$Target,$Urlpar,$Search)
echo ProductPhoto(1,'ProductPhoto',0,0,0,'ProductName,ProductModel',0,1,3,2,'ProductDetail.php','_blank',NULL,$_GET['wd']);
====================================================*/
function ProductPhoto($Lang=1,$Class='ProductPhoto',$Rela=0,$New=0,$Sort=0,$Text='ProductName,ProductModel',$Length=0,$IsPage=1,$Column=4,$Row=3,$Url='ProductDetail.php',$Target='_blank',$Urlpar=NULL,$Search=NULL){
	global $db,$_GET,$PageCount,$page,$RsCount,$cfg_dbprefix,$ConfigProductPhotoWidth1,$ConfigProductPhotoHeight1;
	$PageCount = ($Column*$Row);
	$Url .= strstr($Url,'?') ? '&ID=' :  '?ID=';
	$TextSQL = $Text == NULL ? '' : ',' . $Text;
	!is_numeric($_GET['page']) ? $page = 1 : $page = (int)($_GET['page']);
	if($page<1) $page=1; 
	$SQL = "SELECT `ID`,`ProductPhoto1`" . $TextSQL . " FROM `" . $cfg_dbprefix . "product` ";
	$SQL .= "WHERE `ProductAudit` = 1 && `ProductLang` = $Lang "; //审核、语言
	if($Rela!=0) $SQL .= "&& `ProductRela` LIKE '%" . $Rela . "%' "; //类别
	if($New==1) $SQL .= "&& `ProductNew` = 1 "; elseif ($New==2) $SQL .= "&& `ProductNew` = 0 "; //新产品、非新产品
	if($Search!=NULL) $SQL .= "&& (`ProductName` LIKE '%" . $Search . "%' || `ProductModel` LIKE '%" . $Search . "%') "; //搜索
	$RsCount = count($db->SelectSQL($SQL)); //记录总数
	if ($Sort==0){$SQL .= "ORDER BY `ProductSort` DESC,`ID` DESC ";} elseif($Sort==1) {$SQL .= "ORDER BY `ID` DESC,`ProductSort` DESC ";} elseif($Sort==2){$SQL .= "ORDER BY `ProductClick` DESC,`ID` DESC ";} elseif($Sort==3){$SQL .= "ORDER BY `ProductRecommended` DESC,`ID` DESC ";}
	$SQL .= $IsPage==0 ? "LIMIT 0,$PageCount" : "LIMIT " . ($page-1)*$PageCount . "," . $PageCount;
	if(!$n = $db->SelectSQL($SQL,1)) return '<br /><br /><strong>没有相关数据！</strong>';
	$Text = $Text==NULL ? array() : explode(',',$Text);
	$result = '	<div class="' . $Class . '">' . "\n";
	for($i=0;$i<($Column*$Row);$i+=$Column){ //防止尾页不足一页
		$result .= '		<ul>' . "\n";
			for($x=0;$x<$Column && (($page-1)*$PageCount+($i+$x)<$RsCount);$x++){ //防止尾页不足一页
				$result .= '			<li>';
				$result .= '<a target="' . $Target . '" href="' . $Url . $n[($i+$x)]['ID'] . '"><img src="' . $n[($i+$x)]['ProductPhoto1'] . '" width="' . $ConfigProductPhotoWidth1 . '" height="' . $ConfigProductPhotoHeight1 . '"></a>';
				foreach ($Text as $s => $p){
					$pText = FSubstr($n[($i+$x)][$p],0,$Length);
					if($Search!=NULL) $pText = str_replace($Search,'<font color="#FF0000">' . $Search . '</font>',$pText);
					$result .= '<br /><a target="' . $Target . '" href="' . $Url . $n[($i+$x)]['ID'] . '" title="' . $n[($i+$x)][$p] . '">' . $pText . '</a>';
				}
				$result .= '</li>' . "\n";	
			}
		$result .= '		</ul>' . "\n";
	}
	if($IsPage!=0) {
		$result .= '		<ul class="Page">' . "\n";
		$result .= '			<li>' . "\n";
		$result .= $IsPage ==1 ? pages($Urlpar,'Cn','#999999') : pages($Urlpar,'En','#999999');
		$result .= '			</li>' . "\n";
		$result .= '		</ul>' . "\n";	
	}	
	$result .= '	</div>' . "\n";
	unset($n,$s,$p,$Lang,$Class,$Rela,$New,$Sort,$Text,$Length,$IsPage,$Column,$Row,$Url,$Target,$Urlpar,$Search,$pText);
	return $result;
}
/*====================================================
//产品详情页面调用
//$ID：要调用的新闻的ID号，为0时自动获取地址栏的ID值(默认值)
//赋值全局变量：
$ProductLang 产品语言种类(所属第几种语言)
$ProductRela 产品所属类别路径
$ProductName 产品名称
$ProductNameColor 名称字体颜色
$ProductBrand 品牌
$ProductModel 型号
$ProductCoding 编码
$ProductSpeci 规格
$ProductColor 颜色
$ProductPrice 价格
$ProductKeyWord 产品关键字(关联相关产品或搜索用)
$ProductPhoto1 图片1地址
$ProductPhoto2 图片2地址
$ProductSummary 简要描述
$ProductContent 详细介绍
$ProductSecrecy 查看权限(0全部,其它为会员等级值,指定的级别可见)
$ProductNew 是否为新产品(0一般产品,1新产品)
$ProductRecommended 是否为推荐产品(0否,1是)
$ProductAudit 是否通过审核(0否,1通过)
$ProductClick 点击次数
$ProductSort 排序(倒序)
$ProductPublished 发布者
$ProductTime 添加时间
====================================================*/
function PruductDetails($ID=0){
	global $_GET,$_COOKIE,$db,$cfg_dbprefix;
	global $ProductLang,$ProductRela,$ProductName,$ProductNameColor,$ProductBrand,$ProductModel,$ProductCoding,$ProductSpeci;
	global $ProductColor,$ProductPrice,$ProductKeyWord,$ProductPhoto1,$ProductPhoto2,$ProductSummary,$ProductContent;
	global $ProductSecrecy,$ProductNew,$ProductRecommended,$ProductAudit,$ProductClick,$ProductSort,$ProductPublished,$ProductTime;
	if ($ID==0) $ID = $_GET['ID']; if (!is_numeric($ID)) return false;
	if($_COOKIE['ProductID_' . $ID] != 'song') $db->ExecuteSQL("UPDATE `" . $cfg_dbprefix . "product` SET `ProductClick` = (`ProductClick` + 1) WHERE `ID` = $ID LIMIT 1"); //更新点击数
	@setcookie('ProductID_' . $ID,'song',time()+7200,"/"); //2H
	if(!$result = $db->SelectSQL("SELECT `ProductLang`,`ProductRela`,`ProductName`,`ProductNameColor`,`ProductBrand`,`ProductModel`,`ProductCoding`,`ProductSpeci`,`ProductColor`,`ProductPrice`,`ProductKeyWord`,`ProductPhoto1`,`ProductPhoto2`,`ProductSummary`,`ProductContent`,`ProductSecrecy`,`ProductNew`,`ProductRecommended`,`ProductAudit`,`ProductClick`,`ProductSort`,`ProductPublished`,`ProductTime` FROM `" . $cfg_dbprefix . "product` WHERE `ID` = $ID LIMIT 0,1;",0)) return false;
	list($ProductLang,$ProductRela,$ProductName,$ProductNameColor,$ProductBrand,$ProductModel,$ProductCoding,$ProductSpeci,$ProductColor,$ProductPrice,$ProductKeyWord,$ProductPhoto1,$ProductPhoto2,$ProductSummary,$ProductContent,$ProductSecrecy,$ProductNew,$ProductRecommended,$ProductAudit,$ProductClick,$ProductSort,$ProductPublished,$ProductTime) = $result[0];
	return true;
}
/*====================================================
友情链接调用[Links]
参数说明:
$Type：调用类型(0调用文字链接,1调用Logo链接)
$Class：采用的CSS样式名，默认样式为Links
$Column：显示的列数[每行要显示的文字(图片)数量]
$Row：显示的行数[每列要显示的文字(图片)数量]
$Lang：站点语言(第几种站点语言的Logo)
$Width：Logo宽度(单位px)
$Height：Logo高度(单位px)
====================================================*/
function Links($Type=1,$Class='Links',$Column=3,$Row=2,$Lang=1,$Width=88,$Height=31){
	global $db,$cfg_dbprefix;
	$SQL = "SELECT * FROM `" . $cfg_dbprefix . "link` WHERE `LinkIsAudit` = 1 && `LinkType` = $Type && `LnikLang` = $Lang ";
	$SQL .= "ORDER BY `LinkSort` DESC,`ID` ASC ";
	$SQL .= "LIMIT 0," . ($Column*$Row);
	$n = $db->SelectSQL($SQL,1);
	$result = '	<div class="' . $Class . '">' . "\n";
	for($i=0;$i<($Column*$Row);$i+=$Column){
		$result .= '		<ul>' . "\n";
			for($x=0;$x<$Column && (($i+$x)<count($n));$x++){
				$Text = $Type==0 ? $n[($i+$x)]['LinkWebName'] : '<img src="' . $n[($i+$x)]['LinkLogoUrl'] . '" width="' . $Width . '" height="' . $Height . '" border="0" />';
				$result .= '			<li>';
				$result .= '<a target="_blank" href="' . $n[($i+$x)]['LinkWebUrl'] . '">' . $Text . '</a>';
				$result .= '</li>' . "\n";	
			}
		$result .= '		</ul>' . "\n";
	}
	$result .= '	</div>' . "\n";
	unset($Type,$Text,$Class,$Column,$Row,$Lang,$Width,$Height,$i,$n,$x);
	return $result;
}

/*====================================================
更新点击数
$TableName:要更新的数据表名称
$Field:点击字段名
$ID:更新的ID号，为0时自动获取地址栏的ID值(默认值)
====================================================*/
function UpDatecClick($TableName,$Field,$ID=0){
	global $_GET,$_COOKIE;
	if ($ID==0) $ID = $_GET['ID']; if (!is_numeric($ID)) return false;
	$SQL = "UPDATE `blk_product` SET `ProductClick` = (`ProductClick`+1) WHERE `ID` =2 LIMIT 1 ";
	if($_COOKIE[$TableName . $Field . $ID] != 'song') @ExecuteSQL("UPDATE `" . $TableName . "` SET `" . $Field . "` = (`" . $Field . "` + 1) WHERE `ID` = $ID LIMIT 1"); //更新点击数
	@setcookie($TableName . $Field . $ID,'song',time()+7200,"/"); //2H
	return true;	
}
$db = new db;
$db->cfg_dbhost = $cfg_dbhost;
$db->cfg_dbuser = $cfg_dbuser;
$db->cfg_dbpwd = $cfg_dbpwd;
$db->cfg_dbname = $cfg_dbname;


//对系统配置表sysconfig查询
$Rs=$db->SelectSQL("select varname,value  from `" . $cfg_dbprefix . "sysconfig` where groupid=1   order by aid desc ");
/*==将变量和值重新组合成数组==*/
 foreach( $Rs as $i=>$n ){
   //$strvalue_arr[$i]=$n['value']; //这是合成以数字为索引的数组,数字索引从0开始
   $strvalue_arr[$n['varname']]=$n['value']; //这是合成以查询出字段varname的值(即字符串如字母或汉字即非数字)作为作为索引的
 }
/*==得到所有变量==*/ 
foreach( $Rs as $i=>$n ){
   $strvarname .='$'.$n['varname'].','; 
 }
 $attr_value=substr($strvarname,0,-1);  //表示截取从左边第0位和右边第一位之间的字符串
 extract($strvalue_arr);
 
?>