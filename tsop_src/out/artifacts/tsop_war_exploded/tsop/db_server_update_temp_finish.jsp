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
String sql = new String();
String sql_user = new String();
String sql_temp = new String();
ResultSet rs_temp;
ResultSet rs_user;
int i = 0;
String db_ip = new String();
String os_db_user = new String();
String os_db_passwd = new String();
String db_sid = new String();
String db_user = new String();
String db_user_passwd = new String();
String db_user_type = new String();
String proj_env = new String();
String project_group = new String();
String proposer = new String();
String creater = new String();
String create_date = new String();
String db_manager = new String();
String db_version = new String();
String db_character = new String();
String db_port_num = new String();
String db_listener = new String();
String db_status = new String();
String proj_code = new String();

String datestr = new String();

db_ip = request.getParameter("DB_IP");
db_sid = request.getParameter("DB_SID");
sql_temp = "select * from a_db_svr_main where db_ip = '" + db_ip + "' and db_sid = '" + db_sid + "'";
rs_temp = db.execSQL(sql_temp);

while(rs_temp.next()){
	os_db_user = rs_temp.getString("OS_DB_USER");
	os_db_passwd = rs_temp.getString("OS_DB_PASSWD");
	db_version = rs_temp.getString("DB_VERSION");
	db_character = rs_temp.getString("DB_CHARACTER");
	db_port_num = rs_temp.getString("DB_PORT_NUM");
	db_listener = rs_temp.getString("DB_LISTENER");
}

db_user = request.getParameter("DB_USER");
db_user_passwd = request.getParameter("DB_USER_PASSWD");
db_user_type = request.getParameter("DB_USER_TYPE");
proj_env = request.getParameter("PROJ_ENV");
project_group = request.getParameter("PROJECT_GROUP");
proposer = request.getParameter("PROPOSER");
creater = request.getParameter("CREATER");
create_date = request.getParameter("CREATE_DATE");
db_manager = request.getParameter("DB_MANAGER");

db_status = request.getParameter("DB_STATUS");
proj_code = request.getParameter("PROJ_CODE");

sql = "update a_db_svr_tmp set db_ip = '" + db_ip + "',os_db_user = '" + os_db_user + "',os_db_passwd = '" + os_db_passwd + "',db_sid = '" + db_sid + "',db_user = '" + db_user + "',db_user_passwd = '" + db_user_passwd + "',db_user_type = '" + db_user_type + "',proj_env = '" + proj_env + "',project_group = '" + project_group + "',proposer = '" + proposer + "',creater = '" + creater + "',create_date = to_date('" + create_date + "','yyyy-mm-dd'),db_manager = '" + db_manager + "',db_version = '" + db_version + "',db_character = '" + db_character + "',db_port_num = '" + db_port_num + "',db_listener = '" + db_listener + "',db_status = '" + db_status + "',proj_code = " + proj_code + " where db_id = " + request.getParameter("DB_ID");

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
	response.sendRedirect("db_server_confirm.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("db_server_confirm.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
