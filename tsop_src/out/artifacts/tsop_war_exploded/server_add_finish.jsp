<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title>���������б�</title>
</head>
<body>
<%
String path=request.getRealPath(".") + "/";
FileWriter fw=new FileWriter(path + "db.log");//����FileWriter���󣬲�ʵ����fw
//���ַ���д���ļ�
fw.write("192.168.0.1 7001 USER1 PASSWORD1");
fw.write("\n");
fw.close();
response.sendRedirect("weblogic_test.jsp");
%>
</body>
</html>