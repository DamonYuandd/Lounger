<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
    public function index(){
        header("Content-Type:text/html; charset=utf-8");
        $this->display();
        }

    public function upload(){
    	//$a=$_POST['file'];

    	//$this->success($_FILES['photo']['name']);
    	//$this->success($a);
		//$this->success("su");
		//$a="suju";
		//$this->ajaxReturn($_FILES['photo']['name'],"新增成功！",1);
		//echo $a;
		//echo "success";


		if (!empty($_FILES)) {
		$name=time();
		import("ORG.Net.UploadFile");

		$upload = new UploadFile();// 实例化上传类

		$upload->maxSize  = 3145728 ;// 设置附件上传大小

		$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型

		$upload->savePath =  './Public/Uploads/';// 设置附件上传目录

		$upload->saveRule =  $name;

		//$upload->upload();


		if(!$upload->upload()) {// 上传错误提示错误信息

		//$this->success("su");

		$info=$upload->getErrorMsg();

		//extension

		$this->ajaxReturn($info,"fail",0);

		}else{// 上传成功 获取上传文件信息

		$info =  $upload->getUploadFileInfo();

		$url=$upload->savePath.$info[0]['savename'];

		echo '<script>parent.add("'.$url.'")</script>';

		//$this->ajaxReturn($info[0]["name"],"success",1);
		//echo "success";

 		}
		}
		else
		$this->ajaxReturn("不存在","fail",0);


    }

    public function del(){
		if($_POST['name']!=""){
			$info = explode("/", $_POST['name']);
			//count($info)
			$url='./Public/Uploads/'.$info[count($info)-1];
    		if(unlink($url)){
    			$this->success("success");
    		}
    		else
    			$this->error("unlink fail");
    		}
    	else
    		$this->error("info is gap");
    }
}