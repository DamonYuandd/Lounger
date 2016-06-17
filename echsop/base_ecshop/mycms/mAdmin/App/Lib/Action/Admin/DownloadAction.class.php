<?php
/**
 *
 * 下载管理控制器
 * @author uclnn
 *
 */
class DownloadAction extends AdminAction {


	function _initialize() {
		parent::_initialize ();
		$this->c_root = 26;
		$this->setModel('Download');
		$this->assign('c_root', $this->c_root);
	}

	public function index() {
		$cid = $_REQUEST['cid'];
		if( !empty( $cid ) ) {
			$categoryDao = D('Admin.Category');
			$category = $categoryDao->field('alias,tpl_one')->where(array('id'=>$cid))->find();
			$alias = $category['alias'];
			$tpl_one = $category['tpl_one'];
				
			if( $tpl_one=='auto' ) { //设置呈现样式为“自动”会自动选择下一级的第一个分类
				$this->goToCategoryFirst( $cid );
			} elseif( $tpl_one=='one' ) {
				$this->_oneContent($cid); //单页显示方式
			}
			if( $alias=='download_category' ) {
			    $this->downloadCategory($cid);exit;
			}
			$this->_dataPage($categoryDao, $cid, $where);
				
			$this->display ();
		}
	}

	public function downloadCategory( $cid ) {
		$_SESSION [C('USER_AUTH_KEY')]['backUrl'] = __APP__.'/Admin/Download/downloadCategory/cid/'.$cid;//返回列表连接

		$categoryDao = D('Admin.Category');
		$c_root = $categoryDao->getId('download_list', $this->lang);
		$_GET['pid'] = 26;
		$this->assign('c_root', 26);
		$this->assign('titleText', '分类');
		$this->_category();
	}

	public function upload(){

		$dir = $this->upload_root_path.'images/download/';
		$this->_upload2($dir);
	}

	public function edit(){
			
		$this->_edit();
		$this->display ();
	}

	public function add(){
		
		$this->_imgUploads('download');
		$this->_add2($_POST);
	}

	public function update(){
		$this->_deleteFile($this->upload_root_path.'download/');
		$this->_imgUploads('download');
		$this->_update2($_POST);
	}

	public function delete(){
		$this->_delete();
	}

	public function deleteImage() {
		exit($this->_deleteImage($this->upload_root_path.'images/download/'));
	}


	public function deleteById(){
		$this->_deleteFile($this->upload_root_path.'download/');
		$this->_deleteImage($this->upload_root_path.'download/');
		$this->_deleteById();
	}

	public function ordernum(){
		$this->_ordernum();
	}

	public function move(){
		$this->_move();
	}

	public function copy() {
		$this->_copy();
	}

	public function isPublish() {
		$this->_updateField('is_publish');
	}

	public function isHome() {
		$this->_updateField('is_home');
	}

	public function isTop() {
		$this->_updateField('is_top');
	}
}
?>