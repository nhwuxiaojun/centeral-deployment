<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*, java.util.*" %>
<html>
<head>
<title>数据库申请表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql_temp = new String();
ResultSet rs_temp;

String sql = new String();
ResultSet rs;
int i = 0;

String db_ip = new String();
String db_sid = new String();
String db_ldap_name = new String();
String db_user = new String();
String db_user_passwd = new String();
String db_user_type = new String();
String proposer = new String();
String proj_grp = new String();
String proj_name = new String();
String type_1 = new String();
String type_2 = new String();
String type_3 = new String();
String ver = new String();
String error_msg=new String();

String os_db_user = new String();
String os_db_passwd = new String();
String db_manager = new String();
String db_version = new String();
String db_character = new String();
int db_port_num = 0;
String db_listener = new String();
String db_status = "running";
String creater = (String)session.getAttribute("username");
int proj_code = 0;
int flag = 0;
int id = 0;

db_ip = request.getParameter("db_ip");
db_sid = request.getParameter("db_sid");
db_ldap_name = request.getParameter("db_ldap_name");
sql_temp = "select * from a_db_svr_main where db_ip = '" + db_ip + "' and db_sid = '" + db_sid + "'";
rs_temp = db.execSQL(sql_temp);

while(rs_temp.next()){
	os_db_user = rs_temp.getString("OS_DB_USER");
	os_db_passwd = rs_temp.getString("OS_DB_PASSWD");
	db_version = rs_temp.getString("DB_VERSION");
	db_character = rs_temp.getString("DB_CHARACTER");
	db_port_num = rs_temp.getInt("DB_PORT_NUM");
	db_listener = rs_temp.getString("DB_LISTENER");
}

db_user = request.getParameter("DB_USER").toLowerCase();
db_user_passwd = request.getParameter("DB_USER_PASSWD").toLowerCase();
db_user_type = request.getParameter("DB_USER_TYPE").toLowerCase();
proposer = request.getParameter("PROPOSER").toLowerCase();
String  is_backup= request.getParameter("is_backup");

//---------project_name---start--
proj_grp =request.getParameter("proj_grp").trim();
proj_name = request.getParameter("proj_name").trim();
type_1 = request.getParameter("type_1").trim();
type_2 = request.getParameter("type_2").trim();
type_3 = request.getParameter("type_3").trim();
ver = request.getParameter("ver").trim();
String new_env = proj_name;
  if(ver!=null&&!"".equals(ver)){
       new_env = new_env + "_" + ver;
   }
   if(type_1!=null&&!"".equals(type_1)){
		new_env = new_env + "_" + type_1;
   }
   if(type_2!=null&&!"".equals(type_2)){
		new_env = new_env + "_" + type_2;
   }
   if(type_3!=null&&!"".equals(type_3)){
		new_env = new_env + "_" + type_3;
   }
   new_env=new_env.toUpperCase();
   sql_temp = "select * from a_env_name where proj_name = '" + proj_name + "'";
   rs_temp = db.execSQL(sql_temp);
	while(rs_temp.next()){
		proj_code = rs_temp.getInt("proj_code");
	}
  // sql_temp.close();


   sql_temp = "select a_apply__id.nextval as id from dual";
   rs_temp  = db.execSQL(sql_temp);
   if(rs_temp.next()){
     id = rs_temp.getInt("id");
   }

   sql_temp= "select upper(proj_env) proj_env,upper(db_user_type)  db_user_type from a_db_svr where db_status='running'";
   rs_temp = db.execSQL(sql_temp);
   while(rs_temp.next()){
	  if(new_env.equals(rs_temp.getString("proj_env"))&&db_user_type.equals(rs_temp.getString("db_user_type"))){
		flag = 1;
	 }
   }



  if(flag==1){
	db.close();
	response.sendRedirect("db_server_reg.jsp?info=Database already existed!");
  }else{//upper(db_user_type),proj_env,
 
    sql = "insert into a_db_svr(db_ip,os_db_user,os_db_passwd,db_sid,db_ldap_name,db_user,db_user_passwd,db_user_type,proj_env,project_group,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,proj_code,db_id,latest_update_date,is_direct_reg,is_backup	) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + db_ldap_name + "','" + db_user + "','" + db_user_passwd + "','" + db_user_type+ "','" + new_env + "','"  + proj_grp + "','" + proposer + "','" + creater + "',sysdate,'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','running'," + proj_code + ",s_db_tmp__id.nextval,sysdate,1,"+is_backup+")";

	System.out.println("------insert sql="+sql);
try {
	i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error_msg=e.toString();
}
	//out.println(i+"<br>");
	if(i==1){
		if("1".equals(is_backup)&&"OWNER".equals(db_user_type)){
        	Properties props = new Properties();
        	props.put("mail.smtp.host","mail.ebaotech.com");
        	props.put("mail.smtp.auth","true");
        	Session s = Session.getInstance(props);
        	String content = new String();
        	MimeMessage message = new MimeMessage(s);
        	InternetAddress from = new InternetAddress("op@ebaotech.com");
        	message.setFrom(from);
			//sql_user = "select * from a_user where valid = '2'";
			//rs_user = db.execSQL(sql_user);
			//while(rs_user.next()){
				//count = count + 1;
			//}
			//InternetAddress toAddress[] = new InternetAddress[count];
			InternetAddress toAddress[] = new InternetAddress[1];
			//sql_user = "select * from a_user where valid = '2'";
			//rs_user = db.execSQL(sql_user);
        	//while(rs_user.next()){
				//toAddress[j] = new InternetAddress(rs_user.getString("usr") + "@ebaotech.com");
				toAddress[0] = new InternetAddress("ts-op@ebaotech.com");
				//toAddress[0] = new InternetAddress("eymit.wu@ebaotech.com");
				//j = j + 1;
        	//}
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	//InternetAddress ccAddress = new InternetAddress("op@ebaotech.com");
        	//message.addRecipient(Message.RecipientType.CC,ccAddress);
        	message.setSubject("手动添加数据库信息");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
        	content = "NEW Environment: " + new_env;  
			content = content + "<br>DB IP: " + db_ip;
			content = content + "<br>DB SID: " + db_sid;
			content = content + "<br>DB User: " + db_user;
			content = content + "<br>DB Password: " + db_user_passwd;
			content = content + "<br>DB User Type: " + db_user_type;
			content = content + "<br>TS Owner: " + creater;
			content = content + "<br>Please be careful to add backups.";
        	mdp.setContent(content,"text/html;charset=gbk");
        	Multipart mm = new MimeMultipart();
        	mm.addBodyPart(mdp);
        	message.setContent(mm);
        	message.saveChanges();
			db.close();
			//rs_user.close();
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
		response.sendRedirect("db_server_reg.jsp?info=Create Succeed!");
	}else{
		db.close();
		response.sendRedirect("db_server_reg.jsp?info=Create Failed!<br>"+error_msg);
	}
  }

  
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
