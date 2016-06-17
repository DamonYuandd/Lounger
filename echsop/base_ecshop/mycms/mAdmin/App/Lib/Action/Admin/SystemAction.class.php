<?php
/**
 *
 * 系统设置
 * @author uclnn
 *
 */
class SystemAction extends AdminAction {
	
	function _initialize() {
		parent::_initialize ();
	}
	
	public function index() {
		$cid = $_REQUEST ['cid'];
		if ( !empty ( $cid ) ) {
			if($cid == 'sel'){
				$this->sel();exit;
			}
			if ($cid == 'base') {
				$this->assign('tips','修改网站基本信息');
				$this->assign('headTitle','网站基本信息');
				$this->base ();exit;
			} else if ($cid == 'seo') {
				$this->assign('tips','修改网站SEO信息');
				$this->assign('headTitle','网站SEO设置');
				$this->seo ();exit;
			} else if ($cid == 'email') {
				$this->email ();exit;
			} else if ($cid == 'contact') {
				$this->contact ();exit;
			} else if ($cid == 'theme') {
				$this->assign('headTitle','更换网站风格');
				$this->theme ();exit;
			} else if ($cid == 'domain') {
				$this->domain ();exit;
			} else if ($cid == 'user') {
				$userA = A('Admin.User');
				$userA->index();exit;
			} else if ($cid == 'tertiarycode') {
				$this->tertiarycode();exit;
			}
		}
	}
	
	public function tertiarycode() {
		$commonDao = M('Common');
		$obj = $commonDao->where(array('id'=>1))->find();
		$this->assign('obj', $obj);
		$this->display ( 'tertiarycode' );
	}
	
	public function saveTertiaryCode() {
		$commonDao = M('Common');
		
		$flow_code = $_POST['flow_code'];
		if( !empty($flow_code) ) {
			$end_index = strpos($flow_code,'</script>');
			$end_str = substr($flow_code,0,$end_index+9);
			if(strpos($end_str,'cnzz.com/')>0) {
				$_POST['flow_code'] = $end_str;
			} else {
				$commonDao->where(array('id'=>1))->setField('flow_code','');
				$this->error('非法流量统计代码');exit;
			}
		}
		
		$share_plug = $_POST['share_plug'];
		if( !empty($share_plug) ) {
			$end_index = strpos($share_plug,'</script>');
			$end_str = substr($share_plug,0,$end_index+9);
			
			if(strpos($end_str,'<div id="bdshare"')>0) {
				$_POST['share_plug'] = $share_plug;
			} else {
				$commonDao->where(array('id'=>1))->setField('share_plug','');
				$this->error('非法分享代码');exit;
			}
		}
		
		
		$weibo_plug = $_POST['weibo_plug'];
		if( !empty($weibo_plug) ) {
			$end_index = strpos($weibo_plug,'</iframe>');
			$end_str = substr($weibo_plug,0,$end_index+9);
			
			if(strpos($end_str,'http://widget.weibo.com/')>0 || strpos($end_str,'http://show.v.t.qq.com/')>0) {
				$_POST['weibo_plug'] = $end_str;
			} else {
				$commonDao->where(array('id'=>1))->setField('weibo_plug','');
				$this->error('非法微博秀插件');exit;
			}
		}
		
		$customer_code = $_POST['customer_code'];
		if( !empty($customer_code) ) {
			$end_index = strpos($customer_code,'</script>');
			$end_str = substr($customer_code,0,$end_index+9);
				
			if(strpos($end_str,'http://chat.53kf.com/')>0) {
				$_POST['customer_code'] = $end_str;
			} else {
				$commonDao->where(array('id'=>1))->setField('customer_code','');
				$this->error('非法在线客服代码');exit;
			}
		}
		
		$qq_nums = $_POST['qq_nums'];
		if( !empty($qq_nums) ) {
			$qq_nums = explode(',',$qq_nums );
			for ($i = 0; $i < 4; $i++) {
				if(empty($qq_nums[$i])) {
					break;
				}
				$qq_nums_str.=$qq_nums[$i];
				if($i<4){
					$qq_nums_str.=',';
				}
			}
			$_POST['qq_nums'] = substr($qq_nums_str,0,strlen($qq_nums_str)-1);
		}
		

		$obj = $commonDao->where(array('id'=>1))->find();
		if( !empty($obj) ) {
			$result = $commonDao->where(array('id'=>1))->save($_POST);
		} else {
			$_POST['id'] = 1;
			$result = $commonDao->add($_POST);
		}
		if( $result!==false ) {
			$this->success ( '保存成功！' );
		} else {
			$this->error('保存失败！');
		}
	}
	//网站基础信息
	public function base() {
		$this->assign('obj',$system);
		$this->display('Mobile/base');
	}
	//系统选择栏目
	public function sel() {
		$this->display('Mobile/system_list');
			//$this->display ( 'Mobile/base' );
	}
	public function contact() {
		$this->display ( 'contact' );
	}
	
