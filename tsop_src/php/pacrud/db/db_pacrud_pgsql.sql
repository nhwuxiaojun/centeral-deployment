CREATE SCHEMA pacrud;

CREATE TABLE pacrud.config
(
  config_name character varying(40) NOT NULL,
  config_value character varying(255),
  CONSTRAINT config_pkey PRIMARY KEY (config_name)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.syslogin
(
  username character varying(30) NOT NULL,
  fullname character varying(50) NOT NULL,
  "password" character varying(40),
  enabled boolean NOT NULL DEFAULT 't',
  CONSTRAINT syslogin_pkey PRIMARY KEY (username)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.groups
(
  enabled boolean NOT NULL DEFAULT 't',
  groupname character varying(30) NOT NULL,
  CONSTRAINT groups_pkey PRIMARY KEY (groupname)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.groups_syslogin
(
  groupname character varying(30) NOT NULL,
  username character varying(30) NOT NULL,
  CONSTRAINT groups_syslogin_pkey PRIMARY KEY (groupname, username)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.routines
(
  routine character varying(40) NOT NULL,
  link character varying(255),
  enabled boolean NOT NULL DEFAULT 't',
  description text,
  CONSTRAINT routines_pkey PRIMARY KEY (routine)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.routines_groups
(
  routine character varying(40) NOT NULL,
  groupname character varying(40) NOT NULL,
  c boolean NOT NULL DEFAULT 'f',
  r boolean NOT NULL DEFAULT 'f',
  u boolean NOT NULL DEFAULT 'f',
  d boolean NOT NULL DEFAULT 'f',
  CONSTRAINT routines_groups_pkey PRIMARY KEY (routine, groupname),
  CONSTRAINT routines_groups_routine_fkey FOREIGN KEY (routine)
      REFERENCES pacrud.routines (routine) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.menu
(
  cod serial NOT NULL,
  parent integer,
  caption character varying(40) NOT NULL,
  routine character varying(40) NOT NULL,
  icon character varying(255),
  enabled boolean NOT NULL DEFAULT 't',
  opened boolean NOT NULL DEFAULT 't',
  CONSTRAINT menu_pkey PRIMARY KEY (cod),
  CONSTRAINT menu_parent_fkey FOREIGN KEY (parent)
      REFERENCES pacrud.menu (cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT menu_routine_fkey FOREIGN KEY (routine)
      REFERENCES pacrud.routines (routine) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT menu_parent_key UNIQUE (parent, caption)
)
WITH (
  OIDS=FALSE
);

CREATE VIEW pacrud.v_menu AS
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
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m5.parent)))) as level1,
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m5.parent))) as level2,
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m5.parent)) as level3,
			(SELECT caption FROM pacrud.menu WHERE cod=m5.parent) as level4,
			caption as level5,
			5 as nivel,
			parent,
			routine
		FROM pacrud.menu m5
		WHERE m5.cod IN (
			--level5
			SELECT cod FROM pacrud.menu WHERE parent IN (
				--level4
				SELECT cod FROM pacrud.menu WHERE parent IN (
					--level3
					SELECT cod FROM pacrud.menu WHERE parent IN (
						--level2
						SELECT cod FROM pacrud.menu WHERE parent IN (
							--level1
							SELECT cod FROM pacrud.menu WHERE parent IS NULL
						)
					)
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m4.parent))) as level1,
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m4.parent)) as level2,
			(SELECT caption FROM pacrud.menu WHERE cod=m4.parent) as level3,
			caption as level4,
			CAST('_' as TEXT) as level5,
			4 as nivel,
			parent,
			routine
		FROM pacrud.menu m4
		WHERE m4.cod IN (
			--level4
			SELECT cod FROM pacrud.menu WHERE parent IN (
				--level3
				SELECT cod FROM pacrud.menu WHERE parent IN (
					--level2
					SELECT cod FROM pacrud.menu WHERE parent IN (
						--level1
						SELECT cod FROM pacrud.menu WHERE parent IS NULL
					)
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud.menu WHERE cod=(SELECT parent FROM pacrud.menu WHERE cod=m3.parent)) as level1,
			(SELECT caption FROM pacrud.menu WHERE cod=m3.parent) as level2,
			caption as level3,
			CAST('_' as TEXT) as level4,
			CAST(NULL as TEXT) as level5,
			3 as nivel,
			parent,
			routine
		FROM pacrud.menu m3
		WHERE m3.cod IN (
			--level3
			SELECT cod FROM pacrud.menu WHERE parent IN (
				--level2
				SELECT cod FROM pacrud.menu WHERE parent IN (
					--level1
					SELECT cod FROM pacrud.menu WHERE parent IS NULL
				)
			)
		)

		UNION

		SELECT 
			cod,
			(SELECT caption FROM pacrud.menu WHERE cod=m2.parent) as level1,
			caption as level2,
			CAST('_' as TEXT) as level3,
			CAST(NULL as TEXT) as level4,
			CAST(NULL as TEXT) as level5,
			2 as nivel,
			parent,
			routine
		FROM pacrud.menu m2
		WHERE m2.cod IN (
			--level2
			SELECT cod FROM pacrud.menu WHERE parent IN (
				--level1
				SELECT cod FROM pacrud.menu WHERE parent IS NULL
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
		FROM pacrud.menu m1
		WHERE m1.parent IS NULL
	) a
	ORDER BY level1,level2,level3,level4,level5
) search;

CREATE TABLE pacrud.log_sql
(
  log_serial serial NOT NULL,
  log_timestamp timestamp without time zone NOT NULL DEFAULT now(),
  log_obj_name character varying(100) NOT NULL,
  usr_login character varying(40),
  log_pacrud_method character varying(40) NOT NULL,
  log_statement text NOT NULL,
  CONSTRAINT log_sql_pkey PRIMARY KEY (log_serial)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE pacrud.update_framework
(
   file_name character varying(100) NOT NULL, 
   usr_login character varying(40), 
   date_time timestamp without time zone NOT NULL DEFAULT now(), 
   PRIMARY KEY (file_name)
) 
WITH (
  OIDS = FALSE
);

INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_groups', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_controlPanel', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_changePassword', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_about', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_system', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_users', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_routines', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_submission', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_access_control', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_update', NULL, 't', NULL);
INSERT INTO pacrud.routines (routine, link, enabled, description) VALUES ('pacrud_devtools', NULL, 't', NULL);

INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES (NULL, 'SISTEMA', 'pacrud_system', 'view/images/icons/example.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Alterar Senha', 'pacrud_changePassword', 'view/images/icons/key.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Atualização', 'pacrud_update', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Controle de Acesso', 'pacrud_access_control', 'view/images/icons/key.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_access_control' ORDER BY cod LIMIT 1), 'Grupos de Usuários', 'pacrud_groups', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_access_control' ORDER BY cod LIMIT 1), 'Permissões e Menus', 'pacrud_routines', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_access_control' ORDER BY cod LIMIT 1), 'Usuários', 'pacrud_users', 'view/images/icons/users.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Desenvolvimento', 'pacrud_devtools', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Instruções iniciais', 'pacrud_submission', 'view/images/icons/exclamation.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Painel de Controle', 'pacrud_controlPanel', 'view/images/icons/system.png', 't', 't');
INSERT INTO pacrud.menu (parent, caption, routine, icon, enabled, opened) VALUES ((SELECT cod FROM pacrud.menu WHERE routine='pacrud_system' ORDER BY cod LIMIT 1), 'Sobre o paCRUD', 'pacrud_about', 'view/images/icons/exclamation.png', 't', 't');

INSERT INTO pacrud.syslogin(username, fullname, "password") VALUES ('admin', 'Administrador do sistema', '21232f297a57a5a743894a0e4a801fc3');

INSERT INTO pacrud.groups(enabled, groupname) VALUES ('t', 'sysadmin');
INSERT INTO pacrud.groups(enabled, groupname) VALUES ('t', 'dev');
INSERT INTO pacrud.groups_syslogin(groupname, username) VALUES ('sysadmin', 'admin');
INSERT INTO pacrud.groups_syslogin(groupname, username) VALUES ('dev', 'admin');

INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_groups', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_controlPanel', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_changePassword', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_about', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_system', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_users', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_routines', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_submission', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_access_control', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_update', 'sysadmin', 't', 't', 't', 't');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_devtools', 'dev', 't', 't', 't', 't');

INSERT INTO pacrud.groups(enabled, groupname) VALUES ('t', 'change_password');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_system', 'change_password', 'f', 't', 'f', 'f');
INSERT INTO pacrud.routines_groups(routine, groupname, c, r, u, d) VALUES ('pacrud_changePassword', 'change_password', 'f', 't', 't', 'f');

