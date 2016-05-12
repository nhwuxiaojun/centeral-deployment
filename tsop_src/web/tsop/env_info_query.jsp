<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page  import="java.net.*" %>
<html>
<head>
<title>应用环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35589746-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="interface/js/common.js"></script>
<script type="text/javascript" src="includes/common.js"></script>
</head>
<%
DBean db = new DBean();
String sql = new String();
String common_sql= new String();
ResultSet rs;
String sql_tmp = new String();
ResultSet rs_tmp;

String sql1=new String();
ResultSet rs1;

String sql2=new String();
ResultSet rs2;
ResultSet rs3;


sql1="select * from a_env_name order by proj_grp,proj_name";
rs1=db.execSQL(sql1);
%>
<script language="JavaScript" for="window" event="onload">
        document.getElementById("form1").txt_env_ip.select();
</script>

<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>

<script type="text/javascript"> 

  var subcat = [];
   subcat.length=0;
   <% 
        int count = 0; 
        while(rs1.next()){ 
    %> 
        subcat[<%=count%>] = ["<%=rs1.getString("proj_grp").trim()%>","<%=rs1.getString("proj_name").trim()%>","<%=rs1.getString("proj_code").trim()%>"];
    <% 
        count++; 
        } 
       rs1.close(); 
    %> 



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
	
function check(){
	if(form1.txt_env_ip.value==""&&form1.col_value.value==""&&form1.proj_name.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
	 
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

	 
</script> 


<body><%@include file="includes/head.html" %>
<%


int flag = 0;
sql = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
rs = db.execSQL(sql);
while(rs.next()){
	if("2".equals(rs.getString("valid"))){
		flag = 1;
	}else{
		flag = 0;
	}
}

//query by procode
   String proj_code_sql="";
   String proj_name=(String)request.getParameter("proj_name");
   if (proj_name != null&& !"".equals(proj_name)) {
			proj_code_sql=" and  a.proj_code= " + proj_name.trim() + "  ";
	}

common_sql="select * from a_proj_env_svr a, a_db_svr b where a.proj_env=b.proj_env(+) and b.db_user_type='owner' and ";

if("y".equals(request.getParameter("flag"))){
	if(request.getParameter("txt_env_state")==null||"%".equals(request.getParameter("txt_env_state"))){
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql=common_sql+" lower(env_state) like '%' "+proj_code_sql+" order by a.proj_env,a.env_ip";
			}else{
				sql=common_sql+" upper(a." + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'  "+proj_code_sql+" order by a.proj_env,a.env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql=common_sql+" upper(a.env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%'  "+proj_code_sql+" order by a.proj_env,a.env_ip";
			}else{
				sql=common_sql+" upper(a.env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(a." + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'    "+proj_code_sql+"  order by a.proj_env,a.env_ip";
			}
		}
	}else{
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql=common_sql+" upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by a.proj_env,a.env_ip";
			}else{
				sql=common_sql+" upper(a." + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'   "+proj_code_sql+" order by a.proj_env,a.env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql=common_sql+" upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by a.proj_env,a.env_ip";
			}else{
				sql=common_sql+" upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(a." + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by a.proj_env,a.env_ip";
			}
		}
	}
}else{
	//sql="select * from a_proj_env_svr where  lower(env_state)= 'running' and  rownum<11  "+proj_code_sql+"  order by proj_env,env_ip";
	sql=common_sql+" lower(env_state)= 'running' and  rownum<11    order by a.proj_env,a.env_ip";
}
System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong>
  <span class="s105">应用环境信息查询</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td align="center" class="en">
		<select name="env_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="left" class="en">
		<%if("".equals(request.getParameter("txt_env_ip"))||request.getParameter("txt_env_ip")==null){%>
			<input type="text" name="txt_env_ip" value="" class="en" size="8">
		<%}else{%>
			<input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="en" size="8">
		<%}%>
		</td>
		<td align="center" class="en">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("app_name".equals(request.getParameter("col_name"))){%>
                <option value="app_name">中间件类型</option>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="left" class="en">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="8">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="8">
		<%}%>
		</td>
		<td align="center" class="en">
		<select name="env_state" class="en">
			<option value="环境运行状态">状态</option>
		</select>
        </td>
        <td align="center" class="en">
		<select name="txt_env_state" class="en">
        	<%if("%".equals(request.getParameter("txt_env_state"))){%>
	    <option value="%" selected="selected">all</option>
            <option value="running">running</option>
            <option value="stopped">stopped</option>
            <%}else{%>
            	<%if("running".equals(request.getParameter("txt_env_state"))||request.getParameter("txt_env_state")==null){%>
            	<option value="running" selected="selected">running</option>
            	<option value="stopped">stopped</option>
                <option value="%">all</option>
                <%}%>
            	<%if("stopped".equals(request.getParameter("txt_env_state"))){%>
            	<option value="stopped" selected="selected">stopped</option>
            	<option value="running">running</option>
                <option value="%">all</option>
                <%}%>
            <%}%>
		</select>        
        </td>

     <td  align="center" class="en">&nbsp;</td>
	 <%
	 sql2="select distinct proj_grp from a_env_name";
	 rs2=db.execSQL(sql2);
	 %>
     <td class="en" align="center">
    <SELECT name="proj_grp" onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	 <option value="">项目属组</option>
	  <%if(null!=request.getParameter("proj_grp")){%>
           <option value="<%=request.getParameter("proj_grp")%>" selected="selected"><%=request.getParameter("proj_grp")%></option>
       <%}
	   
	   while(rs2.next()){%>
	<option value="<%=rs2.getString("proj_grp")%>"><%=rs2.getString("proj_grp")%></option>
	<%}%>
	</select>
	</td>
	 <td  align="center" class="en">&nbsp;</td>
	 <td align="center" class="en">
		<select name="proj_name" class="select7">
		<option value="">项目名</option>
		 <%
	     rs3 = db.execSQL(sql1);
         while(rs3.next()){
		   if(rs3.getString("proj_code").equals(request.getParameter("proj_name"))){%>
			<option value="<%=rs3.getString("proj_code")%>"   selected="selected" ><%=rs3.getString("proj_name")%></option>
			<%}%>
		<%}%>
		</SELECT> 
	</td>
	
	<td align="center" class="en"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
  </tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>环境名&详细信息</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>APP</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong><b>DB</b> </strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>URL</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>DB</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>Console</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>修改</strong></font></td>
      <%if(flag==1){%>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>
      <%}%>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><a href="env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%></a>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc"><a href="javascript:" onClick="execPutty('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>')">
      <% 
	  	/* Socket s=null;
           try{
				//System.out.print("Trying SSH to "+rs.getString("ENV_IP")+"...");
               s=new Socket(InetAddress.getByName(rs.getString("ENV_IP")),22);
                 out.print("<font color=green>Alive</font>");
				 //System.out.println(" Alive!\n");
           }
           catch(IOException e){	
                 out.print("<font color=#005566>Down</font>");
				System.out.println("Host "+rs.getString("ENV_IP")+" unreachable.\n");
           }finally{
                try{s.close();}catch(Exception e){}
           } */
		   
	  %>SSH
      </a></td>
          <td align="center" class="en"><a href="javascript:" onClick="execPutty('<%=rs.getString("DB_IP")%>','<%=session.getAttribute("username")%>','x')"><font color="#0000ff">SSH</font></td>
	  <td align="center" class="en"><font color="#3333cc"><a href=<%=rs.getString("PROJ_DNS")%> target=_blank>