	public function domain() {
		$_GET['cid'] = 774;
		$mobileA = A('Admin.Mobile');
		$mobileA->domain();
	}

	public function seo() {
			$this->display ( 'Mobile/seo' );
	}

	public function email() {
		$this->display ( 'email' );
	}

	public function theme() {
		$ctplDao = D('Admin.CategoryTpl');
		$nowStyle = $ctplDao->where(array('id'=>$_GET['ctplid']))->find();
		if(!$nowStyle){
			$nowStyle['title'] = '全部风格';
		};
		$this->assign('nowTplStyle',$nowStyle);
		$this->assign('ctplList',$ctplDao->where(array('pid'=>100))->select());
		$obj = $this->_getTheme();
		$templateDao = D('Admin.Template');
		$objTheme = $templateDao->where(array('number'=>$this->commonInfo['mobile_theme']))->find();
		$obj['themeImages'] = $objTheme['image'];
		$this->assign('obj', $obj);
		$where['hardware'] = $_SESSION['hardware'];
		$where['is_publish'] = 1;
		if( !empty($_GET['ctplid']) ) {
			$where['category_id']=$_GET['ctplid'];
		}
		
		$tpl = $templateDao->where($where)->select();
		if(!$tpl){
			$tpl[0]['number'] = '暂无该资料';
		}
		$this->assign('tips','修改网站风格');
		$this->assign('templateList',$tpl);
		$this->display ( 'Mobile/theme' );
	}
	
	private function _getTheme() {
		$commonDao = M('Common');
		return $commonDao->where(array('id'=>1))->find();
	}

	// 保存基本设置、SEO设置、邮箱设置
	public function saveSetting() {
		try {
			$image = $this->_img_upload('mobile','image',false);
			$app_logo = $this->_img_upload('mobile','app_logo',false);
			if( !empty($image) ) {
				$_POST['image'] = $image;
			}
			if( !empty($app_logo) ) {
				$_POST['app_logo'] = $app_logo;
			}
			$this->setModel ( 'System' );
			if( empty($_POST ['lang']) ) {
				$_POST ['lang'] = $_SESSION['lang'];
			}
			$where ['hardware'] = 'mobile';
			$where ['lang'] = $_POST ['lang'];
			$count = $this->modelDao->where ( $where )->count ();
			if ($count > 0) {
				//二维码开启LOGO
				$commonDao = M('Common');
				$commonDao->where(array('id'=>1))->save(array('is_qrcode_add_logo'=>$_POST['is_qrcode_add_logo']));
				$result = $this->modelDao->where ( $where )->save ( $_POST );
				if( $result!==false ) {
					$synch_msg = $this->_synchSystemOne();
					echo '1';
				//	$this->success ( '修改成功！'.$synch_msg );
				} else {
					echo '2';
				//	$this->error( '修改失败！' );
				}
			} else{
				if( !empty($_POST['website']) ) {
					$_POST['seo_title'] = $_POST['website'];
				}
				$result = $this->modelDao->add ( $_POST );
				if( $result!==false ) {
				//	$synch_msg = $this->_synchSystemOne();
					echo '1';
				//	$this->success ( '添加成功！'.$synch_msg );
				} else {
					echo '2';
				//	$this->error( '添加失败！' );
				}
			}
		} catch ( Exception $e ) {
					echo '2';
			//$this->error ( '异常：' . $e->getMessage () );
		}
	}
	
