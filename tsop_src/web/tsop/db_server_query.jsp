<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.net.*" %>
<html>
<head>
    <title>数据库环境信息查询</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/spin.min.js"></script>
    <link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
    function check() {
        if (form1.col_value1.value == "" && form1.col_value.value == "") {
            alert("请至少输入一项查询条件！");
            return;
        }
        form1.submit();
    }
    function execPLSQL(db_sid, db_username, db_password) {
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
            wsh.Run("\"" + command + "\"" + " userid=" + db_username + "/" + db_password + "@" + db_sid);
        window.onerror = window.oldOnError;
    }
</script>
<script language="JavaScript" for="document" event="onkeypress">
    if (event.keyCode == 13) {
        check();
    }
</script>
<body>
<%@include file="includes/head.html" %>
<br>
<script language="JavaScript" for="window" event="onload">
    form1.col_value.focus();
</script>
<%
    try {
        DBean db = new DBean();
        String sql = new String();
        String sql2 = new String();
        String error_msg = new String();
        ResultSet rs;
        ResultSet rs2;
        int flag = 0;
        String str_act = request.getParameter("act");
        // export db schema
        try {
            if ("export".equals(str_act)) {
                String str_db_sid = request.getParameter("db_sid");
                String str_db_ip = request.getParameter("db_ip");
                String str_db_port = request.getParameter("db_port");
                System.out.println("export DB Info:" + str_db_sid + "=" + str_db_ip + "=" + str_db_port + "=" + str_act);
                String shell = new String();
                try {
                    shell = "/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/tsop_export.sh " + request.getParameter("env_name") + " " + request.getParameter("db_sid") + " " + request.getParameter("db_ip") + " " + request.getParameter("db_port");
                    System.out.println("Export command: " + shell);
                    Process process = Runtime.getRuntime().exec(shell);

                    InputStream stderr = process.getErrorStream();
                    InputStreamReader isr = new InputStreamReader(stderr);
                    BufferedReader br1 = new BufferedReader(isr);

                    Thread.sleep(3000);
                    response.sendRedirect("/tsop/show_export_log.jsp?env_id=" + request.getParameter("env_name") + "&env_name=" + request.getParameter("env_name") + "&filename="+request.getParameter("db_ip")+":"+request.getParameter("db_port"));

                } catch (Exception e) {
                    System.err.println(e.getMessage());
                    error_msg = e.toString();
                    response.sendRedirect(request.getRequestURI() + "?" + "info=" + error_msg);
                }
                //response.sendRedirect(request.getRequestURI() + "?db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port);
            }
        } catch (Exception e) {
            e.printStackTrace();
            error_msg = e.toString();
            response.sendRedirect(request.getRequestURI() + "?" + "info=" + error_msg);
        }

        // unclock db account
        try {
            if ("unlock".equals(str_act)) {
                String str_db_sid = request.getParameter("db_sid");
                String str_db_ip = request.getParameter("db_ip");
                String str_db_port = request.getParameter("db_port");
                System.out.println("DB Info:" + str_db_sid + "=" + str_db_ip + "=" + str_db_port + "=" + str_act);

                String url = "jdbc:oracle:thin:@" + str_db_ip + ":" + str_db_port + ":" + str_db_sid;
                DBADBean dbadb = new DBADBean(url, "dbadmin", "dbadmin");
                Connection conn = dbadb.getConnection();
                Statement stmt = conn.createStatement();
                System.out.println("unlock user:" + request.getParameter("dbuser") + " account unlock");
                String tmpsql = "alter user " + request.getParameter("dbuser") + " account unlock";
                System.out.println(session.getAttribute("username") + ": " + tmpsql);
                stmt.executeQuery(tmpsql);
                System.out.println(tmpsql);
                tmpsql = "alter user " + request.getParameter("dbuser") + "_app account unlock";
                stmt.executeQuery(tmpsql);
                System.out.println(tmpsql);
                tmpsql = "alter user " + request.getParameter("dbuser") + "_read account unlock";
                stmt.executeQuery(tmpsql);
                System.out.println(tmpsql);
                response.sendRedirect(request.getRequestURI() + "?info=Account "+request.getParameter("dbuser")+" was unlocked successfuly!&db_sid=" + str_db_sid + "&db_ip=" + str_db_ip + "&db_port=" + str_db_port);
            }
        } catch (Exception e) {
            e.printStackTrace();
            error_msg = e.toString();
            response.sendRedirect(request.getRequestURI() + "?" + "info=" + error_msg);
        }

        if ("y".equals(request.getParameter("flag"))) {
            if (request.getParameter("txt_db_status") == null || "%".equals(request.getParameter("txt_db_status"))) {
                if ("".equals(request.getParameter("col_value1"))) {
                    if ("".equals(request.getParameter("col_value"))) {

                        sql = "select * from a_db_svr lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";
                    } else {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";
                    }
                } else {
                    if ("".equals(request.getParameter("col_value").toString().trim())) {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and  lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";


                    } else {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";
                    }
                }
            } else {
                if ("".equals(request.getParameter("col_value1"))) {
                    if ("".equals(request.getParameter("col_value"))) {

                        sql = "select * from a_db_svr and lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";
                    } else {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(db_status) = '" + request.getParameter("txt_db_status").toUpperCase() + "' and lower(db_user_type) like '%" + request.getParameter("txt_db_user_type") + "%' order by db_sid,db_user";
                    }
                } else {
                    if ("".equals(request.getParameter("col_value"))) {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper(db_status) = '" + request.getParameter("txt_db_status").toUpperCase() + "' and  upper(db_user_type) like '%" + request.getParameter("txt_db_user_type").trim().toUpperCase() + "%' order by db_sid,db_user";
                    } else {

                        sql = "select * from a_db_svr where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(db_status) = '" + request.getParameter("txt_db_status").toString().trim().toUpperCase() + "' and upper(db_user_type) like '%" + request.getParameter("txt_db_user_type").toString().trim().toUpperCase() + "%' order by db_sid,db_user";
                    }
                }
            }
        } else {
            sql = "select * from a_db_svr where db_user_type='owner' and rownum<11 order by db_sid,db_user";
        }
        System.out.println(sql);
        rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong>
    <span class="s105">数据库环境信息查询</span></strong></font>
</div>
<br>
<%if ("".equals(request.getParameter("info"))) {%>

<%} else {%>
<div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%>
</font></div>
<%}%>


<form name="form1" action="" method="post" class="en">
    <table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
        <tr>
            <td align="center" class="en" width="20%">
                <select name="col_name1" class="en">
                    <%if ("".equals(request.getParameter("col_name1")) || request.getParameter("col_name1") == null) {%>
                    <option value="proj_env">项目环境名</option>
                    <option value="db_ip">数据库IP</option>
                    <%} else {%>
                    <%if ("proj_env".equals(request.getParameter("col_name1"))) {%>
                    <option value="proj_env">项目环境名</option>
                    <option value="db_ip">数据库IP</option>
                    <%} else {%>
                    <option value="db_ip">数据库IP</option>
                    <option value="proj_env">项目环境名</option>
                    <%}%>
                    <%}%>
                </select>
            </td>
            <td align="center" class="en" width="20%">
                <%if ("".equals(request.getParameter("col_value1")) || request.getParameter("col_value1") == null) {%>
                <input type="text" name="col_value1" value="" class="en" size="20">
                <%} else {%>
                <input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en"
                       size="20">
                <%}%>
            </td>


            <td align="center" class="en" width="20%">
                <select name="col_name" class="en">
                    <%if ("".equals(request.getParameter("col_name")) || request.getParameter("col_name") == null) {%>
                    <option value="db_user">数据库用户</option>
                    <option value="db_sid">数据库实例名</option>
                    <option value="db_status">数据库运行状态</option>
                    <option value="db_version">数据库版本</option>
                    <%} else {%>
                    <%if ("db_sid".equals(request.getParameter("col_name"))) {%>
                    <option value="db_sid">数据库实例名</option>
                    <option value="db_status">数据库运行状态</option>
                    <option value="db_user">数据库用户</option>
                    <option value="db_version">数据库版本</option>
                    <%}%>
                    <%if ("db_status".equals(request.getParameter("col_name"))) {%>
                    <option value="db_status">数据库运行状态</option>
                    <option value="db_sid">数据库实例名</option>
                    <option value="db_user">数据库用户</option>
                    <option value="db_version">数据库版本</option>
                    <%}%>
                    <%if ("db_user".equals(request.getParameter("col_name"))) {%>
                    <option value="db_user">数据库用户</option>
                    <option value="db_sid">数据库实例名</option>
                    <option value="db_status">数据库运行状态</option>
                    <option value="db_version">数据库版本</option>
                    <%}%>
                    <%if ("db_version".equals(request.getParameter("col_name"))) {%>
                    <option value="db_version">数据库版本</option>
                    <option value="db_user">数据库用户</option>
                    <option value="db_sid">数据库实例名</option>
                    <option value="db_status">数据库运行状态</option>
                    <%}%>
                    <%}%>
                </select>
            </td>
            <td align="center" class="en" width="20%">
                <%if ("".equals(request.getParameter("col_value")) || request.getParameter("col_value") == null) {%>
                <input type="text" name="col_value" value="" class="en" size="20">
                <%} else {%>
                <input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="20">
                <%}%>
            </td>
            <td align="center" class="en">
                <select name="txt_db_user_type" class="en">
                    <option value="owner">owner</option>
                </select>
            <td align="center" class="en">
                <select name="db_status" class="en">
                    <option value="数据库运行状态">运行状态</option>
                </select>
            </td>
            <td align="center" class="en">
                <select name="txt_db_status" class="en">
                    <%if ("%".equals(request.getParameter("txt_db_status"))) {%>
                    <option value="%">all</option>
                    <option value="running">running</option>
                    <option value="stopped">stopped</option>
                    <%} else {%>
                    <%if ("running".equals(request.getParameter("txt_db_status")) || request.getParameter("txt_db_status") == null) {%>
                    <option value="running">running</option>
                    <option value="stopped">stopped</option>
                    <option value="%">all</option>
                    <%}%>
                    <%if ("stopped".equals(request.getParameter("txt_db_status"))) {%>
                    <option value="stopped">stopped</option>
                    <option value="running">running</option>
                    <option value="%">all</option>
                    <%}%>
                    <%}%>
                </select>
            </td>

            <td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en"
                                                             onClick="check()"></td>
        </tr>
    </table>
    <input type="hidden" name="flag" value="y">
</form>


<br>
<table style="table-layout: fixed" width="99%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
       bordercolordark="#EFEFEF" align="center">
    <tr bgcolor="#D2D2D2">
        <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
        <td align="center" class="en" width="9%"><font color="#3333cc"><strong>实例名</strong></font></td>
        <td align="center" class="en" width="20%"><font color="#3333cc"><strong>环境名&详细信息</strong></font></td>
        <td align="center" class="en" width="20%"><font color="#3333cc"><strong>用户名</strong></font></td>
        <td align="center" class="en" width="9%"><font color="#3333cc"><strong>状态</strong></font></td>
        <td align="center" class="en" width="8%"><font color="#3333cc"><strong>PL/SQL</strong></font></td>
        <td align="center" class="en" width="6%"><font color="#3333cc"><strong>修改</strong></font></td>
        <td align="center" class="en" width="6%"><font color="#3333cc"><strong>锁查询</strong></font></td>
        <td align="center" class="en" width="6%"><font color="#3333cc"><strong>Unlock</strong></font></td>
        <td align="center" class="en" width="10%"><font color="#3333cc"><strong>导出(expdp)</strong></font></td>
    </tr>

    <%
        sql2 = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
        rs2 = db.execSQL(sql2);
        while (rs2.next()) {
            if ("2".equals(rs2.getString("valid"))) {
                flag = 1;
            }
        }


    %>
    <%while (rs.next()) {%>


    <tr bgcolor="#FCFCFC">
        <td align="left" class="en"><font color="#3333cc"><%=rs.getString("DB_IP")%>
        </font></td>
        <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_SID")%>&nbsp;</font></td>


        <td style="word-wrap: break-word" align="left" class="en"><font color="#3333cc"><a
                href="db_server_detail.jsp?id=<%=rs.getInt("DB_ID")%>" target="_blank"><font
                color="#3333cc"><%=rs.getString("PROJ_ENV")%>
        </a>&nbsp;</font></td>
        <td style="word-wrap: break-word" align="left" class="en"><font color="#3333cc"><%=rs.getString("DB_USER")%>
            &nbsp;</font></td>


        <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_STATUS")%>&nbsp;</font></td>

        <td align="center" class="en"><font color="#3333cc"><a href="javascript:"
                                                               onClick="execPLSQL('<%=rs.getString("DB_SID")%>','<%=rs.getString("DB_USER")%>','<%=rs.getString("DB_USER_PASSWD")%>')"><font
                color="#3333cc">PL/SQL</font></a>&nbsp;</td>


        <%if (rs.getString("CREATER").toLowerCase().equals(session.getAttribute("username")) || flag == 1) {%>


        <td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="db_server_update.jsp?id=<%=rs.getInt("DB_ID")%>"
                                                                 target="_blank"><font color="#3333cc">修改</font></a>&nbsp;
        </td>
        <%} else {%>
        <td width="6%" align="center" bgcolor="#FCFCFC" class="en">&nbsp;</td>
        <%}%>
        <td align="center" class="en"><font color="#3333cc"><a
                href='ts_db_lock_query.jsp?db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>'
                target=_blank><font color="#0000ff">查询</a></font></td>
        <td align="center">
            <a href="#" onclick="if (confirm('Confirm unlock user <%=rs.getString("DB_USER")%>?')) {  $(window.location).attr('href','<%=request.getRequestURI()+"?act=unlock&dbuser="+rs.getString("DB_USER")%>&db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>'); }"><font color="red">Unlock</font></a>
        </td>
        <td align="center"><a
            <a href="#" target="_blank" onclick="if (confirm('Confirm export user <%=rs.getString("DB_USER")%>?')) {  $(window.location).attr('href','<%=request.getRequestURI()+"?act=export&dbuser="+rs.getString("DB_USER")%>&db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&env_name=<%=rs.getString("PROJ_ENV")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>'); }"><font color="blue">export</font></a>
    </tr>
    <%}%>


</table>
<%db.close();%>
<%
        rs.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println(e.toString());
    }
%>
<jsp:include page="includes/copyright.jsp"/>
</body>
</html>
