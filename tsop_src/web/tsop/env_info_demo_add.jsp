<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
<title>Demo�������ύ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Demo�������ύ</span></strong></font>
</div>
<form name="form1" action="env_info_demo_add_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO����ip</strong></td>
    <td class="en" width="63%"><input type="text" name="MAC_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO������½��</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO������½����</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO��Ŀ������</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_NAME" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO��Ŀ�����汾</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_VER" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�ļ���ŵ�ַ</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_LOC" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO����Ӧ��ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�������ݿ�ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�����ڲ���½ҳ��</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_INTRA_WEB" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�����ⲿ��½ҳ��</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_OUTER_WEB" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�����ʱ��</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_CREATE_TIME" value="" class="en" size="35" onFocus="show_cele_date(DEMO_CREATE_TIME,'','',DEMO_CREATE_TIME)"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO��������״̬</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_STATUS" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO�����Ǽ���</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_SIGNER" value="<%=session.getAttribute("username").toString()%>" readonly class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO��Ϣ��ע</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_NOTE" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMOӦ�û����汾</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_EDI" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO���ݿ⻷���汾��</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_EDI" value="" class="en" size="35"></td>
  </tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="�ύ" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="����">
</div>
</form>
</body>
<script language="JavaScript">
function check(){
	if(form1.MAC_IP.value==""){
		alert("������DEMO����ip");
		return;
	}
	if(form1.OS_USR.value==""){
		alert("������DEMO������½��");
		return;
	}
	if(form1.OS_PWD.value==""){
		alert("������DEMO������½����");
		return;
	}
	if(form1.PROJ_NAME.value==""){
		alert("������DEMO��Ŀ������");
		return;
	}
	if(form1.PROJ_VER.value==""){
		alert("������DEMO��Ŀ�����汾");
		return;
	}
	if(form1.DEMO_LOC.value==""){
		alert("������DEMO�ļ���ŵ�ַ");
		return;
	}
	if(form1.DEMO_APP_IP.value==""){
		alert("������DEMO����Ӧ��ip");
		return;
	}
	if(form1.DEMO_DB_IP.value==""){
		alert("������DEMO�������ݿ�ip");
		return;
	}
	if(form1.DEMO_INTRA_WEB.value==""){
		alert("������DEMO�����ڲ���½ҳ��");
		return;
	}
	if(form1.DEMO_OUTER_WEB.value==""){
		alert("������DEMO�����ⲿ��½ҳ��");
		return;
	}
	if(form1.DEMO_CREATE_TIME.value==""){
		alert("������DEMO�����ʱ��");
		return;
	}
	if(form1.DEMO_STATUS.value==""){
		alert("������DEMO��������״̬");
		return;
	}
	if(form1.DEMO_SIGNER.value==""){
		alert("������DEMO�����Ǽ���");
		return;
	}
	if(form1.DEMO_NOTE.value==""){
		alert("������DEMO��Ϣ��ע");
		return;
	}
	if(form1.DEMO_APP_EDI.value==""){
		alert("������DEMOӦ�û����汾");
		return;
	}
	if(form1.DEMO_DB_EDI.value==""){
		alert("������DEMO���ݿ⻷���汾");
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
