<?php
//分类列表显示
class CategoryWidget extends Widget {

	public function render( $data )
	{
		$categoryDao = M('Category','AdvModel');
		$lang = L('language');
		$cid =  isset($_REQUEST['cid'])?$_REQUEST['cid']:$data['cid'];
		if( !empty($data['alias']) ) {
			$category = $categoryDao->where( array('alias'=>$data['alias']) )->find();
			$pid = $category['id'];
		} else if(!empty($cid)){
			$category = $categoryDao->where( array('id'=>$cid,'is_publish'=>1,'hardware'=>'pc','lang' => $lang) )->find();
			$pid = $category['pid'];
		} else {
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) {
				$category = $categoryDao->where( array('alias'=>MODULE_NAME) )->find();
			$category = $categoryDao->where( array('pid'=>$category['id'], 'is_publish'=>1) )->order('ordernum desc')->first();
				$pid = $category['pid'];
			} else {
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/'.ACTION_NAME,'hardware'=>'pc', 'lang'=>$lang, 'is_publish'=>1) )->find();
				$pid = $category['pid'];
			}
		}
		$categoryList = $categoryDao->where( array('pid'=>$pid, 'is_publish'=>1, 'hardware' => 'pc' ,'lang'=>$lang) )->order('ordernum desc')->select();		
		$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id'])) )->order('id asc')->select();
		$checkJson = json_parser($location[1]['title']);
		if($checkJson){	//如果是JSON格式则处理
			$title = json_decode($location[1]['title'],true);
			$location[1]['title'] = $title[$lang]['title'];
		}
			if(count($location) <= 2){
			$location[2] = $location[1];
		}
		$content = $this->renderFile($data['style'], array('categoryList'=>$categoryList, 'location'=>$location,'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data),$data['tplNum']);
		return $content;

	}
}