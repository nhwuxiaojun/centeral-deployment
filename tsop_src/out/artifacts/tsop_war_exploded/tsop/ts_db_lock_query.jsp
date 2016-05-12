<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ebao.ts.*"	 %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.cfg.*" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>


<html>
<head>
<title>Database Lock Query</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">  
function kill_session(tmp_no,tmp_sid,tmp_serial){    
//	alert(tmp_no);
//	alert("ssss");
	var action_url="<%out.print(request.getRequestURI()+"?"+request.getQueryString()+"&act=kill&sid=");%>"+tmp_sid+"&serial="+tmp_serial;
	if (confirm('Please confirm kill db session '+tmp_sid+','+tmp_serial+' ?')) {
		if (tmp_no >=1) {
			//alert(action_url);
			var subForms=document.getElementsByName("subForm");
			subForm[tmp_no-1].action=action_url;
			subForm[tmp_no-1].submit();
                        //alert(subForms.length);
		} else {
			//alert(action_url);
	                var subForms=document.getElementsByName("subForm");
        	        subForm.action=action_url;
               	 	subForm.submit();
		}
	}
}  

function delete_print(tmp_no,tmp_id,tmp_ip){
	if (confirm('Please confirm delete '+tmp_ip+' print info?')) {
		var subForms=document.getElementsByName("subForm");
		subForm[tmp_no-1].action="ts_print_query.jsp?print_act=delete";
		subForm[tmp_no-1].submit();
	}
}  


function add_print(tmp_ip,tmp_act){
	if (tmp_ip == null || tmp_ip == '' || tmp_ip.length < 7 || tmp_ip.indexOf('.')<0 ) {
		alert("Please input correct IP address!");
		document.getElementById("edit_print_ip").focus();
	} else {
	    addsearchForm.action="ts_print_query.jsp?print_ip="+tmp_ip+"&print_act="+tmp_act;
		addsearchForm.submit();	
	}
}

function search_print(tmp_ip,tmp_act){
        if (tmp_ip == null || tmp_ip == '') {
                alert("Please input correct IP address!");
                document.getElementById("edit_print_ip").focus();
        } else {
            addsearchForm.action="ts_print_query.jsp?print_ip="+tmp_ip+"&print_act="+tmp_act;
                addsearchForm.submit();
        }
}

</script>  
<body>
<center>
<table width="680" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<tr bgcolor="#aaaaaa">
<td align="left" class="en"><font color="#0000EE"><b>No</b></font></td>
<td align="left" class="en"><font color="#0000EE"><b>DB ACCOUNT</font></td>
<td align="left" class="en"><font color="#0000EE"><b>OS USER</font></td>
<td align="left" class="en"><font color="#0000EE"><b>SID</font></td>
<td align="left" class="en"><font color="#0000EE"><b>SERIAL#</font></td>
<td align="left" class="en"><font color="#0000EE"><b>TYPE</font></td>
<td align="left" class="en"><font color="#0000EE"><b>LMODE</font></td>
<td align="left" class="en"><font color="#0000EE"><b>REQUEST</font></td>
<td align="left" class="en"><font color="#0000EE"><b>Kill Session</font></td>
</tr>
<%
Socket s=null;
DBean db = new DBean();
String sql = new String();
ResultSet rs = null;

System.out.println(request.getRequestURI()+"?"+request.getQueryString());

// Should get from table ts_db
String str_db_sid=request.getParameter("db_sid");
String str_db_ip=request.getParameter("db_ip");
String str_db_port=request.getParameter("db_port");
String str_sid=request.getParameter("sid");

String str_act=request.getParameter("act");
String str_serial=request.getParameter("serial");
String searchsql="";
int i=1;
System.out.println("DB Info:"+str_db_sid+"="+str_db_ip+"="+str_db_port+"="+str_act);

String  url = "jdbc:oracle:thin:@" + str_db_ip + ":" + str_db_port + ":" + str_db_sid;

