<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*, java.util.*" %>
<html>
<head>
<title>环境申请表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql_user = new String();
int i = 0;
String mac_ip = new String();
String env_ip = new String();
String proj_env = new String();
String web_inst_path = new String();
String html_path = new String();
String app_name = new String();
String app_inst_path = new String();
String app_port = new String();
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
String creater = new String();
String crt_date = new String();
String proposer = new String();
String env_state = new String();
String proj_code = new String();
String env_id = new String();
String backup_dir = new String();
String note = new String();

String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

ResultSet rs_user;

mac_ip = request.getParameter("MAC_IP");
env_ip = request.getParameter("ENV_IP");
proj_env = request.getParameter("PROJ_ENV");
web_inst_path = request.getParameter("WEB_INST_PATH");
html_path = request.getParameter("HTML_PATH");
app_name = request.getParameter("APP_NAME");
app_inst_path = request.getParameter("APP_INST_PATH");
app_port = request.getParameter("APP_PORT");
db_info = request.getParameter("DB_INFO");
db_usr = request.getParameter("DB_USR");
db_pwd = request.getParameter("DB_PWD");
env_usr = request.getParameter("ENV_USR");
env_pwd = request.getParameter("ENV_PWD");
con_usr = request.getParameter("CON_USR");
con_pwd = request.getParameter("CON_PWD");
ftp_usr = request.getParameter("FTP_USR");
ftp_pwd = request.getParameter("FTP_PWD");
proj_grp = request.getParameter("PROJ_GRP");
proj_dns = request.getParameter("PROJ_DNS");
creater = request.getParameter("CREATER");
crt_date = request.getParameter("CRT_DATE");
proposer = request.getParameter("PROPOSER");
env_state = request.getParameter("ENV_STATE");
proj_code = request.getParameter("PROJ_CODE");
env_id = request.getParameter("ENV_ID");
backup_dir = request.getParameter("BACKUP_DIR");
note = Tools.toGB(request.getParameter("NOTE"));

sql = "update a_proj_env_svr_tmp set mac_ip = '" + mac_ip + "',env_ip = '" + env_ip + "', proj_env = '" + proj_env + "',web_inst_path = '" + web_inst_path + "',html_path = '" + html_path + "',app_name = '" + app_name + "',app_inst_path = '" + app_inst_path + "',app_port = '" + app_port + "',db_info = '" + db_info + "',db_usr = '" + db_usr + "',db_pwd = '" + db_pwd + "',env_usr = '" + env_usr + "',env_pwd = '" + env_pwd + "',con_usr = '" + con_usr + "',con_pwd = '" + con_pwd + "',ftp_usr = '" + ftp_usr + "',ftp_pwd = '" + ftp_pwd + "',proj_grp = '" + proj_grp + "',proj_dns = '" + proj_dns + "',creater = '" + creater + "',crt_date = to_date('" + crt_date + "','yyyy-mm-dd'),proposer = '" + proposer + "',env_state = '" + env_state + "',proj_code = " + proj_code + ",backup_dir = '" + backup_dir + "',note = '" + note + "' where env_id = " + env_id;

//out.println(sql+"<br>");

sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		i = db.execUpdate(sql);
	}else{
		if(creater.equals(session.getAttribute("username"))){
			i = db.execUpdate(sql);
		}else{
		
		}
	}
}

//out.println(i+"<br>");
db.close();
if(i==1){
	//发送邮件
	Properties props = new Properties();
	props.put("mail.smtp.host","smtp.ebaotech.com");
	props.put("mail.smtp.auth","false");
	Session s = Session.getInstance(props);
	String content = new String();
	MimeMessage message = new MimeMessage(s);
	InternetAddress from = new InternetAddress("op@ebaotech.com");
	message.setFrom(from);
	InternetAddress toAddress[] = new InternetAddress[1];
	toAddress[0] = new InternetAddress("op@ebaotech.com");
	message.setRecipients(Message.RecipientType.TO,toAddress);
	message.setSubject("TABLE A_PROJ_ENV_SVR_TEMP UPDATED");
	message.setDataHandler(new DataHandler(message,"text/html"));
	BodyPart mdp = new MimeBodyPart();
	content = creater + " update table a_proj_env_svr_temp at " + datestr;
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
	//发送邮件结束
	response.sendRedirect("env_info_confirm.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("env_info_confirm.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
