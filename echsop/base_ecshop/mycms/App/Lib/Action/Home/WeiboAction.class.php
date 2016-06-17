<?php
/**
 *
 * 关于我们控制器
 * @author uclnn
 *
 */
class WeiboAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$this->m_show();exit;
			}
		}

		/*if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}*/
	}
	function show(){
		$this->display($this->web_theme.':Weibo:show');
	}
	function index(){
		$result = commonInfo();
		$this->assign('obj',$result);
		$this->display($this->web_theme.':Weibo:index');
	}
	function m_index() {
		$result = commonInfo();
		$this->assign('obj',$result);
		$this->assign('headTitle', L(nav_weibo));
		$this->display($this->mobile_theme.':Weibo:index');
	}
	function share(){
		$this->assign('headTitle', L(web_share));
		$this->display($this->mobile_theme.':Weibo:share');
	}
}
?>