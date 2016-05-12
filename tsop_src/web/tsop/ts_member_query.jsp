<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>TS成员信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "ts_member_add.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script language="JavaScript" for="window" event="onload">
        form1.col_value1.select();
</script>
<body>
<%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
ResultSet rs2;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))){
			sql = "select * from ts_member where resign=0 order by no";
	}else{
			sql = "select * from ts_member where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and resign=0 order by no ";
	}
}else{
	sql = "select * from ts_member where resign=0 order by no";
}
System.out.print(sql+"\n");
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">TS 成员信息查询</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
<div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="account">域帐号</option>
				<option value="no">工号</option>
				<option value="name">英文名</option>
			<%}else{%>
				<option value="account">域帐号</option>
				<option value="no">工号</option>
				<option value="name">英文名</option>
			<%}%>
		</select>
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
		<%}%><input type="button" name="button1" value="查询" class="en" onClick="check()">
        <input type="button" name="button2" value="新增" class="en" onClick="add()">
		<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
		<%rs2=db.execSQL(sql);%>
		<%while(rs2.next()){%>
  			<%if("2".equals(rs2.getString("valid"))){%>
				&nbsp;&nbsp;
			<%}else{%>

			<%}%>
		<%}%>
		</td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>

<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>工号</strong></font></td>
	  <td align="center" class="en" width="18%"><font color="#3333cc"><strong>域帐号</strong></font></td>
	  <td align="center" class="en" width="18%"><font color="#3333cc"><strong>英文名</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>手机号1</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>分机</strong></font></td>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>支持项目</strong></font></td>
      <td align="center" class="en" width="6%"><font color="#3333cc"><strong>修改</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("NO")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ACCOUNT")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("NAME")%>&nbsp;</font></td> 
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("MOBILE1")%>&nbsp;</font></td>

	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("EXT")%></font></a>&nbsp;</td>
	<td align="center" class="en"><font color="#3333cc">&nbsp;<a href="ts_project_support_query.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">查询</font></a></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<a href="ts_member_update.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">
      <%
	  if (rs.getString("ACCOUNT").equals(session.getAttribute("username"))) {
		  out.println("修改");
	  }
	  %>      </font></a></td>

	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>工号</strong></font></td>
	  <td align="center" class="en" width="18%"><font color="#3333cc"><strong>域帐号</strong></font></td>
	  <td align="center" class="en" width="18%"><font color="#3333cc"><strong>英文名</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>手机号1</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>分机</strong></font></td>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>支持项目</strong></font></td>
      <td align="center" class="en" width="6%"><font color="#3333cc"><strong>修改</strong></font></td>
	</tr>
	<%while(rs.next()){%>
    	<%if("sys".equals(rs.getString("NO").toLowerCase())){%>
    		
    	<%}else{%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("NO")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ACCOUNT")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("NAME")%>&nbsp;</font></td> 
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("MOBILE1")%>&nbsp;</font></td>

	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getLong("EXT")%></font></a>&nbsp;</td>
<td align="center" class="en"><font color="#3333cc">&nbsp;<a href="ts_project_support_query.jsp?s_name=<%=rs.getLong("NO")%>&flag=print><font color="#3333cc">查询</font></a></td>
<td align="center" class="en"><font color="#3333cc">&nbsp;<a href="ts_member_update.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">
      <%
	 // System.out.println("===="+rs.getString("ACCOUNT")+"====");
	 // System.out.println("++++"+session.getAttribute("username")+"++++");
	  if (rs.getString("ACCOUNT").toLowerCase().equals(session.getAttribute("username"))) {
		  out.println("修改");
	  }
	  %>      </font></a></td>
	</tr>
    	<%}%>
	<%}%>
  <%}%>
<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
