<?php
/**
 *
 * 优惠动态控制器
 * @author uclnn
 *
 */
class SaleAction extends HomeAction
{
	function _initialize() {
		parent::_initialize();

		if( $this->is_mobile==true ) {
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			}
		}
		/*
		if( !method_exists($this, ACTION_NAME) ) { //没有定制方法
			$this->display('index');exit;
		}*/
	}

	function show(){
		$this->display($this->web_theme.':Sale:show');
	}


	/**********************************手机************************************/

	public function m_index() {
		$advertDao = M('Advert');
		$saleList = $advertDao->where(array('category_id'=>720,'is_publish'=>1,'lang'=>'mobile','content'=>''))->select();
		$saleList2 = $advertDao->where(array('category_id'=>720,'is_publish'=>1,'lang'=>'mobile','content'=>array('neq','')))->select();
		$this->assign('saleList', $saleList);
		$this->assign('saleList2', $saleList2);
		$this->assign('headTitle', '优惠动态');
		$this->display($this->mobile_theme.':Sale:index');
	}

}
?>