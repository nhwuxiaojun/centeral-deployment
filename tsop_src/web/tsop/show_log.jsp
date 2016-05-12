<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>
<html>
<head>
<title>Log viewer <%=request.getParameter("filename")%></title>
</head>
<body>
<%
  byte buf[]=new byte[900000];
  try{
     String path=request.getRealPath("/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/jsp/deploy/logs");
     File fp=new File("/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/jsp/deploy/logs",request.getParameter("filename"));
     FileInputStream fistream=new FileInputStream(fp);
     int bytesum=fistream.read(buf,0,900000);
     String str_file=new String(buf,0,bytesum);
	out.println("<pre>");
     out.println(str_file+"<br>");
	out.println("</pre>");
     fistream.close();
  }catch(IOException e) {
 	e.printStackTrace();
     	out.println(e.toString());
  }
%>
</body>
</html>

