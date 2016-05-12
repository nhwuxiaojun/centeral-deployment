<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ebao.ts.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>


<html>
<head>
    <title>Database Session Query</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/spin.min.js"></script>
    <link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
    function kill_single_session(tmp_sid, tmp_serial) {
//	alert(tmp_no);
//	alert("ssss");
        var action_url = "<%out.print(request.getRequestURI()+"?"+request.getQueryString()+"&act=kill&sid=");%>" + tmp_sid + "&serial=" + tmp_serial;
        if (confirm('Please confirm kill db session ' + tmp_sid + ',' + tmp_serial + ' ?')) {
            subForm1.action = action_url;
            subForm1.submit();
        }
    }
    function kill_session(tmp_no, tmp_sid, tmp_serial) {
//	alert(tmp_no);
//	alert("ssss");
        var action_url = "<%out.print(request.getRequestURI()+"?"+request.getQueryString()+"&act=kill&sid=");%>" + tmp_sid + "&serial=" + tmp_serial;
        if (confirm('Please confirm kill db session ' + tmp_sid + ',' + tmp_serial + ' ?')) {
            if (tmp_no >= 1) {
                //alert(action_url);
                var subForms = document.getElementsByName("subForm");
                subForm[tmp_no - 1].action = action_url;
                subForm[tmp_no - 1].submit();
                //alert(subForms.length);
            } else {
                //alert(action_url);
                var subForms = document.getElementsByName("subForm");
                subForm.action = action_url;
                subForm.submit();
            }
        }
    }


</script>
<body>
<center>
    <table width="680" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF"
           align="center">
        <tr bgcolor="#aaaaaa">
            <td align="left" class="en"><font color="#0000EE"><b>No</b></font></td>
            <td align="left" class="en"><font color="#0000EE"><b>Kill Session</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>DB ACCOUNT</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>TIME<br>(ms)</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>OSUSER<br>SID<br>Serial#</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>Status</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>MACHINE</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>SQL_TEXT</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>Event</font></td>
            <td align="left" class="en"><font color="#0000EE"><b>Program</font></td>
        </tr>
        <%
            Socket s = null;
            DBean db = new DBean();
            String sql = new String();
            ResultSet rs = null;

            System.out.println(request.getRequestURI() + "?" + request.getQueryString());

            String str_db_sid = request.getParameter("db_sid");
            String str_db_ip = request.getParameter("db_ip");
            String str_db_port = request.getParameter("db_port");
            String str_act = request.getParameter("act");
            String str_sid = request.getParameter("sid");
            String str_serial = request.getParameter("serial");
            String searchsql = "";
            String error_msg = "";
            String org_url = request.getRequestURI() + "?db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port;
            int i = 1;
            System.out.println("DB Info:" + str_db_sid + "=" + str_db_ip + "=" + str_db_port + "=" + str_act);

            String url = "jdbc:oracle:thin:@" + str_db_ip + ":" + str_db_port + ":" + str_db_sid;
            DBADBean dbadb = new DBADBean(url, "dbadmin", "dbadmin");
            Connection conn = dbadb.getConnection();
            Statement stmt = conn.createStatement();
            try {
                if ("kill".equals(str_act)) {
                    String kill_session_sql = "alter system kill session '" + str_sid + "," + str_serial + "'";
                    System.out.println(session.getAttribute("username") + ": " + kill_session_sql);
                    ResultSet rs2 = stmt.executeQuery(kill_session_sql);
                    response.sendRedirect(request.getRequestURI() + "?db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port);
                }
            } catch (Exception e) {
                e.printStackTrace();
                error_msg = e.toString();
                response.sendRedirect(request.getRequestURI() + "?db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port + "&msg=" + error_msg);
            }

            try {
                String topsql_query_sql = "SELECT /*+ rule */ s.status, s.machine, s.sid, s.serial#, s.username, b.sql_text,w.event, s.program, round(b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions),3) PERTIME, s.OSUSER,s.BLOCKING_SESSION FROM v$session s, v$session_wait w,v$sql b WHERE s.sid = w.sid(+) And s.SQL_HASH_VALUE=b.HASH_VALUE(+) and s.SQL_CHILD_NUMBER=b.CHILD_NUMBER(+) and (b.sql_text not like 'SELECT /*+ rule */ s.sid, s.username%' or b.sql_text is null) and s.username!='SYS' ORDER BY decode(b.ELAPSED_TIME,null,0,b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions)) desc";
                ResultSet rs1 = stmt.executeQuery(topsql_query_sql);
                //System.out.println(lock_query_sql);
                while (rs1.next()) {
        %>
        <form name="subForm" method="post" action="<%=request.getRequestURI()%>?<%=request.getQueryString()%>">
            <%
                //  System.out.println(rs1.getString("OSUSER") + "=" + rs1.getString("USERNAME"));
                if (rs1.getInt("PERTIME") > 1000) {
                    out.println("<tr bgcolor=#ffff00>");
                } else {
                    out.println("<tr>");
                }
                out.println("<td>" + i + "</td>");
                out.println("<td><button onclick=javascript:kill_session(" + i + "," + rs1.getString("SID") + "," + rs1.getString("SERIAL#") + ")>Kill</button></td>");
                out.println("<td>" + rs1.getString("USERNAME") + "</td>");
                out.println("<td>" + rs1.getString("PERTIME") + "</td>");
                out.println("<td>" + rs1.getString("OSUSER") + "<br>" + rs1.getString("SID") + "<br>" + rs1.getString("SERIAL#") + "</td>");
                out.println("<td>" + rs1.getString("STATUS") + "</td>");
                out.println("<td>" + rs1.getString("MACHINE") + "</td>");
                out.println("<td>" + rs1.getString("SQL_TEXT") + "</td>");
                out.println("<td>" + rs1.getString("EVENT") + "</td>");
                out.println("<td>" + rs1.getString("program") + "</td>");
                out.println("</tr>");
                i++;
            %>
        </form>
        <%
                }
                conn.close();
                dbadb.close();
            } catch (Exception e) {
                e.printStackTrace();
                error_msg = e.toString();
                response.sendRedirect(request.getRequestURI() + "?db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port + "&msg=" + error_msg);
            }
        %>

        <BR>

        <div align="center"><span class="s105"><h2>DB Session Query: <%=str_db_sid%> on <%=str_db_ip%>:<%=str_db_port%>
            &nbsp;
            <button onclick="window.location.reload();">Refersh</button>
            &nbsp;
            <button onclick="window.close();">Close</button>
        </h2></span></div>
        <HR width="60%">
        <div align="center">
            <form name="subForm1" method="post" action="<%=request.getRequestURI()%>?<%=request.getQueryString()%>">
                Kill Session By SID:&nbsp;
                <input name="ksid" id="ksid" value="1" size="10">&nbsp;
                Serial#:&nbsp;<input name="kserial" id="kserial" value="1" size="10">&nbsp;
                <button onclick=javascript:kill_single_session($("#ksid").val(),$("#kserial").val())>Kill</button>
                &nbsp;<font color="red"><%=request.getParameter("msg")%>
            </font>
            </form>
        </div>
        <HR width="99%">
    </table>
</center>
<BR>
<%//db.close();%>
<%//rs.close();%>
<jsp:include page="includes/copyright.jsp"/>
</body>
</html>
