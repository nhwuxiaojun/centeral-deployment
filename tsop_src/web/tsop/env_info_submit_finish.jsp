<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>环境申请表提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%

DBean db = new DBean();
ResultSet rs1;
ResultSet rs2;
ResultSet rs_user;
ResultSet rs_temp;
ResultSet rsdbinfo;
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String sql_temp = new String();
String sql_user = new String();
String sqldbinfo=new String();
//String error_msg=new String();


int i = 0;
int j = 0;
int id = 0;
int proj_code = 0;
int count = 0;
String mac_ip = new String();
String env_ip = new String();
String proj_env = new String();
	String proj_name = new String();
String web_inst_path = new String();
String html_path = new String();
String app_name = new String();
String app_inst_path = new String();
String app_port = new String();
//String db_info = new String();
//String db_usr = new String();
//String db_pwd = new String();
String env_usr = new String();
String env_pwd = new String();
String con_usr = new String();
String con_pwd = new String();
//String ftp_usr = new String();
//String ftp_pwd = new String();
String db_ldap_name = new String();
String proj_grp = new String();
String proj_dns = new String();
String backup_dir = new String();
String note = new String();
String creater = new String();
String crt_date = new String();
String proposer = new String();
String startup_script = new String();
String shell = new String();
String dms_type = new String();
String print_type = new String();
String apply_type=  new String();
String app_console=  new String();

String print_ip =  new String();
//String print_user =  new String();
//String print_pwd =  new String();
String print_dir =  new String();

//db_info

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




mac_ip = request.getParameter("MAC_IP").trim();
env_ip = request.getParameter("ENV_IP").trim();
proj_env = request.getParameter("PROJ_ENV").trim().toUpperCase();
web_inst_path = request.getParameter("WEB_INST_PATH").trim();
html_path = request.getParameter("HTML_PATH").trim();
//app_name = request.getParameter("APP_NAME").trim();
app_inst_path = request.getParameter("APP_INST_PATH").trim();
app_port = request.getParameter("APP_PORT").trim();
//db_info = request.getParameter("DB_INFO").trim();
//db_usr = request.getParameter("DB_USR").trim().toUpperCase();
//db_pwd = request.getParameter("DB_PWD").trim();
env_usr = request.getParameter("ENV_USR").trim();
env_pwd = request.getParameter("ENV_PWD").trim();
con_usr = request.getParameter("CON_USR").trim();
con_pwd = request.getParameter("CON_PWD").trim();
//ftp_usr = request.getParameter("FTP_USR").trim();
//ftp_pwd = request.getParameter("FTP_PWD").trim();
//db_ldap_name = request.getParameter("DB_LDAP_NAME").trim();
startup_script= request.getParameter("startup_script").trim();
//proj_grp = request.getParameter("PROJ_GRP").trim();
proj_dns = request.getParameter("PROJ_DNS").trim();
//backup_dir = request.getParameter("BACKUP_DIR").trim();
note = Tools.toGB(request.getParameter("NOTE").trim());
dms_type = request.getParameter("DMS_TYPE");
print_type = request.getParameter("PRINT_TYPE");

print_ip = request.getParameter("print_ip").trim();
//print_user = request.getParameter("print_user").trim();
//print_pwd = request.getParameter("print_pwd");
print_dir = request.getParameter("print_dir");

//creater = request.getParameter("CREATER").trim();
//crt_date = request.getParameter("CRT_DATE").trim();
//proposer = request.getParameter("PROPOSER").trim();
app_console=request.getParameter("APP_CONSOLE").trim();


sql1 = "select * from a_supply where new_env = '" + proj_env + "' and env_status = 'DOING'";
rs1 = db.execSQL(sql1);
while(rs1.next()){
//	mac_ip = rs1.getString("mac_ip");
//	env_ip = rs1.getString("env_ip");
	creater = rs1.getString("env_creator");
	crt_date = (rs1.getDate("apply_time").getYear() + 1900) + "-" + (rs1.getDate("apply_time").getMonth()+1) + "-" + rs1.getDate("apply_time").getDate() + " " + rs1.getTime("apply_time").getHours() + ":" + rs1.getTime("apply_time").getMinutes() + ":" + rs1.getTime("apply_time").getSeconds();
}

