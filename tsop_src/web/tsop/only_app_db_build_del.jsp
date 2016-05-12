<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>环境搭建流程删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String flag = request.getParameter("flag");
int i=0;
sql="delete from a_apply where id = " + request.getParameter("id");
i=db.execUpdate(sql);
%>

<body><%@include file="includes/head.html" %>

<%
  if(i==1){
     if("1".equals(flag)){
	   response.sendRedirect("only_app_build_list.jsp?info=Delete Succeed!");
	 } else  if("2".equals(flag)){
	    response.sendRedirect("only_db_build_list.jsp?info=Delete Failed!");
	 }
  }else{
      if("1".equals(flag)){
	  response.sendRedirect("only_app_build_list.jsp?info=Delete Succeed!");
	 }else  if("2".equals(flag)){
	   response.sendRedirect("only_db_build_list.jsp?info=Delete Failed!");
	
	}
  }
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
