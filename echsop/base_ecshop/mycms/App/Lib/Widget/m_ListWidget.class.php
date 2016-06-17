<?php
// 列表显示
class m_ListWidget extends Widget {

	/**
	 * 列表显示中间件
	 *
	 * @param string $data['model'] //数据模型
	 * @param string $data['style'] //模板名称,不含护展名
	 * @param string $data['alias'] //分类别名
	 * @param int $data['rowpage'] //每页显示行数
	 */
	public function render( $data ){
		if($data['sort'] == true){
			$this->sortDataList($data);
			exit;
		}
		$categoryDao = D('Home.Category');
		if($data['db']){
			$newsDao = M($data['db']);
		}else{
			if($data['model']){
				$newsDao = M($data['model']);
			}else{
				$newsDao = M('News');
			}
		}
		$lang = L('language'); //获取当前语言
		$cid = isset($_REQUEST['cid'])?$_REQUEST['cid']:$data['cid'];
		if( !empty( $data['alias']) ) {//用别名指定输出分类文章列表
			$category = $categoryDao->where( array('alias'=>$data['alias'], 'hardware' => 'mobile','lang'=>$lang) )->find();
			if(!$category){
				$category = $categoryDao->where( array('alias'=>$data['alias']) )->find();
			}
			$levels = $categoryDao->getDownLevels($category['id'],$lang,'mobile');
			if($data['Number']){
				$l = explode(',',$levels);
				$levels = $l[$data['Number'] -1];
			}
			if(!$levels){
				$where['category_id'] = array('in',$category['id']);
			}else{
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
			}
			
		} elseif( !empty( $cid ) ) {//用分类ID输出文章列表
			//$category = $categoryDao->where( array('my_id'=>$cid, 'lang'=>$lang) )->find();
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			//$levels = $categoryDao->getDownLevels($category['my_id'],$lang);
			//找到下一级
			$levels = $categoryDao->getDownLevels($category['id'],$lang,'mobile');
			//找孙级
			$son_levels = $categoryDao->where(array('id' => array('in',$levels),'is_publish' => 1))->order('ordernum desc, id desc')->select();
			if(!$son_levels){	//无孙级
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
			}else{	//有孙级
				foreach($son_levels as $key => $value){
					$son_levels .= ','.$value['id'];
				}
				$where['category_id'] = array('in',str_replace('|', ',', $levels.$son_levels));
			}

		} else {//自动获取当前别名,即URL控制器和方法组成
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) {// 自动选择Action/index和Action/more
				if( !empty($data['c_levels']) ) { //显示第几个分类文章列表,0为所有分类文章列表
				}
				$category = $categoryDao->where( array('alias'=>MODULE_NAME) )->find();
				if($category['module'] == 'About'){
					$isOne = true;
				}
				$levels = $categoryDao->getDownLevels($category['id'],$lang,'mobile');
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
		
			} else { //获取当前别名分类下的列表
				$alias = MODULE_NAME.'/'.ACTION_NAME;
				$category = $categoryDao->where( array('alias'=>$alias, 'lang'=>$lang) )->find();
				$levels = $categoryDao->getDownLevels($category['id'],$lang,'mobile');
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
			}
		}
		
		if( $data['isHome'] ) {//是否显示在{%nav_home}（不分页）,可以显示从第N条显示到第N条
			$where['is_home'] = 1;
		}

		if( $data['isTop'] ) {//只显示置顶（不分页）,可以显示从第N条显示到第N条
			$where['is_top'] = 1;
		}
		$searchKey = $_REQUEST['search_key'];
		if( $searchKey ) {//搜索关键字
			$where['_string']="title like '%$searchKey%' OR tag like '%$searchKey%'";
		}

		if( $category['tpl_one']=='list' || $category['tpl_one']=='auto' ){
			$where['lang'] = $lang;
			$where['is_publish'] = 1;
			if($data['is_home']){
				$where['is_home'] = $data['is_home'];
			}
			
			/*分页*/
			import ( "ORG.Util.Page" );
			$count = $newsDao->where ( $where )->count ();
			$page = new Page ( $count, $data['rowpage'] );
			$newsList = $newsDao->where ( $where )->order('is_top desc, ordernum desc, create_time desc')->limit ( $page->firstRow . ',' . $page->listRows )->select ();
			//	dump($newsList);exit;
				
			/*在URL添加参数*/
			foreach ( $where as $key => $val ) {
				if (!is_array($val)) {
					$p->parameter .= "$key=" . urlencode($val) . "&";
				}
			}
			//当前位置下标
			//$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id']),'lang'=>$lang,'is_fixed'=>0,'hardware' => 'pc') )->order('id asc')->field('id,title,alias')->select();
			$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id'])) )->order('id asc')->select();
		$checkJson = json_parser($location[1]['title']);
		if($checkJson){	//如果是JSON格式则处理
			$title = json_decode($location[1]['title'],true);
			$location[1]['title'] = $title[$lang]['title'];
		}
			if(count($location) <= 2){
				$location[2] = $location[1];
			}else if(count($location) > 3){
				$location[2] = $location[3];
			}
			$data['userNum'] = $data['userNum'];
			$page->setConfig ( "theme", "<div class=\"prevbut\">%upPage%</div> <div class=\"nextbut\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
		if($isOne == false){
			return $this->renderFile($data['style'], array('dataList'=>$newsList, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid,'data'=>$data, 'pageBar'=>$page->show()),$data['tplNum'],$data['rowpage']);
			}else{
				return '';
			}
		} else {
			return '';
		}
	}
	public function sortDataList( $data){
		if($data['model'] == 'Goods')
		{
			$newsList = m_sortGoods();
		}
		return $this->renderFile($data['style'], array('dataList'=>$newsList, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid,'data'=>$data),$data['tplNum'],$data['rowpage']);
	}
}