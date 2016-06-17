<?php
/**
 *
 * 店铺形像控制器
 * @author uclnn
 *
 */
class StoreAction extends HomeAction
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

	public function show() {
		$this->display('show');
	}


	/**********************************手机************************************/

	public function m_index() {
		$categoryDao = M('Category');
		$cid = $categoryDao->where( array('alias'=>'mobile_store', 'is_publish'=>1, 'lang'=>'mobile') )->getField('my_id');

		$advertDao = M('Advert');
		$storeList = $advertDao->where(array('category_id'=>$cid,'is_publish'=>1,'lang'=>'mobile'))->select();
		$this->assign('storeList', $storeList);
		$this->assign('headTitle', '店铺形像');
		$this->display($this->mobile_theme.':Store:index');
	}

}
?>