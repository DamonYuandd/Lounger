<?php if (!defined('THINK_PATH')) exit();?> <div data-role="content">
    	<ul data-role="listview" data-divider-theme="a" data-inset="true">
            <li data-role="list-divider" role="heading">
                选择语言：
            </li>
            <?php if(is_array($user_langs)): $i = 0; $__LIST__ = $user_langs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li data-theme="<?php if(($_SESSION["lang"])  ==  $vo["alias"]): ?>c<?php else: ?>c<?php endif; ?>">
                    <a href="__APP__/Admin/Index/part?l=<?php echo ($vo["alias"]); ?>" data-ajax="false" data-inline="true">
                        <?php echo ($vo["title"]); ?><?php if(($_SESSION["lang"])  ==  $vo["alias"]): ?>【默认】<?php endif; ?>
                    </a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>           
        </ul>
    </div>