try{
        DBADBean dbadb = new DBADBean(url,"dbadmin","dbadmin");
        Connection conn = dbadb.getConnection();
	Statement stmt = conn.createStatement();
	if ("kill".equals(str_act)) {
		String kill_session_sql="alter system kill session '"+str_sid+","+str_serial+"'";
		System.out.println(session.getAttribute("username")+": "+kill_session_sql);
		ResultSet rs2=stmt.executeQuery(kill_session_sql);
		response.sendRedirect(request.getRequestURI()+"?db_sid="+str_db_sid+"&db_ip="+str_db_ip+"&db_port="+str_db_port);
	}
        String lock_query_sql="SELECT  /*+rule*/ SN.Username, sn.OSUSER, sn.USERNAME, M.Sid,sn.serial#, M.Type, DECODE(M.Lmode, 0, 'None', 1, 'Null', 2, 'Row Share', 3,  'Row Excl.', 4, 'Share', 5, 'S/Row Excl.', 6, 'Exclusive', LTRIM(TO_CHAR(Lmode,'990'))) Lmode,          DECODE(M.Request, 0, 'None', 1, 'Null', 2, 'Row Share', 3,  'Row Excl.', 4, 'Share', 5, 'S/Row Excl.', 6, 'Exclusive',          LTRIM(TO_CHAR(M.Request, '990'))) Request, M.Id1, M.Id2       FROM V$SESSION SN, V$LOCK M WHERE (SN.Sid = M.Sid and M.Request ! = 0)          or (SN.Sid = M.Sid and M.Request = 0 and Lmode != 4 and (id1, id2) in (select S.Id1, S.Id2 from V$LOCK S       where Request != 0 and S.Id1               = M.Id1 and S.Id2 = M.Id2) ) order by Id1, Id2, M.Request";
	ResultSet rs1=stmt.executeQuery(lock_query_sql);
	//System.out.println(lock_query_sql);
	while (rs1.next()) {
%>
        <form name="subForm" method="post" action="<%=request.getRequestURI()%>?<%=request.getQueryString()%>">
<%
		System.out.println(rs1.getString("OSUSER")+"="+rs1.getString("USERNAME"));
		if ("Exclusive".equals(rs1.getString("LMODE"))) {
			out.println("<tr bgcolor=#ffff00>");
		} else { out.println("<tr>"); }
		out.println("<td>"+i+"</td>");
		out.println("<td>"+rs1.getString("USERNAME")+"</td>");
		out.println("<td>"+rs1.getString("OSUSER")+"</td>");
		out.println("<td>"+rs1.getString("SID")+"</td>");
		out.println("<td>"+rs1.getString("SERIAL#")+"</td>");
		out.println("<td>"+rs1.getString("TYPE")+"</td>");
		out.println("<td>"+rs1.getString("LMODE")+"</td>");
		out.println("<td>"+rs1.getString("REQUEST")+"</td>");
		out.println("<td><button onclick=javascript:kill_session("+i+","+rs1.getString("SID")+","+rs1.getString("SERIAL#")+")> Kill Me </button></td>");
		out.println("</tr>");
		i++;
%>
	</form>
<%
	}
        conn.close();
        dbadb.close();
}catch (Exception e) {
        e.printStackTrace();
}
%>

<BR>
<BR>
<div align="center"><span class="s105"><h2>DB Lock Query: <%=str_db_sid%> on <%=str_db_ip%>:<%=str_db_port%></h2></span></div> 
<HR>
		</table>
</center>
<BR>
<%
	if (i==1) { out.println("<div align=center>Congratulations! No lock was found! </div>"); }
%>
<BR>
<center><input type="button" onClick="window.close();" value="Close"> <input type="button" name="button2" value="Back" onClick="history.go(-1);window.location.reload()"></center>
		<%//db.close();%>
		<%//rs.close();%>
		<jsp:include page="includes/copyright.jsp" /></body>
		</html>
