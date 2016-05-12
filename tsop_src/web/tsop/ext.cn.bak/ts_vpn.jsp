<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs = null;

String strVPNIP=request.getParameter("vpn_ip");
String strVPNAct=request.getParameter("vpn_act");
String strProjName=request.getParameter("proj_name");
String strVPNURL=request.getParameter("vpn_url");
String strVPNUser=request.getParameter("vpn_user");
String strVPNPass=request.getParameter("vpn_pass");
//out.print(strVPNIP);
//out.print(strVPNAct);
//out.print(strProjName);
<!--
if ( "update".equals(strVPNAct) ) {
	//out.print("start update");
	String update_sql="update a_vpn_info set vpn_ip='"+strVPNIP+"',vpn_url='"+strVPNURL+"',vpn_user='"+strVPNUser+"',vpn_pass='"+strVPNPass+"' where proj_name='"+strProjName+"'";
	//String update_sql="update a_vpn_info set ip='"+strVPNIP+"',url='"+strVPNURL+"' where proj_name='"+strProjName+"'";
	db.execUpdate(update_sql);
	db.execUpdate("insert into a_vpn_info_log(proj_name,chg_action,chg_user,chg_date,vpn_url,vpn_user,vpn_pass) values('"+strProjName+"','"+strVPNAct+"','"+session.getAttribute("username")+"',sysdate,'"+strVPNURL+"','"+strVPNUser+"','"+strVPNPass+"')");
}
if ( "delete".equals(strVPNAct) ) {
	//out.print("start delete");
	String update_sql="delete from a_vpn_info where proj_name='"+strProjName+"'";
	db.execUpdate(update_sql);
	db.execUpdate("insert into a_vpn_info_log(proj_name,chg_action,chg_user,chg_date) values('"+strProjName+"','"+strVPNAct+"','"+session.getAttribute("username")+"',sysdate)");
}
if ( "insert".equals(strVPNAct) ) {
	//out.print("start insert");
	String insert_sql="insert into a_vpn_info(proj_name) values('"+strProjName+"')";
	//java.util.Date td=new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date ud = new java.util.Date();
	java.sql.Date sd = new java.sql.Date(ud.getTime());

	System.out.println("Now : " + ud);
	db.execUpdate(insert_sql);
	db.execUpdate("insert into a_vpn_info_log(proj_name,chg_action,chg_user,chg_date) values('"+strProjName+"','"+strVPNAct+"','"+session.getAttribute("username")+"',sysdate)");
}
-->
if ( "search".equals(strVPNAct) ) {
	sql = "select * from a_vpn_info where proj_name like '%"+strProjName+"%' order by proj_name";
} else {
	sql = "select * from a_vpn_info order by proj_name";
}
rs=db.execSQL(sql);

%>

<p>
<div align="center">客户环境VPN信息(a_vpn_info)</div>
<table width="680" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<tr bgcolor="#FCFCFC">
<td align="left" class="en"><font color="#FF6600">项目</font></td>
<td align="left" class="en"><font color="#FF6600">VPN IP</font></td>
<td align="left" class="en"><font color="#FF6600">VPN URL or CMD</font></td>
<td align="left" class="en"><font color="#FF6600">用户名</font></td>
<td align="left" class="en"><font color="#FF6600">密码</font></td>
<td align="left" class="en"><font color="#FF6600">&nbsp;操作&nbsp;</font></td>
<td align="left" class="en"><font color="#FF6600">&nbsp;操作&nbsp;</font></td>
</tr>
<script type="text/javascript">  
function update_vpn(proj_name,tmp_ip,tmp_url,tmp_user,tmp_pass,vpn_act){    
	//alert(tmp_ip);
	if (confirm('Please confirm update '+proj_name+' VPN info?')) {
		//	alert(vpn_act+' table '+proj_name+' IP:'+tmp_ip);
		var form11 = document.getElementById("vpnForm");
		form11.action="http://ts.ebaotech.com/tsop/ts_vpn.jsp";
		var act11 = document.getElementById("vpn_act");
		act11.value="update";
		var act12 = document.getElementById("vpn_ip");
		act12.value=tmp_ip;
		var act13 = document.getElementById("proj_name");
		act13.value=proj_name;
		var act14 = document.getElementById("vpn_url");
		act14.value=tmp_url;
		var act14 = document.getElementById("vpn_user");
		act14.value=tmp_user;
		var act14 = document.getElementById("vpn_pass");
		act14.value=tmp_pass;
		form11.method="post";
		form11.submit();
	}
}  

