<?php
/**
 *
 * 留言板控制器
 * @author uclnn
 *
 */
class GuestbookAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			} else if( ACTION_NAME=='joinform' ) {
				$this->m_joinform();exit;
			}
		}
	/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}
		*/
	}
	function index(){
		$this->display($this->web_theme.':Guestbook:index');
	}
	function show(){
		$this->display($this->web_theme.':Guestbook:show');
	}
	function see() {
		$this->display('see');
	}
	
	//保存留言
	public function guestbookSave() {
		if($_SESSION['verify'] != md5($_POST['verify'])) {
			$this->error ( '验证码错误，请注意填写' );
		}
		$guestbookDao = M('Guestbook');
		//$_POST['lang'] = cookie('think_language');
		$lang = L('language'); //获取当前语言
		$_POST['lang'] = $lang;
		$_POST['create_time'] = time();
		$_POST['hardware'] = 'pc';
		$bool = $guestbookDao->add($_POST);
		if( $bool!==false ) {
			$this->success ( '提交成功，我们将尽快回复您！' );
			//exit('1');
		} else {
			$this->error ( '异常' );
			//exit('0');
		}
	}

	function m_index() {
		$this->assign('headTitle', L(nav_guest));
		$this->display($this->mobile_theme.':Guestbook:index');
	}
	
	function m_addGuestbook() {
		$lang = L('language'); //获取当前语言
		$guestbookDao = M('Guestbook');
		$_POST['create_time'] = time();
		$_POST['hardware'] = 'mobile';
		$_POST['lang'] = $lang;
		if( $guestbookDao->add($_POST)!==false ) {
			exit('success');
		} else {
			exit('error');
		}
	}

}
?>