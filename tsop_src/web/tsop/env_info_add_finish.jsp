<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
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
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String sql_temp = new String();
String sql_user = new String();
int i = 0;
int j = 0;
int id = 0;
int proj_code = 0;
int count = 0;
String mac_ip = new String();
String env_ip = new String();
String proj_env = new String();
String web_inst_path = new String();
String html_path = new String();
String app_name = new String();
String app_inst_path = new String();
String app_port = new String();
String app_console = new String();
String db_info = new String();
String db_usr = new String();
String db_pwd = new String();
String env_usr = new String();
String env_pwd = new String();
String con_usr = new String();
String con_pwd = new String();
String ftp_usr = new String();
String ftp_pwd = new String();
String proj_grp = new String();
String proj_dns = new String();
String backup_dir = new String();
String note = new String();
String creater = new String();
String crt_date = new String();
String proposer = new String();
String startup_script = new String();


//mac_ip = request.getParameter("MAC_IP").trim();
//env_ip = request.getParameter("ENV_IP").trim();
proj_env = request.getParameter("PROJ_ENV").trim();
web_inst_path = request.getParameter("WEB_INST_PATH").trim();
html_path = request.getParameter("HTML_PATH").trim();
//app_name = request.getParameter("APP_NAME").trim();
app_inst_path = request.getParameter("APP_INST_PATH").trim();
app_port = request.getParameter("APP_PORT").trim();
app_console = request.getParameter("APP_CONSOLE").trim();
db_info = request.getParameter("DB_INFO").trim();
db_usr = request.getParameter("DB_USR").trim().toUpperCase();
db_pwd = request.getParameter("DB_PWD").trim();
env_usr = request.getParameter("ENV_USR").trim();
env_pwd = request.getParameter("ENV_PWD").trim();
con_usr = request.getParameter("CON_USR").trim();
con_pwd = request.getParameter("CON_PWD").trim();
ftp_usr = request.getParameter("FTP_USR").trim();
ftp_pwd = request.getParameter("FTP_PWD").trim();
startup_script= request.getParameter("startup_script").trim();
//proj_grp = request.getParameter("PROJ_GRP").trim();
proj_dns = request.getParameter("PROJ_DNS").trim();
backup_dir = request.getParameter("BACKUP_DIR").trim();
note = Tools.toGB(request.getParameter("NOTE").trim());

//creater = request.getParameter("CREATER").trim();
//crt_date = request.getParameter("CRT_DATE").trim();
//proposer = request.getParameter("PROPOSER").trim();


sql1 = "select * from a_supply where new_env = '" + proj_env + "' and env_status = 'DOING'";
rs1 = db.execSQL(sql1);
while(rs1.next()){
	mac_ip = rs1.getString("mac_ip");
	env_ip = rs1.getString("env_ip");
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
}

sql_temp = "select s_env_tmp__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
rs_temp = db.execSQL(sql_temp);
if(rs_temp.next()){
	id = rs_temp.getInt("id");
}

rs1.close();
rs2.close();
rs_temp.close();

sql = "insert into a_proj_env_svr_tmp(mac_ip,env_ip,proj_env,web_inst_path,html_path,app_name,app_inst_path,app_port,app_console,db_info,db_usr,db_pwd,env_usr,env_pwd,con_usr,con_pwd,ftp_usr,ftp_pwd,proj_grp,proj_dns,creater,crt_date,proposer,env_state,proj_code,env_id,backup_dir,startup_script,note) values('" + mac_ip + "','" + env_ip + "','" + proj_env + "','" + web_inst_path;
sql = sql + "','" + html_path + "','" + app_name + "','" + app_inst_path + "','" + app_port + "','" app_console + "','" + db_info + "','" + db_usr + "','";
sql = sql + db_pwd + "','" + env_usr + "','" + env_pwd + "','" + con_usr + "','" + con_pwd + "','" + ftp_usr + "','" + ftp_pwd + "','";
sql = sql + proj_grp + "','" + proj_dns + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + proposer + "','running','" + proj_code + "'," + id + ",'" + backup_dir + "','" + startup_script + "','" + note + "')";

//out.println(sql+"<br>");
i = db.execUpdate(sql);
//out.println(i+"<br>");

if(i==1){
	j = db.execUpdate("update a_supply set env_status='DONE' where new_env='" + proj_env + "' and env_status='DOING'");
	db.close();
	if(j==1){
		if("1".equals(request.getParameter("send_email"))){
        	Properties props = new Properties();
        	props.put("mail.smtp.host","smtp.ebaotech.com");
        	props.put("mail.smtp.auth","false");
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
        		transport.connect("smtp.ebaotech.com","op","Sudn1105");
        		transport.sendMessage(message,message.getAllRecipients());
        		transport.close();
        	}
        	catch(Exception e)
        	{
        		System.err.println(e.getMessage());
        	}
		}
		response.sendRedirect("env_info_confirm.jsp?info=Create Succeed!");
	}else{
		response.sendRedirect("env_info_confirm.jsp?info=Create Failed!");
	}
}else{
	response.sendRedirect("env_info_confirm.jsp?info=Create Failed!");
}

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
