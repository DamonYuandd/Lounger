<?php
/**
 *
 * 首页控制器
 * @author uclnn
 *
 */
class IndexAction extends HomeAction
{
	function _initialize() {
		parent::_initialize();
		
	if( $this->is_mobile==true ) {
		$maction = A("Home.Mobile");
			if( ACTION_NAME=='downLoad' ) {
				$this->m_downLoad();exit;
			}else if(ACTION_NAME == 'index'){
				$this->indexGoods();
				$aboutInfo = getNewsByAlias('About/introduction');
				if(!$aboutInfo){
					$aboutInfo = getNewsByAlias('About/indexInfo');
					if(!$aboutInfo){
						$aboutInfo = oneWidget('About');
					}
				}
				if($this->mobile_theme == 'ZM00001'){
					$maction->newsList($_GET['cid'],10,'News',1);
				}
				$this->assign('aboutInfo',$aboutInfo);
				$this->videoShow();
				$is_home_contact = $maction->m_mobileContact('is_home');
				$this->assign('home_contact',$is_home_contact);
				$this->m_index();exit;
			}
		}
		
	}

	public function index() {	
		$this->indexGoods();
		$this->assign('indexNews',getNewsByAlias('About/indexInfo'));
		$this->assign('goodsCate',GoodsCate()); //产品分类
		$this->assign('indexNewsList',$this->indexNewsList('News'));
		$this->display($this->web_theme.':Index:index');
	}
	//首页新闻列表
	public function indexNewsList($alias){
		$cate = M('Category');
		$Cid = $cate->where(array('alias'=> $alias,'is_publish'=>1))->find();
		if( $this->is_mobile==true ) {
			$hardware = 'mobile';
		}else{
			$hardware = 'pc';
		}
		$Ftitle = $cate->where(array('pid' => $Cid['id'],'hardware' => $hardware,'is_publish' => 1,'lang' => L('language')))->select();
		foreach($Ftitle as $key => $value){
			$newsCid .= ','.$value['id'];
		}
		$newsCid = $Cid['id'].$newsCid;
		$db = M('News');
		$result = $db->where('category_id in ('.$newsCid.') and lang = \''.L('language').'\' and is_home = 1')->order('is_top desc, ordernum desc, create_time desc')->select();
		return $result;
	}
	//首页产品
	public function indexGoods(){
		$cdb = M('Category');
		$al = 'Goods';
		if( $this->is_mobile==true ) {
			$hardware = 'mobile';
		}else{
			$hardware = 'pc';
		}
		//获取父类id
		$Getfid = $cdb->where(array('alias'=>$al,'is_publish'=>1))->find();
		//获取子类
		$cid = selectSubCategory($Getfid['id']);
		foreach($cid as $key => $value){
			$newsCid .= ','.$value['id'];
		}
		$newsCid = $Getfid['id'].$newsCid;
		//获取孙类
		foreach($cid as $key => $value){
			if($sun = selectSubCategory($value['id'])){
				for($i=0;$i<count($sun);$i++){
					$newsCid .= ','.$sun[$i]['id'];
				}
			}
		}
		//获取曾孙类
		$zs = $cdb->where(array('pid' => array('in',$newsCid)))->select();
		foreach($zs as $key => $value){
			$newsCid .= ','.$value['id'];
		}
		$db = M('Goods');
		$result = $db->where(array('category_id'=>array('in',$newsCid),'is_home' => 1, 'is_publish' => 1,'hardware' => $hardware,'lang'=>L('language')))->order('is_top desc, ordernum desc, create_time desc')->select();
		$this->assign('list',$result);
	}
	public function m_index() {
		$this->assign('headTitle', $this->system['seo_title']);
		$this->display($this->mobile_theme.':Index:index');
	}
	
