<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page  import="java.util.Date" %>
<html>
<head>
<title>现场备份检查确认表处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
.text
{
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
    border-right-color:Black;
}
.button1
{   height:14pt;
    width:30pt;
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;	 
}
-->
</style>
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
int i=0;
int k=0;
String project_name = new String();
String env_num = new String();
String start_date = new String();
String end_date = new String();
String take_person = new String();
String take_date = new String();
String check_person = new String();
String check_date = new String();
String test_result = new String();
String sample_date = new String();

project_name = Tools.toGB(request.getParameter("project_name").trim());
env_num = request.getParameter("env_num").trim();
start_date = request.getParameter("start_date").trim();
end_date = request.getParameter("end_date").trim();
take_person = Tools.toGB(request.getParameter("take_person").trim());
take_date = request.getParameter("take_date").trim();
check_person = Tools.toGB(request.getParameter("check_person").trim());
check_date = request.getParameter("check_date").trim();
test_result = Tools.toGB(request.getParameter("test_result").trim());
sample_date = request.getParameter("sample_date").trim();
//out.print(project_name+"<br>"+env_num+"<br>"+start_date+"<br>"+end_date+"<br>"+take_person+"<br>"+take_date+"<br>"+check_person+"<br>"+check_date+"<br>"+test_result+"<br>"+sample_date+"<br>");
sql="insert into a_pro_bak(project_name,env_num,start_date,end_date,take_person,take_date,check_person,check_date,test_result,sample_date)values('"+project_name+"','"+env_num+"',to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),'"+take_person+"',to_date('"+take_date+"','yyyy-mm-dd'),'"+check_person+"',to_date('"+check_date+"','yyyy-mm-dd'),'"+test_result+"',to_date('"+sample_date+"','yyyy-mm-dd'))";
//out.println(sql+"<br>");
i=db.execUpdate(sql);
//out.println(i+"<br>");
for(int j=1;j<=Integer.parseInt(env_num);j++){
	//out.print("环境"+j+"<br>");
	sql_temp="insert into a_env_bak(project_name,env_name,env_td_start_date,env_td_end_date,cvs_dev_start_date,cvs_dev_end_date,cvs_test_start_date,cvs_test_end_date,cvs_pub_start_date,cvs_pub_end_date,j2ee_dev_start_date,j2ee_dev_end_date,j2ee_test_start_date,j2ee_test_end_date,j2ee_pub_start_date,j2ee_pub_end_date,data_td_start_date,data_td_end_date,data_rts_start_date,data_rts_end_date,data_jira_start_date,data_jira_end_date,data_cccq_start_date,data_cccq_end_date,data_dev_start_date,data_dev_end_date,data_test_start_date,data_test_end_date,data_pub_start_date,data_pub_end_date)values('"+project_name+"','"+Tools.toGB(request.getParameter("env_"+j).trim())+"',to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'),to_date('"+start_date+"','yyyy-mm-dd'),to_date('"+end_date+"','yyyy-mm-dd'))";
	//out.print(sql_temp+"<br>");
	k=db.execUpdate(sql_temp);
	//out.println(k+"<br>");
}
if(i==1&k==1){
	out.println("<div align=center><font color=red style=\"{font-size:9pt;}\">提交成功！</font></div>");
}else{
	out.println("<div align=center><font color=red style=\"{font-size:9pt;}\">提交失败！</font></div>");
}
db.close();
%>
<br>
<div align="center"><input type="button" name="button1" class="button1" value="返回" onClick="back()"></div>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function back(){
	window.location="scene_backup_check.jsp";
}
</script>
</html>
