<?php
/**
 *
 * 关于我们控制器
 * @author uclnn
 *
 */
class VideoAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();
		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$this->m_show();exit;
			}
		}

		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}
	}
	function videoShow(){
		$db = M('Video');
		$re = $db->where(array('is_show' => 1,'is_publish' => 1))->find();
		$this->assign('result',$re);
	}
	function index(){
		$this->videoShow();
		$this->display($this->web_theme.':Video:index');
	}
	function m_index() {
		$this->videoShow();
		$this->display('Mobile:Video:index');
	}
	
	function m_show() {
		$this->display('Mobile:Video:show');
	}

}
?>