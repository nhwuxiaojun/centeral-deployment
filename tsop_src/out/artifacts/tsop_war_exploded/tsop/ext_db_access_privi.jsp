<%@ include file="./interface/check_ext.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>数据库登陆权限赋予管理</title>
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
	if(form2.col_value1.value==""&&form2.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	/*
	alert(form2.col_name1.value);
	alert(form2.col_value1.value);
	alert(form2.col_name.value);	
	alert(form2.col_value.value);
	
	form2.col_name.value = form2.col_name.value;
	form2.col_name1.value = form2.col_name1.value;
	form2.col_value.value = form2.col_value.value;
	form2.col_value1.value = form2.col_value1.value;
	*/

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
String ext_username=(String)session.getAttribute("ext_username");
ResultSet rs;
if("y".equals(request.getParameter("link"))){
sql="select * from a_db_svr where  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and proj_env = '" + request.getParameter("proj_env") + "' and rownum<6  order by db_sid,db_user";
}else{
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_db_svr where proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' order by db_sid,db_user";
		}else{
			sql="select * from a_db_svr where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' and proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' order by db_sid,db_user";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_db_svr where upper("+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%' and proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' order by db_sid,db_user";
		}else{
			sql="select * from a_db_svr where upper("+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' and  proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' order by db_sid,db_user";
		}
	}
}else{
	sql="select * from a_db_svr where rownum<6 and proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' order by db_sid,db_user";
}
}

rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库登陆权限赋予管理</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form2" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="proj_env">项目环境名</option>
				<option value="db_ip">数据库IP</option>
			<%}else{%>
				<%if("proj_env".equals(request.getParameter("col_name1"))){%>
					<option value="proj_env">项目环境名</option>
					<option value="db_ip">数据库IP</option>
				<%}else{%>
					<option value="db_ip">数据库IP</option>
					<option value="proj_env">项目环境名</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en">
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
			<%}else{%>
				<%if("db_sid".equals(request.getParameter("col_name"))){%>
				<option value="db_sid">数据库实例名</option>
				<option value="db_user">数据库用户</option>
				<%}%>
				<%if("db_user".equals(request.getParameter("col_name"))){%>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
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
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<form name="form1" action="" method="post" class="en">
<hr>
<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="17%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="30%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="11%"><font color="#3333cc"><strong>用户类型</strong></font></td>
	  <td align="center" class="en" width="21%"><font color="#3333cc"><strong>数据库用户</strong></font></td>
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>选择</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<span id="db_<%=rs.getInt("DB_ID")%>"><%=rs.getString("DB_SID")%></span>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_TYPE")%>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<span id="user_<%=rs.getInt("DB_ID")%>"><%=rs.getString("DB_USER")%></span>&nbsp;</font></td>
	  <td width="6%" align="center" bgcolor="#FCFCFC" class="en"><input type="checkbox" name="selectStr" value="<%=rs.getString("DB_USER")%>/<%=rs.getString("DB_SID")%>"></td>
	</tr>
	<%}%>
</table>
<hr><br>
<div align="center">
员工姓名：
<%if(request.getParameter("staff_name")==null||"".equals(request.getParameter("staff_name"))){%>
	<input type="text" name="staff_name" id="staff_name" value="" class="text2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="staff_name" id="staff_name" value="<%=request.getParameter("staff_name")%>" class="text2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}%>
客户IP：
<%if(request.getParameter("customer_ip")==null||"".equals(request.getParameter("customer_ip"))){%>
	<input type="text" name="customer_ip" value="" class="text2">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="customer_ip" value="<%=request.getParameter("customer_ip")%>" class="text2">&nbsp;&nbsp;
<%}%>
</div>
<br><br>
<div align="center">
<input type="button" name="button1" value="提交" class="button1" onClick="check2()">&nbsp;&nbsp;
<input type="reset" name="reset1" value="重置" class="button1">
<input type="hidden" name="col_name" value="">
<input type="hidden" name="col_name1" value="">
<input type="hidden" name="col_value" value="">
<input type="hidden" name="col_value1" value="">
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
	
	form1.col_name.value = form2.col_name.value;
	form1.col_name1.value = form2.col_name1.value;
	form1.col_value.value = form2.col_value.value;
	form1.col_value1.value = form2.col_value1.value;
	
		
	var a = confirm('授予' + form1.staff_name.value + '(' + form1.customer_ip.value + ')的数据库访问权限？');
	if(a==true){
			form1.action = "ext_db_access_privi_finish.jsp";
			form1.submit();
			}
	
	
}
</script>
</html>
