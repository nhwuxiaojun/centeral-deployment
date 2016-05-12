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
<title>PC机答复提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
	DBean db = new DBean();
	ResultSet rs;
	ResultSet rs1;
	ResultSet rs2;
	
	String host_ip =  request.getParameter("host_ip_input");

	String send_email = request.getParameter("send_email");    
	String admin_user =new String();
	String pwd =new String();
//	String host_ip =new String();
	String server_type =new String();
	String use_status =new String();

    String	sql1 = "select * from a_pc_info where host_ip = " + host_ip;
	rs1=db.execSQL(sql1);
 	 if(rs1.next()){
		admin_user = rs1.getString("admin_user");
		pwd =rs1.getString("pwd");
		host_ip =rs1.getString("host_ip");
		server_type =rs1.getString("server_type");
		if("FREE".equals(rs1.getString("status"))){
			use_status="USE";
		}else{
			use_status=rs1.getString("status");
		}
  	}
 	rs1.close();
	
	
	String proj_name = new String();
	String proj_code = new String();
	String purpose = new String();
	String ts_owner = new String();
	String apply_owner  =new String();
	String note    = new String();
	String apply_date    = new String();
	String sql2 = "select * from a_pc_apply where apply_id = " + request.getParameter("apply_id");

    rs2 = db.execSQL(sql2);
	 if(rs2.next()){
		proj_name = rs2.getString("proj_name");
		proj_code =rs2.getString("proj_code");
		purpose =rs2.getString("purpose");
		ts_owner =rs2.getString("ts_owner");
		apply_owner =rs2.getString("proj_proposer");
		note =rs2.getString("note");
		apply_date =rs2.getDate("apply_time").toString();
  	}
 	rs2.close();
	
	int i = 0;     
 String sql = "update a_pc_info set proj_name = '" + proj_name + "',proj_code = '" + proj_code + "',purpose = '" + purpose + "',ts_owner = '" + ts_owner + "',status = '" + use_status +"',apply_owner = '" + apply_owner +"',apply_date = to_date('" + apply_date + "','yyyy-MM-dd')  where host_ip = " + host_ip;
	i = db.execUpdate(sql);
	if(i==1){
	     sql = "update a_pc_apply set status ='DONE'  where  apply_id = " + request.getParameter("apply_id");
	     i = db.execUpdate(sql);
	   
	   
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
		//	toAddress[0] = new InternetAddress("ts-op@ebaotech.com");
			toAddress[0] = new InternetAddress(ts_owner + "@ebaotech.com");
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	message.setSubject("PC/WM申请答复");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();   
        	content = "Admin User: " + admin_user;
			content = content + "<br>Admin Password: " + pwd;
			content = content + "<br>IP: " + host_ip;
			content = content + "<br>Server Type: " + server_type;
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
		response.sendRedirect("pc_reply_list.jsp?info=成功答复！");
	}else{
		db.close();
		response.sendRedirect("pc_reply_list.jsp?info=答复失败！");
	}

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
