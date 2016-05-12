<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
QADBean db = new QADBean();
String sql = new String();
ResultSet rs;
sql="select * from a_qa_user where usr='"+request.getParameter("username").trim()+"' and pwd='"+request.getParameter("password").trim()+"' and (valid='1' or valid='2')";
//out.print(sql + "<br>");
rs=db.execSQL(sql);
while(rs.next()){
	if("1".equals(request.getParameter("choice"))){
		if("1".equals(rs.getString("valid"))){
			session.setAttribute("username",request.getParameter("username").trim());
			response.sendRedirect("qa_query/project_version_manage.jsp");			
		}else{
			response.sendRedirect("index_qa.jsp");
		}
	}
	if("2".equals(request.getParameter("choice"))){
		session.setAttribute("username",request.getParameter("username").trim());
		response.sendRedirect("qa_query/project_test_manage.jsp");
	}
	if("3".equals(request.getParameter("choice"))){
		if("admin".equals(request.getParameter("username").trim())||"ye.wang".equals(request.getParameter("username").trim())||"danhong.chen".equals(request.getParameter("username").trim())||"guanyi.chen".equals(request.getParameter("username").trim())){
			session.setAttribute("username",request.getParameter("username").trim());
			response.sendRedirect("qa_query/project_version_log.jsp");
		}
	}
}
response.sendRedirect("index_qa.jsp");
db.close();
rs.close();
%>
</body>
</html>
