<?php
/**
 * 
 * @author uclnn
 *
 */
class EmptyAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();
	}
	
	public function index() {
		//$this->assign('alias', MODULE_NAME);
		$this->display('Index:'.MODULE_NAME);
	}


}
?>