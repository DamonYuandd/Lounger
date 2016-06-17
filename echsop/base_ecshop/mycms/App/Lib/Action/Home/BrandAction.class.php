<?php
/**
 *
 * 品牌介绍控制器
 * @author uclnn
 *
 */
class BrandAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			$cid = $this->getCid('Brand/index');
			$cid = isset($_GET["cid"])?$_GET["cid"]:$cid;	//设置默认值
			$maction->cidNewsInfo($cid);	
			$this->assign('headTitle', '品牌介绍');
		//	$this->assign('headTitle', $obj['title']);
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$this->m_show();exit;
			}
		}
		/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}
		*/
	}
	
	function m_show() {
		$this->display($this->mobile_theme.':Brand:show');
	}
	function m_index(){
		$this->display($this->mobile_theme.':Brand:index');
	}
	function index(){
		$this->display($this->web_theme.':Brand:index');
	}
	function show(){
		$this->display($this->web_theme.':Brand:show');
	}

}
?>