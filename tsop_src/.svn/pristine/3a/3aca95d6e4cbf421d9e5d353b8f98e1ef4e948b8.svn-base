<?php

// put full path to Smarty.class.php
require('/opt/lampp/lib/php/Smarty/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/php/smarty/templates');
$smarty->setCompileDir('/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/php/smarty/templates_c');
$smarty->setCacheDir('/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/php/smarty/cache');
$smarty->setConfigDir('/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/php/smarty/configs');

$smarty->assign('name', 'Ned');
$smarty->display('smarty.tpl');

?>
