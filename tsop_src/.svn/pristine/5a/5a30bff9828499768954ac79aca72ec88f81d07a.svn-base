<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>内部资产信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_ass_num.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "assets_info_add.jsp";
}
function del(){
	var id;
    var flag = 0;
	if(typeof(form2.ass_num.length)=="undefined"){
		if(form2.ass_num.checked){
			var a = confirm('确认要删除吗？');
			if(a==true){
				form2.action = "assets_info_del.jsp";
				form2.submit();
			}
		}else{
        	alert("Please select!");
        	return false;
		}
	}else{
    	for(var i=0;i<form2.ass_num.length;i++){
    		if(form2.ass_num[i].checked==true){
				id = form2.ass_num[i].value;
        		flag = 1;
        		break;
    		}
		}
    	if(!flag){
        	alert("Please select!");
        	return false;
    	}
		var a = confirm('确认要删除吗？');
		if(a==true){
			form2.action = "assets_info_del.jsp";
			form2.submit();
		}
	}
}
function upd(){
	var id;
    var flag = 0;
	if(typeof(form2.ass_num.length)=="undefined"){
		if(form2.ass_num.checked){
			form2.action = "assets_info_upd.jsp";
			form2.submit();
		}else{
        	alert("Please select!");
        	return false;
		}
	}else{
    	for(var i=0;i<form2.ass_num.length;i++){
    		if(form2.ass_num[i].checked==true){
				id = form2.ass_num[i].value;
        		flag = 1;
        		break;
    		}
		}
    	if(!flag){
        	alert("Please select!");
        	return false;
    	}
		form2.action = "assets_info_upd.jsp";
		form2.submit();
	}
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
String sql2 = new String();
ResultSet rs = null;
ResultSet rs2 = null;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_ass_num"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_assets_ip where valid_flag is null order by ass_num,mac_ip";
		}else{
			sql="select * from a_assets_ip where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by ass_num,mac_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_assets_ip where upper(ass_num) like '%"+request.getParameter("txt_ass_num").toString().toUpperCase()+"%' and valid_flag is null order by ass_num,mac_ip";
		}else{
			sql="select * from a_assets_ip where upper(ass_num) like '%"+request.getParameter("txt_ass_num").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' and valid_flag is null order by ass_num,mac_ip";
		}
	}
}else{
	sql="select * from a_assets_ip where rownum<11 and valid_flag is null order by ass_num,mac_ip";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">内部资产信息查询</span></strong></font>
</div>
<br><br>
<form name="form1" action="" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td align="center" class="en" width="15%">
		<select name="ass_num" class="en">
			<option value="资产编号">资产编号</option>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("txt_ass_num"))||request.getParameter("txt_ass_num")==null){%>
			<input type="text" name="txt_ass_num" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="txt_ass_num" value="<%=request.getParameter("txt_ass_num")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="15%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">物理IP</option>
				<option value="opt_stat">使用状态</option>
				<option value="svr_type">服务器类型</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="opt_stat">使用状态</option>
				<option value="svr_type">服务器类型</option>
				<%}%>
				<%if("opt_stat".equals(request.getParameter("col_name"))){%>
				<option value="opt_stat">使用状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="svr_type">服务器类型</option>
				<%}%>
				<%if("svr_type".equals(request.getParameter("col_name"))){%>
				<option value="svr_type">服务器类型</option>
				<option value="mac_ip">物理IP</option>
				<option value="opt_stat">使用状态</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="30%"><input type="button" name="button1" value="查询" class="en" onClick="check()">
		<%sql2="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
		<%rs2=db.execSQL(sql2);%>
		<%while(rs2.next()){%>
  			<%if("2".equals(rs2.getString("valid"))){%>
				&nbsp;<input type="button" name="button2" value="新增" class="en" onClick="add()">&nbsp;<input type="button" name="button3" value="删除" class="en" onClick="del()">&nbsp;<input type="button" name="button4" value="修改" class="en" onClick="upd()">
			<%}else{%>

			<%}%>
		<%}%>
        </td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<form name="form2" action="" method="post">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>资产编号</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>使用状态</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>服务器类型</strong></font></td>
      <td width="20%" align="center" class="en"><font color="#3333cc"><strong>操作</strong></font></td>
    </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ASS_NUM")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("OPT_STAT")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("SVR_TYPE")%>&nbsp;</font></td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<input type="radio" name="ass_num" value="<%=rs.getString("ASS_NUM")%>">&nbsp;</font></td>
	</tr>
	<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
