<?php
/**
 * 
 * 信息管理控制器
 * @author uclnn
 *
 */
class NewsAction extends AdminAction {
	
	function _initialize() {
		parent::_initialize ();
		$this->setModel('News');
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
			$this->assign('tips','请选择信息');
			$this->_dataPage($categoryDao, $cid, $where);
			$this->display ();
		}
	}
	
	public function isHomeList() {
		$categoryDao = D('Admin.Category');
		$where['is_home'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2().' > 首页');
		$this->display ('index');
	}
	
	public function isTopList() {
		$categoryDao = D('Admin.Category');
		$where['is_top'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2().' > 置顶');
		$this->display ('index');
	}
	
	public function isPublish1List() {
		$categoryDao = D('Admin.Category');
		$where['is_publish'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2().' > 已发布');
		$this->display ('index');
	}
	
	public function isPublish0List() {
		$categoryDao = D('Admin.Category');
		$where['is_publish'] = 0;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2().' > 未发布');
		$this->display ('index');
	}
	
	
	//单页添加
	public function saveOne() {
		$this->setJumpUrl( 'News/index/cid/'.$_SESSION['sidemenu_cid'].'/lang/'.$_SESSION['sidemenu_lang'] );
		$image = $this->_img_upload('news');
		if( !empty($image) ) {
			$_POST['image'] = $image;
		}
		$this->_saveOne($_POST);
	}
	
	public function edit(){
		$this->_edit();
		$this->assign('tips','可修改该信息');
		$this->display('Inc/edit_page');
	}
	
	public function add(){
		$this->setJumpUrl( 'News/index/cid/'.$_SESSION['sidemenu_cid'].'/lang/'.$_SESSION['sidemenu_lang'] );
		$image = $this->_img_upload('news');
		if( !empty($image) ) {
			$_POST['image'] = $image;
		}
		$this->_add2($_POST);
	}

	public function update(){
		$this->setJumpUrl( 'News/index/cid/'.$_SESSION['sidemenu_cid'].'/lang/'.$_SESSION['sidemenu_lang'] );
		$image = $this->_img_upload('news');
		if( !empty($image) ) {
			$_POST['image'] = $image;
		}
		$this->_update2($_POST);
	}

	
	//删除封面
	public function deleteImage() {
		exit($this->_deleteImage($this->upload_root_path.'images/news/'));
	}
	
	public function delete(){
		if( isset( $_GET['id'] ) ) {
			$this->_deleteById();
		} else {
			$this->_delete();
		}
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
	
	
	///////////////////////////分类管理
	
	public function category() {
		$_SESSION['category_action'] = 'News';
		$categoryDao = D('Admin.Category');
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2());
	
		Load ( 'extend' );
		$categoryDao = M( 'Category' );
		$where['lang'] = array('in',getSqlInLangs());
		$where['hardware'] = $_SESSION['hardware'];
		$categoryList = $categoryDao->where($where)->order('lang desc,ordernum desc')->findAll ();
		$categoryList = list_to_tree ( $categoryList, 'id', 'pid', '_child', $_SESSION['c_root'] );
		$this->assign ( 'categoryList', $categoryList );
		$this->display ('category');
	}
	
	public function editAdd() {
		$categoryDao = M ( "Category" );
		$category = $categoryDao->where(array('id'=>$_GET['id']))->field('lang')->find();
		$this->assign('obj', array('pid'=>$_GET['id'],'lang'=>$category['lang']));
		$this->assign('nav_site', '互易移动 > '.$this->_getDefLangTitle2());
		$this->display('category_edit');
	}

}
?>