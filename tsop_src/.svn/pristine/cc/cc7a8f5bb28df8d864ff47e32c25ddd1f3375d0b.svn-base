<%@ include file="./interface/check_ext.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>数据库权限回收</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_db_ip.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
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
ResultSet rs = null;
ResultSet rs2 = null;
String ext_username=(String)session.getAttribute("ext_username");
int delcount = 0;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_db_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a right join a_login_control b on upper(a.db_user) = upper(b.login_db_user) and upper(a.db_sid) = upper(b.login_db_sid) and a. proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') ";
		}else{
			sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a right join a_login_control b on upper(a.db_user) = upper(b.login_db_user) and upper(a.db_sid) = upper(b.login_db_sid) where a. proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a right join a_login_control b on upper(a.db_user) = upper(b.login_db_user) and upper(a.db_sid) = upper(b.login_db_sid) where  a. proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and upper(a.db_ip) like '%" + request.getParameter("txt_db_ip").toString().trim().toUpperCase() + "%'";
		}else{
			sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a right join a_login_control b on upper(a.db_user) = upper(b.login_db_user) and upper(a.db_sid) = upper(b.login_db_sid) where a. proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and  upper(a.db_ip) like '%" + request.getParameter("txt_db_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'";
		}
	}
}else{
	sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a right join a_login_control b on upper(a.db_user) = upper(b.login_db_user) and upper(a.db_sid) = upper(b.login_db_sid) where  a. proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and rownum<11";
}
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库权限回收</span></strong></font>
</div>
<br>
<%
if(request.getParameter("info")==null||"".equals(request.getParameter("info"))){

}else{
	out.print("<div align=\"center\"><font color=red>" + Tools.toGB(request.getParameter("info")) + "</font></div>");
}
%>
<br>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="db_ip" class="en">
			<option value="数据库IP">数据库IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_db_ip"))||request.getParameter("txt_db_ip")==null){%>
			<input type="text" name="txt_db_ip" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_db_ip" value="<%=request.getParameter("txt_db_ip")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="login_db_sid">数据库实例名</option>
				<option value="proj_env">项目环境名</option>
                <option value="login_db_user">数据库用户</option>
				<option value="login_ip">客户IP</option>
                <option value="login_os_user">员工姓名</option>
			<%}else{%>
				<%if("login_db_sid".equals(request.getParameter("col_name"))){%>
				<option value="login_db_sid">数据库实例名</option>
				<option value="proj_env">项目环境名</option>
                <option value="login_db_user">数据库用户</option>
				<option value="login_ip">客户IP</option>
                <option value="login_os_user">员工姓名</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="login_db_sid">数据库实例名</option>
                <option value="login_db_user">数据库用户</option>
				<option value="login_ip">客户IP</option>
                <option value="login_os_user">员工姓名</option>
				<%}%>
				<%if("login_db_user".equals(request.getParameter("col_name"))){%>
                <option value="login_db_user">数据库用户</option>
				<option value="login_db_sid">数据库实例名</option>
				<option value="proj_env">项目环境名</option>
				<option value="login_ip">客户IP</option>
                <option value="login_os_user">员工姓名</option>
				<%}%>
				<%if("login_ip".equals(request.getParameter("col_name"))){%>
				<option value="login_ip">客户IP</option>
				<option value="login_db_sid">数据库实例名</option>
				<option value="proj_env">项目环境名</option>
                <option value="login_db_user">数据库用户</option>
                <option value="login_os_user">员工姓名</option>
				<%}%>
				<%if("login_os_user".equals(request.getParameter("col_name"))){%>
                <option value="login_os_user">员工姓名</option>
				<option value="login_db_sid">数据库实例名</option>
				<option value="proj_env">项目环境名</option>
                <option value="login_db_user">数据库用户</option>
				<option value="login_ip">客户IP</option>
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
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()">&nbsp;<input type="button" name="button2" value="回收" class="en" onClick="del()">&nbsp;<input type="checkbox" name="checkbox1" value="1" onClick="select_all()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<form name="form2" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>用户类型</strong></font></td>
      <td width="20%" align="center" class="en"><font color="#3333cc"><strong>数据库用户</strong></font></td>
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>客户IP</strong></font></td>
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>员工姓名</strong></font></td>
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>操作</strong></font></td>
    </tr>
	<%while(rs.next()){%>
    <%delcount = delcount + 1;%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("DB_IP"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("LOGIN_DB_SID"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("PROJ_ENV"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("DB_USER_TYPE"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("LOGIN_DB_USER"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("LOGIN_IP"))%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=Tools.msNull(rs.getString("LOGIN_OS_USER"))%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<input type="checkbox" name="<%="del_" + delcount%>" value="<%=rs.getString("LOGIN_IP")%>/<%=rs.getString("LOGIN_OS_USER")%>/<%=rs.getString("LOGIN_DB_USER")%>/<%=rs.getString("LOGIN_DB_SID")%>">&nbsp;</font></td>
	</tr>
	<%}%>

<input type="hidden" name="delcount" value="<%=delcount%>">
</table>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function select_all() {
	if(form1.checkbox1.checked){
		for(var j = 1; j <= <%=delcount%>; j++){
			box = eval("document.form2.del_" + j); 
			if(box.checked == false) 
				box.checked = true;
		}
	}else{
		for(var k = 1; k <= <%=delcount%>; k++){
			box = eval("document.form2.del_" + k); 
			if(box.checked == true)
				box.checked = false;
		}
	}
}
function del(){
  var len;
  len = document.form2.elements.length;
  if (len==0){
    alert ("对不起，无记录可选！");

  }else{
    var j=0;
    var y=0;
    for( j=0; j<len; j++){
      if (document.form2.elements[j].type=='checkbox'){
        if (document.form2.elements[j].checked){
          y=y+1;
        }
      }
    }
    if(y==0){
      alert ("必须至少选一个删除对象！");
      return;
    }
    isdel=confirm("确定要回收权限吗？");
    if (isdel!="0"){
      document.form2.action="ext_db_privi_del.jsp";
      document.form2.submit();
    }
  }
}
</script>
</html>
