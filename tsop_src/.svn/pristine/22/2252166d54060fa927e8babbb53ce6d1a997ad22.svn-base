<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page  import="java.util.Date" %>
<html>
<head>
<title>现场备份检查环境表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
int i=0;
String project_name = new String();
String env_name = new String();
String env_td_start_date = new String();
String env_td_end_date = new String();
String env_td_remark = new String();
String cvs_dev_start_date = new String();
String cvs_dev_end_date = new String();
String cvs_dev_remark = new String();
String cvs_test_start_date = new String();
String cvs_test_end_date = new String();
String cvs_test_remark = new String();
String cvs_pub_start_date = new String();
String cvs_pub_end_date = new String();
String cvs_pub_remark = new String();
String j2ee_dev_start_date = new String();
String j2ee_dev_end_date = new String();
String j2ee_dev_remark = new String();
String j2ee_test_start_date = new String();
String j2ee_test_end_date = new String();
String j2ee_test_remark = new String();
String j2ee_pub_start_date = new String();
String j2ee_pub_end_date = new String();
String j2ee_pub_remark = new String();
String data_td_start_date = new String();
String data_td_end_date = new String();
String data_td_remark = new String();
String data_rts_start_date = new String();
String data_rts_end_date = new String();
String data_rts_remark = new String();
String data_jira_start_date = new String();
String data_jira_end_date = new String();
String data_jira_remark = new String();
String data_cccq_start_date = new String();
String data_cccq_end_date = new String();
String data_cccq_remark = new String();
String data_dev_start_date = new String();
String data_dev_end_date = new String();
String data_dev_remark = new String();
String data_test_start_date = new String();
String data_test_end_date = new String();
String data_test_remark = new String();
String data_pub_start_date = new String();
String data_pub_end_date = new String();
String data_pub_remark = new String();

project_name = Tools.toGB(request.getParameter("project_name").trim());
env_name = Tools.toGB(request.getParameter("env_name").trim());
env_td_start_date = request.getParameter("env_td_start_date").trim();
env_td_end_date = request.getParameter("env_td_end_date").trim();
env_td_remark = Tools.toGB(request.getParameter("env_td_remark").trim());
cvs_dev_start_date = request.getParameter("cvs_dev_start_date").trim();
cvs_dev_end_date = request.getParameter("cvs_dev_end_date").trim();
cvs_dev_remark = Tools.toGB(request.getParameter("cvs_dev_remark").trim());
cvs_test_start_date = request.getParameter("cvs_test_start_date").trim();
cvs_test_end_date = request.getParameter("cvs_test_end_date").trim();
cvs_test_remark = Tools.toGB(request.getParameter("cvs_test_remark").trim());
cvs_pub_start_date = request.getParameter("cvs_pub_start_date").trim();
cvs_pub_end_date = request.getParameter("cvs_pub_end_date").trim();
cvs_pub_remark = Tools.toGB(request.getParameter("cvs_pub_remark").trim());
j2ee_dev_start_date = request.getParameter("j2ee_dev_start_date").trim();
j2ee_dev_end_date = request.getParameter("j2ee_dev_end_date").trim();
j2ee_dev_remark = Tools.toGB(request.getParameter("j2ee_dev_remark").trim());
j2ee_test_start_date = request.getParameter("j2ee_test_start_date").trim();
j2ee_test_end_date = request.getParameter("j2ee_test_end_date").trim();
j2ee_test_remark = Tools.toGB(request.getParameter("j2ee_test_remark").trim());
j2ee_pub_start_date = request.getParameter("j2ee_pub_start_date").trim();
j2ee_pub_end_date = request.getParameter("j2ee_pub_end_date").trim();
j2ee_pub_remark = Tools.toGB(request.getParameter("j2ee_pub_remark").trim());
data_td_start_date = request.getParameter("data_td_start_date").trim();
data_td_end_date = request.getParameter("data_td_end_date").trim();
data_td_remark = Tools.toGB(request.getParameter("data_td_remark").trim());
data_rts_start_date = request.getParameter("data_rts_start_date").trim();
data_rts_end_date = request.getParameter("data_rts_end_date").trim();
data_rts_remark = Tools.toGB(request.getParameter("data_rts_remark").trim());
data_jira_start_date = request.getParameter("data_jira_start_date").trim();
data_jira_end_date = request.getParameter("data_jira_end_date").trim();
data_jira_remark = Tools.toGB(request.getParameter("data_jira_remark").trim());
data_cccq_start_date = request.getParameter("data_cccq_start_date").trim();
data_cccq_end_date = request.getParameter("data_cccq_end_date").trim();
data_cccq_remark = Tools.toGB(request.getParameter("data_cccq_remark").trim());
data_dev_start_date = request.getParameter("data_dev_start_date").trim();
data_dev_end_date = request.getParameter("data_dev_end_date").trim();
data_dev_remark = Tools.toGB(request.getParameter("data_dev_remark").trim());
data_test_start_date = request.getParameter("data_test_start_date").trim();
data_test_end_date = request.getParameter("data_test_end_date").trim();
data_test_remark = Tools.toGB(request.getParameter("data_test_remark").trim());
data_pub_start_date = request.getParameter("data_pub_start_date").trim();
data_pub_end_date = request.getParameter("data_pub_end_date").trim();
data_pub_remark = Tools.toGB(request.getParameter("data_pub_remark").trim());

