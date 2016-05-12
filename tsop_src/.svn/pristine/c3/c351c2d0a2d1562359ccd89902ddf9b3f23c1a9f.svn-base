<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="java.sql.Connection"%>
<%@ page  import="java.sql.DatabaseMetaData"%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean"%>
<%@ page import="ebao.Tools" %>
<%
DBean db = new DBean();
String dbName ="";
String dbVersion ="";
String driverName ="";
String driverVersion ="";
int driverMajorVersion =0;
int driverMinorVersion =0;
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
String url = new String();
String user = new String();
String password = new String();

try {
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        //Properties pros = new Properties();
        //pros.load(instream);
        url = "jdbc:oracle:thin:@172.16.7.189:1521:ora189";
        user = "TS_OP_APP";
        password = "TS_OP_APPPWD";
		conn = DriverManager.getConnection(url, user, password);
        //db.connect();
        //Connection c = db.getConnection();
        DatabaseMetaData dbdata = conn.getMetaData();
        if (dbdata == null){
                out.println("<BR>");
                out.println("DatabaseMetaData is NULL !!!!");
        }

        //DbMajorVersion = dbdata.getDatabaseMajorVersion();
        //DbMinorVersion = dbdata.getDatabaseMinorVersion();

        dbName = dbdata.getDatabaseProductName();
        dbVersion = dbdata.getDatabaseProductVersion();
        driverName = dbdata.getDriverName();
        driverVersion = dbdata.getDriverVersion();
        driverMajorVersion = dbdata.getDriverMajorVersion();
        driverMinorVersion = dbdata.getDriverMinorVersion();
} catch (Exception e) {
        e.printStackTrace();
        out.println(e.getMessage());
}finally{
        if (db != null)
                db.close();
}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JDBC Version</title>
</head>

<body><%@include file="includes/head.html" %>


<table border="1" background="white">
        <tr>
                <td>DatabaseProductName</td>
                <td>DatabaseProductVersion</td>
                <!-- 
                <td>DatabaseMajorVersion</td>
                <td>DatabaseMinorVersion</td>
                 -->
                <td>DriverName</td>
                <td>DriverVersion</td>
                <td>DriverMajorVersion</td>
                <td>DriverMinorVersion</td>
        </tr>
        <TR>
                <TD><%= dbName%></TD>
                <TD><%= dbVersion%></TD>
                <TD><%=driverName %></TD>
                <TD><div style="color='RED';font-weight:Bold"><%=driverVersion %></div></TD>
                <TD><%=driverMajorVersion %></TD>
                <TD><%=driverMinorVersion %></TD>
        </TR>
</table>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
