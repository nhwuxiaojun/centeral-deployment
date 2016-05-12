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
<title>环境搭建流程提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
DBean db = new DBean();
String sql_temp = new String();
String sql_code = new String();
String sql_user = new String();
String sql = new String();
String sql_env = new String();
String error_msg=new String();
ResultSet rs;
ResultSet rs_user;
ResultSet rs_env;
ResultSet rs_code;
int i = 0;
int j = 0;
int id = 0;
int count = 0;
int flag = 0;
int proj_code = 0;
String proj_grp = new String();
String new_env = new String();
String proj_name = new String();
String type_1 = new String();
String type_2 = new String();
String type_3 = new String();
String ver = new String();
String db_ver = new String();
String db_creator = new String();
String proj_proposer = new String();
String backup_type = new String();
int db_size = 0;
String note = new String();
String datestr = new String();


proj_grp = Tools.toGB(request.getParameter("proj_grp").trim());
proj_name = Tools.toGB(request.getParameter("proj_name").trim());
type_1 = Tools.toGB(request.getParameter("type_1").trim());
type_2 = Tools.toGB(request.getParameter("type_2").trim());
type_3 = Tools.toGB(request.getParameter("type_3").trim());
ver = Tools.toGB(request.getParameter("ver").trim());
db_ver = Tools.toGB(request.getParameter("db_ver").trim());
db_creator = Tools.toGB(request.getParameter("db_creator").trim());
backup_type = Tools.toGB(request.getParameter("backup_type").trim());
db_size = Integer.parseInt(request.getParameter("db_size").trim());
note = Tools.toGB(request.getParameter("note").trim());
proj_proposer = Tools.toGB(request.getParameter("proj_proposer").trim());



DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

sql_temp = "select a_apply__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
try {
rs = db.execSQL(sql_temp);
if(rs.next()){
	id = rs.getInt("id");
}
rs.close();
} catch (Exception e) {
	e.printStackTrace();
}

new_env = proj_name;



if(ver==null||"".equals(ver)){

	if(type_1==null||"".equals(type_1)){
		
	}else{
		type_1 = request.getParameter("type_1").trim();
		new_env = new_env + "_" + type_1;
	}

	if(type_2==null||"".equals(type_2)){
		
	}else{
		type_2 = request.getParameter("type_2").trim();
		new_env = new_env + "_" + type_2;
	}

	if(type_3==null||"".equals(type_3)){
		
	}else{
		type_3 = request.getParameter("type_3").trim();
		new_env = new_env + "_" + type_3;
	}

}else{

	ver = request.getParameter("ver").trim();
	new_env = new_env + "_" + ver;
	
	if(type_1==null||"".equals(type_1)){
		
	}else{
		type_1 = request.getParameter("type_1").trim();
		new_env = new_env + "_" + type_1;
	}

	if(type_2==null||"".equals(type_2)){
		
	}else{
		type_2 = request.getParameter("type_2").trim();
		new_env = new_env + "_" + type_2;
	}

	if(type_3==null||"".equals(type_3)){
		
	}else{
		type_3 = request.getParameter("type_3").trim();
		new_env = new_env + "_" + type_3;
	}
}

//out.print(new_env + "<br>");

//sql_env = "select * from a_proj_env_svr where proj_env= '" + new_env + "' " ;

sql_env=" select count(1) count_env from a_proj_env_svr where upper(proj_env)= upper('" + new_env + "') " ;

try {
rs_env = db.execSQL(sql_env);
while(rs_env.next()){
	if(rs_env.getInt("count_env")>0){
		flag = 1;
	}
}
rs_env.close();
} catch (Exception e) {
	e.printStackTrace();
}
if("DEMO".equals(type_3)){
	flag = 0;
}
if(flag==1){
	db.close();
	response.sendRedirect("only_db_build_add.jsp?info=Environment name "+new_env+" existed, please re-apply");
}else{

	sql_code = "select * from a_env_name where proj_name = '" + proj_name + "'";
	rs_code = db.execSQL(sql_code);
	while(rs_code.next()){
		proj_code = rs_code.getInt("proj_code");
	}
    //System.out.print("---------=sql="+sql);
   
	sql = "insert into a_apply(id,new_env,proj_grp,db_version,env_creator,db_creator,proj_proposer,apply_time,status,proj_code,proj_name,backup_type,db_size,note,apply_type)values(" + id + ",'" + new_env + "','" + proj_grp + "','" + db_ver +  "','" + db_creator + "','" + db_creator + "','" + proj_proposer + "',to_date('" + datestr + "','yyyy-MM-dd hh24:mi:ss'),'DOING','" + proj_code +"','"+proj_name+ "','" + backup_type + "'," + db_size  + ",'"+ note + "','DB')";
	out.println(sql+"<br>");
	try {
	i = db.execUpdate(sql);
	} catch (Exception e) {
		e.printStackTrace();
		error_msg=e.toString();
	}
	//out.println(i+"<br>");
	if(i==1){
		if("1".equals(request.getParameter("send_email"))){
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
				  toAddress[0] = new InternetAddress("tsop@ebaotech.com");
				//toAddress[0] = new InternetAddress("eymit.wu@ebaotech.com");
				//j = j + 1;
        	//}
			message.setRecipients(Message.RecipientType.TO,toAddress);
        	//InternetAddress ccAddress = new InternetAddress("op@ebaotech.com");
        	//message.addRecipient(Message.RecipientType.CC,ccAddress);
        	message.setSubject("单数据库申请","utf-8");
        	message.setDataHandler(new DataHandler(message,"text/html"));
        	BodyPart mdp = new MimeBodyPart();
        	content = "NEW Environment: " + new_env;
			content = content + "<br>DB Version: " + db_ver;
			content = content + "<br>DB Creator: " + db_creator;
			content = content + "<br>Comments: " + note;
        	mdp.setContent(content,"text/html;charset=utf-8");
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
		response.sendRedirect("only_db_build_list.jsp?info=Create Succeed!");
	}else{
		db.close();
		response.sendRedirect("only_db_build_list.jsp?info=Create Failed!<br>"+error_msg);
	}
}
%>
</body>
</html>
