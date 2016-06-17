<?php

/**
 * 
 * 后台主框架控制器
 * @author uclnn
 *
 */
class IndexAction extends AdminAction {

	
	public function index() {
		$this->_assignModuleList();
		$this->display ( 'Layout:admin' );
	}
	public function part(){
		$this->_assignModuleList();
		$this->assign('headTitle','选择栏目');
		if($_GET['l']){
			$_SESSION['lang'] = $_GET['l'];
		}
		$this->assign('tips','选择管理的栏目');
		$this->display ();
	}
	//系统首页
	public function main() {
		$categoryDao = M('Category');
		$newsDao = M('News');
		$goodsDao = M('Goods');
		$guestbookDao = M('Guestbook');
		$advertDao = M('Advert');
		$linkDao = M('Link');
		$downloadDao = M('Download');
		$jobDao = M('Job');
		$jobrDao = M('JobResume');
		$memberDao = M('Member');
// 		$customDao = M('Custom');

		$categoryList = $categoryDao->where(array('lang'=>array('in',getSqlInLangs())))->select();
		
		$news_cids = $this->categoryIds($categoryList,19);
		$news_cids = substr($news_cids,1,strlen($news_cids));
		
		$goods_cids = $this->categoryIds($categoryList,20);
		$goods_cids = substr($goods_cids,1,strlen($goods_cids));
		
		$job_cids = $this->categoryIds($categoryList,27);
		$job_cids = substr($job_cids,1,strlen($job_cids));
		
		$advert_cids = $this->categoryIds($categoryList,23);
		$advert_cids = substr($advert_cids,1,strlen($advert_cids));
		
		$link_cids = $this->categoryIds($categoryList,24);
		$link_cids = substr($link_cids,1,strlen($link_cids));
		
		$download_cids = $this->categoryIds($categoryList,26);
		$download_cids = substr($download_cids,1,strlen($download_cids));
		
		
		$this->assign('newsCount', $newsDao->where(array('category_id'=>array('in',$news_cids)))->count());
		$this->assign('goodsCount', $goodsDao->where(array('category_id'=>array('in',$goods_cids)))->count());
		$this->assign('guestbookCount', $guestbookDao->count());
		$this->assign('guestbookCountRead0', $guestbookDao->where(array('read'=>0))->count());
		$this->assign('advertCount', $advertDao->where(array('category_id'=>array('in',$advert_cids)))->count());
		$this->assign('linkCount', $linkDao->where(array('category_id'=>array('in',$link_cids)))->count());
		$this->assign('downloadCount', $downloadDao->where(array('category_id'=>array('in',$download_cids)))->count());
		$this->assign('jobCount', $jobDao->where(array('category_id'=>array('in',$job_cids)))->count());
		$this->assign('jobrCount', $jobrDao->count());
		$this->assign('memberCount', $memberDao->count());
		$this->assign('todayMemberCount', $memberDao->where("(FROM_UNIXTIME(create_time,'%Y-%m-%d')='" . date ( 'Y-m-d', time () ) . "')")->count());
		
		$this->_assignModuleList();
		
		$this->display ();
	}
	
	function categoryIds($catArray, $id = 0 , $prefix = ''){
		
		static $formatCat = '';
		static $floor     = 0;
		foreach($catArray as $key => $val)
		{
				
			if($val['pid'] == $id)
			{
				$formatCat .= ','.$val['id'];
				unset($catArray[$key]);
				$floor++;
				$this->categoryIds($catArray, $val['id'] ,$prefix );
				$floor--;
	
			}
				
		}
		return $formatCat;
	}
	
	public function mainMenu() {
		exit;
	}

	public function category() {
		$this->assign('c_root', $_GET['c_root']);
		$this->display ();
	}

	//左边菜单
	public function sidemenu() {
		$selSort = $_GET['sort'];
		$pid = $_GET['pid'];
		$categoryDao = M('Category');
		$langin = $this->getSqlInLangs();
		$where['_string'] = "is_publish=1 AND hardware='".$_SESSION['hardware']."' AND lang = '".$_SESSION['lang']."' OR is_fixed=1";
		$dataList = $categoryDao->where( $where )->order('ordernum desc')->select();
		//echo $categoryDao->getlastsql();
	//	exit;
		Load('extend');
		$dataList = list_to_tree($dataList, 'id', 'pid','_child',$pid);
		//获取某个分类信息
		$obj = getCategoryTitle($pid,true);
		if(!json_parser($obj)){
			$obj['title'] = getDefNavTitle(json_decode($obj['title'],true),$_SESSION['lang'],true);
		}
		$this->assign('module',$obj['module']);
		$this->assign('alias', $obj['alias']);
		$this->assign('headTitle',$obj['title']);
		$this->assign('dataList', $dataList);
		$this->assign('tips','选择管理的分类');
		if(!$selSort){
			$this->display ();
		}else{
			
			$this->display ('Mobile/sort');
		}
	}
	
