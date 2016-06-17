<?php
// 列表显示
class ListWidget extends Widget {

	/**
	 * 列表显示中间件
	 *
	 * @param string $data['model'] //数据模型
	 * @param string $data['style'] //模板名称,不含护展名
	 * @param string $data['alias'] //分类别名
	 * @param int $data['rowpage'] //每页显示行数
	 */
	public function render( $data ){
		$categoryDao = D('Home.Category');
		$newsDao = M($data['model']);
		$lang = L('language'); //获取当前语言
		$cid = isset($_REQUEST['cid'])?$_REQUEST['cid']:$data['cid'];
		if( !empty( $data['alias']) ) {//用别名指定输出分类文章列表
			$category = $categoryDao->where( array('alias'=>$data['alias'], 'lang'=>$lang) )->find();
			$levels = $categoryDao->getDownLevels($category['pid'],$lang);
			$where['category_id'] = array('in',str_replace('|', ',', $levels));
			
		} elseif( !empty( $cid ) ) {//用分类ID输出文章列表
			
			//$category = $categoryDao->where( array('my_id'=>$cid, 'lang'=>$lang) )->find();
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			//$levels = $categoryDao->getDownLevels($category['my_id'],$lang);
			$levels = $categoryDao->getDownLevels($category['id'],$lang);
			$where['category_id'] = array('in',str_replace('|', ',', $levels));
				
		} else {//自动获取当前别名,即URL控制器和方法组成
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) {// 自动选择Action/index和Action/more
				if( !empty($data['c_levels']) ) { //显示第几个分类文章列表,0为所有分类文章列表
						
				}
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/index', 'lang'=>$lang) )->find();
				$category = $categoryDao->switchModel('Adv')->where( array('pid'=>$category['pid'], 'is_publish'=>1) )->order('ordernum desc')->first();
				$levels = $categoryDao->getDownLevels($category['pid'],$lang);
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
			} else { //获取当前别名分类下的列表
				
				$alias = MODULE_NAME.'/'.ACTION_NAME;
				$category = $categoryDao->where( array('alias'=>$alias, 'lang'=>$lang) )->find();
				//$levels = $categoryDao->getDownLevels($category['my_id'],$lang);
				$levels = $categoryDao->getDownLevels($category['id'],$lang);
				$where['category_id'] = array('in',str_replace('|', ',', $levels));
			}
		}

		if( $data['isHome'] ) {//是否显示在首页（不分页）,可以显示从第N条显示到第N条
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
			/*$location = $categoryDao->where( array('my_id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['my_id']),'lang'=>$lang,'is_fixed'=>0) )->order('id asc')->field('id,title,alias')->select();*/
			$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id']),'lang'=>$lang,'is_fixed'=>0) )->order('id asc')->field('id,title,alias')->select();
			//dump($categoryDao->getlastsql());
			return $this->renderFile($data['style'], array('dataList'=>$newsList, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data, 'pageBar'=>$page->show()));
		} else {
			return '';
		}
	}
}