	public function m_downLoad()
	{
		if($_GET['hw'] == 'pc' || !$_GET['hw']){	//下载PC的联系信息
			$obj = pcContactInfo();
			$getdata = 'ADR:'.$obj['address']."\n"	//获取联系信息
			.'TEL;CELL:'.$obj['telephone']."\n"
			.'EMAIL:'.$obj['email']."\n";  
				
			$str='BEGIN:VCARD'."\n".'VERSION:2.1'."\n"	//整合联系方式
				.'N;CHARSET=UTF-8;ENCODING=QUOTED-PRINTABLE:'.$obj['company'].';'."\n"
				.$getdata
				.'END:VCARD';
			}else if($_GET['hw'] == 'mobile'){		//下载手机版的联系信息
				$lang = L('language');
				$db = M('mobile_contact');
				$system = M('system');
				$sysInfo = $system->where(array('hardware'=> 'mobile','lang' => $lang))->find();
				$data = $db->where(array('hardware'=> 'mobile','lang' => $lang))->select();
				for($i=0;$i<count($data);$i++)
				{
					if($data[$i]['content_type'] == 'address')
					{
						$data[$i]['get'] = 'ADR:'.$data[$i]['content']."\n";
					}					
					if($data[$i]['content_type'] == "phone")
					{
						$data[$i]['get'] = 'TEL;CELL:'.$data[$i]['content']."\n";
					}
					if($data[$i]['content_type'] == "mail")
					{
						$data[$i]['get'] = 'EMAIL:'.$data[$i]['content']."\n";
					}
					
					
					$getdata .= $data[$i]['get'];
				}
				$str='BEGIN:VCARD'."\n".'VERSION:2.1'."\n"
				.'N;CHARSET=UTF-8;ENCODING=QUOTED-PRINTABLE:'.$sysInfo['company'].';'."\n"
				.$getdata
				.'END:VCARD';
			}
			$file_name = '1.vcf';
			$file_path = realpath(dirname(__FILE__));
			$byte = file_put_contents($file_name,$str);
			if($byte > 0) {
				
				if(!file_exists($file_path)){
					echo $file_path;
					$this->error('找不到文件');
				}
				//$fp=fopen($file_path,"r");
				$fp=fopen($file_path,"r");
				$file_size=filesize($file_path);
				//下载文件需要用到的头
				Header("Content-type: application/octet-stream");
				Header("Accept-Ranges: bytes");
				Header("Accept-Length:".$file_size);
				Header("Content-Disposition: attachment; filename=".basename($file_name));
				readfile($file_name);
			}else
			{
				echo "网络原因导致失败";
			}
	}
	//验证码生成
	public function verify() {
		$type = isset ( $_GET ['type'] ) ? $_GET ['type'] : 'gif';
		import ( "ORG.Util.Image" );
		Image::buildImageVerify ( 4, 1, $type );
	}
	//二维码方法
public function erweima(){
	if($_GET['hw'] == 'pc' || !$_GET['hw']){
		$hw = 'pc';
	}else{
		$hw = 'mobile';
	}
	$db = M('System');
	$lang = L('language');
	$br = ";\r\n";
	import ( "ORG.Util.Phpqrcode" );
	if($hw == 'pc'){ //PC的联系信息
		$obj = $db->where(array('hardware' => 'pc' ,'lang' => $lang))->find();
	}else{
		$mdb = M('MobileContact');
		$result = $mdb->where(array('hardware' => 'mobile','lang' => $lang,'is_contact' => 1,'is_publish' => 1))->select();
	}
	if($hw == 'pc'){
	$data = '公司名称：'.$obj['company'].$br.'联系人：'.$obj['linkman'].$br.'电话：'.$obj['telephone'].$br.'联系地址：'.$obj['address'].$br.'E-mail：'.$obj['email'].$br."\r\n\r\n".'收藏名片：'.'http://'.$_SERVER['HTTP_HOST'].'/0-Y+09_v2/index.php/Index/m_downLoad/hw/'.$hw;
	}else{
		if(!$_GET['url']){
			$data .='http://'.$_SERVER['HTTP_HOST'].'/index.php/Index';
	    }else{
			$data .= 'http://'.$_GET['url']; 
		} 
	//	$data .='链接网址：'.'http://'.$_GET['url']; 
		//$data .= '收藏名片：'.'http://'.$_SERVER['HTTP_HOST'].'/index.php/Index/m_downLoad/hw/'.$hw;
	}
	$level = 'L';
    $size = 4;
	QRcode::png($data, false, $level, $size);
	}
}
?>