<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<%@ page  import="java.net.*" %>
<html>
<head>
<title>TS环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="interface/js/common.js"></script>
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql1= new String();
String sql2= new String();
String sql3= new String();
int i=0;
int sum=0;
float sum1=0;
float sum2=0;
String array1[][];
array1=new String[50][2];
ResultSet rs;
ResultSet rs1;
ResultSet rs2;
ResultSet rs3;
%>
<script language="JavaScript">
var subcat = [];
subcat.length=0;
<% 
sql1="select * from ts_proj where valid=1 order by proj_grp,proj_name";
System.out.println(sql1);
rs1=db.execSQL(sql1);
int count = 0; 
while(rs1.next()){ 
	%> 
		subcat[<%=count%>] = ["<%=rs1.getString("proj_grp")%>","<%=rs1.getString("proj_name")%>","<%=rs1.getString("proj_id")%>"];
	<% 
		count++; 
} 
rs1.close(); 
	%> 
	
function execPLSQL (db_info,db_username,db_password ) {
  var arr=db_info.split(":");
  var db_sid=arr[2];
  var command;
    var shell = new ActiveXObject("WScript.Shell");
 // command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Allround Automations\\PL/SQL Developer\\InstallPath");//从注册表获得软件安装路径    
   command = "C:\\Program Files\\PLSQL Developer\\";//从注册表获得软件安装路径

  // alert(command);
    command = command + "plsqldev.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('命令' + window._command + ' 已经被用户禁止！');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_sid);
  window.onerror = window.oldOnError;
}


function execSecureCRT (env_ip,env_username,env_password ) {
  var command;
  	if(window.ActiveXObject){ 
    	var shell = new ActiveXObject("WScript.Shell");
	} else  if(window.XMLHTTPRequest){
    	var shell = new XMLHTTPRequest("WScript.Shell");	
	}
	try {
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");
    command = command + "SecureCRT.exe";
	} catch(err) {
		alert('SecureCRT was not installed!');
	}
	
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
		alert('sss' + window._command + ' ssss'); 
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+"/PASSWORD "+env_password+" "+env_username+"@"+env_ip);
  window.onerror = window.oldOnError;
}

function change_proj(pname) 
{
	var form11 = document.getElementById("form1");
	var act1=document.getElementById("flag");
	act1.value="y";
	//form11.target="_blank";
	form11.action="ts_env_query.jsp?proj_name="+pname;
	form11.method="post";
	form11.submit();	
}
function change(team_id) 
{ 
	document.form1.proj_name.length = 0; 
	document.form1.proj_name.options[0] = new Option('请选择','');
	var team_id=team_id; 
	for (i=0;i < subcat.length ; i++) 
	{         	
		if (subcat[i][0] == team_id) 
		{ 
			document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][2]); 
		}        
	} 
	// document.form1.proj_name.options[0].selected = true;  
}   

function query_proj(){
	var form11 = document.getElementById("form1");
	var act1=document.getElementById("flag");
	act1.value="y";
	//form11.target="_blank";
	//form11.action="ts_project_support_query.jsp";
	form11.method="post";
	form11.submit();
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
<body><%@include file="includes/head.html" %>
<jsp:include page="menu.jsp" />
<%

// For search
String tmpact=request.getParameter("act");
String tmpid=request.getParameter("proj_id");
String tmpproj_name=request.getParameter("proj_name");
String tmpproj_grp=request.getParameter("proj_grp");
String env_state=request.getParameter("env_state");
// For print
String tmpflag=request.getParameter("flag");
System.out.println("Flag is:"+tmpflag);

System.out.println("proj_name:"+tmpproj_name);
System.out.println("proj_grp:"+tmpproj_grp);
System.out.println("env_state:"+env_state);

int flag = 0;

//query by procode
String proj_code_sql="";
//String proj_name=(String)request.getParameter("proj_name");
//if (proj_name != null&& !"".equals(proj_name)) {
//	proj_code_sql=" and  proj_code= " + proj_name.trim() + "  ";
//}
/*
if("".equals(request.getParameter("txt_env_ip"))){
	if("".equals(request.getParameter("col_value"))){
		sql="select * from a_proj_env_svr where upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by proj_env,env_ip";
	}else{
		sql="select * from a_proj_env_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'   "+proj_code_sql+" order by proj_env,env_ip";
	}
}else{
	if("".equals(request.getParameter("col_value"))){
		sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by proj_env,env_ip";
	}else{
		sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by proj_env,env_ip";
	}
}*/
sql="select * from ts_env_app where env_state='running' and proj_id like '"+tmpproj_name+"' and rownum<20 order by ENV_NAME";
System.out.println(sql);
rs = db.execSQL(sql);
%>

<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
<tr><td>&nbsp;</td></tr>
<form name="form1" action="ts_env_query.jsp" method="post" class="en">
<input name="flag" value="y" type=hidden>
<tr>
<td align="left" class="en" width="20%">
&nbsp;<font color="#3333cc" class="MenuBarItemSubmenu">环境信息查询</font> &nbsp;&nbsp;

<SELECT name="proj_grp" onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	 <option 
     <%
	if ("".equals(request.getParameter("proj_grp"))) {
		out.print("selected=selected ");
		}
	 %>
     value="%">项目属组</option>
	 <%
	 sql3="select distinct proj_grp from ts_proj where valid=1";
	 System.out.println(sql3);
	 rs3=db.execSQL(sql3);
	   while(rs3.next()){%>
	<option <%
	if (rs3.getString("proj_grp").equals(request.getParameter("proj_grp"))) {
		out.print("selected=selected ");
		}
	%>
    value="<%=rs3.getString("proj_grp")%>"><%=rs3.getString("proj_grp")%></option>
	<%}%>
	</select>
				&nbsp;
				<select name="proj_name" onChange="change_proj(document.form1.proj_name.options[document.form1.proj_name.selectedIndex].value)">
				<option 
     <%
	if ("".equals(request.getParameter("proj_name"))) {
		out.print("selected=selected ");
		}
	 %>
                value="">项目名</option>
				<%
				sql1="select * from ts_proj where valid=1 order by proj_grp,proj_name ";
				System.out.println(sql1);
				rs3 = db.execSQL(sql1);
				while(rs3.next()){
					%>
						<option 
<%
	if (rs3.getString("proj_id").equals(request.getParameter("proj_name"))) {
		out.print("selected=selected ");
		}
	%>
                        value="<%=rs3.getString("proj_id")%>"  ><%=rs3.getString("proj_name")%></option>
						<%}%>
						</SELECT> 
						&nbsp;
						<select name="col_name1" class="en">
						<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
							<option value="proj_name">项目名称</option>
								<option value="proj_grp">项目属组</option>
								<option value="proj_code">项目代码</option>
								<%}else{%>
									<option value="proj_name">项目名称</option>
										<option value="proj_grp">项目属组</option>
										<option value="proj_code">项目代码</option>
										<%}%>
										</select>
										<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
											<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
											<%}else{%>
												<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
												<%}%>
												<select name="s_name" onChange="query_proj()" onkeyup="this.blur();this.focus();">
												<%
												for (int j=0;j<i;j++) {
													out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
												}		
