<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.BOODBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
BOODBean db = new BOODBean();
String sql = new String();
String sql_log = new String();
String sql_temp = new String();

String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

int i = 0;
int id = 0;
ResultSet rs = null;
ResultSet rs_temp = null;
sql = "select * from conf_project_owner where lower(user_name) = '" + request.getParameter("username").trim().toLowerCase() + "'";
//out.print(sql + "<br>");
rs = db.execSQL(sql);
while(rs.next()){
	LdapUserPassAutherticateProvider ldapUserPassAutherticateProvider = new LdapUserPassAutherticateProvider();
	//if(request.getParameter("username").equals(request.getParameter("password"))){
	if(ldapUserPassAutherticateProvider.doAuthenticate(request.getParameter("username"),request.getParameter("password"))==true){
		session.setAttribute("username",request.getParameter("username").trim().toLowerCase());
		sql_temp = "select s_kpi_log__id.nextval as id from dual";
		//out.print(sql_temp+"<br>");
		rs_temp = db.execSQL(sql_temp);
		if(rs_temp.next()){
			id = rs_temp.getInt("id");
		}
		rs_temp.close();
		sql_log = "insert into l_kpi_log(id,usr,operation,date_time)values(" + id + ",'" + session.getAttribute("username") + "','LOGIN',to_date('" + datestr + "','yyyy-MM-dd hh24:mi:ss')" + ")";
		//out.print(sql_log + "<br>");
		i = db.execUpdate(sql_log);
		if(i==1){
			response.sendRedirect("boo_query/index.jsp");
		}else{
			response.sendRedirect("index_boo.jsp");
		}
	}else{
		response.sendRedirect("index_boo.jsp");
	}
}
response.sendRedirect("index_boo.jsp");
db.close();
rs.close();
%>
</body>
</html>