sql2 = "select * from a_apply where new_env = '" + proj_env + "'";
rs2 = db.execSQL(sql2);
while(rs2.next()){
	proposer = rs2.getString("proj_proposer");
	app_name = rs2.getString("app_soft");
	proj_grp = rs2.getString("proj_grp");
	proj_code = rs2.getInt("proj_code");
	proj_name=rs2.getString("proj_name");
	apply_type=rs2.getString("apply_type");
}

sql_temp = "select s_env__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
rs_temp = db.execSQL(sql_temp);
if(rs_temp.next()){
	id = rs_temp.getInt("id");
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





rs1.close();
rs2.close();
rs_temp.close();


sql = "insert into a_proj_env_svr(mac_ip,env_ip,proj_env,web_inst_path,html_path,app_name,app_inst_path,app_port,env_usr,env_pwd,con_usr,con_pwd,proj_grp,proj_dns,creater,crt_date,proposer,env_state,proj_code,proj_name,env_id,startup_script,note,dms_type,apply_type,print_type,print_ip,print_dir,app_console) values('" + mac_ip + "','" + env_ip + "','" + proj_env + "','" + web_inst_path;
sql = sql + "','" + html_path + "','" + app_name + "','" + app_inst_path + "','" + app_port + "','";
sql = sql + env_usr + "','" + env_pwd + "','" + con_usr + "','" + con_pwd + "','";
sql = sql + proj_grp + "','" + proj_dns + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + proposer + "','running','" + proj_code +"','"+proj_name+ "'," + id + ",'" + startup_script + "','" + note +  "','" + dms_type + "','"+ apply_type + "','" + print_type + "','" + print_ip + "','" + print_dir  + "','" + app_console +"')";

System.out.println("sql-------------"+sql+"-------");
try {
i = db.execUpdate(sql);
//out.println(i+"<br>");


} catch (Exception e) {
e.printStackTrace();
//error_msg=e.toString();
}

if(i==1){


//--------dmpfile start---------------------
//	try {
//		File f = new File("./applications/ts_op/jsp/tsmp_dmp/dmp.properties");
//		if (!f.exists()) {
//			f.createNewFile();
//	   }
//		FileWriter fw = new FileWriter(f);
//		BufferedWriter bw = new BufferedWriter(fw);
//
//
//	        bw.write("dmp.project.name" + "=" + proj_env + "\r\n");
//			bw.write("dmp.env.type.list" + "=" + "uat_tst,r2_tst,preuat,preprd,e2e,e2e_bk,e2e_demo,preupgrade" + "\r\n");
//			bw.write("dmp.env.type" + "=" + "dev" + "\r\n");
//			bw.write("dmp.logLevel" + "=" + "debug" + "\r\n");
//			bw.write("dmp.verboseFlag" + "=" + "true" + "\r\n");
//			bw.write("dmp.debug" + "=" + "false" + "\r\n");
//			bw.write("isICP3.5" + "=" + "true" + "\r\n");
//			bw.write("dmp.product.type" + "=" + "gs" + "\r\n");
//			bw.write("replaceToken" + "=" + "default" + "\r\n");
//			bw.write("dmp.remote.app.user.name" + "=" + env_usr + "\r\n");
//			bw.write("dmp.remote.app.user.pwd" + "=" + env_pwd + "\r\n");
//			bw.write("dmp.env.app.host.name" + "=" + mac_ip + "\r\n");
//			bw.write("dmp.env.port" + "=" + app_port + "\r\n");
//			bw.write("dmp.env.context" + "=" + "insurance" + "\r\n");
//
//			bw.write("dmp.env.url" + "=" + proj_dns + "\r\n");
//			bw.write("dmp.env.ebao.root.dir" + "=" + app_inst_path+"/ebao_root" + "\r\n");
//			bw.write("dmp.env.ebao.home.dir" + "=" + app_inst_path+"/EBAO_HOME" + "\r\n");
//			bw.write("dmp.env.ebao.tmp.home.dir" + "=" + app_inst_path+"/EBAO_TMP_HOME" + "\r\n");
//			bw.write("dmp.env.app.config.home.dir" + "=" + app_inst_path+"/app_config" + "\r\n");
//			bw.write("dmp.env.dataSources.name" + "=" + "ebao_insurance-ebao_usrDs" + "\r\n");
//			bw.write("dmp.env.dataSources.jndi.name" + "=" + "ebao_insurance-ebao_usrDs" + "\r\n");
//
//			bw.write("isEncryptUserPwd" + "=" + "false" + "\r\n");
//			bw.write("instance.name" + "=" + "generalsystem" + "\r\n");
//			bw.write("isXaDriver" + "=" + "false" + "\r\n");
//
//			bw.write("maxHeapSize" + "=" + "768" + "\r\n");
//			bw.write("minHeapSize" + "=" + "768" + "\r\n");
//			bw.write("genericJvmArguments" + "=" + "-server -verbose:gc -XX:+PrintGCTimeStamps -XX:+PrintGCDetails" + "\r\n");
//			bw.write("maxDBConnections" + "=" + "40" + "\r\n");
//			bw.write("minDBConnections" + "=" + "10" + "\r\n");
//			bw.write("app.name" + "=" + "insurance" + "\r\n");
//
//			bw.write("package.ear.home" + "=" + "EAR_FILE" + "\r\n");
//			bw.write("isEAR" + "=" + "true" + "\r\n");
//			bw.write("package.ear.name" + "=" + "insurance.ear" + "\r\n");
//			bw.write("package.db.home" + "=" + "db" + "\r\n");
//			bw.write("package.ebao.home" + "=" + "EBAO_HOME" + "\r\n");
//
//			bw.write("package.tmp.home" + "=" + "EBAO_TMP_HOME" + "\r\n");
//			bw.write("package.app.config.home" + "=" + "EBAO_HOME/app_config" + "\r\n");
//
//			bw.write("oracle.host.name" + "=" + db_ip+ "\r\n");
//			bw.write("oracle.sid.name" + "=" + db_sid + "\r\n");
//			bw.write("oracle.listen.port" + "=" + db_port_num + "\r\n");
//			bw.write("oracle.jdbc.url" + "=" + "jdbc:oracle:thin:@"+db_ip+":"+db_port_num+":"+db_sid + "\r\n");
//
//			bw.write("oracle.tablespace.name" + "=" +db_user +""+"_tbs"+ "\r\n");
//			bw.write("db.sequence.section" + "=" + "" + "\r\n");
//			bw.write("db.owner.user.name" + "=" + db_user + "\r\n");
//			bw.write("db.owner.user.pwd" + "=" + db_user_passwd + "\r\n");
//			bw.write("db.app.user.name" + "=" + db_app_user+ "\r\n");
//			bw.write("db.app.user.pwd"   + "=" + db_app_user_passwd + "\r\n");
//			bw.write("db.read.user.name" + "=" + db_read_user + "\r\n");
//			bw.write("db.read.user.pwd"  + "=" + db_read_user_passwd + "\r\n");
//
//			if (app_name.toLowerCase().indexOf("tomcat", 0) >= 0) {
//	 			bw.write("dmp.application.server.type" + "=" + "tomcat" + "\r\n");
//				bw.write("tomcat.home.dir" + "=" + app_inst_path + "\r\n");
//				bw.write("tomcat.shutdown.port" + "=" + "8008" + "\r\n");
//				bw.write("tomcat.connector.port" + "=" + app_port + "\r\n");
//				bw.write("tomcat.connector.ip.address" + "=" + env_ip + "\r\n");
//	        }
//			if (app_name.toLowerCase().indexOf("weblogic", 0) >= 0) {
//	 			bw.write("dmp.application.server.type" + "=" + "weblogic" + "\r\n");
//
//				bw.write("wls.admin.user.name" + "=" + con_usr + "\r\n");
//				bw.write("wls.admin.user.pwd" + "=" + con_pwd + "\r\n");
//                bw.write("wls.listen.port" + "=" + app_port + "\r\n");
//                bw.write("wls.listen.address" + "=" + mac_ip + "\r\n");
//
//				bw.write("wls.server.name" + "=" + "AdminServer" + "\r\n");
//				bw.write("wls.domain.name" + "=" + "base_domain" + "\r\n");
//                bw.write("wls.domain.home.dir" + "=" + app_inst_path + "\r\n");
//                bw.write("wls.domain.app.home.dir" + "=" + app_inst_path + "\r\n");
//	        }
//			if (app_name.toLowerCase().indexOf("websphere", 0) >= 0) {
//	 			bw.write("dmp.application.server.type" + "=" + "websphere" + "\r\n");
//
//				bw.write("was.host.name" + "=" + mac_ip + "\r\n");
//				bw.write("was.cell.name" + "=" + "Node01Cell" + "\r\n");
//				bw.write("was.node.name" + "=" + proj_env+"Node" + "\r\n");
//				bw.write("was.profile.home.dir" + "=" + app_inst_path + "\r\n");
//				bw.write("was.server.name" + "=" + "server1" + "\r\n");
//				bw.write("was.profile.name" + "=" + proj_env + "\r\n");
//				bw.write("was.admin.user.name" + "=" + con_usr + "\r\n");
//				bw.write("was.admin.user.pwd" + "=" + con_pwd + "\r\n");
//
//				bw.write("was.virtual.host.name" + "=" + "default" + "\r\n");
//				bw.write("was.jaas.alias.name" + "=" + "ebao_jaas_alias" + "\r\n");
//				bw.write("was.connector.type" + "=" + "SOAP" + "\r\n");
//				bw.write("was.connector.port" + "=" + app_port + "\r\n");
//
//	        }
//
//
//
//		bw.flush();
//		bw.close();
//		}
//
//		catch (IOException ex) {
//			ex.printStackTrace();
//		}

//---------dmp file end-----------	



	j = db.execUpdate("update a_supply set env_status='DONE' where new_env='" + proj_env + "' and env_status='DOING'");
	db.close();
	if(j==1){
		if("1".equals(request.getParameter("send_email"))){
        	Properties props = new Properties();
        	props.put("mail.smtp.host","mail.ebaotech.com");
        	props.put("mail.smtp.auth","true");
        	Session s = Session.getInstance(props);
        	String content = new String();
        	MimeMessage message = new MimeMessage(s);
        	InternetAddress from = new InternetAddress("op@ebaotech.com");
        	message.setFrom(from);
			InternetAddress toAddress[] = new InternetAddress[1];
			toAddress[0] = new InternetAddress("ts-op@ebaotech.com");
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	message.setSubject("应用信息已提交");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
        	content = "Project Name: " + proj_env;
			content = content + "<br>Server Ip: " + mac_ip;
			content = content + "<br>App Ip: " + env_ip;
			content = content + "<br>Html Path: " + html_path;
			content = content + "<br>Apache Path: " + web_inst_path;
			content = content + "<br>App Path: " + app_inst_path;
			if(backup_dir==null||"".equals(backup_dir)){
				
			}else{
				content = content + "<br>Backup Path: " + backup_dir;
			}
			content = content + "<br>Please be careful to add backups.";
        	mdp.setContent(content,"text/html;charset=gbk");
        	Multipart mm = new MimeMultipart();
        	mm.addBodyPart(mdp);
        	message.setContent(mm);
        	message.saveChanges();
        	try
			{
        		Transport transport = s.getTransport("smtp");
        		transport.connect("mail.ebaotech.com","op","Sudn1105");
        		transport.sendMessage(message,message.getAllRecipients());
        		transport.close();
				//参数1. 环境名称
                // 参数2. 环境IP
                //参数3：启动脚本
				if (!"".equals(startup_script) && startup_script != null) {    
				  shell = "sh  /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/env_startup.sh " + proj_env + " " + env_ip  +" "+ startup_script+ " " + env_usr;
				  System.out.print("------------------shell= " + shell);
       		      Runtime.getRuntime().exec(shell);
				 }
        	}
        	catch(Exception e)
        	{
        		System.err.println(e.getMessage());
        	}
		}
		
		
		try{
      	 	shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/delcert.sh " + creater + " " + mac_ip;
    		Runtime.getRuntime().exec(shell);
		}
		catch(Exception e)
		{
  	     	System.err.println(e.getMessage());
		}
		
		
		
		response.sendRedirect("env_info_submit_list.jsp?info=Environment Submit Succeed!"+proj_env);
	}else{
		response.sendRedirect("env_info_submit_list.jsp?info=Environment Submit Failed!"+proj_env);
	}
}else{
	response.sendRedirect("env_info_submit_list.jsp?info=Create Failed!<br>");
}

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
