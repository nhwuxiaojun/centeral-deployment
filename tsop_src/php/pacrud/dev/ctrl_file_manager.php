<?php
require_once('pacrud.php');
pProtect('pacrud_devtools');

if (isset($_POST['open'])) {
	$fileName = $pacrudConfig['pacrudPath'].'/app/'.$_POST['filename'];
	
	if (file_exists($fileName)) {
		$fileContent = file_get_contents($fileName);
		echo $fileContent;
	}
	else {
		echo _('Arquivo não encontrado "'.$fileName.'".');
	}
}

if (isset($_POST['save'])) {
	$fileName = $pacrudConfig['pacrudPath'].'/app/'.$_POST['filename'];
	
	if (file_exists($fileName) and !is_writable($fileName)) {
		$msg = _('Sem permissão de escrita para o arquivo "%filename%".');
		echo str_replace('%filename%',$_POST['filename'],$msg);
	}
	else if (!is_writable($pacrudConfig['pacrudPath'].'/app')) {
		echo _('Sem permissão de escrita na pasta "app".');
	}
	else {
		file_put_contents($fileName, $_POST['code']);
		echo 'OK';
	}
}
