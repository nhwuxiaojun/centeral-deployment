<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>������½Ȩ�޻���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_app_ip.value==""&&form1.col_value.value==""){
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
<script language="JavaScript" for="window" event="onload">
        form1.txt_app_ip.select();
</script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
ResultSet rs2;
int delcount = 0;
/*
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_app_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) order by staff_name,guest_ip,mac_ip,app_ip";
		}else{
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper(app_ip) like '%"+request.getParameter("txt_app_ip").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}else{
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper(app_ip) like '%"+request.getParameter("txt_app_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}
	}
}else{
	sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where rownum<11 order by staff_name,guest_ip,mac_ip,app_ip";
}
*/
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_app_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql = "select s.*,t.proj_env from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) s,a_proj_env_svr t order by staff_name,guest_ip,t.mac_ip,app_ip";
		}else{
			sql = "select s.*,t.proj_env from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) s,a_proj_env_svr t where s.app_ip = t.env_ip and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by staff_name,guest_ip,t.mac_ip,app_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql = "select s.*,t.proj_env from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) s,a_proj_env_svr t where s.app_ip = t.env_ip and upper(app_ip) like '%" + request.getParameter("txt_app_ip").toString().trim().toUpperCase() + "%' order by staff_name,guest_ip,t.mac_ip,app_ip";
		}else{
			sql = "select s.*,t.proj_env from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) s,a_proj_env_svr t where s.app_ip = t.env_ip and upper(app_ip) like '%" + request.getParameter("txt_app_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%"+request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by staff_name,guest_ip,t.mac_ip,app_ip";
		}
	}
}else{
	sql = "select s.*,t.proj_env from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) s,a_proj_env_svr t where s.app_ip = t.env_ip and rownum<11 order by staff_name,guest_ip,t.mac_ip,app_ip";
}
//System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">������½Ȩ�޻���</span></strong></font>
</div>
<br>
<%
if(request.getParameter("info")==null||"".equals(request.getParameter("info"))){

}else{
	out.print("<div align=\"center\"><font color=red>" + Tools.toGB(request.getParameter("info")) + "</font></div>");
}
%>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="app_ip" class="en">
			<option value="����IP">����IP</option>
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
				<option value="staff_name">Ա������</option>
				<option value="guest_ip">�ͻ�IP</option>
			<%}else{%>
				<%if("staff_name".equals(request.getParameter("col_name"))){%>
				<option value="staff_name">Ա������</option>
				<option value="guest_ip">�ͻ�IP</option>
				<%}%>
				<%if("guest_ip".equals(request.getParameter("col_name"))){%>
				<option value="guest_ip">�ͻ�IP</option>
				<option value="staff_name">Ա������</option>
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
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="��ѯ" class="en" onClick="check()">&nbsp;<input type="button" name="button2" value="����" class="en" onClick="del()"></td>
	</tr>
</table>
<br>
<input type="hidden" name="flag" value="y">
</form>
<form name="form2" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>Ա������</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>�ͻ�IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>����IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>����IP</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>Ȩ�޷�������</strong></font></td>
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>����</strong></font></td>
    </tr>
	<%while(rs.next()){%>
    <%delcount = delcount + 1;%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("STAFF_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("GUEST_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("APP_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PRIVI_TYPE")%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<input type="checkbox" name="<%="del_" + delcount%>" value="<%=rs.getString("STAFF_NAME")%>/<%=rs.getString("GUEST_IP")%>/<%=rs.getString("APP_IP")%>/<%=rs.getString("PRIVI_TYPE")%>/<%=rs.getString("MAC_IP")%>">&nbsp;</font></td>
	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>Ա������</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>�ͻ�IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>����IP</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>Ȩ�޷�������</strong></font></td>
      <td width="20%" align="center" class="en"><font color="#3333cc"><strong>��Ŀ����</strong></font></td> 
      <td width="10%" align="center" class="en"><font color="#3333cc"><strong>����</strong></font></td> 
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
  <%}%>
<%}%>
<input type="hidden" name="delcount" value="<%=delcount%>">
</table>
</form>
<%db.close();%>
<%rs.close();%>
</body>
<script language="javascript">
function del(){
  var len;
  len = document.form2.elements.length;
  if (len==0){
    alert ("�Բ����޼�¼��ѡ��");

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
      alert ("��������ѡһ��ɾ������");
      return;
    }
    isdel=confirm("���Ҫɾ����");
    if (isdel!="0"){
      document.form2.action="env_access_privi_del.jsp";
      document.form2.submit();
    }
  }
}
</script>
</html>
