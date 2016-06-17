<?php
/**
 *
 * 网络营销控制器
 * @author uclnn
 *
 */
class MarketAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$maction->market();
				$market_contact = $maction->mobileMarket();
				$this->assign('market_contact',$market_contact);
				$this->m_index();exit;
			}
		}
		/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}*/
	}
	
	  public function index() {
    	$keyword = $_GET['keyword'];
    	if( !empty($keyword) ) {
    		$this->display($this->web_theme.':Market:list');
    	} else {
			$db = M('Market');
			$cid = $db->where(array('lang' => L('language'),'hardware' => 'pc'))->group("category_id")->findAll();
			foreach($cid as $key => $value){
				$cate.=$value['category_id'].',' ;
			}
			$cate = substr($cate,0,-1);
			$CateInfo = M('Category');
			$result = $CateInfo->where('id in ('.$cate.')')->select();
			$this->assign('list',$result);
			$this->display($this->web_theme.':Market:index');
    	}
    }
	
	function show(){
		$this->display($this->web_theme.':Market:show');
	}



	function m_index() {
		$this->display($this->mobile_theme.':Market:index');
	}
	
	
	function m_map() {
		$marketDao = M('Market');
		$lang = L('language');
		$contact = $marketDao->where(array('category_id'=>$_GET['cid'],'lang'=>$lang,'hardware' => 'mobile','is_publish'=>1,'image'=>'address'))->find();
		$this->assign('contact', $contact);
		$this->display($this->mobile_theme.':Inc:map');
	}
}
?>