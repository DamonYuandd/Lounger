<?php
/**
 *
 * 当没有方法存在控制器
 * @author uclnn
 *
 */
class OtherAction extends HomeAction {
	function _initialize() {
		parent::_initialize ();
	}
	function index(){
	
	//	$this->display($this->web_theme.':Other:index');
	}
	function show(){
		$this->display($this->web_theme.':Other:show');
	}
	function news(){
		if($this->is_mobile==true){
			$this->assign('db','News');
			$this->display($this->mobile_theme.':Other:news');
		}else{
			$this->display($this->web_theme.':Other:news');
		}
	}
	function about(){
		if($this->is_mobile==true){
			$this->assign('db','News');
			$this->display($this->mobile_theme.':Other:about');
		}else{
			$this->display($this->web_theme.':Other:about');
		}
	}
}
?>