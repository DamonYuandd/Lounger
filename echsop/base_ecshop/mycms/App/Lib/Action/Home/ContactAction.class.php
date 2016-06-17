<?php
/**
 *
 * 联系我们控制器
 * @author uclnn
 *
 */
class ContactAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if(ACTION_NAME=='index'){
				$maction->market();
				$is_contact_contact = $maction->m_mobileContact('is_contact');
				$this->assign('is_contact',$is_contact_contact);
				$this->m_index();exit;
			}
			else if( ACTION_NAME=='show' ) {
				$maction->market();
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
	function map(){
		
		//$this->assign('obj',$obj);
		$this->display($this->web_theme.':Contact:map');
	}
	function index(){
		$categoryDao = M('Category');
		$lang = L('language'); 
		$category = $categoryDao->where( array('alias'=>'Contact/mode', 'is_publish'=>1, 'lang'=>$lang, 'hardware' => 'pc') )->find();
		if($category){
			$this->assign('checkContact','1');
		}else{
			$this->assign('checkContact','0');
		}
		$this->display($this->web_theme.':Contact:index');
	}
	function show(){
		$this->display($this->web_theme.':Contact:show');
	}
	function m_show() {
		$categoryDao = M('Category');
		$category = $categoryDao->where( array('alias'=>'Contact/index', 'is_publish'=>1, 'lang'=>'mobile') )->find();
		$this->assign('headTitle', L(nav_contact));
		$this->display($this->mobile_theme.':Contact:show');
	}
	function m_index() {
		$categoryDao = M('Category');
		$category = $categoryDao->where( array('alias'=>'Contact/index', 'is_publish'=>1, 'lang'=>'mobile') )->find();
		$this->assign('headTitle', L(nav_contact));
		$this->display($this->mobile_theme.':Contact:index');
	}
	function m_map() {
		$db = M('MobileContact');
		$lang = L('language');
		//$contact = $db->where(array('category_id'=>749,'is_publish'=>1,'image'=>'address'))->find();
		$contact = $db->where(array('hardware' =>'mobile','is_publish'=>1,'image'=>'address','lang'=>$lang))->find();
		$this->assign('contact', $contact);
		$this->display($this->mobile_theme.':Inc:map');
	}
	
	function m_weibo() {
		$systemDao = M('System');
		$system = $systemDao->where(array('lang'=>'mobile'))->find();
		$this->assign('headTitle', L(nav_weibo));
		$this->assign('system',$system);
		$this->display($this->mobile_theme.':Contact:weibo');
	}

}
?>