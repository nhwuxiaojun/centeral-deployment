<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
<title>数据库信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;
sql = "select * from a_db_svr_tmp where db_id = " + request.getParameter("id");
//out.print(sql);
rs = db.execSQL(sql);
%>
<script language="javascript">

var onecount;
onecount = 0;
subcat = [];
<%
sql_temp = "select * from a_db_sid";
rs_temp = db.execSQL(sql_temp);
int count = 0;
while(rs_temp.next()){
%>
subcat[<%=count%>] = ["<%=rs_temp.getString("db_ip")%>","<%=rs_temp.getString("db_sid")%>"];
<%
count++;
}
rs_temp.close();
%>
temp = <%=count%>;


function change(team_id){
    document.form1.DB_SID.length = 0;
    var team_id = team_id;
    var i;
    for (i=0;i<temp;i++){
		if (subcat[i][0] == team_id){
			document.form1.DB_SID.options[document.form1.DB_SID.length] = new Option(subcat[i][1], subcat[i][1],false,false); 
            //window.alert(document.form1.db_sid.length);
         	//window.alert(subcat[i][1]);
		} 
    } 
    document.form1.DB_SID.options[0].selected = true;
	//window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
}    


function check(){
	if(form1.DB_IP.value==""){
		alert("请输入数据库IP");
		return;
	}
	/*
	if(form1.OS_DB_USER.value==""){
		alert("请输入安装用户名");
		return;
	}
	if(form1.OS_DB_PASSWD.value==""){
		alert("请输入用户密码");
		return;
	}
	*/
	if(form1.DB_SID.value==""){
		alert("请输入数据库实例名");
		return;
	}
	if(form1.DB_USER.value==""){
		alert("请输入数据库用户");
		return;
	}
	if(form1.DB_USER_PASSWD.value==""){
		alert("请输入数据库用户密码");
		return;
	}
	if(form1.DB_USER_TYPE.value==""){
		alert("请输入数据库用户类型");
		return;
	}
	//if(form1.PROJ_ENV.value==""){
		//alert("请输入项目环境名");
		//return;
	//}
	if(form1.PROJECT_GROUP.value==""){
		alert("请输入环境项目属组");
		return;
	}
	if(form1.PROPOSER.value==""){
		alert("请输入数据库环境申请人");
		return;
	}
	//if(form1.CREATER.value==""){
		//alert("请输入数据库环境创建人");
		//return;
	//}
	if(form1.CREATE_DATE.value==""){
		alert("请输入数据库环境创建日期");
		return;
	}
	if(form1.DB_MANAGER.value==""){
		alert("请输入数据库负责人");
		return;
	}
	/*
	if(form1.DB_VERSION.value==""){
		alert("请输入数据库版本");
		return;
	}
	if(form1.DB_CHARACTER.value==""){
		alert("请输入数据库字符集");
		return;
	}
	if(form1.DB_PORT_NUM.value==""){
		alert("请输入数据库端口号");
		return;
	}
	if(form1.DB_LISTENER.value==""){
		alert("请输入数据库监听器");
		return;
	}
	*/
	if(form1.DB_STATUS.value==""){
		alert("请输入数据库运行状态");
		return;
	}
	form1.submit();
}
function return_back(){
	window.location = "db_server_query.jsp";
}
</script>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="db_server_update_temp_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库信息修改</span></strong></font>
</div>
<br><br>
<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	  <%
	  sql_temp = "select distinct db_ip from a_db_sid where db_ip is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td width="74%" align="center" bgcolor="#FCFCFC" class="en">
	  <select name="DB_IP" onChange="change(document.form1.DB_IP.options[document.form1.DB_IP.selectedIndex].value)">
	  <option value="<%=rs.getString("DB_IP")%>"><%=rs.getString("DB_IP")%></option>
	  <%while(rs_temp.next()){%>
	  	<%if(rs.getString("DB_IP").equals(rs_temp.getString("db_ip"))){%>
			
		<%}else{%>
	  		<option value="<%=rs_temp.getString("db_ip")%>"><%=rs_temp.getString("db_ip")%></option>
		<%}%>
	  <%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="DB_SID">
	  	<option value="<%=rs.getString("DB_SID")%>"><%=rs.getString("DB_SID")%></option>
   	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td width="26%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>数据库用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input type="text" name="DB_USER" value="<%=rs.getString("DB_USER")%>" class="text">&nbsp;</font></td>
	</tr>
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>安装用户名</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="OS_DB_USER" value="<%//=rs.getString("OS_DB_USER")%>" class="text">&nbsp;</font></td>
	</tr>-->
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>用户密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="OS_DB_PASSWD" value="<%//=rs.getString("OS_DB_PASSWD")%>" class="text">&nbsp;</font></td>
	</tr>-->
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库用户密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_USER_PASSWD" value="<%=rs.getString("DB_USER_PASSWD")%>" class="text">&nbsp;</font></td>
	</tr>
	  <%
	  sql_temp = "select distinct db_type from a_property where db_type is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库用户类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="DB_USER_TYPE">
	  	<option value="<%=rs.getString("DB_USER_TYPE")%>"><%=rs.getString("DB_USER_TYPE")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs_temp.getString("DB_TYPE").equals(rs.getString("DB_USER_TYPE"))){%>
			
			<%}else{%>
				<option value="<%=rs_temp.getString("DB_TYPE")%>"><%=rs_temp.getString("DB_TYPE")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_ENV" value="<%=rs.getString("PROJ_ENV")%>" class="text" disabled="disabled">&nbsp;</font></td>
	  <input type="hidden" name="PROJ_ENV" value="<%=rs.getString("PROJ_ENV")%>">
	</tr>
	  <%
	  sql_temp = "select distinct proj_grp from a_env_name where proj_grp is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>环境项目属组</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="PROJECT_GROUP">
	  	<option value="<%=rs.getString("PROJECT_GROUP")%>"><%=rs.getString("PROJECT_GROUP")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs_temp.getString("PROJ_GRP").equals(rs.getString("PROJECT_GROUP"))){%>
			
			<%}else{%>
				<option value="<%=rs_temp.getString("PROJ_GRP")%>"><%=rs_temp.getString("PROJ_GRP")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库环境申请人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROPOSER" value="<%=rs.getString("PROPOSER")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库环境创建人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CREATER" value="<%=rs.getString("CREATER")%>" class="text" disabled="disabled">&nbsp;</font></td>
	  <input type="hidden" name="CREATER" value="<%=rs.getString("CREATER")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库环境创建日期</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CREATE_DATE" value="<%=rs.getDate("CREATE_DATE")%>" class="text" onFocus="show_cele_date(CREATE_DATE,'','',CREATE_DATE)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库负责人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_MANAGER" value="<%=rs.getString("DB_MANAGER")%>" class="text">&nbsp;</font></td>
	</tr>
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_VERSION" value="<%//=rs.getString("DB_VERSION")%>" class="text">&nbsp;</font></td>
	</tr>-->
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库字符集</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_CHARACTER" value="<%//=rs.getString("DB_CHARACTER")%>" class="text">&nbsp;</font></td>
	</tr>-->
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库端口号</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_PORT_NUM" value="<%//=rs.getString("DB_PORT_NUM")%>" class="text">&nbsp;</font></td>
	</tr>-->
	<!--<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库监听器</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_LISTENER" value="<%//=rs.getString("DB_LISTENER")%>" class="text">&nbsp;</font></td>
	</tr>-->
	  <%
	  sql_temp = "select distinct proj_status from a_property where proj_status is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="DB_STATUS">
	  	<option value="<%=rs.getString("DB_STATUS")%>"><%=rs.getString("DB_STATUS")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs_temp.getString("proj_status").equals(rs.getString("DB_STATUS"))){%>
			
			<%}else{%>
			<option value="<%=rs_temp.getString("proj_status")%>"><%=rs_temp.getString("proj_status")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="26%"><font color="#3333cc"><strong>项目代码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_CODE" value="<%=rs.getInt("PROJ_CODE")%>" class="text" disabled="disabled">&nbsp;</font></td>
	  <input type="hidden" name="PROJ_CODE" value="<%=rs.getString("PROJ_CODE")%>">
	</tr>
</table>
<input type="hidden" name="DB_ID" value="<%=request.getParameter("id")%>">
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="but">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="but">&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="but" onClick="return_back()"></div>
<%}%>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
<%rs_temp.close();%>
</html>
