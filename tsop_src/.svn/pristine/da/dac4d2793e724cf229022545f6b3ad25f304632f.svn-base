<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*, java.util.*" %>
<html>
<head>
<title>DB info update</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
String sql1 = new String();
String sql2 = new String();
//String sql2 = new String();
ResultSet rs_temp;
ResultSet rs2;

int i = 0;
int i1 = 0;
//int count_db_user=0;
String db_ip = new String();
String os_db_user = new String();
String os_db_passwd = new String();
String db_sid = new String();
String db_ldap_name = new String();
String db_user = new String();
String db_user_passwd = new String();
String db_user_type = new String();
String proj_env = new String();
//String project_group = new String();
String proposer = new String();
String creater = new String();
String create_date = new String();
String db_manager = new String();
String db_version = new String();
String db_character = new String();
int db_port_num = 0;
String db_listener = new String();
String db_status = new String();
String proj_code = new String();
String old_db_status = new String();
String operater = (String)session.getAttribute("username");
int db_id=Integer.parseInt(request.getParameter("DB_ID"));
String apply_type = new String();
String error_info = new String();


String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

db_ip = request.getParameter("DB_IP");
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

sql2 = "select * from a_db_svr where db_id = " + db_id;
//out.print(sql);
rs2 = db.execSQL(sql2);
while(rs2.next()){
	apply_type =Tools.toGB( rs2.getString("apply_type"));
}

db_user = request.getParameter("DB_USER");
db_user_passwd = request.getParameter("DB_USER_PASSWD");
db_user_type = request.getParameter("DB_USER_TYPE").trim();
proj_env = request.getParameter("PROJ_ENV").toUpperCase().trim();
//project_group = request.getParameter("PROJECT_GROUP");
proposer = request.getParameter("PROPOSER");
creater = request.getParameter("CREATER");
create_date = request.getParameter("CREATE_DATE");
//db_manager = request.getParameter("DB_MANAGER");

db_status = request.getParameter("DB_STATUS").toLowerCase();
proj_code = request.getParameter("PROJ_CODE");
old_db_status=request.getParameter("OLD_DB_STATUS").toLowerCase().trim();
String old_db_user  = request.getParameter("OLD_DB_USER").toUpperCase().trim();
String old_db_user_passwd  = request.getParameter("OLD_DB_USER_PASSWD").toUpperCase().trim();
String old_db_sid  = request.getParameter("OLD_DB_SID");



sql = "update a_db_svr set db_ip = '" + db_ip + "',os_db_user = '" + os_db_user + "',os_db_passwd = '" + os_db_passwd + "',db_ldap_name = '" + db_ldap_name + "',db_sid = '" + db_sid + "',db_user = '" + db_user + "',db_user_passwd = '" + db_user_passwd + "',db_user_type = '" + db_user_type + "',proj_env = '" + proj_env + "',proposer = '" + proposer + "',creater = '" + creater + "',db_version = '" + db_version + "',db_character = '" + db_character + "',db_port_num = " + db_port_num + ",db_listener = '" + db_listener + "',db_status = '" + db_status + "',proj_code = " + proj_code + ",latest_update_date = to_date('" + datestr +"','yyyy-mm-dd hh24:mi:ss') where db_id = " + request.getParameter("DB_ID");

try {
	System.out.println("sql="+sql);
	i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error_info=e.toString();
}

 if(i==1){
			//db_status =db_status.toUpperCase();
			db_user =db_user.toUpperCase();
			db_user_passwd =db_user_passwd.toUpperCase();

    if(db_user_type.toUpperCase().equals("OWNER")){
	  // if(!old_db_user.equals(db_user)||!old_db_user.equals(db_user)||!old_db_user_passwd.equals(db_user_passwd)||!old_db_sid.equals(db_sid)){ 
	       
	       //更新app,read,oper用户中除用户名密码，用户类型外的其它字段
	  
	String   sql_update_other_user = "update a_db_svr set db_ip = '" + db_ip + "',os_db_user = '" + os_db_user + "',os_db_passwd = '" + os_db_passwd + "',db_sid = '" + db_sid + "',proj_env = '" + proj_env + "',proposer = '" + proposer + "',creater = '" + creater + "',create_date = to_date('" + create_date + "','yyyy-mm-dd'),db_version = '" + db_version + "',db_character = '" + db_character + "',db_port_num = " + db_port_num + ",db_listener = '" + db_listener + "',db_status = '" + db_status + "',proj_code = " + proj_code + ",latest_update_date = to_date('" + datestr +"','yyyy-mm-dd hh24:mi:ss') where proj_env in (select proj_env from a_db_svr where upper(db_user) = '"+old_db_user+"') and    upper(db_user_type) ! = 'OWNER'  ";
	    i = db.execUpdate(sql_update_other_user);
	  
	  
		   //发送邮件
        	Properties props = new Properties();
        	props.put("mail.smtp.host","mail.ebaotech.com");
        	props.put("mail.smtp.auth","true");
        	Session s = Session.getInstance(props);
        	String content = new String();
        	MimeMessage message = new MimeMessage(s);
        	InternetAddress from = new InternetAddress("op@ebaotech.com");
        	message.setFrom(from);
			InternetAddress toAddress[] = new InternetAddress[1];
			//toAddress[0] = new InternetAddress("eymit.wu@ebaotech.com");
			toAddress[0] = new InternetAddress("ts-op@ebaotech.com");
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	message.setSubject("数据库信息变更");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
        	content = "Environment Name: " + proj_env;
			content = content + "<br>Change By: " + session.getAttribute("username");
			 if(!old_db_user.equals(db_user)){ 
			    content = content + "<br>Old Db Username: " + old_db_user;
			    content = content + "<br>New Db Username: " + db_user;
			 }else{
			    content = content + "<br>Db Username: " + db_user;
			 }
			
			 if(!old_db_status.equals(db_status)){ 
			    content = content + "<br>Old Status: " + old_db_status;
			    content = content + "<br>New Status: " + db_status;
				
			sql1 = "insert into a_update_stat_hist(update_id,old_status,new_status,oper_date,proj_env,update_type,db_user,db_sid,operater,proj_group,proj_code,db_id,apply_type) values(s_env__id.nextval,'" + old_db_status + "','" + db_status + "',sysdate,'" + proj_env + "','DB','" + db_user + "','" + db_sid + "','" + operater + "','" + proj_code + "," + db_id + ",'" + apply_type + "')";
			
	System.out.println("sql1="+sql1);
	
	i1 = db.execUpdate(sql1);
				
				
				
				
			 }

			 if(!old_db_user_passwd.equals(db_user_passwd)){ 
			    content = content + "<br>Old  Db Password: " + old_db_user_passwd;
			    content = content + "<br>New  Db Password: " + db_user_passwd;
			 }
			 if(!old_db_sid.equals(db_sid)){
			    content = content + "<br>Old  Db Sid: " + old_db_sid;
			    content = content + "<br>New  Db Sid: " + db_sid;
			 }
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
        	}
        	catch(Exception e)
        	{
        		System.err.println(e.getMessage());
        	}
		//}
	} 
	//发送邮件结束
//	response.sendRedirect("db_server_query.jsp?info=Update Succeed!");
%>
<script type="text/javascript">
        alert('DB Env <% out.print(proj_env); %> was updated successfully!');
	window.close();
</script>
<%

}else{
//	response.sendRedirect("db_server_query.jsp?info=Update Failed!");
%>
<script type="text/javascript">
        history.go(-1);
        history.go(-1);
        alert('DB Env <% out.print(proj_env); %> failed to update!');
</script>
<%
}
db.close();
%>
</body>
</html>
