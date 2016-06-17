<?php
/**
 *
 * 新闻控制器
 * @author uclnn
 *
 */
class NewsAction extends HomeAction
{
	function _initialize() {
		parent::_initialize();
		if( $this->is_mobile==true ) {
			$maction = A("Home.Mobile");
			if( ACTION_NAME=='index' ) {
				$maction->newsList($_GET['cid'],5);
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$maction->newsInfo($_GET['id']);
				$this->m_show();exit;
			}
		}
		/*
		if( !method_exists($this, ACTION_NAME) ) { //没有定制方法
			$this->display('index');exit;
		}
		*/
	}
	public function index2(){
		$this->display($this->web_theme.':News:index');
	}
	function show(){
		$this->display($this->web_theme.':News:show');
	}
	function index(){
		$this->display($this->web_theme.':News:index');
	}

	/**********************************手机************************************/

	public function m_index() {
		$this->display($this->mobile_theme.':News:index');
	}

	public function m_show() {
			$this->display($this->mobile_theme.':News:show');
	}
	//搜索
	public function search(){
		$cdb = M('Category');
		$al = 'News';
		if( $this->is_mobile==true ) {
			$hardware = 'mobile';
		}else{
			$hardware = 'pc';
		}
		//获取父类id
		$Getfid = $cdb->where(array('alias'=>$al,'is_publish'=>1))->find();
		//获取子类
		$cid = selectSubCategory($Getfid['id']);
		foreach($cid as $key => $value){
			$newsCid .= ','.$value['id'];
		}
		$newsCid = $Getfid['id'].$newsCid;
		//获取孙类
		foreach($cid as $key => $value){
			if($sun = selectSubCategory($value['id'])){
				for($i=0;$i<count($sun);$i++){
					$newsCid .= ','.$sun[$i]['id'];
				}
			}
		}
		$db = M('News');
		$char = trim($_GET['key']);
		if(!$char){
			$this->error ( '搜索的文字不能为空' );
		}
		$where = 'category_id in ('.$newsCid.') and title like \'%'.$char.'%\' and is_publish = 1 and lang = \''.L('language').'\' and hardware = \'pc\'';
		import ( "ORG.Util.Page" );
		$count = $db->where ( $where )->count ();
		$page = new Page ( $count, 7);
		$newsList = $db->where ( $where )->order('is_top desc, ordernum desc, create_time desc')->limit ( $page->firstRow . ',' . $page->listRows )->select ();
		$this->assign('key',$_GET['key']);
		$this->assign('dataList',$newsList);
		$this->assign('pageBar',$page->show());
		$this->display($this->web_theme.':News:search');
	}

}
?>