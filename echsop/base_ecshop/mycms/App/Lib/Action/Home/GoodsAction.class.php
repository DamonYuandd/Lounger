<?php
/**
 * 
 * 产品控制器
 * @author uclnn
 *
 */
class GoodsAction extends HomeAction
{
	function _initialize() {
        parent::_initialize();
	
        if( $this->is_mobile==true ) {
			$maction = A('Home.Mobile');
            if( ACTION_NAME=='index' ) {
				if($this->mobile_theme == 'YM17002'){	//首页有分类以及对应产品
					$result = $maction->m_indexGoods(5,4);
					$this->assign('result',$result);
				}
           		if($this->mobile_theme == 'YM11001'){	//首页有分类以及对应产品
					$result = $maction->m_indexGoods(3,4);
					///dump($result);
					$this->assign('result',$result);
				}
				if($this->mobile_theme == 'YM16001'){
					//$result = $maction->m_indexGoods(5,3);
					$maction->m_sortGoods(5,3);
				//	$this->assign('result',$result);
				}
				else{
					if($this->mobile_theme == 'YM04001'){
						$maction->productList($_REQUEST['cid'],6); //产品列表
					}else{
                		$maction->productList($_REQUEST['cid']); //产品列表
					}
				}
                $this->m_index();exit;
            } else if( ACTION_NAME=='show' ) {
				$maction->goodInfo($_GET['id']); //产品详情
                $this->m_show();exit;
            } else if(ACTION_NAME=='list'){
				$maction->productList($_REQUEST['cid']); //产品列表
				$this->m_list();exit;
			}
        }
        /*
        if( !method_exists($this, ACTION_NAME) ) {
        	$this->display('index');exit;
        }*/
    }
    
    public function show() {
    	$this->display($this->web_theme.':Goods:show');
    }
    
    function index(){
		$this->display($this->web_theme.':Goods:index');
	}
    /**********************************手机************************************/
    
    public function m_index() {
        $this->display($this->mobile_theme.':Goods:index');
    }
    
    public function m_show() {
        $this->display($this->mobile_theme.':Goods:show');
    }
	public function m_list(){
		 $this->display($this->mobile_theme.':Goods:list');
	}
    
    //添加产品资讯
    public function m_addInquire() {
    	$giDao = M('GoodsInquire');
    	$_POST['create_time'] = time();
    	if( $giDao->add($_POST)!==false ) {
    		exit('success');
    	} else {
    		exit('error');
    	}
    }
	//添加产品资讯
    public function addInquire() {
		if($_SESSION['verify'] != md5($_POST['verify'])) {
			$this->error ( '验证码错误，请注意填写' );
		}
    	$giDao = M('GoodsInquire');
    	$_POST['create_time'] = time();
		$_POST['hardware'] =  'pc';
    	if( $giDao->add($_POST)!==false ) {
    		$this->success ( '提交成功，我们将尽快回复您！' );
    	} else {
    		$this->error ( '异常' );
    	}
    }
	public function search(){
		$cdb = M('Category');
		$al = 'Goods';
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
		$db = M('Goods');
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
		$this->display($this->web_theme.':Goods:search');
	}
}
?>