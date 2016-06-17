<?php
/**
 *
 * 在线加盟控制器
 * @author uclnn
 *
 */
class JoinAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$maction->categoryList(1187); //获取某个分类
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$maction->newsInfo($_GET['cid']);
				$maction->cidNewsInfo($_GET['cid']);
				$this->m_show();exit;
			} else if( ACTION_NAME=='joinform' ) {
				$this->m_joinform();exit;
			}
		}
		/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}*/
	}
	
	function index(){
		$this->display($this->web_theme.':Join:index');
	}
	function show(){
		$this->display($this->web_theme.':Join:show');
	}
	function apply(){
		$this->display($this->web_theme.':Join:apply');
	}
	//保存留言
	public function joinSave() {
		if($_SESSION['verify'] != md5($_POST['verify'])) {
			exit('verify_error');
		}
		$joinDao = M('Joinin');
		$_POST['lang'] = cookie('think_language');
		$_POST['create_time'] = time();
		$bool = $joinDao->add($_POST);
		if( $bool!==false ) {
			exit('1');
		} else {
			exit('0');
		}
	}

	function m_index() {
		$this->display($this->mobile_theme.':Join:index');
	}
	
	function m_show() {
		$this->display($this->mobile_theme.':Join:show');
	}
	
	function m_joinform() {
		$this->assign('headTitle', '加盟咨询');
		$this->display($this->mobile_theme.':Join:form');
	}
	
	function m_addJoinform() {
		$joininDao = M('Joinin');
		$_POST['create_time'] = time();
		if( $joininDao->add($_POST)!==false ) {
			exit('success');
		} else {
			exit('error');
		}
	}

}
?>