%>
<option value="all" selected="selected">all</option>
</select>
<input type="button" name="button1" value="查询" class="en" onClick="query_proj();">

<input type="button" name="button2" value="返回" class="en" onClick="history.go(-1);">
</td>
</tr>
</form>

<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
	<%if("0".equals(rs2.getString("valid"))){%>
		<tr><td>&nbsp;</td></tr>
			<tr>
			<td align="center">
			<form name="form3" action="ts_env_query.jsp">
			项目属组：<select name="a_proj_grp">
			<%
			sql="select distinct proj_grp from ts_proj order by proj_grp";
		rs3=db.execSQL(sql);
		while (rs3.next()) {
			out.print("<option value="+rs3.getString("PROJ_GRP")+">"+rs3.getString("PROJ_GRP")+"</option>");
		}
		
		%></select>
        项目名称：<input name="a_proj_name" size=15>
        项目代码：<input name="a_proj_id" size=10>
		OWNER1:<select name="a_owner1">
        <%
		for (int j=0;j<i;j++) {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
		}		
		%>
        </select> 
        <input type="submit" name="button2" value="新增" class="en">
        </form>
        </td>
      </tr>
<%}}%>
</table>
<input type="hidden" name="flag" value="y">
</form>
    <form name="form2">
		<input name="act" type=hidden>
		<input name="proj_id" type=hidden>
		<input name="s_owner1" type=hidden>
		<input name="s_owner2" type=hidden>
		<input name="cost1" type=hidden>
		<input name="cost2" type=hidden>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="10%"><font color="#ffffff">物理IP</font></td>
	  <td align="center" class="en" width="13%"><font color="#ffffff">环境IP</font></td>
	  <td align="center" class="en" width="13%"><font color="#ffffff">环境名&详细信息</font></td>
	  <td align="center" class="en" width="12%"><font color="#ffffff">运行状态</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">SSH</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">URL</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">DB</font></td>
	</tr>
	<%while(rs.next()){
				sum++;
		if ((sum%2)==1) {
			out.println("<tr bgcolor=#eeeeee height=20>");
		} else {
			out.println("<tr bgcolor=#ffffff height=20>");
		}
		%>
	  <td align="left" class="en">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="left" class="en">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><a href="env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank">&nbsp;<%=rs.getString("ENV_NAME")%></a>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	  <td align="center" class="en"><a href="javascript:" onClick="execSecureCRT('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>')">
      <%
	  	Socket s=null;
           try{
				//System.out.print("Trying SSH to "+rs.getString("ENV_IP")+"...");
               s=new Socket(InetAddress.getByName(rs.getString("ENV_IP")),22);
                 out.print("<font color=green>Alive </font>");
				 //System.out.println(" Alive!\n");
           }
           catch(IOException e){	
                 out.print("<font color=#005566>Down</font>");
				 System.out.println("Host "+rs.getString("ENV_IP")+" unreachable.\n");
           }finally{
                try{s.close();}catch(Exception e){}
           }
	  %>SSH
      </a></td>
	  <td align="center" class="en"><a href=<%=rs.getString("PROJ_DNS")%> target=_blank>
<% if (rs.getString("PROJ_DNS")==null||"null".equals(rs.getString("PROJ_DNS"))) {out.println("<font color=#000000>Null</font>");} else { out.print("<font color=#000000>Open</font>"); } %> 
	</a></td>
	  <td align="center" class="en">&nbsp;<a href="javascript:" onClick="execPLSQL('<%=rs.getString("DB_INFO")%>','<%=rs.getString("DB_USR")%>','<%=rs.getString("DB_PWD")%>')">
      Open
      </font></a>&nbsp;</td>



    </tr>
	<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<%rs2.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
