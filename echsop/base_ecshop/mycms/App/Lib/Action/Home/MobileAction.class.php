<?php
/**
 * 
 * 控制器
 * @author uclnn
 *
 */
class MobileAction extends HomeAction
{
	function _initialize() {
    }
    
   
	//首页banner
	public function banner(){
		$advertDao = M('Advert');
		$advertHomeList = $advertDao->where(array('lang'=>'mobile','category_id'=>752))->order('ordernum desc, id desc')->select();
		if( $this->isAjax() ) {
			json_encode(array('list'=>$advertHomeList));
		} else {
			$this->assign('advertHomeList',$advertHomeList);
		}	
	}
 	//首页产品
	public function indexGoods($num){
		$goodsDao = M('Goods');
		$lang = L('language');
		if($num)
		{
			$goodsHomeList = $goodsDao->where(array('lang'=>$lang,'hardware' => 'mobile','is_home'=>1))->order('is_top desc, ordernum desc, create_time desc')->limit($num)->select();
		}else
		{
			$goodsHomeList = $goodsDao->where(array('lang'=>$lang,'hardware' => 'mobile','is_home'=>1))->order('is_top desc, ordernum desc, create_time desc')->select();
		}
		if($this->isAjax())
		{
			json_encode(array('list' => $goodsHomeList));
		}else
		{
			$this->assign('goodsHomeList',$goodsHomeList);
		}
	}
	//首页小图片
	public function hotAd($num){
		$advertDao = M('Advert');
		if($num)
		{
			$advertHomeList2 = $advertDao->where(array('lang'=>'mobile','category_id'=>684))->order('ordernum desc, id desc')->limit($num)->select();
		}else{
			$advertHomeList2 = $advertDao->where(array('lang'=>'mobile','category_id'=>684))->order('ordernum desc, id desc')->select();
		}
		if($this->isAjax())
		{
			json_encode(array('list'=>$advertHomeList2));
		}else
		{
			$this->assign('advertHomeList2',$advertHomeList2);
		}
	}
	//产品信息
	public function goodInfo($id)
	{
		 //$id = $_GET['id'];
        if( !empty( $id ) ) {
            $modelDao = M('Goods');
            $gpDao = M('GoodsPhoto');
            $categoryDao = M('Category');
            $obj = $modelDao->find( $id );
            $gpList = $gpDao->where(array('goods_id'=>$id))->select();
            $title = $categoryDao->where(array('id'=>$obj['category_id'],'lang'=>'mobile'))->getField('title');
			if($this->isAjax())
			{
				json_encode(array(
				'obj' => $obj,
				'gpList' => $gpList,
				'headTitle' => $obj['title'],
				'categoryTitle' => $title
				));
			}else{
            $this->assign('obj', $obj);
            $this->assign('gpList', $gpList);
            $this->assign('headTitle', $obj['title']);
			$this->assign('categoryTitle', $title);
			}
        }
	}
	//产品列表
	public function productList($cid,$page=5,$re = false) // 第三个参数是否采用返回值
	{
    	$categoryDao = D('Home.Category');
    	$lang = L('language'); 
    	if( empty($cid) ) {
			$cid = $categoryDao->where( array('alias'=>'Goods', 'is_publish'=>1) )->getField('id');
    	}
		
		
		
		if( empty($cid) ) {
			$cid = $categoryDao->where( array('alias'=>$alias, 'is_publish'=>1))->getField('id');
		}
		$title = $categoryDao->where(array('id'=>$cid,'lang'=>$lang))->getField('title');
		if(!$title){
			$title = $categoryDao->where(array('id'=>$cid))->getField('title');
		}
		if(json_parser($title)){
			$title = json_decode($title,true);
			$title = $title[$lang]['title'];
		}
		if( empty($title)){
			$title = L(goodsCenter);
		}
				
		
    	$levels = $categoryDao->getDownLevels($cid,$lang,'mobile');
    	if( empty($levels) ) {
    		$levels = $cid;
    	}
		$exLev = explode(',',$levels);
		//寻找下一级
		foreach($exLev as $key => $value){
			if($cid = selectSubCategory($value)){
				for($i=0;$i<count($cid);$i++){
					$levels .= ','.$cid[$i]['id'];
				}	
			}
		}
		//获取曾孙类
		$zs = $categoryDao->where(array('pid' => array('in',$levels)))->select();
		foreach($zs as $key => $value){
			$levels .= ','.$value['id'];
		}
    	$where['category_id'] = array('in', $levels);
        $modelDao = M('Goods');
		$where['hardware'] = 'mobile';
        $where['lang'] = $lang;
        $where['is_publish'] = 1;
        
        $searchKey = $_REQUEST['search_key'];
        if( $searchKey ) {//搜索关键字
        	$where['_string']="title like '%$searchKey%' OR tag like '%$searchKey%'";
        }
        /*分页*/
        import ( "ORG.Util.Page" );
        $count = $modelDao->where ( $where )->count ();
        $page = new Page ( $count, $page );
        $dataList = $modelDao->where ( $where )->order('is_top desc, ordernum desc, id desc')->limit ( $page->firstRow . ',' . $page->listRows )->select ();
        /*在URL添加参数*/
        foreach ( $where as $key => $val ) {
            if (!is_array($val)) {
                $p->parameter .= "$key=" . urlencode($val) . "&";
            }
        }
		if( $this->isAjax() )
		{
			json_encode(array(
				'headTitle' => $title,
				'dataList' => $dataList
			));
		}else if($re == true){
			return $dataList;
		}
		else
		{
			$page->setConfig ( "theme", "<div class=\"prevbut\">%upPage%</div> <div class=\"nextbut\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
			$this->assign('headTitle', $title);
			$this->assign('dataList', $dataList);
			$this->assign ('pageBar', $page->show () );
		}
	}
	//新闻列表
	public function newsList($cid,$page=2,$alias = 'News',$is_home)
	{
		$newsDao = M('News');
		//$topList = $newsDao->where(array('lang'=>'mobile','is_publish'=>1,'is_top'=>1))->select();
		//$cid = $_REQUEST['cid'];
		$lang = L('language');
		$categoryDao = D('Home.Category');
		if( empty($cid) ) {
			$cid = $categoryDao->where( array('alias'=>$alias, 'is_publish'=>1))->getField('id');
		}
		$title = $categoryDao->where(array('id'=>$cid,'lang'=>$lang))->getField('title');
		if(!$title){
			$title = $categoryDao->where(array('id'=>$cid))->getField('title');
		}
		if(json_parser($title)){
			$title = json_decode($title,true);
			$title = $title[$lang]['title'];
		}
		if( empty($title)){
			$title = L(nav_news);
		}

		$levels = $categoryDao->getDownLevels($cid,$lang,'mobile');
		if( empty($levels) ) {
			$levels = $cid;
		}
		$where['category_id'] = array('in', $levels);
		$where['hardware'] = 'mobile';
        $where['lang'] = $lang;
		$where['is_publish'] = 1;
		if($is_home){
			$where['is_home'] = $is_home;
		}
		/*分页*/
		import ( "ORG.Util.Page" );
		$count = $newsDao->where ( $where )->count ();
		$page = new Page ( $count, $page );
		$dataList = $newsDao->where ( $where )->order('is_top desc, ordernum desc, id desc')->limit ( $page->firstRow . ',' . $page->listRows )->select ();

		/*在URL添加参数*/
		foreach ( $where as $key => $val ) {
			if (!is_array($val)) {
				$p->parameter .= "$key=" . urlencode($val) . "&";
			}
		}
		if($this->isAjax())
		{
			json_encode(array(
			'dataList' => $dataList,
			'topList' =>$topList,
			'headTitle' => $title
			));
		}else
		{
			$page->setConfig ( "theme", "<div class=\"prevbut\">%upPage%</div> <div class=\"nextbut\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
			$this->assign('dataList', $dataList);
			$this->assign('topList', $topList);
			$this->assign('pageBar', $page->show () );
			$this->assign('headTitle', $title);
		}
	}
	//获取信息详情
	public function newsInfo($id)
	{
		$newsDao = M('News');
		$lang = L('language');
		$obj = $newsDao->where(array('id'=>$id,'lang'=>$lang,'hardware' => 'mobile','is_publish'=>1))->find();
		if($this->isAjax())
		{
			json_encode(array(
				'obj' => $obj,
				'headTitle' => $obj['title']
			));
		}else
		{
			$this->assign('obj', $obj);
			$this->assign('headTitle', $obj['title']);
		}
	}
	//通过cid来获取信息详情
	public function cidNewsInfo($cid)
	{
		$newsDao = M('News');
		$lang = L('language');
		$obj = $newsDao->where(array('category_id'=>$cid,'lang'=>$lang,'hardware' => 'mobile','is_publish'=>1))->find();
		if($this->isAjax())
		{
			json_encode(array(
				'obj' => $obj,
			));
		}else
		{
			$this->assign('obj', $obj);
			return $obj;			
		}
	}
	public function aliaNewsInfo($alia){
		$db = M('Category');
		$cid = $db->where(array('alias' => $alia,'lang' => 'mobile' ,'is_publish' =>1))->find();
		$result = $this->cidNewsInfo($cid['id']);
		if($this->isAjax())
		{
			json_encode(array(
				'obj' => $result,
			));
		}else
		{
		//	$this->assign('obj', $result);
			return $result;		
		}

	}
	//获取某个分类的下级
	public function categoryList($cid)
	{
		$categoryDao = M('Category');
		$categoryList = $categoryDao->where( array('pid'=>$cid, 'is_publish'=>1, 'lang'=>'mobile') )->order('ordernum desc')->select();
		if($this->isAjax())
		{
			json_encode(array(
				'categoryList',$categoryList
			));
		}
		else
		{
			$this->assign('categoryList', $categoryList);
		}
	//	$this->assign('headTitle', '在线加盟');	
	}
	//通过别名来获取分类的下一级
	public function categoryListAlias($alias)
	{
		$categoryDao = M('Category');
		$get = $categoryDao->where( array('alias'=>$alias, 'is_publish'=>1, 'lang'=>'mobile') )->order('ordernum desc')->find();
		$categoryList = $categoryDao->where(array('pid' => $get['id'], 'is_publish'=>1, 'lang'=>'mobile'))->order('ordernum desc')->select();
		if($this->isAjax())
		{
			json_encode(array(
				'categoryList',$categoryList
			));
		}
		else
		{
			$this->assign('categoryList', $categoryList);
		}
	//	$this->assign('headTitle', '在线加盟');	
	}
	//网点信息
	public function market($re = false)
	{
		$cid = $_GET['cid'];
		$lang = L('language');
		$categoryDao = M('Category');
		//$category = $categoryDao->where( array('alias'=>'Market/index', 'is_publish'=>1, 'lang'=>'mobile') )->find();
		$category = $categoryDao->where( array('alias'=>'Market/index', 'is_publish'=>1,'lang'=> $lang,'hardware' => 'mobile') )->find();
		$categoryList = $categoryDao->where( array('pid'=>$category['id'], 'is_publish'=>1, 'lang'=> $lang, 'hardware' => 'mobile') )->order('ordernum desc')->select();
		if( empty($cid) ) {//获取第一个网点数据
			$cid = $categoryList[0]['id'];
		}
		if($this->isAjax())
		{
			json_encode(array(
				'cid' => $cid,
				'categoryList' => $categoryList,
				'headTitle' => '服务网点'
			));
		}else if($re == true){
			return $cid;
		}else
		{
			$this->assign('cid', $cid);
			$this->assign('categoryList', $categoryList);
			$this->assign('headTitle', L(nav_market));
		}
	}
	//店铺形象
	public function Store(){
		$categoryDao = M('Category');
		$cid = $categoryDao->where( array('alias'=>'mobile_store', 'is_publish'=>1, 'lang'=>'mobile') )->getField('id');

		$advertDao = M('Advert');
		$storeList = $advertDao->where(array('category_id'=>$cid,'is_publish'=>1,'lang'=>'mobile'))->select();
		if($this->isAjax())
		{
			json_encode(array(
				'storeList' => $storeList,
			));
		}else
		{
			$this->assign('storeList', $storeList);
		}
	}
	//分类以及对应的产品
	public function m_indexGoods($cate_Num =5,$good_Num = 5){
		$goodCate = GoodsCate($cate_Num);
		for($i = 0; $i< count($goodCate);$i++){
			$getGoods[$i]['sort'] = $goodCate[$i];
			$getGoods[$i]['goods'] = $this->productList($goodCate[$i]['id'],$good_Num,true);
		}
		return $getGoods;
	}
	
	//带分页分类及其产品
	public function m_sortGoods($cate_Num = 5,$goods_Num = 5){
		$modelDao =  M('Category');
		$hardware = 'Mobile';
		$cid = $modelDao->where(array('alias' => 'Goods','is_publish' => 1))->find();
		$where['pid'] =  $cid['id'];
		$where['is_publish'] = 1;
		$where['lang'] = L('language');
		$where['hardware'] = $hardware;
		 /*分页*/
        import ( "ORG.Util.Page" );
        $count = $modelDao->where ( $where )->count ();
        $page = new Page ( $count, $cate_Num );
        $goodCate = $modelDao->where ($where )->order('ordernum desc, id desc')->limit ( $page->firstRow . ',' . $page->listRows )->select ();
		$page->setConfig ( "theme", "<div class=\"prevbut\">%upPage%</div> <div class=\"nextbut\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
		$this->assign('pageBar', $page->show ());
		for($i = 0; $i< count($goodCate);$i++){
			$getGoods[$i]['sort'] = $goodCate[$i];
			$getGoods[$i]['goods'] = $this->productList($goodCate[$i]['id'],$goods_Num,true);
		}
		$this->assign('pageBar',$page->show());
		$this->assign('result',$getGoods);
		//dump($Ftitle);
	//	$Ftitle = $cate->where(array('pid' => $cid['id'],'is_publish' => 1,'lang' => L('language'),'hardware' => $hardware))->order('ordernum desc, id desc')->limit($num)->select();
		
		
	}
	//联系方式
	public function m_mobileContact($is,$public_mobile){
		import ( "ORG.Util.MobileDetect" );
		$detect = new MobileDetect();
		$mwDao = M('MobileContact');
		$lang = L('language');
		$dataList = $mwDao->where(array($is=>1,'is_publish'=>1,'hardware' => 'mobile','lang'=> $lang))->order('ordernum desc')->select();
		foreach ($dataList as $key => $value) {
			$ct = $value['content_type'];
			if($ct=='url') {
				$dataList[$key]['href'] = $value['content'];
			} elseif ($ct=='mail' || $ct=='email') {
				$dataList[$key]['href'] = 'mailto:'.$value['content'];
			} elseif ($ct=='phone' || $ct=='mobile') {
				if($detect->isiOS())
				{
					$dataList[$key]['href'] = 'callto:'.$value['content'];
				}else if($detect->isAndroidOS())
				{
					$dataList[$key]['href'] = 'wtai://wp/mc;'.$value['content'];
				}
			} elseif($ct=='sms'){
				$dataList[$key]['href'] = 'smsto:'.$value['content'];
				}
			else {
				$dataList[$key]['href'] = '#';
			}
			if( $value['image']=='address' ) {
				$dataList[$key]['href'] = __APP__.'/Contact';
			}
		}
		return $dataList;
	}
	//网点分公司信息列表
	function mobileMarket($cid) {
		import ( "ORG.Util.MobileDetect" );
		$cid = $this->market(true);	//获取第一个网点的id
		$detect = new MobileDetect();
		$lang = L('language');
		$marketDao = M('Market');
		$dataList = $marketDao->where(array('category_id'=>$cid,'lang'=>$lang,'hardware' => 'mobile','is_publish'=>1,'traffic1'=>'','traffic2'=>''))->order('ordernum desc')->select();
		foreach ($dataList as $key => $value) {
			$ct = $value['image'];
			if($ct=='url') {
				$dataList[$key]['href'] = $value['content'];
			} elseif ($ct=='email' || $ct=='mail') {
				$dataList[$key]['href'] = 'mailto:'.$value['content'];
			} elseif ($ct=='phone' || $ct=='mobile' || $ct=='tel') {
				if($detect->isiOS())
				{
					$dataList[$key]['href'] = 'callto:'.$value['content'];
				}else if($detect->isAndroidOS())
				{
					$dataList[$key]['href'] = 'wtai://wp/mc;'.$value['content'];
				}
				//$href = 'callto:'.$value['content'];
			} elseif($ct=='sms'){
				$dataList[$key]['href'] = 'smsto:'.$value['content'];
				}
			else {
				$dataList[$key]['href'] = '#';
			}
		}
		return $dataList;
	}
}
?>