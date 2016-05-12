<?php
require_once('pacrud.php');
require_once('../controller/connection.php');

pProtect('pacrud_devtools');

// verifica se existe a pasta de scripts de atualização do banco da aplicação
$scriptDir = $pacrudConfig['appPath'].'/updatedb';

if (!is_writable($pacrudConfig['appPath']) and !file_exists($scriptDir)) {
	$msg = _('Diretório "%dir%" não possui permissão de escrita, nada feito!');
	echo str_replace('%dir%',$pacrudConfig['appPath'],$msg);
	exit;
}

if (!file_exists($scriptDir)) {
	if (!mkdir($scriptDir)) {
		$msg = _('Erro ao criar o diretório "%dir%", nada feito!');
		echo str_replace('%dir%',$pacrudConfig['appPath'],$msg);
		exit;
	}
}

//escolhe o nome do arquivo
$fileName = $pConnection->sqlQuery('SELECT now()');
$fileName = str_replace(':','',$fileName);
$fileName = str_replace('-','',$fileName);
$fileName = str_replace('.','',$fileName);
$fileName = str_replace(' ','',$fileName);
$fileName .= '.php';

$completeFileName = $scriptDir.'/'.$fileName;

$fileContent  = '<?php'."\n";
$fileContent .= '$sql = '.pFormatSql($_POST['ddl'],'string').';';
$fileContent .= "\n";

if (file_put_contents($completeFileName, $fileContent) === false) {
	$msg = _('Erro ao gravar o arquivo "%file%"!');
	echo str_replace('%file%',$pacrudConfig['appPath'],$msg);
	exit;
}


//verifica se o schema existe na base de dados, caso não existe, cria
$schema = $pConnection->sqlQuery('SELECT count(*) FROM information_schema.schemata WHERE schema_name='.pFormatSql($pacrudConfig['loginSchema_pacrud'],'string').';');
if (!$schema) {
	$pConnection->sqlQuery('CREATE SCHEMA pacrud;');
}

if ($_POST['uptodate'] == 't') {
	writeAppUpdate($fileName);
}

echo 'OK';

