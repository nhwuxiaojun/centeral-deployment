<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>PC/WM��Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
{
    font-size:9pt;
    color:black;
	vertical-align:middle;
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
.STYLE1 {color: #3333cc}
-->
</style>
</head>

<script src="calendar.js" language="javascript" type="text/javascript"></script>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;

sql = "select * from a_pc_info where host_id = " + request.getParameter("host_id");
rs = db.execSQL(sql);
%>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC/WM��Ϣ�޸�</span></strong></font>
</div>
<br><br>
<form name="form1" action="pc_update_finish.jsp" method="post" class="en">
<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>����IP(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="host_ip"  value="<%=rs.getString("host_ip")%>" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>�ʲ���ţ�</strong></td>
    <td width="78%" class="en">
	<input type="text" name="asset"  value="<%=rs.getString("asset")%>" class="text2">
	</td>
  </tr>  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>����Ա�û���(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="admin_user"  value="<%=rs.getString("admin_user")%>" class="text2">
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>����Ա����(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="pwd"  value="<%=rs.getString("pwd")%>" class="text2">
	</td>
  </tr>
   <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��Ŀ���ƣ�</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_name"  value="<%=rs.getString("proj_name")%>" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��Ŀ���룺</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_code"  value="<%=rs.getString("proj_code")%>" class="text2">
	</td>
  </tr>
    </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��;��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="purpose"  value="<%=rs.getString("purpose")%>" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>TS Owner��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="ts_owner"  value="<%=rs.getString("ts_owner")%>" class="text2">
	</td>
  </tr>
    </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>�����ˣ�</strong></td>
    <td width="78%" class="en">
	<input type="text" name="apply_owner"  value="<%=rs.getString("apply_owner")%>" class="text2">
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>ϵͳƽ̨(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	 <%
	  sql_temp = "select distinct sys_ver from a_property";
	  rs_temp = db.execSQL(sql_temp);
	 %>
	  <select name="sys_type">
	  	<option value="<%=rs.getString("sys_type")%>"><%=rs.getString("sys_type")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("sys_type").equals(rs_temp.getString("sys_ver"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("sys_ver")==null||"".equals(rs_temp.getString("sys_ver"))){%>
				
				<%}else{%>
					<option value="<%=rs_temp.getString("sys_ver")%>"><%=rs_temp.getString("sys_ver")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>
	</td>
  </tr>
  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>CPU���(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="cpu_size"  size=50   value="<%=rs.getString("cpu_size")%>" class="text2">
	</td>
  </tr>  

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>�ڴ�(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="mem_size"  value="<%=rs.getString("mem_size")%>" class="text2">G
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>���̴�С(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="disk_size"  value="<%=rs.getString("disk_size")%>" class="text2">G
	</td>
  </tr>    
 <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>���������IP��</strong></td>
    <td width="78%" class="en">
	<input type="text" name="vm_mac_ip"  value="<%=rs.getString("vm_mac_ip")%>" class="text2">PC������Ҫ��д
	</td>
  </tr>  
 <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>����λ�ã�</strong></td>
    <td width="78%" class="en">
	<input type="text" name="location"  value="<%=rs.getString("location")%>" class="text2">
	</td>
  </tr>  

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>״̬(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<%
	sql_temp="select distinct is_free from a_property";
	rs_temp=db.execSQL(sql_temp);
	%>
	
	<select name="status">
	  	<option value="<%=rs.getString("status")%>"><%=rs.getString("status")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("status").equals(rs_temp.getString("is_free"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("is_free")==null||"".equals(rs_temp.getString("is_free"))){%>
				
				<%}else{%>
					<option value="<%=rs_temp.getString("is_free")%>"><%=rs_temp.getString("is_free")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>
	
	</td>
  </tr>	
		
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��������(<font color="#FF0000">*</font>)��</strong></td>
    <td width="78%" class="en">
	<%
	sql_temp="select distinct svr_type from a_property";
	rs_temp=db.execSQL(sql_temp);
	%>
	<select name="server_type">
	  	<option value="<%=rs.getString("server_type")%>"><%=rs.getString("server_type")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("server_type").equals(rs_temp.getString("svr_type"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("svr_type")==null||"".equals(rs_temp.getString("svr_type"))){%>
				
				<%}else{%>
					<option value="<%=rs_temp.getString("svr_type")%>"><%=rs_temp.getString("svr_type")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>
	
	
	</td>
  </tr>	

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>��ע��</strong></td>
    <td width="78%" class="en">
	<textarea name="note" cols="56"   rows="3"><%=rs.getString("note")%></textarea>
	</td>
  </tr>
  <input type="hidden" name="host_id" value="<%=request.getParameter("host_id")%>">
</table>
<br><br>
<div align="center">
<input type="button" name="button1" class="button1" value="�ύ" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="����">&nbsp;&nbsp;<input type="button" name="button2" value="����" onClick="return_back()" class="button1">
</div>
</form>
<%
rs_temp.close();
 }
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function IsNumber(str){
	for(i=0;i<str.length;i++){
       	if(str.charAt(i)<'0' || str.charAt(i)>'9')
            return false;
    }
    return true;
}
function check(){
	if(form1.host_ip.value==""){
		alert("������IP");
		form1.host_ip.focus();
		return;
	}
	if(form1.admin_user.value==""){
		alert("���������Ա�û���");
		form1.admin_user.focus();
		return;
	}
	if(form1.pwd.value==""){
		alert("���������Ա�û�����");
		form1.pwd.focus();
		return;
	}

	if(form1.sys_type.value==""){
		alert("������ϵͳƽ̨");
		form1.sys_type.focus();
		return;
	}
	if(form1.mem_size.value==""){
		alert("�������ڴ��С");
		form1.mem_size.focus();
		return;
	}
	if(form1.disk_size.value==""){
		alert("��������̿ռ��С");
		form1.disk_size.focus();
		return;
	}
	if(form1.cpu_size.value==""){
		alert("������CPU���");
		form1.cpu_size.focus();
		return;
	}
	
	if(form1.status.value==""){
		alert("��ѡ��״̬");
		form1.status.focus();
		return;
	}
	
   form1.submit();

}

function return_back(){
	window.location = "pc_list.jsp";
}

</script>
</html>
