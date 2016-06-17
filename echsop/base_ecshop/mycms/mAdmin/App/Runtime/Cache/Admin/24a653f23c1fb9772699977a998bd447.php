<?php if (!defined('THINK_PATH')) exit();?><div data-role="footer" data-theme="a" data-position="fixed">
 	<div data-role="navbar" data-iconpos="bottom" >
            <ul>
                <li>
                    <a href="__APP__/Admin/Index/part?l=<?php echo ($_SESSION['lang']); ?>"  data-theme="" data-icon="">
                        控制页版
                    </a>
                </li>
                <li>
                    <a id="systemShow" href="__APP__/System/index/cid/sel" data-transition="fade" data-theme="" data-icon="" ata-transition="pop" data-rel="dialog">
                        系统管理
                    </a>
                </li>
                <li>
                    <a href="__APP__" data-transition="fade" data-theme="" data-icon="" data-ajax="false">
                        访问网站
                    </a>
                </li>
                <li>
                    <a href="__APP__/Admin/Public/logout"  data-ajax="false" data-transition="fade" data-theme="" data-icon="">
                        退出网站
                    </a>
                </li>
            </ul>
        </div>
</div>