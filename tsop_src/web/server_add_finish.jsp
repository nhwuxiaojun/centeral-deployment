<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title>检测服务器列表</title>
</head>
<body>
<%
String path=request.getRealPath(".") + "/";
FileWriter fw=new FileWriter(path + "db.log");//建立FileWriter对象，并实例化fw
//将字符串写入文件
fw.write("192.168.0.1 7001 USER1 PASSWORD1");
fw.write("\n");
fw.close();
response.sendRedirect("weblogic_test.jsp");
%>
</body>
</html>