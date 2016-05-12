<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>应用环境信息删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql_app = new String();
String sql_db = new String();
String error_msg= new String();
int i = 0;
int j = 0;
//sql = "delete from a_proj_env_svr where env_id = " + request.getParameter("id");
try {
sql_app = "update a_proj_env_svr set env_state='stopped' where env_id = " + request.getParameter("id");
System.out.println(sql_app);
i = db.execUpdate(sql_app);

sql_db = "update a_db_svr b set b.db_status='stopped' where exists (select 1 from a_proj_env_svr a where a.proj_env=b.proj_env and a.env_id=" + request.getParameter("id") +")";
System.out.println(sql_db);
j = db.execUpdate(sql_db);
} catch (Exception e) {
	e.printStackTrace();
	error_msg=e.toString();
}

%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
//	response.sendRedirect("env_info_query.jsp?info=Delete Succeed!");
%>
<script type="text/javascript">
        history.go(-1);
        alert('Delete Succeed!');
</script>
<%
}else{
	response.sendRedirect("env_info_query.jsp?info=Delete Failed!+<br>"+error_msg);
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