	//保存Seo设置
	public function saveSeo(){
		$db = M('system');
		$where ['hardware'] = 'mobile';
		if( empty($_POST ['lang']) ) {
				$_POST ['lang'] = $_SESSION['lang'];
		}
		$where ['lang'] = $_POST ['lang'];
		$result = $db->where ( $where )->save ( $_POST );
		if($result == 1) {
					//$synch_msg = $this->_synchSystemOne();
					echo '1';
				//	$this->success ( '修改成功！'.$synch_msg );
				} else {
				//	dump($result);
					echo '2';
				//	$this->error( '修改失败！' );
				}
	}
	
	protected function _synchSystemOne() {
		try {
			$where ['hardware'] = $_SESSION ['hardware'];
			$where ['lang'] = $_POST['lang'];
			if( !empty($_POST['website']) && $_SESSION ['hardware']=='pc' ) {
				$field = 'hardware,image,website,domain,icpnumber,copyright';
			} else if( !empty($_POST['company']) && $_SESSION ['hardware']=='pc' ) {
				$field = 'hardware,company,linkman,telephone,fax,address,postcode,email,is_twoCode';
			} else if( !empty($_POST['seo_title']) ) {
				$field = 'hardware,seo_title,seo_keywords,seo_description';
			} else if( !empty($_POST['website']) && $_SESSION ['hardware']=='mobile' ) {
				$field = 'hardware,image,app_logo,website,domain,icpnumber,copyright,credible';
			}
			$data = $this->modelDao->where( $where )->field($field)->find();
			$synch_lang = $_POST['synch_lang'];
			if( !empty($synch_lang) ) {
				foreach ($synch_lang as $value) {
					$where ['lang'] = $value;
					$system = $this->modelDao->where( $where )->find();
					if( !empty($system) ) {
						unset($data['id'],$data['synch_lang']);
						$system = $data;
						$system['lang'] = $value;
						$result = $this->modelDao->where($where)->save ( $system );
					} else {
						unset($data['id']);
						$data["lang"] = $value;
						$result = $this->modelDao->add ( $data );
					}
				}
				if( $result!==false ) {
					return true;
					//	return '同步语言成功！';
				} else {
					return false;
				//	return '同步语言失败！';
				}
			}
		} catch ( Exception $e ) {
			$this->error ( '异常：' . $e->getMessage () );
		}
	}
	public function themeShow(){
		$templateDao = D('Admin.Template');
		$obj = $templateDao->where(array('number'=>$_POST['mobile_theme']))->find();
		echo json_encode($obj);
	}
	//主题保存
	public function saveTheme() {
		$commonDao = M('Common');
		$bool = $commonDao->where(array('id'=>1))->save($_POST);
		if($bool !== false){
			echo '1';
		}else{
			echo '2';
		}
	}

	// ajax获取空间大小
	public function getSpaceSize() {
		$size = $this->getDirSize ( $this->upload_root_path );
		$size = $size+20000000;
		echo getRealSize ( $size );
	}

	// 获取虚拟空间使用大小
	private function getDirSize($dir) {
		$handle = opendir ( $dir );
		while ( false !== ($FolderOrFile = readdir ( $handle )) ) {
			if ($FolderOrFile != "." && $FolderOrFile != "..") {
				if (is_dir ( "$dir/$FolderOrFile" )) {
					$sizeResult += $this->getDirSize ( "$dir/$FolderOrFile" );
				} else {
					$sizeResult += filesize ( "$dir/$FolderOrFile" );
				}
			}
		}
		closedir ( $handle );
		return $sizeResult;
	}
}
?>