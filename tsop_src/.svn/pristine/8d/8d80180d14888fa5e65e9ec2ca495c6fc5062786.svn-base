<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>应用环境信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql1 = new String();
String sql2 = new String();
String sqldbinfo=new String();
ResultSet rsdbinfo;
String shell = new String();
String name = new String();
String ip = new String();
int i = 0;
int j = 0;

//---dmp file ---
String  app_name=new String();
String proj_env=new String();
String env_usr=new String();
String env_pwd=new String();
String env_ip=new String();
String app_port=new String();
String proj_dns=new String();
String app_inst_path=new String();

//----db info---
String  db_user=new String();
String db_user_passwd=new String(); 
String db_user_type=new String();
String db_sid=new String();
String db_ip=new String();
String db_port_num=new String();
String db_read_user=new String();
String db_read_user_passwd=new String(); 
String db_app_user=new String();
String db_app_user_passwd=new String(); 
String con_usr=new String();
String con_pwd=new String(); 

String print_ip =  new String();
String print_user =  new String();
String print_pwd =  new String();
String print_dir =  new String();

String sql = new String();
ResultSet rs;
sql = "select b.*, a.backup_type from a_apply a, a_proj_env_svr_tmp b where a.new_env(+) = b.proj_env and b.env_id = " + request.getParameter("id");
rs = db.execSQL(sql);
while(rs.next()){
	name = rs.getString("creater");
	ip = rs.getString("mac_ip");
   
    app_name=rs.getString("app_name");
	proj_env=rs.getString("proj_env").toLowerCase();
	env_usr=rs.getString("env_usr").toLowerCase();
	env_pwd=rs.getString("env_pwd").toLowerCase();
	env_ip=rs.getString("env_ip").toLowerCase();
	app_port=rs.getString("app_port").toLowerCase();
	proj_dns=rs.getString("proj_dns").toLowerCase();
	app_inst_path=rs.getString("app_inst_path").toLowerCase();
	con_usr=rs.getString("con_usr");
	con_pwd=rs.getString("con_pwd");

	print_ip=rs.getString("print_ip");
	print_user=rs.getString("print_user");
	print_pwd=rs.getString("print_pwd");
	print_dir=rs.getString("print_dir");
   }

  sqldbinfo = "select proj_env, db_user, db_user_passwd, db_user_type,db_sid,db_ip,db_port_num from (select proj_env, db_user, db_user_passwd, db_user_type,db_sid,db_ip,db_port_num   from a_db_svr  union  select proj_env, db_user, db_user_passwd,db_user_type,db_sid,db_ip,db_port_num from a_db_svr_tmp) where lower(proj_env) in (select lower(proj_env) from a_proj_env_svr_tmp b where b.env_id = " + request.getParameter("id")+")";
  rsdbinfo = db.execSQL(sqldbinfo);
 	
	while(rsdbinfo.next()){
	  db_user_type=rsdbinfo.getString("db_user_type").toLowerCase();

      if("owner".endsWith(db_user_type)){
	  	db_sid=rsdbinfo.getString("db_sid").toLowerCase();
        db_ip=rsdbinfo.getString("db_ip").toLowerCase();
        db_port_num=rsdbinfo.getString("db_port_num");
	    db_user=rsdbinfo.getString("db_user").toLowerCase();
      	db_user_passwd=rsdbinfo.getString("db_user_passwd").toLowerCase();
	  }
	  if("read".endsWith(db_user_type)){
	  db_read_user=rsdbinfo.getString("db_user").toLowerCase();
      db_read_user_passwd=rsdbinfo.getString("db_user_passwd").toLowerCase();
	  }
      if("app".endsWith(db_user_type)){
	  db_app_user=rsdbinfo.getString("db_user").toLowerCase();
      db_app_user_passwd=rsdbinfo.getString("db_user_passwd").toLowerCase();
	  }

    }



