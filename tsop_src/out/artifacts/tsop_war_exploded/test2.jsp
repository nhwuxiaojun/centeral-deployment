<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>Test</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
DBean db = new DBean();
String sql = new String();
System.out.println("sql="+sql);
ResultSet rs = null;
//sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a, a_login_control b where upper(a.db_user(+)) = upper(b.login_db_user) and upper(a.db_sid(+)) = upper(b.login_db_sid) and rownum<11";
//sql = " select * from  A_LOGIN_CONTROL5 where rownum <20 ";
sql = " select * from  A_DB_SID where rownum <20 ";
System.out.println("sql="+sql);
rs = db.execSQL(sql);
//System.out.println("rs.getFetchSize()="+rs.getFetchSize());
while(rs.next()){
	//System.out.print("OK" + "<br>");
}
%>
<%db.close();%>
<%rs.close();%>
</body>
</html>