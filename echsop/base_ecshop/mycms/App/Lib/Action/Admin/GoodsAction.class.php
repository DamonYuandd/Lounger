<?php
/**
 * 
 * 产品控制器
 * @author uclnn
 *
 */
class GoodsAction extends AdminAction {
	function _initialize() {
		parent::_initialize ();
		$this->setModel('Goods');
	}
	
	public function index() {
		$cid = $_REQUEST['cid'];
		$rowpage = $_REQUEST['rowpage'];		

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

			if( $alias=='goods_one_content' ) {
				$this->goToCategoryFirst( $cid );
			}

			$this->_dataPage($categoryDao, $cid, $where);
			
			$this->display ();
		}
	}
	
	public function isHomeList() {
		$categoryDao = D('Admin.Category');
		$where['is_home'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '网站后台 > '.$this->_getDefLangTitle2().' > 首页');
		$this->display ('index');
	}
	
	public function isTopList() {
		$categoryDao = D('Admin.Category');
		$where['is_top'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '网站后台 > '.$this->_getDefLangTitle2().' > 置顶');
		$this->display ('index');
	}
	
	public function isPublish1List() {
		$categoryDao = D('Admin.Category');
		$where['is_publish'] = 1;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '网站后台 > '.$this->_getDefLangTitle2().' > 已发布');
		$this->display ('index');
	}
	
	public function isPublish0List() {
		$categoryDao = D('Admin.Category');
		$where['is_publish'] = 0;
		$this->_dataPage( $categoryDao, $_SESSION['c_root'], $where );
		$this->assign('nav_site', '网站后台 > '.$this->_getDefLangTitle2().' > 未发布');
		$this->display ('index');
	}
	
	public function upfile(){
		
		$dir = $this->upload_root_path.'images/product/';
		$this->_upload2($dir);
	}
	
	//产品咨价
	public function inquire() {
		$goods_inquire = A('Admin.GoodsInquire');
		$goods_inquire->index();
		exit();
	}
	
	//商品分类
	public function category() {
// 		$cid = $_GET['id'];
// 		$_SESSION [C('USER_AUTH_KEY')]['backUrl'] = __APP__.'/Admin/Goods/category';//返回列表连接
		$_SESSION['category_action'] = 'Goods';
		$categoryDao = D('Admin.Category');
		//$this->assign('title', $categoryDao->getTitle($_SESSION['c_root']));
		$this->assign('nav_site', '网站后台 > '.$this->_getDefLangTitle2());
		$this->_category($where);
	}
	
	
	public function upload(){
				
		$this->display ();
	}
	
	//单页添加
	public function saveOne() {
		$this->_imgUploads('news');
		$this->_saveOne($_POST);
	}
	
	public function edit(){
		$this->_edit();
		$gpDao = M('GoodsPhoto');
		$photos = $gpDao->where(array('goods_id'=>$_GET['id']))->select();
		$this->assign('photos', $photos);
		$this->display ();
	}
	
	public function add(){
		try {
			$data = $this->_processData($_POST);
			$this->setJumpUrl( 'Goods/index/cid/'.$_SESSION['sidemenu_cid'].'/lang/'.$_SESSION['sidemenu_lang'] );
			if ($this->modelDao->add ( $data )!==false) {
				
				//上传产品图片
				$good_id = $this->modelDao->getLastInsID();
				//$this->uploadProduct($good_id);
				$gpDao = M('GoodsPhoto');
				$photoAdd['goods_id'] = $good_id;
				$photoAdd['ordernum'] = 30;
				foreach ($data['imageList'] as $key){
					if (!empty($key)){
						$photoAdd['image'] = $key;
						$gpDao->add($photoAdd);
					}
				}

				//$photo = $gpDao->where(array('goods_id'=>$good_id))->order('ordernum desc')->find();
				//$this->modelDao->where(array('id'=>$good_id))->setField('image',$photo['image']);
				
				//手机同步产品图片X
			/*	if (isset($data['synch_mobile'])) {
					$data['image'] = $photo['image'];
					$data['category_id'] = $this->_getModileCategoryId($data);
					$synch_msg = $this->_synchMobileList($data);
					$good_insid = $this->modelDao->getLastInsID();
					$gpDao = M('GoodsPhoto');
					$gphotos = $gpDao->where(array('goods_id'=>$good_id))->order('ordernum desc')->select();
					$gp_count = count($gphotos);
					for($i=0;$i<$gp_count;$i++){
						$gphoto = $gphotos[$i];
						unset($gphoto['id']);
						$gphoto['goods_id'] = $good_insid;
						$gpDao->add($gphoto);
					}
				}*/
				
				$this->success ( '添加成功！'.$synch_msg, $ajax );
			} else {
				$this->error ( '添加失败！', $ajax );
			}
		} catch ( Exception $e ) {
			$this->error ( '异常：' . $e->getMessage () );
		}
	}

	public function update(){
		$this->setJumpUrl( 'Goods/index/cid/'.$_SESSION['sidemenu_cid'].'/lang/'.$_SESSION['sidemenu_lang'] );
		$gpDao = M('Goods');
		if ($_POST['imageList']){
			$gpimgDao = M('GoodsPhoto');
			$gpimgDao->where(array('goods_id' => $_POST['id']))->delete();
			$photoAdd['goods_id'] = $_POST['id'];
			foreach ($_POST['imageList'] as $key){
					if (!empty($key)){
						$photoAdd['image'] = $key;
						$upImg = $gpimgDao->add($photoAdd);
					}
			}
		}
		$gp = $gpDao->where(array('id' => $_POST['id']))->save($_POST);
		if ($gp || $upImg){
			$this->success ( '修改成功！');
		}else{
			$this->error ( '修改失败！');
		}
		//$this->uploadProduct($_POST['id']);
		//	dump($_POST);
		//$this->_update2($_POST);
	}
	
	//上传产品图片
	private function uploadProduct($good_id) {
		$gpDao = M('GoodsPhoto');
		$photoList = $gpDao->where(array('goods_id'=>$good_id))->order('ordernum desc')->select();
		for($i=0; $i < 4; $i++) {
			if ( !empty($_FILES['image'.$i]) ) {
				$image = $this->_img_upload('product', 'image'.$i);
				if( empty($photoList[$i]) && !empty($image) ) {
					$gpDao->add(array('goods_id'=>$good_id,'image'=>$image));
				} elseif( !empty($image) ) {
					$gpDao->where(array('id'=>$photoList[$i]['id']))->setField('image', $image);
				}
			} else {
				continue;
			}
		}
	}
	
	//设置默认图片
	public function photoDef() {
		$id = $_GET['id'];
		$image = $_GET['image'];
		if( !empty($id) && !empty($image) ) {
			$goodsDao = M('Goods');
			$result = $goodsDao->where(array('id'=>$id))->setField('image',$image);
		}
		exit($result);
	}
	
	public function delete(){
		$this->_delete();
	}
	
	public function deleteById(){
		$this->_deleteById();
	}
	
	//删除封面
	public function deleteImage() {
		$gp_id = $_GET['gp_id'];
		if( !empty($gp_id) ) {
			$gpDao = M('GoodsPhoto');
			$image = $gpDao->where(array('id'=>$gp_id))->getField('image');
			$result = $gpDao->delete($gp_id);
			if( $result!==false ) {
				$path = $this->upload_root_path.'images/product/';
				unlink($path.'s_'.$image);
				unlink($path.'m_'.$image);
				exit(true);
			} else {
				exit(false);
			}
		} else {
			exit(false);
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
	public function groupUp(){
		//echo  dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/Public/images/product/';
		//exit;
		$this->display();
	}
	
	//swfu 上传图片
	public function sufuLoad(){
		
// Code for Session Cookie workaround
	if (isset($_POST["PHPSESSID"])) {
		session_id($_POST["PHPSESSID"]);
	} else if (isset($_GET["PHPSESSID"])) {
		session_id($_GET["PHPSESSID"]);
	}

	session_start();

	$POST_MAX_SIZE = ini_get('post_max_size');
	$unit = strtoupper(substr($POST_MAX_SIZE, -1));
	$multiplier = ($unit == 'M' ? 1048576 : ($unit == 'K' ? 1024 : ($unit == 'G' ? 1073741824 : 1)));

	if ((int)$_SERVER['CONTENT_LENGTH'] > $multiplier*(int)$POST_MAX_SIZE && $POST_MAX_SIZE) {
		header("HTTP/1.1 500 Internal Server Error");
		echo "POST exceeded maximum allowed size.";
		exit(0);
	}

// Settings
	$save_path =   dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/Public/images/product/';;
	$upload_name = "Filedata";
	$max_file_size_in_bytes = 2147483647;				// 2GB in bytes
	$extension_whitelist = array("jpg", "gif", "png");	//允许的文件
	$valid_chars_regex = '.A-Z0-9_ !@#$%^&()+={}\[\]\',~`-';				//允许的文件名字符
	
// Other variables	
	$MAX_FILENAME_LENGTH = 260;
	$file_name = "";
	$file_extension = "";
	$uploadErrors = array(
        0=>"文件上传成功",
        1=>"上传的文件超过了 php.ini 文件中的 upload_max_filesize directive 里的设置",
        2=>"上传的文件超过了 HTML form 文件中的 MAX_FILE_SIZE directive 里的设置",
        3=>"上传的文件仅为部分文件",
        4=>"没有文件上传",
        6=>"缺少临时文件夹"
	);

	if (!isset($_FILES[$upload_name])) {
		HandleError("No upload found in \$_FILES for " . $upload_name);
		exit(0);
	} else if (isset($_FILES[$upload_name]["error"]) && $_FILES[$upload_name]["error"] != 0) {
		HandleError($uploadErrors[$_FILES[$upload_name]["error"]]);
		exit(0);
	} else if (!isset($_FILES[$upload_name]["tmp_name"]) || !@is_uploaded_file($_FILES[$upload_name]["tmp_name"])) {
		HandleError("Upload failed is_uploaded_file test.");
		exit(0);
	} else if (!isset($_FILES[$upload_name]['name'])) {
		HandleError("File has no name.");
		exit(0);
	}
	
	$file_size = @filesize($_FILES[$upload_name]["tmp_name"]);
	if (!$file_size || $file_size > $max_file_size_in_bytes) {
		HandleError("File exceeds the maximum allowed size");
		exit(0);
	}
	
	if ($file_size <= 0) {
		HandleError("文件大小超过制定范围");
		exit(0);
	}


	$file_name = preg_replace('/[^'.$valid_chars_regex.']|\.+$/i', "", basename($_FILES[$upload_name]['name']));
	if (strlen($file_name) == 0 || strlen($file_name) > $MAX_FILENAME_LENGTH) {
		HandleError("请上传图片格式的文件");
		exit(0);
	}


	if (file_exists($save_path . $file_name)) {
		HandleError("已存在相同文件");
		exit(0);
	}

// Validate file extension
	$path_info = pathinfo($_FILES[$upload_name]['name']);
	$file_extension = $path_info["extension"];
	$is_valid_extension = false;
	foreach ($extension_whitelist as $extension) {
		if (strcasecmp($file_extension, $extension) == 0) {
			$is_valid_extension = true;

			break;
		}
	}
	if (!$is_valid_extension) {
		HandleError("Invalid file extension");
		exit(0);
	}
     
    $file_name = time().$file_name;
	if (!@move_uploaded_file($_FILES[$upload_name]["tmp_name"], $save_path.$file_name)) {
		HandleError("文件无法保存.");
		exit(0);
	}else{
		if (!empty($_GET['cid'])){
			$db = M('Goods');
			$data['title']  = $file_name;
			$data['hardware'] = $_GET['hardware'];
			$data['update_time'] = time();
			$data['create_time'] = time();
			$data['category_id'] = $_GET['cid'];
			$data['lang'] = $_GET['lang'];
			$data['image'] = $file_name;
			$data['is_publish'] = 1;
			$obj = $db->add($data);
			if($obj){
				echo $file_name;
			}
		}
	}

	//echo "File Received";
	exit(0);
	 }
	 
	 public function ajaxUp(){
	 //	$data['image'] = $_REQUEST['img'];
	 	$data['title'] = $_REQUEST['t'];
	 	$db = M('Goods');
	 	$obj = $db->where(array('image' => $_REQUEST['img']))->save($data);
	 	if($obj){
	 		echo 1; //更新成功
	 	}else{
	 		echo 2;
	 	}
	 }
	 //上传产品图片
	 public function imgsLoad(){
	 	$this->display();
	 }
}
?>