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


ass_num = Tools.toGB(request.getParameter("ass_num").trim());
mac_ip = Tools.toGB(request.getParameter("mac_ip").trim());
opt_stat = Tools.toGB(request.getParameter("opt_stat").trim());
svr_type = Tools.toGB(request.getParameter("svr_type").trim());
svr_price = Tools.toGB(request.getParameter("svr_price").trim());
b_date = Tools.toGB(request.getParameter("b_date").trim());
svr_sn = Tools.toGB(request.getParameter("svr_sn").trim());

sql = "update a_assets_ip set mac_ip = '" + mac_ip + "',opt_stat = '" + opt_stat + "',svr_type = '" + svr_type + "',svr_price = '" + svr_price + "',b_date = to_date('" + b_date + "','yyyy-MM-dd'),svr_sn = '" + svr_sn + "' where ass_num = '" + ass_num + "'";
i = db.execUpdate(sql);
//out.print(sql);
if(i==1){
	response.sendRedirect("assets_info_query.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("assets_info_query.jsp?info=Update Failed!");
}
%>


<jsp:include page="includes/copyright.jsp" /></body>
</html>
