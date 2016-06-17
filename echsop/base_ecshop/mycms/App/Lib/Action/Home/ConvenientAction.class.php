<?php
/**
 *
 * 便民服务控制器
 * @author uclnn
 *
 */
class ConvenientAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();
		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$maction->newsList($_GET['cid'],5,'Convenient');
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
		$this->display($this->mobile_theme.':Convenient:index');
	}
	
	function m_show() {
		$this->assign('headTitle', $obj['title']);
		$this->display($this->mobile_theme.':Convenient:show');
	}
	function index(){
		$this->display($this->web_theme.':Convenient:index');
	}
	function show(){
		$this->display($this->web_theme.':Convenient:show');
	}

}
?>