sql1 = "insert into a_proj_env_svr  (MAC_IP,ENV_IP,PROJ_ENV,WEB_INST_PATH,HTML_PATH,APP_NAME,APP_INST_PATH,APP_PORT,DB_INFO,DB_USR,DB_PWD,ENV_USR,ENV_PWD,CON_USR,CON_PWD,FTP_USR,FTP_PWD,PROJ_GRP,PROJ_DNS,CREATER,CRT_DATE,PROPOSER,ENV_STATE,PROJ_CODE,ENV_ID,LATEST_UPDATE_DATE,BACKUP_DIR,NOTE,STARTUP_SCRIPT,DMS_TYPE,PRINT_TYPE,APPLY_TYPE,print_ip,print_user,print_pwd,print_dir)   select a_proj_env_svr_tmp.mac_ip,env_ip,proj_env,web_inst_path,html_path,app_name,app_inst_path,app_port,db_info,db_usr,db_pwd,env_usr,env_pwd,con_usr,con_pwd,ftp_usr,ftp_pwd,proj_grp,proj_dns,creater,crt_date,proposer,env_state,proj_code,s_env__id.nextval,a_proj_env_svr_tmp.crt_date,backup_dir,note,startup_script,dms_type,print_type,apply_type ,print_ip,print_user,print_pwd,print_dir from a_proj_env_svr_tmp where env_id = " + request.getParameter("id");
i = db.execUpdate(sql1);
sql2 = "delete from a_proj_env_svr_tmp where env_id = " + request.getParameter("id");
j = db.execUpdate(sql2);
db.close();
if(i==1&&j==1){


//--------dmpfile start---------------------
	try {
		File f = new File("./applications/ts_op/jsp/tsmp_dmp/dmp.properties");
		if (!f.exists()) {
			f.createNewFile();
	   }
		FileWriter fw = new FileWriter(f);
		BufferedWriter bw = new BufferedWriter(fw);

	
	        bw.write("dmp.project.name" + "=" + proj_env + "\r\n");
			bw.write("dmp.env.type.list" + "=" + "uat_tst,r2_tst,preuat,preprd,e2e,e2e_bk,e2e_demo,preupgrade" + "\r\n");
			bw.write("dmp.env.type" + "=" + "dev" + "\r\n");
			bw.write("dmp.logLevel" + "=" + "debug" + "\r\n");
			bw.write("dmp.verboseFlag" + "=" + "true" + "\r\n");
			bw.write("dmp.debug" + "=" + "false" + "\r\n");
			bw.write("isICP3.5" + "=" + "true" + "\r\n");
			bw.write("dmp.product.type" + "=" + "gs" + "\r\n");
			bw.write("replaceToken" + "=" + "default" + "\r\n");
			bw.write("dmp.remote.app.user.name" + "=" + env_usr + "\r\n");
			bw.write("dmp.remote.app.user.pwd" + "=" + env_pwd + "\r\n");
			bw.write("dmp.env.app.host.name" + "=" + ip + "\r\n");
			bw.write("dmp.env.port" + "=" + app_port + "\r\n");
			bw.write("dmp.env.context" + "=" + "insurance" + "\r\n");

			bw.write("dmp.env.url" + "=" + proj_dns + "\r\n");
			bw.write("dmp.env.ebao.root.dir" + "=" + app_inst_path+"/ebao_root" + "\r\n");
			bw.write("dmp.env.ebao.home.dir" + "=" + app_inst_path+"/EBAO_HOME" + "\r\n");
			bw.write("dmp.env.ebao.tmp.home.dir" + "=" + app_inst_path+"/EBAO_TMP_HOME" + "\r\n");
			bw.write("dmp.env.app.config.home.dir" + "=" + app_inst_path+"/app_config" + "\r\n");
			bw.write("dmp.env.dataSources.name" + "=" + "ebao_insurance-ebao_usrDs" + "\r\n");
			bw.write("dmp.env.dataSources.jndi.name" + "=" + "ebao_insurance-ebao_usrDs" + "\r\n");

			bw.write("isEncryptUserPwd" + "=" + "false" + "\r\n");
			bw.write("instance.name" + "=" + "generalsystem" + "\r\n");
			bw.write("isXaDriver" + "=" + "false" + "\r\n");
			
			bw.write("maxHeapSize" + "=" + "768" + "\r\n");
			bw.write("minHeapSize" + "=" + "768" + "\r\n");
			bw.write("genericJvmArguments" + "=" + "-server -verbose:gc -XX:+PrintGCTimeStamps -XX:+PrintGCDetails" + "\r\n");
			bw.write("maxDBConnections" + "=" + "40" + "\r\n");
			bw.write("minDBConnections" + "=" + "10" + "\r\n");
			bw.write("app.name" + "=" + "insurance" + "\r\n");

			bw.write("package.ear.home" + "=" + "EAR_FILE" + "\r\n");
			bw.write("isEAR" + "=" + "true" + "\r\n");
			bw.write("package.ear.name" + "=" + "insurance.ear" + "\r\n");
			bw.write("package.db.home" + "=" + "db" + "\r\n");
			bw.write("package.ebao.home" + "=" + "EBAO_HOME" + "\r\n");

			bw.write("package.tmp.home" + "=" + "EBAO_TMP_HOME" + "\r\n");
			bw.write("package.app.config.home" + "=" + "EBAO_HOME/app_config" + "\r\n");
			
			bw.write("oracle.host.name" + "=" + db_ip+ "\r\n");
			bw.write("oracle.sid.name" + "=" + db_sid + "\r\n");
			bw.write("oracle.listen.port" + "=" + db_port_num + "\r\n");
			bw.write("oracle.jdbc.url" + "=" + "jdbc:oracle:thin:@"+db_ip+":"+db_port_num+":"+db_sid + "\r\n");

			bw.write("oracle.tablespace.name" + "=" +db_user +""+"_tbs"+ "\r\n");
			bw.write("db.sequence.section" + "=" + "" + "\r\n");
			bw.write("db.owner.user.name" + "=" + db_user + "\r\n");
			bw.write("db.owner.user.pwd" + "=" + db_user_passwd + "\r\n");
			bw.write("db.app.user.name" + "=" + db_app_user+ "\r\n");
			bw.write("db.app.user.pwd"   + "=" + db_app_user_passwd + "\r\n");
			bw.write("db.read.user.name" + "=" + db_read_user + "\r\n");
			bw.write("db.read.user.pwd"  + "=" + db_read_user_passwd + "\r\n");
			
			if (app_name.toLowerCase().indexOf("tomcat", 0) >= 0) {
	 			bw.write("dmp.application.server.type" + "=" + "tomcat" + "\r\n");
				bw.write("tomcat.home.dir" + "=" + app_inst_path + "\r\n");
				bw.write("tomcat.shutdown.port" + "=" + "8008" + "\r\n");
				bw.write("tomcat.connector.port" + "=" + app_port + "\r\n");
				bw.write("tomcat.connector.ip.address" + "=" + env_ip + "\r\n");
	        }
			if (app_name.toLowerCase().indexOf("weblogic", 0) >= 0) {
	 			bw.write("dmp.application.server.type" + "=" + "weblogic" + "\r\n");
				
				bw.write("wls.admin.user.name" + "=" + con_usr + "\r\n");
				bw.write("wls.admin.user.pwd" + "=" + con_pwd + "\r\n");
                bw.write("wls.listen.port" + "=" + app_port + "\r\n");	
                bw.write("wls.listen.address" + "=" + ip + "\r\n");	
				
				bw.write("wls.server.name" + "=" + "AdminServer" + "\r\n");
				bw.write("wls.domain.name" + "=" + "base_domain" + "\r\n");
                bw.write("wls.domain.home.dir" + "=" + app_inst_path + "\r\n");	
                bw.write("wls.domain.app.home.dir" + "=" + app_inst_path + "\r\n");	
	        }
			if (app_name.toLowerCase().indexOf("websphere", 0) >= 0) {
	 			bw.write("dmp.application.server.type" + "=" + "websphere" + "\r\n");
				
				bw.write("was.host.name" + "=" + ip + "\r\n");
				bw.write("was.cell.name" + "=" + "Node01Cell" + "\r\n");
				bw.write("was.node.name" + "=" + proj_env+"Node" + "\r\n");
				bw.write("was.profile.home.dir" + "=" + app_inst_path + "\r\n");				
				bw.write("was.server.name" + "=" + "server1" + "\r\n");
				bw.write("was.profile.name" + "=" + proj_env + "\r\n");
				bw.write("was.admin.user.name" + "=" + con_usr + "\r\n");
				bw.write("was.admin.user.pwd" + "=" + con_pwd + "\r\n");	
								
				bw.write("was.virtual.host.name" + "=" + "default" + "\r\n");
				bw.write("was.jaas.alias.name" + "=" + "ebao_jaas_alias" + "\r\n");
				bw.write("was.connector.type" + "=" + "SOAP" + "\r\n");				
				bw.write("was.connector.port" + "=" + app_port + "\r\n");					
								
	        }			
	
			

		bw.flush();
		bw.close();
		}

		catch (IOException ex) {
			ex.printStackTrace();
		}

//---------dmp file end-----------	



	response.sendRedirect("env_info_confirm.jsp?info=确认成功！");
	try{
       	shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/delcert.sh " + name + " " + ip;
    	Runtime.getRuntime().exec(shell);
	}
	catch(Exception e)
	{
       	System.err.println(e.getMessage());
	}
}else{
	response.sendRedirect("env_info_confirm.jsp?info=确认失败！");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
