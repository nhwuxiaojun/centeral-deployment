<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>服务器硬件新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">服务器硬件新增</span></strong></font>
</div>
<br><br>
<form name="form1" action="hardware_info_add_finish.jsp" method="post" class="en">
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td width="21%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="MAC_IP" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>主机名</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="HOST_NAME" value="" class="en" size="20">*Asset Number</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Root用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="ROOT" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Root密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="PWD" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>系统类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="SYS_TYPE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>服务器类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="SVR_TYPE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Cpu大小</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="CPU_SIZE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>内存大小</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="MEM_SIZE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>硬盘数</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="DISK_COUNT" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>硬盘总大小</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="DISK_SIZE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>SWAP大小</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="SWAP_SIZE" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>其他</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="OTHERS" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>最大内存槽位数</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="MAX_MEM_NUM" value="" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>最大硬盘槽位数</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="MAX_DISK_NUM" value="" class="en" size="35"></td>
	</tr>
    <tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
      	<select name="TYPE">
        	<option value="">请选择</option>
            <option value="DB">DB</option>
            <option value="APP">APP</option>
            <option value="SP">SP</option>
        </select>
      </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>机柜号</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="DESK_NO" value="" class="en" size="35"></td>
	</tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="添加" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">
</div>
</form>
</body>
<script language="JavaScript">
function check(){
	if(form1.MAC_IP.value==""){
		alert("请输入MAC IP！");
		form1.MAC_IP.focus();
		return false;
	}
	if(form1.HOST_NAME.value==""){
		alert("请输入主机名！");
		form1.HOST_NAME.focus();
		return false;
	}
	if(isNumber(form1.MAX_MEM_NUM.value)==false){
		alert("最大内存槽位数必须为数字！");
		form1.MAX_MEM_NUM.focus();
		return false;
	}
	if(isNumber(form1.MAX_DISK_NUM.value)==false){
		alert("最大硬盘槽位数必须为数字！");
		form1.MAX_DISK_NUM.focus();
		return false;
	}
	form1.submit();
}
function isNumber(oNum){
	var i,j,strTemp;
	strTemp="0123456789.";
	if(oNum.length==0)
		return 0;
	for(i=0;i<oNum.length;i++){
		j=strTemp.indexOf(oNum.charAt(i)); 
		if(j==-1){
			return 0;
		}
	}
	return 1;
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
