<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>TS部门信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../ebao.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<%//if(request.getAttribute("user")==null){%>
	<%//response.sendRedirect("../index.jsp");%>
<%//}%>
<br><br>
<div align="center"><font color="#3333cc" size="2">欢迎您<%//=session.getAttribute("user")%></font></div>
<br><br>
<div align="center" class="s105">
<font color="#3333cc" size="+3"><strong>TS部门信息查询</strong></font>
<br><br>
<select name="select1" onChange="query()">
	<option value="">请选择</option>
	<option value="1">环境申请表查询</option> 
	<option value="2">应用环境信息查询</option> 
	<option value="3">数据库环境信息查询</option> 
	<option value="4">CVS环境信息查询</option> 
	<option value="5">服务器硬件信息查询</option> 
</select>
</div>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function query(){
	if(select1.value=="1"){
		window.open ('env_apply_query.jsp','newwindow', 'height='+(screen.height-55)+', width='+(screen.width-10)+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	if(select1.value=="2"){
		window.open ('env_info_query.jsp','newwindow', 'height='+(screen.height-55)+', width='+(screen.width-10)+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	if(select1.value=="3"){
		window.open ('db_server_query.jsp','newwindow', 'height='+(screen.height-55)+', width='+(screen.width-10)+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	if(select1.value=="4"){
		window.open ('cvs_server_query.jsp','newwindow', 'height='+(screen.height-55)+', width='+(screen.width-10)+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	if(select1.value=="5"){
		window.open ('hardware_info_query.jsp','newwindow', 'height='+(screen.height-55)+', width='+(screen.width-10)+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
}
</script>
</html>
