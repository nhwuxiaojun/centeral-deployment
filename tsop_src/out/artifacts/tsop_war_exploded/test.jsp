<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="import java.awt.event.*" %>
<%@ page  import="import java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
Thread t = Thread.currentThread();
t.setName("My Thraed");
out.print(t + "<br>");
try{
  for(int n = 5;n>0;n--){
    out.print(n + "<br>");
    Thread.sleep(1000);
  }
}catch(Exception e){
  out.print("interrupted");
}
%>
</body>
</html>