<% if (rs.getString("PROJ_DNS")==null||"null".equals(rs.getString("PROJ_DNS"))) {out.println("<font color=#ddddee>Null</font>");} else { out.print("<font color=#3333cc>Open</font>"); } %> 
	</a></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<a href="javascript:" onClick="execPLSQL('<%=rs.getString("DB_INFO")%>','<%=rs.getString("DB_USR")%>','<%=rs.getString("DB_PWD")%>')"><font color="#3333cc">Open</font></a>&nbsp;</td>
	  <td align="center" class="en"><font color="#3333cc"><a href=<%=rs.getString("APP_CONSOLE")%> target=_blank>
<% if (rs.getString("APP_CONSOLE")==null||"null".equals(rs.getString("APP_CONSOLE"))) {out.println("<font color=#ddddee>Null</font>");} else { out.print("<font color=#3333cc>Open</font>"); } %>
</a></td>
	<%
	sql_tmp="SELECT a.env_name, c.account A1, d.account A2 from ts_env a,  ts_proj b, ts_member c, ts_member d where a.proj_id = b.proj_id(+) and b.owner1=c.no(+) and b.owner2=d.no(+) and a.env_name='"+rs.getString("PROJ_ENV")+"'";
	rs_tmp=db.execSQL(sql_tmp);
	//System.out.println(sql_tmp);
	while (rs_tmp.next()) {
	%>
<%	// only environment owner can modify %>
	  <%
	   String loginid=new String();
	  loginid=session.getAttribute("username").toString().toLowerCase(); %>
      	<%
         //System.out.println(loginid+":"+rs_tmp.getString("ENV_NAME")+":"+rs_tmp.getString("A1")+" and "+rs_tmp.getString("A2"));
	  if(flag==1){%>
	    <td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	 <%}else{%>
	 <%if((rs_tmp.getString("A1")==null)||(rs_tmp.getString("A2")==null)||loginid.equals(rs_tmp.getString("A1").toLowerCase())||loginid.equals(rs_tmp.getString("A2").toLowerCase())){%>
	    <td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
        <%}else{%>
        	<td width="1%" align="center" bgcolor="#FCFCFC" class="en">-</td>
        <%}%>
	  <%}%>
	<%} // end of while %>
      <%if(flag==1){%>
      	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="#" onClick="del(<%=rs.getInt("ENV_ID")%>)"><font color="#3333cc">删除</font></a>&nbsp;</td>
      <%}%>
	  

    </tr>
	<%}%>
</table>

<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function del(id){
	var a = confirm("确认要删除吗？");
	if(a==true){
		window.location = "env_info_delete.jsp?id=" + id;
	}
}

function execSecureCRT (env_ip,env_username,env_password ) {    
  var command;    
    var shell = new ActiveXObject("WScript.Shell");     
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");//从注册表获得软件安装路径    
    command = command + "SecureCRT.exe";    
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
    wsh.Run("\""+command+"\""+"/PASSWORD "+env_password+" "+env_username+"@"+env_ip);
  window.onerror = window.oldOnError;    
}   

</script>
</html>
