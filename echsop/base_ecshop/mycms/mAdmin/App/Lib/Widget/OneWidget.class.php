<?php
//单页显示
class OneWidget extends Widget {

	public function render( $data ){

		$categoryDao = M('Category','AdvModel');
		$modelDao = M($data['model']);
		$lang = L('language'); //获取当前语言
		$id = $_GET['id'];
		$cid = isset($_GET['cid'])?$_GET['cid']:$data['cid'];

		if( !empty( $data['alias']) ) { //1.使用别名获取单页
				
			$category = $categoryDao->where( array('alias'=>$data['alias'], 'lang'=>$lang) )->find();
			//$obj = $modelDao->where( array('category_id'=>$category['my_id'], 'lang'=>$lang, 'is_publish'=>1) )->find();
			$obj = $modelDao->where( array('category_id'=>$category['id'], 'lang'=>$lang, 'is_publish'=>1) )->find();

		} else if( !empty($id) ) { //2.使用ID获取单页
			//$category = $categoryDao->where( array('my_id'=>$cid, 'lang'=>$lang) )->find();
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			$obj = $modelDao->where( array('id'=>$id, 'is_publish'=>1) )->find();
				
		} else if( !empty($cid) ) { //3.使用CID获取单页
			//$category = $categoryDao->where( array('my_id'=>$cid, 'lang'=>$lang) )->find();
			//$obj = $modelDao->where( array('category_id'=>$category['my_id'],'lang'=>$lang, 'is_publish'=>1) )->find();
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			$obj = $modelDao->where( array('category_id'=>$category['id'],'lang'=>$lang, 'is_publish'=>1) )->find();
		} else {  //4.其它原因获取单页
				
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) { //4-1.如果是主导航就获取主导航下第
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/index', 'lang'=>$lang) )->find();
			//	$category = $categoryDao->where( array('pid'=>$category['my_id'], 'is_publish'=>1) )->order('ordernum desc')->first();
				$category = $categoryDao->where( array('pid'=>$category['id'], 'is_publish'=>1) )->order('ordernum desc')->first();
			} else { //4-2.自动选择别名
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/'.ACTION_NAME, 'lang'=>$lang) )->find();
			}
		//	$obj = $modelDao->where( array('category_id'=>$category['my_id'], 'lang'=>$lang, 'is_publish'=>1) )->find();
			$obj = $modelDao->where( array('category_id'=>$category['id'], 'lang'=>$lang, 'is_publish'=>1) )->find();
		}
		$modelDao->setInc('clicks', array('id'=>$obj['id']), 1);

		//当前位置下标
		/*$location = $categoryDao->where( array('my_id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['my_id']),'lang'=>$lang,'is_fixed'=>0,'is_publish'=>1) )->order('id asc')->field('id,title,alias')->select();*/
		$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id']),'lang'=>$lang,'is_fixed'=>0,'is_publish'=>1) )->order('id asc')->field('id,title,alias')->select();
		return $this->renderFile($data['style'], array('obj'=>$obj, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data) );
	}

}