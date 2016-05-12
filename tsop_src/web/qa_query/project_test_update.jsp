<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目测试修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
{
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
.STYLE1 {color: #FF6600}
-->
</style>
</head>
<%
QADBean db = new QADBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_project_version_test where id = " + request.getParameter("id");
rs=db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.project_name.value==""){
		alert("请输入项目名称");
		form1.project_name.focus();
		return;
	}
	if(form1.project_version.value==""){
		alert("请输入项目版本");
		form1.project_version.focus();
		return;
	}
	if(form1.customer_name.value==""){
		alert("请输入客户名称");
		form1.customer_name.focus();
		return;
	}
	if(form1.fail_num.value==""){
		alert("请输入Failed");
		form1.fail_num.focus();
		return;
	}
	if(IsNumber(form1.fail_num.value)==false){
		alert("Failed必须为数字");
		form1.fail_num.focus();
		return;
	}
	if(form1.pass_num.value==""){
		alert("请输入Passed");
		form1.pass_num.focus();
		return;
	}
	if(IsNumber(form1.pass_num.value)==false){
		alert("Passed必须为数字");
		form1.pass_num.focus();
		return;
	}
	if(form1.test_date.value==""){
		alert("请输入测试日期");
		form1.test_date.focus();
		return;
	}
	form1.submit();
}
function IsNumber(str){       
	for(i=0;i<str.length;i++){
       	if(str.charAt(i)<'0' || str.charAt(i)>'9')
            return false;
    }
    return true;
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<br><br><br><br>
<form name="form1" action="project_test_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目外部测试用例执行情况（当天）</span></strong></font>
</div>
<br><br>
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <input type="hidden" name="id" value="<%=rs.getInt("id")%>">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目名称：</strong></td>
    <td class="en" width="60%" align="center"><input type="text" class="text" name="project_name" value="<%=rs.getString("project_name")%>" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目版本：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" class="text" name="project_version" value="<%=rs.getString("project_version")%>" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>客户名称：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" class="text" name="customer_name" value="<%=rs.getString("customer_name")%>" size="25"></td>
  </tr>
</table>
<br>
<br>
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Failed：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" class="text" name="fail_num" value="<%=rs.getInt("fail_num")%>" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Passed：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" class="text" name="pass_num" value="<%=rs.getInt("pass_num")%>" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>测试日期：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="test_date" value="<%=rs.getDate("test_date")%>" class="text" size="25" onFocus="show_cele_date(test_date,'','',test_date)"></td>
  </tr>
</table>
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="button1">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1"></div>
<%}%>
</form>
</body>
<%db.close();%>
<%rs.close();%>
</html>