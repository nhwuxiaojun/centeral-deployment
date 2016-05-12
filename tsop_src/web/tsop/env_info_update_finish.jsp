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
<title>Environment Info Update</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
DBean db = new DBean();
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String sql3 = new String();
String sql4 = new String();
ResultSet rs;
ResultSet rs4;
int i = 0;
int i1 = 0;
String mac_ip = new String();
String env_ip = new String();
String proj_env = new String();
String web_inst_path = new String();
String html_path = new String();
String app_name = new String();
String app_inst_path = new String();
String app_port = new String();
String debug_port = new String();
String app_console = new String();
//String db_info = new String();
//String db_usr = new String();
//String db_pwd = new String();
String env_usr = new String();
String env_pwd = new String();
String con_usr = new String();
String con_pwd = new String();
String inc_deploy_para = new String();
String full_deploy_para = new String();
//String proj_grp = new String();
String proj_dns = new String();
String creater = new String();
String crt_date = new String();
String proposer = new String();
String env_state = new String();
//String proj_code = new String();
String env_id = new String();
//String backup_dir = new String();
String note = new String();
String dms_type = new String();
String print_type = new String();
String old_proj_env= new String();
String old_env_state= new String();
String apply_type = new String();

String print_ip =  new String();
//String print_user =  new String();
//String print_pwd =  new String();
String print_dir =  new String();

int count_env=0;


String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);


mac_ip = request.getParameter("MAC_IP");
env_ip = request.getParameter("ENV_IP");
System.out.println("===app update 1======================");
proj_env = request.getParameter("PROJ_ENV").trim().toUpperCase();
web_inst_path = request.getParameter("WEB_INST_PATH");
html_path = request.getParameter("HTML_PATH");
app_name = request.getParameter("APP_NAME");
app_inst_path = request.getParameter("APP_INST_PATH");
app_port = request.getParameter("APP_PORT");
debug_port = request.getParameter("DEBUG_PORT");
app_console = request.getParameter("APP_CONSOLE");
//db_info = request.getParameter("DB_INFO");
//db_usr = request.getParameter("DB_USR");
//db_pwd = request.getParameter("DB_PWD");
env_usr = request.getParameter("ENV_USR");
env_pwd = request.getParameter("ENV_PWD");
con_usr = request.getParameter("CON_USR");
con_pwd = request.getParameter("CON_PWD");
inc_deploy_para = request.getParameter("INC_DEPLOY_PARA").trim();
full_deploy_para = request.getParameter("FULL_DEPLOY_PARA").trim();
//proj_grp = request.getParameter("PROJ_GRP");
proj_dns = request.getParameter("PROJ_DNS");
creater = request.getParameter("CREATER");
crt_date = request.getParameter("CRT_DATE");
proposer = request.getParameter("PROPOSER");
env_state = request.getParameter("ENV_STATE").toLowerCase();
//proj_code = request.getParameter("PROJ_CODE");
env_id = request.getParameter("ENV_ID");
//backup_dir = request.getParameter("BACKUP_DIR");
note = Tools.toGB(request.getParameter("NOTE"));
dms_type = request.getParameter("DMS_TYPE");
print_type = request.getParameter("PRINT_TYPE");
System.out.println("===app update 2======================");
old_proj_env= request.getParameter("OLD_PROJ_ENV").trim().toUpperCase();
old_env_state= request.getParameter("OLD_ENV_STATE").toLowerCase();
System.out.println("=========================");
String operater = (String)session.getAttribute("username");

print_ip = request.getParameter("print_ip").trim();
//print_user = request.getParameter("print_user").trim();
//print_pwd = request.getParameter("print_pwd");
print_dir = request.getParameter("print_dir");


System.out.println("===app update 3======================");
sql3=" select count(1) count_env from a_proj_env_svr where proj_env= '" + proj_env + "' " ;
 rs = db.execSQL(sql3);
System.out.println("===app update 4======================"+sql3);
while(rs.next()){
  count_env = rs.getInt("count_env");
 }


