<%@ include file="../interface/check_qa.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>��Ŀ������Ϣɾ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
QADBean db = new QADBean();
String sql = new String();
int i = 0;
sql = "delete from a_project_version_test where id = " + request.getParameter("id");
i = db.execUpdate(sql);
%>
<body>
<%
if(i==1){
	response.sendRedirect("project_test_manage.jsp?info=ɾ���ɹ���");
}else{
	response.sendRedirect("project_test_manage.jsp?info=ɾ��ʧ�ܣ�");
}
%>
</body>
<%db.close();%>
</html>