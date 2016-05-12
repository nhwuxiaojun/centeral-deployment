CREATE TABLE pacrud_config
(
  config_name VARCHAR(40) NOT NULL,
  config_value VARCHAR(255),
  CONSTRAINT config_pkey PRIMARY KEY (config_name)
);

CREATE TABLE pacrud_syslogin
(
  username VARCHAR(30) NOT NULL,
  fullname VARCHAR(50) NOT NULL,
  password VARCHAR(40),
  enabled VARCHAR(1) NOT NULL DEFAULT 't',
  CONSTRAINT syslogin_pkey PRIMARY KEY (username)
);

CREATE TABLE pacrud_groups
(
  enabled VARCHAR(1) NOT NULL DEFAULT 't',
  groupname VARCHAR(30) NOT NULL,
  CONSTRAINT groups_pkey PRIMARY KEY (groupname)
);

CREATE TABLE pacrud_groups_syslogin
(
  groupname VARCHAR(30) NOT NULL,
  username VARCHAR(30) NOT NULL,
  CONSTRAINT groups_syslogin_pkey PRIMARY KEY (groupname, username)
);

CREATE TABLE pacrud_routines
(
  routine VARCHAR(40) NOT NULL,
  link VARCHAR(255),
  enabled VARCHAR(1) NOT NULL DEFAULT 't',
  description text,
  CONSTRAINT routines_pkey PRIMARY KEY (routine)
);

