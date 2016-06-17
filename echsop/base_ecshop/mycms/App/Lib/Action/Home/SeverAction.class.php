<?php
/**
 *
 * 服务中心控制器
 * @author uclnn
 *
 */
class SeverAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$maction->newsList($_GET['cid'],5,'Sever');
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$maction->newsInfo($_GET['id']);
				$this->m_show();exit;
			}
		}
		/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}*/
	}

	function m_index() {
		$this->display($this->mobile_theme.':Sever:index');
	}
	
	function m_show() {
		$this->assign('headTitle', $obj['title']);
		$this->display($this->mobile_theme.':Sever:show');
	}
	function index(){
		$this->display($this->web_theme.':Sever:index');
	}
	function show(){
		$this->display($this->web_theme.':Sever:show');
	}

}
?>