function delete_vpn(proj_name,vpn_act){
	if (confirm('Please confirm delete '+proj_name+' VPN info?')) {
		var form11 = document.getElementById("vpnForm");
		form11.action="http://ts.ebaotech.com/tsop/ts_vpn.jsp";
		var act11 = document.getElementById("vpn_act");
		act11.value="delete";
		var act13 = document.getElementById("proj_name");
		act13.value=proj_name;
		//   form11.target="_blank";
		form11.method="post";
		form11.submit();
	}
}  

function search_vpn(proj_name,vpn_act){
//	if (proj_name == null || proj_name == '') {
//		alert("Please input project name!");
//		document.getElementById("edit_proj_name").focus();
//	} else {
		var form11 = document.getElementById("vpnForm");
		form11.action="http://ts.ebaotech.com/tsop/ts_vpn.jsp";
		var act13 = document.getElementById("proj_name");
		act13.value=proj_name.toUpperCase();
		var act11 = document.getElementById("vpn_act");
		act11.value="search";
		form11.method="post";
		form11.submit();
//	}	// end of search_vpn
}

function add_vpn(proj_name,vpn_act,tmp_ip){
	if (proj_name == null || proj_name == '') {
		alert("Please input project name!");
		document.getElementById("edit_proj_name").focus();
	} else {
		var form11 = document.getElementById("vpnForm");
		form11.action="http://ts.ebaotech.com/tsop/ts_vpn.jsp";
		var act13 = document.getElementById("proj_name");
		act13.value=proj_name.toUpperCase();
		var act11 = document.getElementById("vpn_act");
		act11.value="insert";
		form11.method="post";
		form11.submit();
	}
}

</script>  
<br>
&nbsp;项目名称:&nbsp;<input name="edit_proj_name" size=20>
&nbsp;<button style="height: 20px; width: 40px" onclick=add_vpn(edit_proj_name.value,'insert','192.168.1.1')>新增</button>
&nbsp;<button style="height: 20px; width: 40px" onclick=search_vpn(edit_proj_name.value,'search')>搜索</button>
<%while(rs.next()){%>
	<form name="vpnForm" method="post" action="vpn.jsp">
		<input name="vpn_act" type=hidden>
		<tr bgcolor="#FCFCFC">
		<input name="proj_name" type=hidden value=<%=rs.getString("PROJ_NAME")%>>
		<td class="en"><font color="#FF6600"><%=rs.getString("PROJ_NAME")%></font></td>
		<td class="en"><input name="vpn_ip" size="13" value="<%=(rs.getString("VPN_IP")==null?"":rs.getString("VPN_IP"))%>"></font></td>
		<td class="en"><input name="vpn_url" size="40" value="<%=(rs.getString("VPN_URL")==null?"":rs.getString("VPN_URL"))%>"></font>
		<a href=<%=(rs.getString("VPN_URL")==null?"":rs.getString("VPN_URL"))%> target=_blank><b>Go</b></a>
		</td>
		<td class="en"><input name="vpn_user" size="10" value=<%=(rs.getString("VPN_USER")==null?"":rs.getString("VPN_USER"))%>></font></td>
		<td class="en"><input name="vpn_pass" size="12" value=<%=(rs.getString("VPN_PASS")==null?"":rs.getString("VPN_PASS"))%>></font></td>
		<td class="en"><button style="height: 22px; width: 40px" onclick=update_vpn('<%=rs.getString("PROJ_NAME")%>',vpn_ip.value,vpn_url.value,vpn_user.value,vpn_pass.value,'update')>更新</button></font></td>
		<td class="en"><button style="height: 22px; width: 40px" onclick=delete_vpn('<%=rs.getString("PROJ_NAME")%>','delete')>删除</button></font></td>
		</tr>
		</form>
		<%}%>
		</table>
		<%db.close();%>
		<%rs.close();%>
		<jsp:include page="includes/copyright.jsp" /></body>
		</html>
