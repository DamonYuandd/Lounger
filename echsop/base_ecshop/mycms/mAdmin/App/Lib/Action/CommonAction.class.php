<?php

class CommonAction extends Action {

	public $modelDao = null;

	function _initialize() {
		
	}

	/**
	 * 实例化模型 - 前提是需要调用操作数据库方法
	 *
	 * @param string $modelName 模型名称，如：Menber
	 */
	protected function setModel($modelName) {
		$this->modelDao = D ( $modelName );
	}

	/**
	 * 单个数据表查询分页
	 *
	 * @param array $where 查询条件
	 * @param string $order_str 排序
	 * @param int $rowpage 每页显示行数
	 */
	protected function page($where, $rowpage = 10, $order_str = '', $asc = false) {
		$order_str = empty($order_str)?'lang desc,ordernum desc':$order_str;
		/*分页*/
		import ( "ORG.Util.Page" );
		$count = $this->modelDao->where ( $where )->count ();
		$page = new Page ( $count, $rowpage );
		$dataList = $this->modelDao->where ( $where )->order($order_str)->limit ( $page->firstRow . ',' . $page->listRows )->select ();

		/*在URL添加参数*/
		foreach ( $where as $key => $val ) {
			if (!is_array($val)) {
				$p->parameter .= "$key=" . urlencode($val) . "&";
			}
		}
		$page->setConfig ( "theme","<div class=\"prevbut\" style=\"float:left;\">%upPage%</div> <div class=\"nextbut\" style=\"float:right;\">%downPage%</div> <div class=\"number\">%nowPage%/%totalPage%</div>" );
		$pageBar = $page->show ();
		$sort = $sort == 'desc' ? 1 : 0; //排序方式
		$this->assign ( 'pageBar', $pageBar );
		$this->assign ( 'sort', $sort);
		$this->assign ( 'totalRows', $count );
		$this->assign ( 'rowpage', $rowpage );
		return $dataList;
	}

}
?>