<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>����������Ϣ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_mac_ip.value==""&&form1.col_value.value==""){
		alert("����������һ���ѯ������");
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
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_mac_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_env_bkinfo order by mac_ip,client_name";
		}else{
			sql="select * from a_env_bkinfo where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,client_name";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_env_bkinfo where upper(mac_ip) like '%"+request.getParameter("txt_mac_ip").toString().toUpperCase()+"%' order by mac_ip,client_name";
		}else{
			sql="select * from a_env_bkinfo where upper(mac_ip) like '%"+request.getParameter("txt_mac_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,client_name";
		}
	}
}else{
	sql="select * from a_env_bkinfo where rownum<11 order by mac_ip,client_name";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">����������Ϣ��ѯ</span></strong></font>
</div>
<br><br>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="mac_ip" class="en">
			<option value="������IP">������IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_mac_ip"))||request.getParameter("txt_mac_ip")==null){%>
			<input type="text" name="txt_mac_ip" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_mac_ip" value="<%=request.getParameter("txt_mac_ip")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="client_name">�ͻ�������</option>
				<option value="bk_path">����·��</option>
			<%}else{%>
				<%if("client_name".equals(request.getParameter("col_name"))){%>
				<option value="client_name">�ͻ�������</option>
				<option value="bk_path">����·��</option>
				<%}else{%>
				<option value="bk_path">����·��</option>
				<option value="client_name">�ͻ�������</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="��ѯ" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="21%" align="center" class="en"><font color="#3333cc"><strong>������IP</strong></font></td>
	  <td width="25%" align="center" class="en"><font color="#3333cc"><strong>�ͻ�������</strong></font></td>
	  <td width="29%" align="center" class="en"><font color="#3333cc"><strong>����·��</strong></font></td>
  </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("CLIENT_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("BK_PATH")%>&nbsp;</font></td>
	</tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
