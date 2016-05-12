<?php
/**
 * Este arquivo contém a configuração inicial do framework, as demais configurações estão disponíveis no painel de
 * controle do paCRUD no menu Sistema.
 */

// configuração default (não remover esta linha)
if (file_exists('../config_default.php')) {
	require_once('../config_default.php');
}

/**
 * Banco de dados do paCRUD
 *
 * Esta configuração, define as opções de conectividade com o banco de dados do framework, neste banco serão
 * armazenadas informações sobre usuários, grupos, rotinas, menus, permissões e demais configurações da aplicação.
 *
 * A configuração padrão é sqlite3, que é uma boa opção quem é recém chegado ou para pequenas aplicações.
 * Use esta opções se você esta iniciando ou simplesmente testando o framework. (Se esta for a sua escolha não é 
 * necessário alterar este arquivo).
 *
 * Para aplicação em produção, o recomendado é usar PostrgreSQL.
 *
 * É possível (mas não obrigatório), usar um banco de dados separado para framework, embora o mais usual seja 
 * colocar as tabelas do paCRUD Framework na mesma base de dados da sua aplicação (apenas para bancos PostgreSQL).
 *
 * A segui um exemplo de configuração para o banco do framework PostgreSQL. A estrutura das tabelas banco está 
 * disponivel na pasta "db".
 *
 * As configurações de conexão com o banco de dados da aplicação estão disponíveis no painel de controle.
 */
 
/* Exemplo de banco de dados do framework com PostgreSQL */
//$pacrudConfig['sgdb_pacrud']       = 'pgsql';
//$pacrudConfig['dbHost_pacrud']     = 'localhost';
//$pacrudConfig['dbPort_pacrud']     = '5432';
//$pacrudConfig['dbName_pacrud']     = 'db_pacrud';
//$pacrudConfig['dbUserName_pacrud'] = 'pacrud';
//$pacrudConfig['dbPassword_pacrud'] = '123456';


// configuração final (não remover esta linha)
require_once($pacrudConfig['pacrudPath'].'/controller/ambient.php');
