<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page  import="java.net.*" %>
<html>
<head>
<title>数据库环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value==""&&form1.col_value.value==""){
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
<script language="JavaScript" for="window" event="onload">
        form1.col_value.focus();
</script>
<%
DBean db = new DBean();
String sql = new String();
String sql2 = new String();
ResultSet rs;
ResultSet rs2;
int flag = 0;
String common_sql = new String();
common_sql="select d.env_name,a.creater,b.db_ip,a.db_id,a.db_ldap_name,a.db_user,a.DB_USER_PASSWD,a.env_db_status,c.env_id,c.env_ip from ts_env_db a, ts_db b, ts_env_app c, ts_env d where a.db_ldap_name=b.LDAP_NAME(+) and a.db_id=c.db_id(+) and a.env_id=d.env_id(+) ";
if("y".equals(request.getParameter("flag"))){
	if(request.getParameter("txt_db_status")==null||"%".equals(request.getParameter("txt_db_status"))){
		if("".equals(request.getParameter("col_value1"))){
			if("".equals(request.getParameter("col_value"))){
			    
				sql = common_sql+"and db_ldap_name=ldap_name and lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_sid,db_user";
			}else{
			
				sql = common_sql+"and  upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_sid,db_user";
			}
		}else{
			if("".equals(request.getParameter("col_value").toString().trim())){
			
				sql = common_sql+"and  upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and  lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_sid,db_user";
				
				
			}else{
		
				sql = common_sql+"and  upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper("+request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_sid,db_user";
			}
		}
	}else{
		if("".equals(request.getParameter("col_value1"))){
			if("".equals(request.getParameter("col_value"))){
			
				sql = common_sql+"and  lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_ldap_name,db_user";
			}else{
			
				sql = common_sql+"and  upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_db_status) = '" + request.getParameter("txt_db_status").toUpperCase() + "' and lower(db_user_type) like '%"+request.getParameter("txt_db_user_type")+"%' order by db_ldap_name,db_user";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
			
				sql = common_sql+"and  upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper(env_db_status) = '" + request.getParameter("txt_db_status").toUpperCase() + "' and  upper(db_user_type) like '%"+request.getParameter("txt_db_user_type").trim().toUpperCase()+"%' order by db_ldap_name,db_user";
			}else{
			
				sql = common_sql+"and  upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper("+request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_db_status) = '" + request.getParameter("txt_db_status").toString().trim().toUpperCase() + "' and upper(db_user_type) like '%"+request.getParameter("txt_db_user_type").toString().trim().toUpperCase()+"%' order by db_ldap_name,db_user";
			}
		}
	}
}else{
	sql=common_sql+"and a.db_ldap_name=b.LDAP_NAME and a.db_id=c.db_id and a.env_id=d.env_id and rownum<13 order by d.env_name";
}
System.out.println(sql);
try {
rs = db.execSQL(sql);

%>
<div align="center"><font color="#0000EE"><strong><br>
  <span class="s105">数据库环境信息查询</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>



<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="env_name">项目环境名</option>
				<option value="db_ip">数据库IP</option>
			<%}else{%>
				<%if("env_name".equals(request.getParameter("col_name1"))){%>
					<option value="env_name">项目环境名</option>
					<option value="db_ip">数据库IP</option>
				<%}else{%>
					<option value="db_ip">数据库IP</option>
					<option value="env_name">项目环境名</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="12">
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="8">
		<%}%>
		</td>
		

		
		
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
                <option value="db_version">数据库版本</option>
			<%}else{%>
				<%if("db_sid".equals(request.getParameter("col_name"))){%>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
				<option value="db_user">数据库用户</option>
                <option value="db_version">数据库版本</option>
				<%}%>
				<%if("db_status".equals(request.getParameter("col_name"))){%>
				<option value="db_status">数据库运行状态</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_user">数据库用户</option>
                <option value="db_version">数据库版本</option>
				<%}%>
				<%if("db_user".equals(request.getParameter("col_name"))){%>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
                <option value="db_version">数据库版本</option>
				<%}%>
				<%if("db_version".equals(request.getParameter("col_name"))){%>
                <option value="db_version">数据库版本</option>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="16">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="8">
		<%}%>
		</td>
        <td align="center" class="en">
                <select name="txt_db_user_type" class="en">
                <%if("owner".equals(request.getParameter("txt_db_user_type"))||request.getParameter("txt_db_user_type")==null){%>
                        <option value="owner">owner</option>
                        <option value="oper">oper</option>
                        <option value="read">read</option>
                        <option value="app">app</option>
                        <option value="%">all</option>
            <%}else{%>
                <%if("read".equals(request.getParameter("txt_db_user_type"))){%>
                        <option value="read">read</option>
                        <option value="owner">owner</option>
                        <option value="oper">oper</option>
                        <option value="app">app</option>
                        <option value="%">all</option>
                <%}%>
                <%if("app".equals(request.getParameter("txt_db_user_type"))){%>
                        <option value="app">app</option>
                        <option value="owner">owner</option>
                        <option value="oper">oper</option>
                        <option value="read">read</option>
                        <option value="%">all</option>
                <%}%>
                <%if("oper".equals(request.getParameter("txt_db_user_type"))){%>
                        <option value="oper">oper</option>
                        <option value="app">app</option>
                        <option value="owner">owner</option>
                        <option value="read">read</option>
                        <option value="%">all</option>
                <%}%>
                <%if("%".equals(request.getParameter("txt_db_user_type"))){%>
                        <option value="%">all</option>
                        <option value="oper">oper</option>
                        <option value="app">app</option>
                        <option value="owner">owner</option>
                        <option value="read">read</option>
                <%}%>
            <%}%>
                </select>
				
		
				
		<td align="center" class="en">
		<select name="env_db_status" class="en">
			<option value="数据库运行状态">运行状态</option>
		</select>
        </td>
        <td align="center" class="en">
		<select name="txt_db_status" class="en">
        	<%if("%".equals(request.getParameter("txt_db_status"))){%>
		<option value="%">all</option>
            	<option value="running">running</option>
            	<option value="stopped">stopped</option>
            <%}else{%>
            	<%if("running".equals(request.getParameter("txt_db_status"))||request.getParameter("txt_db_status")==null){%>
            	<option value="running">running</option>
            	<option value="stopped">stopped</option>
				<option value="%">all</option>
                <%}%>
            	<%if("stopped".equals(request.getParameter("txt_db_status"))){%>
            	<option value="stopped">stopped</option>
            	<option value="running">running</option>
				<option value="%">all</option>
                <%}%>
            <%}%>
		</select>        
        </td>
		
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>


<hr>
<table style="table-layout: fixed" width="99%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <!--<td align="center" class="en" width="12%"><font color="#0000EE"><strong>数据库IP</strong></font></td>-->
	  <td align="center" class="en" width="9%"><font color="#0000EE"><strong>DB实例名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#0000EE"><strong>DB Info</strong></font></td>
	  <td align="center" class="en" width="9%"><font color="#0000EE"><strong>APP Info</strong></font></td>
	  <td align="left" class="en" width="9%"><font color="#0000EE"><strong>APP IP</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#0000EE"><strong>用户名</strong></font></td>
	  <td align="center" class="en" width="9%"><font color="#0000EE"><strong>状态</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#0000EE"><strong>PL/SQL</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#0000EE"><strong>SSH</strong></font></td>
	  <td align="center" class="en" width="6%"><font color="#0000EE"><strong>修改</strong></font></td>
	</tr>

	<%
	sql2 = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
	rs2 = db.execSQL(sql2);
	while(rs2.next()){
    	if("2".equals(rs2.getString("valid"))){
			flag = 1;
		}
	}
	

	
	%>
    <%while(rs.next()){%>  
	
	
	
	<tr bgcolor="#FCFCFC">
	  <!--<td align="left" class="en"><font color="#0000EE"><%=rs.getString("DB_IP")%></font></td>-->
	  <td align="center" class="en"><font color="#0000EE"><%=rs.getString("DB_LDAP_NAME")%>&nbsp;</font></td>
	
	  
	  <td style="word-wrap: break-word" align="left" class="en"><font color="#0000EE"><a href="new.db_server_detail.jsp?id=<%=rs.getInt("DB_ID")%>" target="_blank"><font color="#0000EE"><%=rs.getString("ENV_NAME")%></a>&nbsp;</font></td>
      

	  <td align="center" class="en" width="6%"><a href="new.env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank">View</a></font></td> 
	  <td align="left" class="en" width="6%"><%=rs.getString("ENV_IP")%></td> 
	  <td style="word-wrap: break-word" align="left" class="en"><font color="#0000EE"><%=rs.getString("DB_USER")%>&nbsp;</font></td>

	 
	  <td align="center" class="en"><font color="#0000EE"><%=rs.getString("env_db_status")%>&nbsp;</font></td>

	  <td align="center" class="en"><font color="#0000EE"><a href="javascript:" onClick="execPLSQL('<%=rs.getString("DB_LDAP_NAME")%>','<%=rs.getString("DB_USER")%>','<%=rs.getString("DB_USER_PASSWD")%>')"><font color="#0000EE">PL/SQL</font></a>&nbsp;</td>

	  <td align="center" class="en"><font color="#0000EE"><a href="javascript:" onClick="execSecureCRT('<%=rs.getString("DB_IP")%>','oracleread','readonly')">Connect</a></td>
	  <%if(rs.getString("CREATER").toLowerCase().equals(session.getAttribute("username"))||flag==1){%>
	
	
	  <td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="db_server_update.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#0000EE">修改</font></a>&nbsp;</td>
	  <%}else{%>
	  <td width="6%" align="center" bgcolor="#FCFCFC" class="en">&nbsp;</td>
	  <%}%>
	</tr>
	<%}%>
	

	
</table>
<%db.close();%>
<%rs.close();
} catch (Exception e) {
	e.printStackTrace();
}%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
