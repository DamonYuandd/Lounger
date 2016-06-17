<?php
// 送禮相關控制器
class GiftsAction extends EntryAction{
    
   //sse 推送判斷
   public function edit2(){
    	header('Content-Type: text/event-stream');
		header('Cache-Control: no-cache');
		//$time = date('r');
		$obj = D('Gifts')->where(array('id' => 14))->find();
		echo "data: {$obj['manipulator']}\n\n";
		ob_flush();
		flush();
    }
}