<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>��������ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
 function check(){
	if(form1.host_ip.value==""){
		alert("��ѡ������PC/VM");
		return false;
	 }
	 form1.submit();
  }
 function return_back(){
	 window.location = "pc_reply_list.jsp";
  }
</script>


<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_pc_apply where apply_id = " + request.getParameter("apply_id");
rs=db.execSQL(sql);
%>


<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC/WM��</span></strong></font>
</div>
<br><br>
<center>
<form name="form1" action="pc_reply_finish.jsp" method="post">
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>ϵͳƽ̨</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("sys_type")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_proposer")%>&nbsp;</font></td>
	</tr>
		<tr>
	  <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>TS Owner</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ts_owner")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�ڴ��С</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("mem_size")%>G&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���̴�С</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("disk_size")%>G&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ύʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("apply_time")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>����״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ύʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>&nbsp;<%=rs.getTime("apply_time")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_code")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��;</strong></font></td>
	   <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("purpose")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��ע</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("note")%>&nbsp;</font></td>
	</tr>
	<tr> 
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>����PC/WM</strong></font></td>
      <td width="78%" class="en">
		<%
		sql="select distinct host_ip,host_id from a_pc_info where upper(status)!='USE' order by host_ip";
		rs=db.execSQL(sql);
		%>
<div style="position:relative;">
		<select name="host_ip" class="select6" onchange="document.getElementById('host_ip_input').value=this.value">
		<option value="">��ѡ��</option>
		<%while(rs.next()){%>
			<%if(rs.getString("host_ip")!=null){%>
				<option value="<%=rs.getString("host_ip")%>"><%=rs.getString("host_ip")%></option>
			<%}%>
		<%}%>
		</select>
  <input id="host_ip_input" name="host_ip_input" placeholder="Input or select" style="position:absolute;width:88px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
</div>
		</td>
		
    </tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�Ƿ��ʼ�֪ͨ��</strong></font></td>
	  <td align="left" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input type="checkbox" name="send_email" checked="checked" value="1">&nbsp;</font></td>
	</tr>

</table>
   <input type="hidden" name="apply_id" value="<%=request.getParameter("apply_id")%>">
   <br>
   <div align="center">
    <input type="button" name="button1" value="�ύ" onClick="check()" class="button1">&nbsp;&nbsp;
	<input type="button" name="button2" value="����" class="button1" onClick="return_back()">  
  </div>
</form>
<%}%>	
<jsp:include page="includes/copyright.jsp" /></body>

<%db.close();%>
<%rs.close();%>
</html>
