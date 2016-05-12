<%//@ include file="./interface/check_ext.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>环境登陆权限赋予管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.button1
{   
    height:14pt;
    width:30pt;
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
-->
</style>
</head>
<script language="JavaScript">
function check(){
	if(form2.txt_env_ip.value==""&&form2.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form2.submit();
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
String ext_username=(String)session.getAttribute("ext_username");
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_env_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  order by mac_ip,proj_env,env_ip";
		}else{
			sql="select * from a_proj_env_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,proj_env,env_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and  upper(env_ip) like '%"+request.getParameter("txt_env_ip").toString().toUpperCase()+"%' order by mac_ip,proj_env,env_ip";
		}else{
			sql="select * from a_proj_env_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and     upper(env_ip) like '%"+request.getParameter("txt_env_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,proj_env,env_ip";
		}
	}
}else{
	sql="select * from a_proj_env_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and rownum<6 order by mac_ip,proj_env,env_ip";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境登陆权限赋予管理</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form2" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="env_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_env_ip"))||request.getParameter("txt_env_ip")==null){%>
			<input type="text" name="txt_env_ip" value="" class="text2">
		<%}else{%>
			<input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="text2">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">&nbsp;&nbsp;
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="text2">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="text2">
		<%}%>
		</td>
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="button1" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<form name="form1" action="" method="post" class="en">
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="19%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td align="center" class="en" width="28%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="24%"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td align="center" class="en" width="12%"><font color="#3333cc"><strong>选择</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<span id="env_<%=rs.getString("ENV_ID")%>"><%=rs.getString("ENV_IP")%></span>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	 <!-- <td align="center" bgcolor="#FCFCFC" class="en"><input type="radio" name="env_id" value="<%//=rs.getString("ENV_ID")%>"></td>-->
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="checkbox" name="env_id" value="<%=rs.getString("ENV_ID")%>"></td>
	  
	
    </tr>
	<%}%>
</table>
<hr><br>
员工姓名：
<%if(request.getParameter("staff_name")==null||"".equals(request.getParameter("staff_name"))){%>
	<input type="text" name="staff_name" id="staff_name" value="" class="text2">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="staff_name" id="staff_name" value="<%=request.getParameter("staff_name")%>" class="text2">&nbsp;&nbsp;
<%}%>
客户IP：
<%if(request.getParameter("customer_ip")==null||"".equals(request.getParameter("customer_ip"))){%>
	<input type="text" name="customer_ip" value="" class="text2">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="customer_ip" value="<%=request.getParameter("customer_ip")%>" class="text2">&nbsp;&nbsp;
<%}%>
<%
String sql_temp = new String();
ResultSet rs_temp;
sql_temp = "select distinct login_way from a_property where login_way is not null";
rs_temp = db.execSQL(sql_temp);
%>
权限访问类型：
<select name="visit_type">
	<option value="">请选择</option>
	<%while(rs_temp.next()){%>
		<option value="<%=rs_temp.getString("login_way")%>"><%=rs_temp.getString("login_way")%></option>
	<%}%>
</select>
<br><br>
<div align="center">
<input type="button" name="button1" value="提交" class="button1" onClick="check2()">&nbsp;&nbsp;
<input type="reset" name="reset1" value="重置" class="button1">
<input type="hidden" name="env_ip" value="">
<input type="hidden" name="txt_env_ip" value="">
<input type="hidden" name="col_name" value="">
<input type="hidden" name="col_value" value="">
</div>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function check2(){


   var len = document.form1.elements.length;
   if (len==0){
    alert ("对不起，无记录可选！");
    return;
   }else{
    var j=0;
    var y=0;
    for( j=0; j<len; j++){
      if (document.form1.elements[j].type=='checkbox'){
        if (document.form1.elements[j].checked){
          y=y+1;
        }
      }
    }
    if(y==0){
      alert ("必须至少选一个对象！");
      return;
    }
   }
	
	if(form1.staff_name.value==""){
		alert("请输入员工姓名！");
		form1.staff_name.focus();
		return false;
	}
	if(form1.staff_name.value.indexOf("1")=="-1"){

	}else{
		alert("员工姓名错误！");
		form1.staff_name.focus();
		return false;
	}
	if(form1.customer_ip.value==""){
		alert("请输入客户IP！");
		form1.customer_ip.focus();
		return false;
	}
	if(form1.customer_ip.value.indexOf("172.16.0.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	if(form1.customer_ip.value.indexOf("172.16.1.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	if(form1.customer_ip.value.indexOf("172.16.2.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	if(form1.visit_type.value==""){
		alert("请选择权限访问类型！");
		form1.visit_type.focus();
		return false;
	}
	form1.env_ip.value = form2.env_ip.value;
	form1.txt_env_ip.value = form2.txt_env_ip.value;
	form1.col_name.value = form2.col_name.value;
	form1.col_value.value = form2.col_value.value;
	
	
	
	var a = confirm('授予' + form1.staff_name.value + '(' + form1.customer_ip.value + ')的访问权限？');
	if(a==true){           
			form1.action = "ext_env_access_privi_finish.jsp";
			form1.submit();
	}
	
}
</script>
</html>
