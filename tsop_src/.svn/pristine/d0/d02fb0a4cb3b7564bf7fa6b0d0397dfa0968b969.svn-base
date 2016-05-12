<%@ include file="./interface/check_ext.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>环境登陆权限回收</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_app_ip.value==""&&form1.col_value.value==""){
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
ResultSet rs;
ResultSet rs2;
String ext_username=(String)session.getAttribute("ext_username");
int delcount = 0;

if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_app_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql = " select b.staff_name, b.guest_ip,  b.app_ip, b.privi_type,a.proj_env,a.mac_ip from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip)  and  a.proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"')  order by b.staff_name, b.guest_ip, b.app_ip ";
		}else{
		    sql="select * from (select b.staff_name,  b.guest_ip,  b.app_ip, b.privi_type, a.proj_env,a.mac_ip from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) and a.proj_code in (select proj_code from a_user_ext where name = '"+ext_username+"')) t  where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by staff_name, guest_ip,   app_ip  ";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql = "select * from (select b.staff_name,  b.guest_ip,  b.app_ip, b.privi_type, a.proj_env,a.mac_ip from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) and a.proj_code in (select proj_code from a_user_ext where name = '"+ext_username+"')) t  where upper(app_ip) like '%" + request.getParameter("txt_app_ip").toString().trim().toUpperCase() + "%' order by staff_name, guest_ip,  app_ip ";
		}else{
			sql = "select * from (select b.staff_name,  b.guest_ip,  b.app_ip, b.privi_type, a.proj_env,a.mac_ip from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) and a.proj_code in (select proj_code from a_user_ext where name = '"+ext_username+"')) t  where upper(app_ip) like '%" + request.getParameter("txt_app_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%"+request.getParameter("col_value").toString().trim().toUpperCase() + "%'  order by staff_name, guest_ip,  app_ip ";
		}
	}
}else{
	sql = "select b.staff_name, b.guest_ip, b.app_ip, b.privi_type,a.proj_env,a.mac_ip from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip)  and  a.proj_code  in (select proj_code from a_user_ext where name='"+ext_username+"') and rownum<11 order by b.staff_name, b.guest_ip, b.app_ip";
}
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境登陆权限回收</span></strong></font>
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
		<select name="app_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_app_ip"))||request.getParameter("txt_app_ip")==null){%>
			<input type="text" name="txt_app_ip" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_app_ip" value="<%=request.getParameter("txt_app_ip")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="staff_name">员工姓名</option>
				<option value="guest_ip">客户IP</option>
			<%}else{%>
				<%if("staff_name".equals(request.getParameter("col_name"))){%>
				<option value="staff_name">员工姓名</option>
				<option value="guest_ip">客户IP</option>
				<%}%>
				<%if("guest_ip".equals(request.getParameter("col_name"))){%>
				<option value="guest_ip">客户IP</option>
				<option value="staff_name">员工姓名</option>
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
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()">&nbsp;<input type="button" name="button2" value="回收" class="en" onClick="del()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<form name="form2" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">

	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>员工姓名</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>客户IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>权限访问类型</strong></font></td>
      <td width="20%" align="center" class="en"><font color="#3333cc"><strong>项目环境</strong></font></td> 
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>操作</strong></font></td> 
    </tr>
	<%while(rs.next()){%>
    <%delcount = delcount + 1;%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("STAFF_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("GUEST_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("APP_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PRIVI_TYPE")%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<input type="checkbox" name="<%="del_" + delcount%>" value="<%=rs.getString("STAFF_NAME")%>/<%=rs.getString("GUEST_IP")%>/<%=rs.getString("APP_IP")%>/<%=rs.getString("PRIVI_TYPE")%>/<%=rs.getString("MAC_IP")%>">&nbsp;</font></td>
	</tr>

<%}%>
<input type="hidden" name="delcount" value="<%=delcount%>">
</table>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
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
    isdel=confirm("真的要删除吗？");
    if (isdel!="0"){
      document.form2.action="ext_env_access_pri_del.jsp";
      document.form2.submit();
    }
  }
}
</script>
</html>
