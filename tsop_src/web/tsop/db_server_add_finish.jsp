<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>数据库申请表提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
ResultSet rs;
ResultSet rs_user;
ResultSet rs_temp;
ResultSet rs_temp1;
ResultSet rs_temp2;

String sql = new String();
String sql1 = new String();
String sql2 = new String();
String sql3 = new String();
String sql4 = new String();
String sql_temp = new String();
String sql_temp1 = new String();
String sql_temp2 = new String();
String sql_user = new String();
int i=0;
int j=0;
int k=0;
int l=0;
int m=0;

String os_db_user = new String();
String os_db_passwd = new String();
String db_version = new String();
String db_character = new String();
int db_port_num = 0;
int count = 0;
int proj_code = 0;
String db_listener = new String();

String proj_env = new String();
String db_ip = new String();
String db_sid = new String();
String env_owner = new String();
String env_owner_password = new String();
String env_app = new String();
String env_app_password = new String();
String env_read = new String();
String env_read_password = new String();
String env_oper = new String();
String env_oper_password = new String();
String project_group = new String();
String proposer = new String();
String creater = new String();
String crt_date = new String();
String db_manager = new String();

proj_env = request.getParameter("PROJ_ENV").trim();
env_owner = request.getParameter("ENV_OWNER").trim().toUpperCase();
env_owner_password = request.getParameter("ENV_OWNER_PASSWORD").trim();
env_app = request.getParameter("ENV_APP").trim().toUpperCase();
env_app_password = request.getParameter("ENV_APP_PASSWORD").trim();
env_read = request.getParameter("ENV_READ").trim().toUpperCase();
env_read_password = request.getParameter("ENV_READ_PASSWORD").trim();
env_oper = request.getParameter("ENV_OPER").trim().toUpperCase();
env_oper_password = request.getParameter("ENV_OPER_PASSWORD").trim();
//crt_date = request.getParameter("CRT_DATE").trim();
db_manager = request.getParameter("DB_MANAGER").trim();


sql_temp1 = "select * from a_supply where new_env = '" + proj_env + "' and db_status = 'DOING'";
rs_temp1 = db.execSQL(sql_temp1);
while(rs_temp1.next()){
	db_ip = rs_temp1.getString("db_ip");
	db_sid = rs_temp1.getString("db_sid");
	crt_date = (rs_temp1.getDate("apply_time").getYear() + 1900) + "-" + (rs_temp1.getDate("apply_time").getMonth()+1) + "-" + rs_temp1.getDate("apply_time").getDate() + " " + rs_temp1.getTime("apply_time").getHours() + ":" + rs_temp1.getTime("apply_time").getMinutes() + ":" + rs_temp1.getTime("apply_time").getSeconds();
}
rs_temp1.close();


sql_temp = "select * from a_apply where new_env = '" + proj_env + "'";
rs_temp = db.execSQL(sql_temp);
while(rs_temp.next()){
	proj_code = rs_temp.getInt("proj_code");
	project_group = rs_temp.getString("proj_grp");
	proposer = rs_temp.getString("proj_proposer");
	creater = rs_temp.getString("db_creator");
}
rs_temp.close();


sql = "select * from a_db_svr_main where db_ip = '" + db_ip + "' and db_sid = '" + db_sid + "'";
//out.print(sql + "<br>");


rs = db.execSQL(sql);
while(rs.next()){
	os_db_user = rs.getString("os_db_user");
	os_db_passwd = rs.getString("os_db_passwd");
	db_version = rs.getString("db_version");
	db_character = rs.getString("db_character");
	db_port_num = rs.getInt("db_port_num");
	db_listener = rs.getString("db_listener");
	
}
rs.close();

sql1 = "insert into a_db_svr_tmp(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proj_env,project_group,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,proj_code,db_id) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + env_owner + "','" + env_owner_password + "','owner','" + proj_env + "','" + project_group + "','" + proposer + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','running'," + proj_code + ",s_db_tmp__id.nextval)";

if(env_app==null||"".equals(env_app)){

}else{
sql2 = "insert into a_db_svr_tmp(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proj_env,project_group,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,proj_code,db_id) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + env_app + "','" + env_app_password + "','app','" + proj_env + "','" + project_group + "','" + proposer + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','running'," + proj_code + ",s_db_tmp__id.nextval)";
}

if(env_read==null||"".equals(env_read)){

}else{
sql3 = "insert into a_db_svr_tmp(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proj_env,project_group,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,proj_code,db_id) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + env_read + "','" + env_read_password + "','read','" + proj_env + "','" + project_group + "','" + proposer + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','running'," + proj_code + ",s_db_tmp__id.nextval)";
}

if(env_oper==null||"".equals(env_oper)){

}else{
sql4 = "insert into a_db_svr_tmp(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proj_env,project_group,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,proj_code,db_id) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + env_oper + "','" + env_oper_password + "','oper','" + proj_env + "','" + project_group + "','" + proposer + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','running'," + proj_code + ",s_db_tmp__id.nextval)";
}

//out.println("sql1: " + sql1 + "<br>");
//out.println("sql2: " + sql2 + "<br>");
//out.println("sql3: " + sql3 + "<br>");
//out.println("sql4: " + sql4 + "<br>");
i = db.execUpdate(sql1);

if(env_app==null||"".equals(env_app)){
	j = 1;
}else{
	j = db.execUpdate(sql2);
}

if(env_read==null||"".equals(env_read)){
	k = 1;
}else{
	k = db.execUpdate(sql3);
}

if(env_oper==null||"".equals(env_oper)){
	l = 1;
}else{
	l = db.execUpdate(sql4);
}

//out.println(i+"<br>");
//out.println(j+"<br>");
//out.println(k+"<br>");
//out.println(l+"<br>");

if(i==1&&j==1&&k==1&&l==1){
	m=db.execUpdate("update a_supply set db_status='DONE' where new_env='" + proj_env + "'");
	db.close();
    if(m==1){
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
        	message.setSubject("数据库信息已提交");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
			content = "Project Name: " + proj_env;
        	content = content + "<br>DB Ip: " + db_ip;
			content = content + "<br>DB Sid: " + db_sid;
			content = content + "<br>Owner: " + env_owner;
			content = content + "<br>Owner Password: " + env_owner_password;
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
		response.sendRedirect("db_server_confirm.jsp?info=Create Succeed!");
	}else{
		response.sendRedirect("db_server_confirm.jsp?info=Create Failed!");
	}
}else{
	response.sendRedirect("db_server_confirm.jsp?info=Create Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
