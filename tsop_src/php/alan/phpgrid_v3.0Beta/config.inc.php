<?php

/**
 * 
 * 
 * phpgrid的配置文件，配置默认的数据库连接和phpgrid的目录常量
 * 
 * 请不要改变此文件的路径,
 * 否则会导致fckeditor或simple_edtor无法正确引用
 * 
 * 
 * 
 */



//数据库设定
 $GLOBALS['datagrid']['db']=array(
									'host' => 'localhost',                            
									'port'=> '3306',
									'type' => 'mysql',
									'user' => 'root',
									'passwd' => 'mysql1,',
									'dbname' => 'crm',
									'charset'=> 'utf8'
									);
							

//设置语言
define("LANGUAGE_FILE","zh_cn.php");//en.php or  zh_cn.php
									
//设置时区									
date_default_timezone_set('Asia/Shanghai');									
									
									
			
?>
