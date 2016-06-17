<?php
/**
 * 
 * 控制器
 * @author uclnn
 *
 */
class TestAction extends HomeAction
{
	function _initialize() {
        parent::_initialize();
        if( $this->is_mobile==true ) {
			$maction = A('Home.Mobile');
            if( ACTION_NAME=='index' ) {
				$maction->banner();	//首页banner
			//	$maction->indexGoods(2); //首页产品,参数为产品条数
			//	$maction->hotAd(); //首页小图广告
			//	$maction->productList($_GET['cid'],10); // 产品列表，参数则为类型的id
			//	$maction->goodInfo($_GET['id']);//产品详情，参数为产品id
            //	$maction->newsList($_GET['cid'],10); //新闻列表，参数为分类id，每页10个,默认5个
			//	$maction->newsInfo($_GET['id']);	//新闻详情，参数为新闻id
			//	$maction->market(); //服务网点
			    $this->m_index();exit;
            } else if( ACTION_NAME=='show' ) {
				$maction->goodInfo($_GET['id']); //产品详情
                $this->m_show();exit;
            }
        }
        
        if( !method_exists($this, ACTION_NAME) ) {
        	$this->display('index');exit;
        }
    }
    
    public function show() {
    	$this->display();
    }
    
    
    /**********************************手机************************************/
    
    public function m_index() {
        $this->display($this->mobile_theme.':Test:index');
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

}
?>