	//获取网站多语言SQL查询IN()参数
	protected function getSqlInLangs() {
		$categoryDao = M('Category');
		if( $_SESSION['hardware']=='pc' ) {
			$lang_pid = 3;
		} elseif( $_SESSION['hardware']=='mobile' ) {
			$lang_pid = 4;
		}
		$alias = $categoryDao->where(array('pid'=>$lang_pid,'is_publish'=>1))->field('alias')->select();
		$alias_count = count($alias);
		$langin = '';
		for ($i = 0; $i < $alias_count; $i++) {
			$langin .= "'".$alias[$i]['alias']."'";
			if( $alias_count-1 > $i ) {
				$langin .= ',';
			}
		}
		return $langin;
	}
	
	//改变当前语 言
	public function checkedLang() {
		$lang = $_GET['lang'];
		$_SESSION[C('USER_AUTH_KEY')]['lang'] = $lang;
	}
	
	//获取单个分类信息
	public function getCategory() {
		$id = $_REQUEST['id'];
		if( !empty($id) ) {
			$categoryDao = M('Category');
			$category = $categoryDao->find($id);
			if ( $this->isAjax() ) {
				exit(json_encode($category));
			} else {
				$this->assign('obj',$category);
			}
		}
	}
	
	//分类查找
	function selectCategoryByPid() {
		if( !empty($_GET['lang']) ) {
			$where['lang'] = $_GET['lang'];
		} else {
			$where['lang'] = array('in',getSqlInLangs());
		}
		if( !empty($_GET['hwe']) ) {
			$where['hardware'] = $_GET['hwe'];
		}
		if( !empty($_GET['pid']) ) {
			$where['pid'] = $_GET['pid'];
			$where['is_publish'] = 1;
			$categoryDao = M ( "Category" );
			$categoryList = $categoryDao->where ( $where )->order('hardware desc,lang desc,ordernum desc')->select ();
			$count = count($categoryList);
			for ($i = 0; $i < $count; $i++) {
				$hardware = $categoryList[$i]['hardware'];
				if($hardware=='pc') {
					$hardware_text = '电脑>';
				} elseif($hardware=='mobile') {
					$hardware_text = '手机>';
				}
				$title = $categoryDao->where(array('hardware'=>$hardware,'alias'=>$categoryList[$i]['lang']))->getField('title');
				$categoryList[$i]['title'] = '['.$hardware_text.substr($title, 0, 3).'] '.$categoryList[$i]['title'];
			}
			if( $this->isAjax() ) {
				$json ['list'] = $categoryList;
				exit(json_encode ( $json ));
			} else {
				$this->assign('categoryList', $categoryList);
			}
		}
	}
	//修改分类信息
	function sortEdit(){
		$id = $_GET['id'];
		$obj = getCategoryTitle($id,true);
		$this->assign('headTitle',$obj['title']);
		$this->assign('obj',$obj);
		$this->assign('tips','修改分类信息');
		$this->display('Index/edit-sort');
	}
	//修改分类
	function sortUpdate(){
		if(!$_POST['is_publish']){
			$_POST['is_publish'] = 0;
		}
		$_POST['update_time'] = time();
		$_POST['content'] = htmlspecialchars($_POST['content']);
		ajaxUpdate($_POST['id'],$_POST['dbName'],$_POST);
	}
	
	//手机分类输出
	function selectMobileCategoryByPid() {
		if( !empty($_GET['lang']) ) {
			$where['lang'] = $_GET['lang'];
		} else {
			$where['lang'] = array('in',getSqlInLangs());
		}
		if( !empty($_GET['hwe']) ) {
			$where['hardware'] = $_GET['hwe'];
		}
		if( !empty($_GET['pid']) ) {
			$where['pid'] = $_GET['pid'];
			$where['is_publish'] = 1;
			$categoryDao = M ( "Category" );
			$categoryList = $categoryDao->where ( $where )->order('hardware desc,lang desc,ordernum desc')->select ();
			$count = count($categoryList);
			for ($i = 0; $i < $count; $i++) {
				$hardware = $categoryList[$i]['hardware'];
				$title = $categoryDao->where(array('hardware'=>$hardware,'alias'=>$categoryList[$i]['lang']))->getField('title');
				$categoryList[$i]['title'] = '['.substr($title, 0, 3).'] '.$categoryList[$i]['title'];
			}
			if( $this->isAjax() ) {
				$json ['list'] = $categoryList;
				exit(json_encode ( $json ));
			} else {
				$this->assign('categoryList', $categoryList);
			}
		}
	}
	
}
?>