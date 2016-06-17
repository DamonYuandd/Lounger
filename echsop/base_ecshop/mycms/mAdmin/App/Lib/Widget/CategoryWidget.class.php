<?php
//分类列表显示
class CategoryWidget extends Widget {

	public function render( $data )
	{
		$categoryDao = M('Category','AdvModel');
		$lang = L('language');

		$cid =  isset($_REQUEST['cid'])?$_REQUEST['cid']:$data['cid'];
		if( !empty($data['alias']) ) {
			$category = $categoryDao->where( array('alias'=>$data['alias'], 'lang'=>$lang) )->find();
		//	$pid = $category['my_id'];
			$pid = $category['id'];
		} else if(!empty($cid)){
			//$category = $categoryDao->where( array('my_id'=>$cid, 'lang'=>$lang, 'is_publish'=>1) )->find();
			$category = $categoryDao->where( array('pid'=>$cid, 'lang'=>$lang, 'is_publish'=>1) )->find();
			$pid = $category['pid'];
		} else {
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) {
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/index', 'lang'=>$lang) )->find();
			//	$category = $categoryDao->where( array('pid'=>$category['my_id'], 'is_publish'=>1) )->order('ordernum desc')->first();
			$category = $categoryDao->where( array('pid'=>$category['id'], 'is_publish'=>1) )->order('ordernum desc')->first();
				$pid = $category['pid'];
			} else {
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/'.ACTION_NAME, 'lang'=>$lang, 'is_publish'=>1) )->find();
				$pid = $category['pid'];
			}
		}
		$categoryList = $categoryDao->where( array('pid'=>$pid, 'is_publish'=>1, 'lang'=>$lang) )->order('ordernum desc')->select();//dump($categoryDao->getLastSql());
		$content = $this->renderFile($data['style'], array('categoryList'=>$categoryList, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data));
		return $content;

	}
}