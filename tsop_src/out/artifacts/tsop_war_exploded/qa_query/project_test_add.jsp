<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>��Ŀ�����ύ</title>
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
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<br><br><br><br>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">��Ŀ�ⲿ��������ִ����������죩</span></strong></font>
</div>
<br><br>
<form name="form1" action="project_test_add_finish.jsp" method="post" class="en">
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��Ŀ���ƣ�</strong></td>
    <td class="en" width="60%" align="center"><input type="text" name="project_name" value="" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��Ŀ�汾��</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="project_version" value="" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>�ͻ����ƣ�</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="customer_name" value="" class="text" size="25"></td>
  </tr>
</table>
<br>
<br>
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Failed��</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="fail_num" value="" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Passed��</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="pass_num" value="" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>�������ڣ�</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="test_date" value="" class="text" size="25" onFocus="show_cele_date(test_date,'','',test_date)"></td>
  </tr>
</table>
<br><br>
<div align="center">
<input type="button" name="button1" class="button1" value="�ύ" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="����">
</div>
</form>
</body>
<script language="JavaScript">
function IsNumber(str){       
	for(i=0;i<str.length;i++){
       	if(str.charAt(i)<'0' || str.charAt(i)>'9')
            return false;
    }
    return true;
}
function check(){
	if(form1.project_name.value==""){
		alert("��������Ŀ����");
		form1.project_name.focus();
		return;
	}
	if(form1.project_version.value==""){
		alert("��������Ŀ�汾");
		form1.project_version.focus();
		return;
	}
	if(form1.customer_name.value==""){
		alert("������ͻ�����");
		form1.customer_name.focus();
		return;
	}
	if(form1.fail_num.value==""){
		alert("������Failed");
		form1.fail_num.focus();
		return;
	}
	if(IsNumber(form1.fail_num.value)==false){
		alert("Failed����Ϊ����");
		form1.fail_num.focus();
		return;
	}
	if(form1.pass_num.value==""){
		alert("������Passed");
		form1.pass_num.focus();
		return;
	}
	if(IsNumber(form1.pass_num.value)==false){
		alert("Passed����Ϊ����");
		form1.pass_num.focus();
		return;
	}
	if(form1.test_date.value==""){
		alert("�������������");
		form1.test_date.focus();
		return;
	}
	form1.submit();
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>