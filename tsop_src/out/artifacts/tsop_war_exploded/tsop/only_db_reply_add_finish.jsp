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
String sql_checkdb = new String();
String sql_ip = new String();
String shell = new String();
String shell_ex = new String();
String url = new String();
ResultSet rs;
ResultSet rs_apply;
ResultSet rs_ip;
ResultSet rs_checkdb;
int i = 0;
int j = 0;
int k = 0;
int l = 0;
int id = 0;
int flag = 0;
String new_env = new String();
String db_sid = new String();
String db_ip = new String();
String owner_name = new String();
String file_dir = new String();


String db_creator = new String();
String db_port_num = new String();

int db_size = 0;
int db_conut_flag=0;

new_env = Tools.toGB(request.getParameter("new_env").trim());
db_sid = Tools.toGB(request.getParameter("db_sid").trim());
db_ip = Tools.toGB(request.getParameter("db_ip").trim());
owner_name = Tools.toGB(request.getParameter("owner_name").trim());
file_dir = Tools.toGB(request.getParameter("file_dir").trim());


sql_temp = "select * from a_db_svr where db_sid = '" + db_sid + "'";
rs = db.execSQL(sql_temp);
  if(rs.next()){
	db_port_num = String.valueOf(rs.getInt("db_port_num"));
  }

  sql_apply="select * from a_apply where new_env = '" + new_env + "'";
  rs_apply = db.execSQL(sql_apply);
  while(rs_apply.next()){
	db_creator = rs_apply.getString("db_creator");
	db_size = rs_apply.getInt("db_size");
  }

  url = "jdbc:oracle:thin:@" + db_ip + ":" + db_port_num + ":" + db_sid;

  sql_checkdb=" select count(1) count_db from a_db_svr where upper(db_user)= upper('" + owner_name + "') " ;
  rs_checkdb = db.execSQL(sql_checkdb);
  while(rs_checkdb.next()){
	if(rs_checkdb.getInt("count_db")>0){
		db_conut_flag=1; 
	}
  }
  rs_checkdb.close();

 if(db_conut_flag==1){
		response.sendRedirect("only_db_reply_add.jsp?info=该数据库用户名称已存在,请重新输入！");
 }else{
     sql_temp = "select a_supply__id.nextval as id from dual";
     rs = db.execSQL(sql_temp);
     if(rs.next()){
	  id = rs.getInt("id");
     }
     rs.close();
   sql = "insert into a_supply(id,new_env,db_sid,db_ip,env_creator,db_creator,apply_time,db_status,owner_name,file_dir,apply_type)values(" + id + ",'" + new_env + "','"  + db_sid + "','" + db_ip + "','" + db_creator +"','" + db_creator + "',sysdate,'DOING','" + owner_name + "','" + file_dir + "','DB')";

   i=db.execUpdate(sql);
   System.out.println("---"+sql+"---");

   if(i==1){
	j=db.execUpdate("update a_apply set status='DONE' where new_env = '" + new_env + "' and status = 'DOING'");
	try{
		DBADBean dbadb = new DBADBean(url,"dbadmin","dbadmin");
		Connection conn = dbadb.getConnection();
		String procedure1 = "{call p_create_user(?,?,?)}";
		CallableStatement cstmt1;
		cstmt1 = conn.prepareCall(procedure1);
		cstmt1.setString(1,owner_name);
		cstmt1.setString(2,file_dir);
		cstmt1.setInt(3,db_size);
    	cstmt1.execute();
		conn.close();
		dbadb.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	  db.close();
	      if("1".equals(request.getParameter("send_email"))){
	         //send mail
	         	Properties props = new Properties();
	        	props.put("mail.smtp.host","mail.ebaotech.com");
	        	props.put("mail.smtp.auth","true");
	        	Session s = Session.getInstance(props);
	        	String content = new String();
	        	MimeMessage message = new MimeMessage(s);
	        	InternetAddress from = new InternetAddress("op@ebaotech.com");
	        	message.setFrom(from);
				
				InternetAddress toAddress[] = new InternetAddress[1];
				toAddress[0] = new InternetAddress(db_creator + "@ebaotech.com");
				message.setRecipients(Message.RecipientType.TO,toAddress);
	        	message.setSubject("单数据库申请答复");
	        	message.setDataHandler(new DataHandler(message,"text/html"));
	        	BodyPart mdp = new MimeBodyPart();
				content = "Single DB Apply <br>";
	        	content = "NEW ENVIRONMENT: " + new_env + "<br>";
				content = content + "DB SID: " + db_sid + "<br>";
				content = content + "DB PORT: " + db_port_num + "<br>";
				content = content + "DB SERVER: " + db_ip + "<br>";
				content = content + "Tablespace: " + owner_name + "_tbs<br>";
				content = content + "Username/password" + "<br>";
				content = content + owner_name + "     " + owner_name + "pwd" + "<br>";
				content = content + owner_name + "_APP     " + owner_name + "_APP_ONLY" + "<br>";
				content = content + owner_name + "_READ     " + owner_name + "_READ_ONLY" + "<br>";
				content = content + owner_name + "_OPER     " + owner_name + "_OPER_ONLY" + "<br>";
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
	response.sendRedirect("only_db_reply_list.jsp?info=Create Succeed!");	 
			
	}else{
	  response.sendRedirect("only_db_reply_list.jsp?info=Create Failed!insert失败！");
	}
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
