<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.net.*" %>
<html>
<head>
<title>Ӧ�û�����Ϣ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="interface/js/common.js"></script>
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;

String sql1=new String();
ResultSet rs1;

String sql2=new String();
ResultSet rs2;
ResultSet rs3;

Socket s=null;


sql1="select * from a_env_name order by proj_grp,proj_name";
rs1=db.execSQL(sql1);
%>

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
	document.form1.proj_name.options[0] = new Option('��ѡ��','');
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
		alert("����������һ���ѯ������");
		return;
	}
	form1.submit();
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
			proj_code_sql=" and  proj_code= " + proj_name.trim() + "  ";
	}


if("y".equals(request.getParameter("flag"))){
	if(request.getParameter("txt_env_state")==null||"%".equals(request.getParameter("txt_env_state"))){
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
		sql="select * from a_proj_env_svr where lower(env_state) like '%' "+proj_code_sql+" order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'  "+proj_code_sql+" order by proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%'  "+proj_code_sql+" order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'    "+proj_code_sql+"  order by proj_env,env_ip";
			}
		}
	}else{
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where   upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' "+proj_code_sql+"  order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'   "+proj_code_sql+" order by proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  "+proj_code_sql+"  order by proj_env,env_ip";
			}
		}
	}
}else{
	sql="select * from a_proj_env_svr where  lower(env_state)= 'running' and  rownum<11  "+proj_code_sql+"  order by proj_env,env_ip";
}
System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Ӧ�û�����Ϣ��ѯ</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td align="center" class="en">
		<select name="env_ip" class="en">
			<option value="����IP">����IP</option>
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
				<option value="mac_ip">����IP</option>
				<option value="proj_env">��Ŀ������</option>
				<option value="proj_grp">��Ŀ��������</option>
				<option value="env_state">��������״̬</option>
                <option value="app_name">�м������</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">����IP</option>
				<option value="proj_env">��Ŀ������</option>
				<option value="proj_grp">��Ŀ��������</option>
				<option value="env_state">��������״̬</option>
                <option value="app_name">�м������</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">��Ŀ������</option>
				<option value="mac_ip">����IP</option>
				<option value="proj_grp">��Ŀ��������</option>
				<option value="env_state">��������״̬</option>
                <option value="app_name">�м������</option>
				<%}%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">��Ŀ��������</option>
				<option value="mac_ip">����IP</option>
				<option value="proj_env">��Ŀ������</option>
				<option value="env_state">��������״̬</option>
                <option value="app_name">�м������</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">��������״̬</option>
				<option value="mac_ip">����IP</option>
				<option value="proj_env">��Ŀ������</option>
				<option value="proj_grp">��Ŀ��������</option>
                <option value="app_name">�м������</option>
				<%}%>
				<%if("app_name".equals(request.getParameter("col_name"))){%>
                <option value="app_name">�м������</option>
				<option value="env_state">��������״̬</option>
				<option value="mac_ip">����IP</option>
				<option value="proj_env">��Ŀ������</option>
				<option value="proj_grp">��Ŀ��������</option>
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
			<option value="��������״̬">״̬</option>
		</select>
        </td>
        <td align="center" class="en">
		<select name="txt_env_state" class="en">
        	<%if("%".equals(request.getParameter("txt_env_state"))||request.getParameter("txt_env_state")==null){%>
	    <option value="%" selected="selected">all</option>
            <option value="running">running</option>
            <option value="stopped">stopped</option>
            <%}else{%>
            	<%if("running".equals(request.getParameter("txt_env_state"))){%>
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
  	 <option value="">��Ŀ����</option>
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
		<option value="">��Ŀ��</option>
		 <%
	     rs3 = db.execSQL(sql1);
         while(rs3.next()){
		   if(rs3.getString("proj_code").equals(request.getParameter("proj_name"))){%>
			<option value="<%=rs3.getString("proj_code")%>"   selected="selected" ><%=rs3.getString("proj_name")%></option>
			<%}%>
		<%}%>
		</SELECT> 
	</td>
	
	<td align="center" class="en"><input type="button" name="button1" value="��ѯ" class="en" onClick="check()"></td>
  </tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>����IP</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>����IP</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>������</strong></font></td>
	  <td align="center" class="en" width="12%"><font color="#3333cc"><strong>����״̬</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>SSH</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>��ϸ</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>�޸�</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>Status</strong></font></td>
      <%if(flag==1){%>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>ɾ��</strong></font></td>
      <%}%>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<a href="javascript:" onclick="execSecureCRT('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>')"><font color="#3333cc">SSH</font></a>&nbsp;</td>
		 
	  <td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank"><font color="#3333cc">��ϸ</font></a>&nbsp;</td>
	  <%if(rs.getString("CREATER").toLowerCase().equals(session.getAttribute("username").toString().toLowerCase())){%>
	  	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">�޸�</font></a>&nbsp;</td>
	  <%}else{%>
      	<%if(flag==1){%>
	  		<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">�޸�</font></a>&nbsp;</td>
	  		<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;
        <%}else{%>
        	<td width="1%" align="center" bgcolor="#FCFCFC" class="en">&nbsp;</td>
        <%}%>
	  <%}%>
      <%if(flag==1){%>
      	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="#" onClick="del(<%=rs.getInt("ENV_ID")%>)"><font color="#3333cc">ɾ��</font></a>&nbsp;</td>
      <%}%>
	  
<td align=center>
	<%
           try{
               s=new Socket(InetAddress.getByName(rs.getString("ENV_IP")),22);
               out.println("<font color=green>Open</font>");
           }
           catch(IOException e){
                out.println("<font color=red>Close<font>");
           }finally{
   //             try{s.close();}catch(Exception e){}
           }
	%>
	</td>

    </tr>
	<%}%>
</table>

<%db.close();%>
<%rs.close();%>
<%s.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function del(id){
	var a = confirm("ȷ��Ҫɾ����");
	if(a==true){
		window.location = "env_info_delete.jsp?id=" + id;
	}
}

function execSecureCRT (env_ip,env_username,env_password ) {    
  var command;    
    var shell = new ActiveXObject("WScript.Shell");     
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");//��ע����������װ·��    
    command = command + "SecureCRT.exe";    
  window.oldOnError = window.onerror;    
  window._command = command;    
  window.onerror = function (err) {    
    if (err.indexOf('utomation') != -1) {    
      alert('����' + window._command + ' �Ѿ����û���ֹ��');     
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
