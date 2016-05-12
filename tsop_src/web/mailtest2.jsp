<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.Tools" %>
<%
try{
	String shell = "sh /usr/local/ts_op/test.sh";
	Runtime.getRuntime().exec(shell);
}
catch(Exception e)
{
	System.err.println(e.getMessage());
}
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>mail2 test</title>
  </head>
  <body>
  </body>
</html>