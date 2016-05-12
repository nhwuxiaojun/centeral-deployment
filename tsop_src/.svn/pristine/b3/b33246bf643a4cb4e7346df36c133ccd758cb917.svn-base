<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>资产提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String ass_num = new String();
String mac_ip = new String();
String opt_stat = new String();
String svr_type = new String();
String svr_price = new String();
String b_date = new String();
String svr_sn = new String();


ass_num = request.getParameter("ass_num").trim();
mac_ip = request.getParameter("mac_ip").trim();
opt_stat = request.getParameter("opt_stat").trim();
svr_type = request.getParameter("svr_type").trim();
svr_price = request.getParameter("svr_price").trim();
b_date = request.getParameter("b_date").trim();
svr_sn = request.getParameter("svr_sn").trim();

sql_temp = "select * from a_assets_ip where ass_num = '" + request.getParameter("ass_num") + "'";
rs = db.execSQL(sql_temp);
%>

<%if(rs.next()){%>
	<script language="JavaScript">
		alert("资产编号已存在！");
		window.location = "assets_info_query.jsp";
	</script>
<%}else{%>

<%
sql = "insert into a_assets_ip(ass_num,mac_ip,opt_stat,svr_type,svr_price,b_date,svr_sn,valid_flag) values('" + ass_num + "','" + mac_ip + "','" + opt_stat + "','" + svr_type + "'," + svr_price + ",to_date('" + b_date + "','yyyy-MM-dd'),'" + svr_sn + "',null)";
i = db.execUpdate(sql);
if(i==1){
	response.sendRedirect("assets_info_query.jsp?info=Create Succeed!");
}else{
	response.sendRedirect("assets_info_query.jsp?info=Create Failed!");
}
%>

<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