sql4 = "select * from a_proj_env_svr where env_id = " + env_id;
//out.print(sql);
rs4 = db.execSQL(sql4);
System.out.println("===app update 5======================"+sql4);
while(rs4.next()){
	apply_type =Tools.toGB( rs4.getString("apply_type"));
}


if(!old_proj_env.toUpperCase().equals(proj_env.toUpperCase()) &&count_env>1){
  response.sendRedirect("env_info_query.jsp?info=修改失败,存在同名环境！");
}else {

 sql = "update a_proj_env_svr set mac_ip = '" + mac_ip + "',env_ip = '" + env_ip + "', proj_env = '" + proj_env + "',web_inst_path = '" + web_inst_path + "',html_path = '" + html_path + "',app_name = '" + app_name + "',app_inst_path = '" + app_inst_path + "',app_port = '" + app_port + "',debug_port = '" + debug_port + "',app_console = '" + app_console + "',env_usr = '" + env_usr + "',env_pwd = '" + env_pwd + "',con_usr = '" + con_usr + "',con_pwd = '" + con_pwd + "',proj_dns = '" + proj_dns + "',creater = '" + creater + "',crt_date = to_date('" + crt_date + "','yyyy-mm-dd'),proposer = '" + proposer + "',env_state = '" + env_state + "',latest_update_date = to_date('" + datestr +"','yyyy-mm-dd hh24:mi:ss'),note = '" + note + "',dms_type = '" + dms_type + "',print_type = '" + print_type +  "',print_ip = '" + print_ip +  "',print_dir = '" + print_dir +"',inc_deploy_para='"+inc_deploy_para+"',full_deploy_para='"+full_deploy_para +"' where env_id = " + env_id;

System.out.println("------3-----sql=-"+sql);
//if(creater.equals(session.getAttribute("username"))){
	i = db.execUpdate(sql);
//}else{
	
//}
//out.println(i+"<br>");

 if(i==1){
   //update db env_name
    if (old_proj_env!=proj_env){
	  sql2 = " update a_db_svr set proj_env= '" + proj_env + "'   where proj_env= '" + old_proj_env + "' " ;
	  i = db.execUpdate(sql2);
	 // System.out.println("----sql2=-"+sql2);
	}
	 if(!old_env_state.equals(env_state)){
	// if(!old_env_state.toUpperCase().equals(env_state.toUpperCase())){
	 		sql1 = "insert into a_update_stat_hist(update_id,old_status,new_status,oper_date,proj_env,update_type,app_mac_ip,app_env_ip,operater,proj_group,app_env_id,apply_type)  values(s_env__id.nextval,'" + old_env_state + "','" + env_state + "',sysdate,'" + proj_env + "','APP','" + mac_ip + "','" + env_ip + "','" + operater + "','" + env_id + "','" + apply_type + "')";
			
	   System.out.println("sql1="+sql1);
	
	       i1 = db.execUpdate(sql1);
	 
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
        	message.setSubject("环境状态变更");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
        	content = "Environment Name: " + proj_env;
			content = content + "<br>Change By: " + session.getAttribute("username");
			content = content + "<br>Old Status: " + old_env_state;
			content = content + "<br>New Status: " + env_state;
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
		}
	
	
	//发送邮件结束
	//response.sendRedirect("env_info_query.jsp?info=Update Succeed!");
%>
<script type="text/javascript">
	alert('App Env <% out.print(proj_env); %> was updated successfully!');
//	history.go(-2);
	window.close();
</script>

<%
//	response.sendRedirect("env_info_update.jsp?env_id="+env_id);
 }else{
	//response.sendRedirect("env_info_query.jsp?info=Update Failed!");
%>
<script type="text/javascript">
	history.go(-1);
	history.go(-1);
	alert('App Env <% out.print(proj_env); %> failed to update!');
</script>
<%
 }
} 
rs.close();
db.close();
%>
</body>
</html>