sql="update a_env_bak set env_td_start_date = to_date('" + env_td_start_date + "','yyyy-mm-dd')" + ",env_td_end_date = to_date('" + env_td_end_date + "','yyyy-mm-dd'),env_td_remark = '" + env_td_remark + "',cvs_dev_start_date = to_date('" + cvs_dev_start_date + "','yyyy-mm-dd'),cvs_dev_end_date = to_date('" + cvs_dev_end_date + "','yyyy-mm-dd'),cvs_dev_remark = '" + cvs_dev_remark + "',cvs_test_start_date = to_date('" + cvs_test_start_date + "','yyyy-mm-dd'),cvs_test_end_date = to_date('" + cvs_test_end_date + "','yyyy-mm-dd'),cvs_test_remark = '" + cvs_test_remark + "',cvs_pub_start_date = to_date('" + cvs_pub_start_date + "','yyyy-mm-dd'),cvs_pub_end_date = to_date('" + cvs_pub_end_date + "','yyyy-mm-dd'),cvs_pub_remark = '" + cvs_pub_remark + "',j2ee_dev_start_date = to_date('" + j2ee_dev_start_date + "','yyyy-mm-dd'),j2ee_dev_end_date = to_date('" + j2ee_dev_end_date + "','yyyy-mm-dd'),j2ee_dev_remark = '" + j2ee_dev_remark + "',j2ee_test_start_date = to_date('" + j2ee_test_start_date + "','yyyy-mm-dd'),j2ee_test_end_date = to_date('" + j2ee_test_end_date + "','yyyy-mm-dd'),j2ee_test_remark = '" + j2ee_test_remark + "',j2ee_pub_start_date = to_date('" + j2ee_pub_start_date + "','yyyy-mm-dd'),j2ee_pub_end_date = to_date('" + j2ee_pub_end_date + "','yyyy-mm-dd'),j2ee_pub_remark = '" + j2ee_pub_remark + "',data_td_start_date = to_date('" + data_td_start_date + "','yyyy-mm-dd'),data_td_end_date = to_date('" + data_td_end_date + "','yyyy-mm-dd'),data_td_remark = '" + data_td_remark + "',data_rts_start_date = to_date('" + data_rts_start_date + "','yyyy-mm-dd'),data_rts_end_date = to_date('" + data_rts_end_date + "','yyyy-mm-dd'),data_rts_remark = '" + data_rts_remark + "',data_jira_start_date = to_date('" + data_jira_start_date + "','yyyy-mm-dd'),data_jira_end_date = to_date('" + data_jira_end_date + "','yyyy-mm-dd'),data_jira_remark = '" + data_jira_remark + "',data_cccq_start_date = to_date('" + data_cccq_start_date + "','yyyy-mm-dd'),data_cccq_end_date = to_date('" + data_cccq_end_date + "','yyyy-mm-dd'),data_cccq_remark = '" + data_cccq_remark + "',data_dev_start_date = to_date('" + data_dev_start_date + "','yyyy-mm-dd'),data_dev_end_date = to_date('" + data_dev_end_date + "','yyyy-mm-dd'),data_dev_remark = '" + data_dev_remark + "',data_test_start_date = to_date('" + data_test_start_date + "','yyyy-mm-dd'),data_test_end_date = to_date('" + data_test_end_date + "','yyyy-mm-dd'),data_test_remark = '" + data_test_remark + "',data_pub_start_date = to_date('" + data_pub_start_date + "','yyyy-mm-dd'),data_pub_end_date = to_date('" + data_pub_end_date + "','yyyy-mm-dd'),data_pub_remark = '" + data_pub_remark + "' where project_name = '" + project_name + "' and env_name = '" + env_name + "'";
//out.println(sql + "<br>");
i=db.execUpdate(sql);
//out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("scene_backup_env_manage.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("scene_backup_env_manage.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
