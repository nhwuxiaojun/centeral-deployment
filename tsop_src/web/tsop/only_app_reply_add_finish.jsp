<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>搭建申请答复提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
String sql_apply = new String();

String sql_ip = new String();
String shell = new String();
String shell_ex = new String();
String url = new String();
ResultSet rs;
ResultSet rs_apply;
ResultSet rs_ip;
int i = 0;
int j = 0;
int k = 0;
int l = 0;
int id = 0;
int flag = 0;
String new_env = new String();
String mac_ip = new String();
String env_ip = new String();
String app_user = new String();
String app_dir = new String();
String app_soft = new String();
String appsoft_ver = new String();
String env_creator = new String();


new_env = Tools.toGB(request.getParameter("new_env").trim());
mac_ip = Tools.toGB(request.getParameter("mac_ip").trim());
env_ip = Tools.toGB(request.getParameter("env_ip_input").trim());
app_user = Tools.toGB(request.getParameter("app_user").trim());
app_dir = Tools.toGB(request.getParameter("app_dir").trim());


 sql_apply="select * from a_apply where new_env = '" + new_env + "'";
 rs_apply = db.execSQL(sql_apply);
 while(rs_apply.next()){
	appsoft_ver = rs_apply.getString("app_soft");
	env_creator = rs_apply.getString("env_creator");
	app_soft = rs_apply.getString("app_soft"); 
 }

  sql_temp = "select a_supply__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
  rs = db.execSQL(sql_temp);
  if(rs.next()){
	  id = rs.getInt("id");
   }
  rs.close();
  sql = "insert into a_supply(id,new_env,mac_ip,env_ip,env_creator,apply_time,env_status,db_status,app_user,app_dir,app_soft,apply_type)values(" + id + ",'" + new_env + "','" + mac_ip + "','"+ env_ip +"','" + env_creator + "',sysdate,'DOING','DOING','"  + app_user + "','" + app_dir+ "','" + app_soft  + "','APP')";


  i=db.execUpdate(sql);

  if(i==1){
	j=db.execUpdate("update a_apply set status='DONE' where new_env = '" + new_env + "' and status = 'DOING'");
	k=db.execUpdate("update a_ip set ip_status='YES' where trim(ip_list) = '" + env_ip.trim() + "'");
	
	sql_ip = "select * from a_proj_env_svr_del where trim(env_ip) = '" + env_ip.trim() + "'";
	rs_ip = db.execSQL(sql_ip);
	while(rs_ip.next()){
		l=db.execUpdate("update a_proj_env_svr_del set env_ip_state = 'YES' where env_ip = '" + env_ip + "'");
	}
	rs_ip.close();
	
	db.close();
        //send mail
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
				toAddress[0] = new InternetAddress(env_creator + "@ebaotech.com");
				message.setRecipients(Message.RecipientType.TO,toAddress);

	        	message.setSubject("单应用申请答复");
	        	message.setDataHandler(new DataHandler(message,"text/html"));
	        	BodyPart mdp = new MimeBodyPart();
				content = "Single App Apply <br>";
	        	content = "NEW ENVIRONMENT: " + new_env + "<br>";
				content = content + "APP SERVER: " + mac_ip + "<br>";
				content = content + "APP IP: " + env_ip + "<br>";
				content = content + "APP USER: " + app_user.toLowerCase() + "<br>";
				content = content + "APP PASSWORD: " + app_user.toLowerCase() + "<br>";
				content = content + "APP DIR: " + app_dir + "<br>";
	        	mdp.setContent(content,"text/html;charset=gbk");
	        	Multipart mm = new MimeMultipart();
	        	mm.addBodyPart(mdp);
	        	message.setContent(mm);
	        	message.saveChanges();
				db.close();
	        	try
				{
					Session s1 = Session.getInstance(props);
	        		Transport transport = s1.getTransport("smtp");
	        		transport.connect("mail.ebaotech.com","op","Sudn1105");
	        		transport.sendMessage(message,message.getAllRecipients());
	        		transport.close();
	        	}
	        	catch(Exception e)
	        	{
	        		System.err.println(e.getMessage());
	        	}
		     }
			 
			try
			{
					shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/addcert.sh " + env_creator + " " + mac_ip;
					System.out.print("Xiaojun'log: " + shell);
       				Runtime.getRuntime().exec(shell);
					shell_ex = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/env_allocate.sh " + mac_ip + " " + env_ip + " " + new_env + " " + appsoft_ver;
					System.out.print("Eymit'log: " + shell_ex);
       				Runtime.getRuntime().exec(shell_ex);
	        	}
	        	catch(Exception e)
	        	{
	        		System.err.println(e.getMessage());
	         }
			response.sendRedirect("only_app_reply_list.jsp?info=Create Succeed!");
    }else{
	db.close();
	response.sendRedirect("only_app_reply_list.jsp?info=Create Failed!");
   }

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
