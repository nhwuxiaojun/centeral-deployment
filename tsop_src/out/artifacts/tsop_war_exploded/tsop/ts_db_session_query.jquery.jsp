<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ebao.ts.*"	 %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

<title>DB Session TopSQL Query</title>
<link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css">
<link rel="stylesheet" type="text/css" href="../resources/demo.css">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
<script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
<script type="text/javascript" language="javascript" class="init">
$(document).ready(function() {
        $('#example').DataTable({
         "order": [[ 2, "desc" ]]
        });
} );
</script>
<script type="text/javascript">
function kill_sess(tmp_no,tmp_sid,tmp_serial){
    if (confirm('Please confirm kill db session '+tmp_sid+','+tmp_serial+' ?')) {
        	var action_url="<%out.print(request.getRequestURI()+"?"+request.getQueryString()+"&act=kill&sid=");%>"+tmp_sid+"&serial="+tmp_serial;
                var formid="subForm_"+tmp_sid;
		alert(formid);
		alert($("#test1").html);
		alert($("#test1").val);
		alert($("#test2").text);
		alert($("#test2").val);
	//	formid.submit();
         //       $('#'+formid).submit();
             //   document.getElementById(formid).submit();
                var tmpsubForm=document.getElementById(formid);

		tmp_subForm.action=action_url;
                //tmp_subForm.submit();
        } // end of iff
}
function kill_session(tmp_no,tmp_sid,tmp_serial){
//      alert(tmp_no);
        if (confirm('Please confirm kill db session '+tmp_sid+','+tmp_serial+' ?')) {
                var action_url="<%out.print(request.getRequestURI()+"?"+request.getQueryString()+"&act=kill&sid=");%>"+tmp_sid+"&serial="+tmp_serial;
                if (tmp_no >=1) {
                        var subForms=document.getElementsByName("subForm");
			alert(subForms.length);
                        subForm[tmp_no-1].action=action_url;
                        subForm[tmp_no-1].submit();
                } else {
                        var subForms=document.getElementsByName("subForm");
                        subForm.action=action_url;
                        subForm.submit();
                } // end of if-else
        } // end of iff
} // end of function

</script>
<style>
div.container {
        width: 99%;
    }
</style>
</head>

<body class="dt-example">
<input type="hidden" name="test1" value="1">
<%
Socket s=null;
System.out.println(request.getRequestURI()+"?"+request.getQueryString());
DBean db = new DBean();
String sql = new String();
ResultSet rs = null;

String str_db_sid=request.getParameter("db_sid");
String str_db_ip=request.getParameter("db_ip");
String str_db_port=request.getParameter("db_port");
String str_act=request.getParameter("act");
String str_sid=request.getParameter("sid");
String str_serial=request.getParameter("serial");
String searchsql="";
int i=1;
System.out.println("DB Info:"+str_db_sid+"="+str_db_ip+"="+str_db_port+"="+str_act);

String  url = "jdbc:oracle:thin:@" + str_db_ip + ":" + str_db_port + ":" + str_db_sid;
System.out.println(str_act+"----"+url);

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
        String topsql_query_sql="SELECT /*+ rule */ s.sid, s.serial#, s.username, b.sql_text,w.event, s.program, round(b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions),3) PERTIME, s.OSUSER,s.BLOCKING_SESSION FROM v$session s, v$session_wait w,v$sql b WHERE s.sid = w.sid(+) And s.SQL_HASH_VALUE=b.HASH_VALUE(+) and s.SQL_CHILD_NUMBER=b.CHILD_NUMBER(+) and (b.sql_text not like 'SELECT /*+ rule */ s.sid, s.username%' or b.sql_text is null) and s.username!='SYS' and rownum < 2 ORDER BY decode(b.ELAPSED_TIME,null,0,b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions)) desc";
	ResultSet rs1=stmt.executeQuery(topsql_query_sql);
	//System.out.println(topsql_query_sql);
%>

<br>
        <div class="container">
                        <h2>DB Session Query: <%out.print("<font color=red>"+str_db_ip + ":" + str_db_port + ":" + str_db_sid+"</font>");%>&nbsp;&nbsp;<button onClick="window.location.reload();">refersh</button>&nbsp;<button onClick="window.close();">Close</button></h2>

<br>
                        <table id="example" class="display compact" cellspacing="0" width="100%">
                                <thead>
                                        <tr>
                                                <th>Kill</th>
                                                <th>USERNAME</th>
                                                <th>Elapsed Time(s)</th>
                                                <th>OSUSER</th>
                                                <th>SID</th>
                                                <th>SQL_TEXT</th>
                                                <th>EVENT</th>
                                                <th>Client</th>
                                        </tr>
                                </thead>


                                <tbody>
        <%while(rs1.next()){%>

		  <input type="hidden" name="test2" value="2">
          <tr>
	      <td><input type="button" value="Kill" onClick="kill_sess(<%out.print(i);%>,<%=rs1.getString("SID")%>,<%=rs1.getString("SERIAL#")%>);"></td>
          <td><%=rs1.getString("USERNAME")%></td>
          <td><%if ( null!=rs1.getString("pertime")) { out.print(rs1.getInt("pertime")/1000); } else { out.print("0") ; }%></td>
          <td><%=rs1.getString("OSUSER")%></td>
          <td><%=rs1.getString("SID")%></td>
          <td><%=rs1.getString("SQL_TEXT")%></td>
          <td><%=rs1.getString("EVENT")%></td>
          <td><%=rs1.getString("program")%></td>
          </tr>

        <%i++;}%>
  </tbody>
</table>
</div>

<%
        conn.close();
        dbadb.close();
}catch (Exception e) {
        e.printStackTrace();
}
%>

<BR>
<center><input type="button" onClick="window.close();" value="Close"> <input type="button" name="button2" value="Back" onClick="history.go(-1);window.location.reload()"></center>
		<%//db.close();%>
		<%//rs.close();%>
</body>
</html>
