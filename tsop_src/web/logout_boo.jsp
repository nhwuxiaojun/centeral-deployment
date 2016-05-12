<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.BOODBean" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<title>logout</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
BOODBean db = new BOODBean();
String sql_log = new String();
String sql_temp = new String();
String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);
int i = 0;
int id = 0;
ResultSet rs_temp = null;
sql_temp = "select s_kpi_log__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
rs_temp = db.execSQL(sql_temp);
if(rs_temp.next()){
	id = rs_temp.getInt("id");
}
rs_temp.close();
sql_log = "insert into l_kpi_log(id,usr,operation,date_time)values(" + id + ",'" + session.getAttribute("username") + "','LOGOUT',to_date('" + datestr + "','yyyy-mm-dd hh24:mi:ss')" + ")";
i = db.execUpdate(sql_log);

session.invalidate();
response.sendRedirect("index_boo.jsp");
%>
</body>
</html>