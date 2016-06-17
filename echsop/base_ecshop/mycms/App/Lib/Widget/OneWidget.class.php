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
			$category = $categoryDao->where( array('alias'=>$data['alias'], 'lang'=>$lang,'hardware' =>'pc') )->find();
			if(!$category){
				$fid = $categoryDao->where( array('alias'=>$data['alias']) )->find();
				$category = $categoryDao->where(array('pid' => $fid['id'],'lang' => $lang, 'hardware' => 'pc'))->order('ordernum desc')->find();
			}
			$obj = $modelDao->where( array('category_id'=>$category['id'], 'lang'=>$lang, 'is_publish'=>1) )->find();
		} else if( !empty($id) ) { //2.使用ID获取单页
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			$obj = $modelDao->where( array('id'=>$id, 'is_publish'=>1) )->find();
				
		} else if( !empty($cid) ) { //3.使用CID获取单页
			$category = $categoryDao->where( array('id'=>$cid, 'lang'=>$lang) )->find();
			$obj = $modelDao->where( array('category_id'=>$category['id'],'lang'=>$lang, 'is_publish'=>1) )->find();
		
		} else {  //4.其它原因获取单页
			if( ACTION_NAME == 'index' || ACTION_NAME == 'more' ) { //4-1.如果是主导航就获取主导航下第
				$category = $categoryDao->where( array('alias'=>MODULE_NAME) )->find();
				$category = $categoryDao->where( array('pid'=>$category['id'], 'is_publish'=>1,'hardware' => 'pc' , 'lang' => $lang) )->order('ordernum desc')->first();
			} else { //4-2.自动选择别名
				$category = $categoryDao->where( array('alias'=>MODULE_NAME.'/'.ACTION_NAME, 'lang'=>$lang) )->find();
			}
			$obj = $modelDao->where( array('category_id'=>$category['id'], 'lang'=>$lang, 'is_publish'=>1) )->find();
		}
		$modelDao->setInc('click_count', array('id'=>$obj['id']), 1);
		$location = $categoryDao->where( array('id'=>array('in',str_replace('|', ',', $category['levels']).','.$category['id']),'is_publish'=>1) )->order('id asc')->field('id,title,alias')->select();
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
		if($category['tpl_one']=='one'){
		return $this->renderFile($data['style'], array('obj'=>$obj, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data),$data['tplNum'] );
		}else{
			if(ACTION_NAME == 'show'&&($category['tpl_one']=='list' || $category['tpl_one']=='auto')){
				return $this->renderFile($data['style'], array('obj'=>$obj, 'location'=>$location, 'category'=>$category, 'module'=>MODULE_NAME, 'cid'=>$cid, 'data'=>$data),$data['tplNum'] );
			}else{
				return '';
			}
		}
	}

}