CREATE TABLE pacrud_routines_groups
(
  routine VARCHAR(40) NOT NULL,
  groupname VARCHAR(40) NOT NULL,
  c VARCHAR(1) NOT NULL DEFAULT 'f',
  r VARCHAR(1) NOT NULL DEFAULT 'f',
  u VARCHAR(1) NOT NULL DEFAULT 'f',
  d VARCHAR(1) NOT NULL DEFAULT 'f',
  CONSTRAINT routines_groups_pkey PRIMARY KEY (routine, groupname),
  CONSTRAINT routines_groups_routine_fkey FOREIGN KEY (routine)
      REFERENCES pacrud_routines (routine) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE pacrud_menu
(
  cod integer PRIMARY KEY AUTOINCREMENT,
  parent INTEGER,
  caption VARCHAR(40) NOT NULL,
  routine VARCHAR(40) NOT NULL,
  icon VARCHAR(255),
  enabled VARCHAR(1) NOT NULL DEFAULT 't',
  opened VARCHAR(1) NOT NULL DEFAULT 't',
  CONSTRAINT menu_parent_fkey FOREIGN KEY (parent)
      REFERENCES pacrud_menu (cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT menu_routine_fkey FOREIGN KEY (routine)
      REFERENCES pacrud_routines (routine) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT menu_parent_key UNIQUE (parent, caption)
);

CREATE VIEW pacrud_v_menu AS
SELECT cod,tree,routine FROM
(
	SELECT
		cod,
		CASE
			WHEN level2='_' THEN level1
			WHEN level3='_' THEN level1||' > '||level2
			WHEN level4='_' THEN level1||' > '||level2||' > '||level3
			WHEN level5='_' THEN level1||' > '||level2||' > '||level3||' > '||level4
			ELSE level1||' > '||level2||' > '||level3||' > '||level4||' > '||level5
		END as tree,
		routine
	FROM
	(
		SELECT 
			cod,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m5.parent)))) as level1,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m5.parent))) as level2,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m5.parent)) as level3,
			(SELECT caption FROM pacrud_menu WHERE cod=m5.parent) as level4,
			caption as level5,
			5 as nivel,
			parent,
			routine
		FROM pacrud_menu m5
		WHERE m5.cod IN (
			--level5
			SELECT cod FROM pacrud_menu WHERE parent IN (
				--level4
				SELECT cod FROM pacrud_menu WHERE parent IN (
					--level3
					SELECT cod FROM pacrud_menu WHERE parent IN (
						--level2
						SELECT cod FROM pacrud_menu WHERE parent IN (
							--level1
							SELECT cod FROM pacrud_menu WHERE parent IS NULL
						)
					)
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m4.parent))) as level1,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m4.parent)) as level2,
			(SELECT caption FROM pacrud_menu WHERE cod=m4.parent) as level3,
			caption as level4,
			CAST('_' as TEXT) as level5,
			4 as nivel,
			parent,
			routine
		FROM pacrud_menu m4
		WHERE m4.cod IN (
			--level4
			SELECT cod FROM pacrud_menu WHERE parent IN (
				--level3
				SELECT cod FROM pacrud_menu WHERE parent IN (
					--level2
					SELECT cod FROM pacrud_menu WHERE parent IN (
						--level1
						SELECT cod FROM pacrud_menu WHERE parent IS NULL
					)
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud_menu WHERE cod=(SELECT parent FROM pacrud_menu WHERE cod=m3.parent)) as level1,
			(SELECT caption FROM pacrud_menu WHERE cod=m3.parent) as level2,
			caption as level3,
			CAST('_' as TEXT) as level4,
			CAST(NULL as TEXT) as level5,
			3 as nivel,
			parent,
			routine
		FROM pacrud_menu m3
		WHERE m3.cod IN (
			--level3
			SELECT cod FROM pacrud_menu WHERE parent IN (
				--level2
				SELECT cod FROM pacrud_menu WHERE parent IN (
					--level1
					SELECT cod FROM pacrud_menu WHERE parent IS NULL
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud_menu WHERE cod=m2.parent) as level1,
			caption as level2,
			CAST('_' as TEXT) as level3,
			CAST(NULL as TEXT) as level4,
			CAST(NULL as TEXT) as level5,
			2 as nivel,
			parent,
			routine
		FROM pacrud_menu m2
		WHERE m2.cod IN (
			--level2
			SELECT cod FROM pacrud_menu WHERE parent IN (
				--level1
				SELECT cod FROM pacrud_menu WHERE parent IS NULL
			)
		)

		UNION

		SELECT 
			cod,
			caption as level1,
			CAST('_' as TEXT) as level2,
			CAST(NULL as TEXT) as level3,
			CAST(NULL as TEXT) as level4,
			CAST(NULL as TEXT) as level5,
			1 as nivel,
			parent,
			routine
		FROM pacrud_menu m1
		WHERE m1.parent IS NULL
	) a
	ORDER BY level1,level2,level3,level4,level5
) search;

CREATE TABLE pacrud_log_sql
(
  log_serial integer PRIMARY KEY AUTOINCREMENT,
  log_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  log_obj_name VARCHAR(100) NOT NULL,
  usr_login VARCHAR(40),
  log_pacrud_method VARCHAR(40) NOT NULL,
  log_statement text NOT NULL
);

CREATE TABLE pacrud_update_framework
(
   file_name VARCHAR(100) NOT NULL, 
   usr_login VARCHAR(40), 
   date_time DATETIME DEFAULT CURRENT_TIMESTAMP, 
   PRIMARY KEY (file_name)
);

INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_groups', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_controlPanel', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_changePassword', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_about', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_system', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_users', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_routines', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_submission', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_access_control', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_update', NULL, 't', NULL);
INSERT INTO pacrud_routines (routine, link, enabled, description) VALUES ('pacrud_devtools', NULL, 't', NULL);

INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (NULL, 'SISTEMA', 'pacrud_system', 'view/images/icons/example.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Alterar Senha', 'pacrud_changePassword', 'view/images/icons/key.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Atualização', 'pacrud_update', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Controle de Acesso', 'pacrud_access_control', 'view/images/icons/key.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (4, 'Grupos de Usuários', 'pacrud_groups', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (4, 'Permissões e Menus', 'pacrud_routines', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (4, 'Usuários', 'pacrud_users', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Desenvolvimento', 'pacrud_devtools', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Instruções iniciais', 'pacrud_submission', 'view/images/icons/exclamation.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Painel de Controle', 'pacrud_controlPanel', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud_menu (parent, caption, routine, icon, enabled, opened) VALUES (1, 'Sobre o paCRUD', 'pacrud_about', 'view/images/icons/exclamation.png', 't', 't');

INSERT INTO pacrud_syslogin(username, fullname, password) VALUES ('admin', 'Administrador do sistema', '21232f297a57a5a743894a0e4a801fc3');

INSERT INTO pacrud_groups(enabled, groupname) VALUES ('t', 'sysadmin');
INSERT INTO pacrud_groups(enabled, groupname) VALUES ('t', 'dev');
INSERT INTO pacrud_groups_syslogin(groupname, username) VALUES ('sysadmin', 'admin');
INSERT INTO pacrud_groups_syslogin(groupname, username) VALUES ('dev', 'admin');

INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_groups', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_controlPanel', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_changePassword', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_about', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_system', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_users', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_routines', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_submission', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_access_control', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_update', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_devtools', 'dev', 't', 't', 't', 't');

INSERT INTO pacrud_groups(enabled, groupname) VALUES ('t', 'change_password');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_system', 'change_password', 'f', 't', 'f', 'f');
INSERT INTO pacrud_routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_changePassword', 'change_password', 'f', 't', 't', 'f');

