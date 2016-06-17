<?php
/**
 *
 * 关于我们控制器
 * @author uclnn
 *
 */
class JobAction extends HomeAction {

	function _initialize() {
		parent::_initialize ();

		if( $this->is_mobile==true ) {
			if( ACTION_NAME=='index' ) {
				$this->m_index();exit;
			} else if( ACTION_NAME=='show' ) {
				$this->m_show();exit;
			}
		}
		/*
		if (! method_exists ( $this, ACTION_NAME )) { // 没有定制方法
			$this->display ( 'index' );
			exit ();
		}*/
	}
	
	function index(){
		$this->display($this->web_theme.':Job:index');
	}
	function show(){
		$this->display($this->web_theme.':Job:show');
	}
	 //提交简历
    public function resumeSave() {
    	if($_SESSION['verify'] != md5($_POST['verify'])) {
    		$this->error(L('验证码错误'));
    	}
    	if( !empty($_FILES['file']['name']) ) {
    		$this->uploadFile();
    	}

    	$jrDao = M('JobResume');
    	$_POST['create_time'] = time();
    	$bool = $jrDao->add($_POST);
    	if( $bool!==false ) {
    		$this->success('提交成功，我们将尽快回复您！');
    	} else {
    		$this->error(L('提交失败'));
    	}
    }
    
    private function uploadFile() {
    	$uploaddir = C('APP_ROOT_PATH').'/yupload/'.C('USER_CNUM').'/files/resume/';
		if(!file_exists($uploaddir)){
			mkdir($uploaddir,0777,true);
		}
    	import("ORG.Util.UploadFile");
    	$upload = new UploadFile();
    	$upload->maxSize = 3292200;
    	$upload->allowExts = explode(',', 'doc,docx');
    	$upload->savePath = $uploaddir;
    	$upload->saveRule = uniqid;
    	if (!$upload->upload()) {
    		$this->error($upload->getErrorMsg());
    	} else {
    		$uploadList = $upload->getUploadFileInfo();
    		$_POST['file'] = $uploadList[0]['savename'];
    	}
    }
	
	
	public function resume() {
		$db = M('Job');
		$result = $db->where(array('id' => $_GET['id']))->find();
		$this->assign('obj',$result);
		$this->display($this->web_theme.':Job:resume');
	}
	
	function m_index(){
		 /*分页*/
        import ( "ORG.Util.Page" );
		$page = 5;
		$db = M('Category');
		$lang = L('language');
		$pid = $db->where(array('alias' => 'Job','is_publish' => 1))->find();
		$cid = $db->where(array('pid' => $pid['id'],'lang' => $lang,'hardware' => 'mobile','is_publish'=>1))->select();
		$jobDb = M('Job');
		if(!$cid){
			$jobCid = $pid['id'];
		}else{
			foreach($cid as $key => $value){
				$getCid .= ','.$value['id'];
			}
			$jobCid = $pid['id'].$getCid;
		}
		
		$count = $jobDb->where('category_id in ('.$jobCid.') and is_publish = 1')->count();
		$page = new Page ( $count, $page );
		$jobList = $jobDb->where('category_id in ('.$jobCid.') and is_publish = 1')->order('ordernum desc, id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
		$this->assign('jobList',$jobList);
		$this->assign('headTitle', L(nav_job));
		$page->setConfig ( "theme", "<div class=\"prevbut\">%upPage%</div> <div class=\"nextbut\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
		$this->assign ('pageBar', $page->show () );
		$this->display($this->mobile_theme.':Job:index');
		
	}
	function m_show(){
		$jobDb = M('Job');
		$jobInfo = $jobDb->where(array('id' => $_GET['id']))->find();
		$this->assign('obj',$jobInfo);
		$this->assign('headTitle', $jobInfo['title']);
		$this->display($this->mobile_theme.':Job:show');
	}
	function m_resume(){
		$this->display($this->mobile_theme.':Job:resume');
	}
	function m_resumeSave(){
		$db = M('JobResume');
	//	dump($_POST);
		$_POST['create_time'] = time();
		if($db->add($_POST)){
			echo "<script>alert('提交成功，我们将尽快回复您！');</script>" ;
			echo "<script>window.location.href='".__APP__."/Job';</script>";
		}else{
			echo "<script>alert('发送简历失败');</script>" ;
			echo "<script>window.location.href='".__APP__."/Job';</script>";
		}
	}
}
?>