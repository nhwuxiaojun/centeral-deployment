<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>

<html>
<head>
<title>PC机申请提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();

String sql_temp = new String();
String sql_code = new String();
String sql = new String();
String sql_env = new String();
ResultSet rs;
ResultSet rs_env;
ResultSet rs_code;

String proj_grp = Tools.toGB(request.getParameter("proj_grp").trim());
String proj_name =  Tools.toGB(request.getParameter("proj_name").trim());

String sys_type = Tools.toGB(request.getParameter("sys_type").trim());
String proj_proposer = Tools.toGB(request.getParameter("proj_proposer").trim());
int mem_size =  Integer.parseInt(request.getParameter("mem_size").trim());  
int disk_size =  Integer.parseInt(request.getParameter("disk_size").trim()); 
String purpose = Tools.toGB(request.getParameter("purpose").trim());    
String note =  Tools.toGB(request.getParameter("note"));  

String ts_owner  =session.getAttribute("username").toString();
      
String send_email = request.getParameter("send_email");    
int i = 0;     
int id = 0;  
int proj_code = 0;               


  sql_temp = "select a_apply__id.nextval as id from dual";
  rs = db.execSQL(sql_temp);
  if(rs.next()){
	id = rs.getInt("id");
  }
  rs.close();
  sql_code = "select * from a_env_name where proj_name = '" + proj_name + "'";
	rs_code = db.execSQL(sql_code);
	 while(rs_code.next()){
		proj_code = rs_code.getInt("proj_code");
	 }
	 
    sql= "insert into  A_PC_APPLY(apply_id,proj_name,proj_code,proj_proposer,apply_time,sys_type,mem_size,ts_owner,note,purpose,disk_size,status) values(" + id + ",'" + proj_name + "','" + proj_code + "','" + proj_proposer + "',sysdate,'" + sys_type + "'," + mem_size + ",'" + ts_owner + "','" + note +  "','" + purpose +  "'," + disk_size +",'DOING')";
	i = db.execUpdate(sql);

	if(i==1){
		if("1".equals(send_email)){
        	Properties props = new Properties();
        	props.put("mail.smtp.host","mail.ebaotech.com");
        	props.put("mail.smtp.auth","true");
        	Session s = Session.getInstance(props);
        	String content = new String();
        	MimeMessage message = new MimeMessage(s);
        	InternetAddress from = new InternetAddress("op@ebaotech.com");
        	message.setFrom(from);
			InternetAddress toAddress[] = new InternetAddress[1];
          //  toAddress[0] = new InternetAddress("eymit.wu@ebaotech.com");
		  	toAddress[0] = new InternetAddress("ts-op@ebaotech.com");
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	message.setSubject("PC/WM申请");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();   
        	content = "System Type: " + sys_type;
			content = content + "<br>Mem Size: " + mem_size+"G";
			content = content + "<br>Disk Size: " + disk_size+"G";
			content = content + "<br>TS Owner: " + ts_owner;
			content = content + "<br>Project Name: " + proj_name;
			content = content + "<br>Purpose: " + purpose;
			content = content + "<br>Comments: " + note;
        	mdp.setContent(content,"text/html;charset=gbk");
        	Multipart mm = new MimeMultipart();
        	mm.addBodyPart(mdp);
        	message.setContent(mm);
        	message.saveChanges();
			db.close();
        	try
			{
        		Transport transport = s.getTransport("smtp");
        		transport.connect("mail.ebaotech.com","op","Sudn1105");
        		transport.sendMessage(message,message.getAllRecipients());
        		transport.close();
        	}
        	catch(Exception e)
        	{
        		System.err.println(e.getMessage());
        	}
		}
		response.sendRedirect("pc_apply_list.jsp?info=Create Succeed!");
	}else{
		db.close();
		response.sendRedirect("pc_apply_list.jsp?info=Create Failed!");
	}

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
