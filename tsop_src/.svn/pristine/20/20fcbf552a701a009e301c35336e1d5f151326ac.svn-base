<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
    <title>申请答复流程修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .text {
            font-size: 9pt;
            color: black;
            vertical-align: middle;
            border-bottom-width: 1pt;
            border-bottom-color: Black;
            border-top-width: 1pt;
            border-top-color: Black;
            border-left-width: 1pt;
            border-left-color: Black;
            border-right-width: 1pt;
            border-right-color: Black;
        }

        .button1 {
            height: 14pt;
            width: 30pt;
            font-size: 9pt;
            color: black;
            border-bottom-width: 1pt;
            border-bottom-color: Black;
            border-top-width: 1pt;
            border-top-color: Black;
            border-left-width: 1pt;
            border-left-color: Black;
            border-right-width: 1pt;
            border-right-color: Black;
        }

        .STYLE1 {
            color: #3333cc
        }

        -->
    </style>
</head>
<%
    DBean db = new DBean();
    String sql = new String();
    String sql_temp = new String();
    String sql_user = new String();
    String sql5 = new String();
    sql5 = "select * from ts_db";
    ResultSet rs5;
    ResultSet rs;
    ResultSet rs_temp;
    ResultSet rs_user;
    sql = "select * from a_supply where id = " + request.getParameter("id");
    rs = db.execSQL(sql);
%>
<script type="text/javascript">
    var onecount;
    onecount = 0;
    subcat = [];
    <%
    rs5 = db.execSQL(sql5);
    int count = 0;
    while(rs5.next()){
    %>
    subcat[<%=count%>] = ["<%=rs5.getString("db_ip").trim()%>", "<%=rs5.getString("db_sid").trim()%>"];
    <%
    count++;
    }
    rs5.close();
    %>
    temp = <%=count%>;
    function change(team_id) {
        document.form1.db_sid.length = 0;
        var team_id = team_id;
        var i;
        for (i = 0; i < temp; i++) {
            if (subcat[i][0] == team_id) {
                document.form1.db_sid.options[document.form1.db_sid.length] = new Option(subcat[i][1], subcat[i][1], false, false);
                //window.alert(document.form1.db_sid.length);
                //window.alert(subcat[i][1]);
            }
        }
        document.form1.db_sid.options[0].selected = true;
        //window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
    }
</script>
<script language="javascript">
    function check() {
        if (form1.env_ip.value == "") {
            alert("请输入应用使用ip！");
            return false;
        }
        form1.submit();
    }
    function return_back() {
        window.location = "project_apply_manage.jsp";
    }
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<%@include file="includes/head.html" %>
<form name="form1" action="project_apply_update_finish.jsp" method="post">
    <%while (rs.next()) {%>
    <div align="center"><font color="#3333cc"><strong><br>
        <span class="s105">申请答复流程修改</span></strong></font>
    </div>
    <br><br>
    <table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF"
           align="center">
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>新环境名称</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="new_env"
                                                                               value="<%=rs.getString("new_env")%>"
                                                                               class="text" disabled="disabled"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>搭建环境服务器</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en">
                <%
                    sql_temp = "select distinct mac_ip from a_hardware";
                    rs_temp = db.execSQL(sql_temp);
                %>
                <select name="mac_ip">
                    <option value="<%=rs.getString("mac_ip")%>"><%=rs.getString("mac_ip")%>
                    </option>
                    <%while (rs_temp.next()) {%>
                    <%if (rs.getString("mac_ip").equals(rs_temp.getString("mac_ip"))) {%>

                    <%} else {%>
                    <option value="<%=rs_temp.getString("mac_ip")%>"><%=rs_temp.getString("mac_ip")%>
                    </option>
                    <%}%>
                    <%}%>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <%
            sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
            rs_user = db.execSQL(sql_user);
            while (rs_user.next()) {
                if ("2".equals(rs_user.getString("valid"))) {

                } else {
                    response.sendRedirect("../index.jsp");
                }
            }
        %>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>应用使用ip</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="env_ip"
                                                                               value="<%=rs.getString("env_ip")%>"
                                                                               class="text"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>环境搭建人</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="env_creator"
                                                                               value="<%=rs.getString("env_creator")%>"
                                                                               class="text" disabled="disabled"></td>
        </tr>
        <tr>
            <td align="center" width="24%" bgcolor="#D2D2D2" class="en"><font
                    color="#3333cc"><strong>数据库服务器</strong></font></td>
            <td align="center" width="76%" bgcolor="#FCFCFC" class="en">
                <%
                    sql_temp = "select distinct db_ip from ts_db";
                    rs_temp = db.execSQL(sql_temp);
                %>
                <select name="db_ip"
                        onChange="change(document.form1.db_ip.options[document.form1.db_ip.selectedIndex].value)">
                    <option value="<%=rs.getString("db_ip")%>"><%=rs.getString("db_ip")%>
                    </option>
                    <%while (rs_temp.next()) {%>
                    <option value="<%=rs_temp.getString("db_ip")%>"><%=rs_temp.getString("db_ip")%>
                    </option>
                    <%}%>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" width="24%" bgcolor="#D2D2D2" class="en"><font
                    color="#3333cc"><strong>数据库SID</strong></font></td>
            <td align="center" width="76%" bgcolor="#FCFCFC" class="en">
                <select name="db_sid">
                    <option value="<%=rs.getString("db_sid")%>"><%=rs.getString("db_sid")%>
                    </option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>数据库搭建人</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="db_creator"
                                                                               value="<%=rs.getString("db_creator")%>"
                                                                               class="text" disabled="disabled"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>申请提交时间</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en"><input name="apply_name"
                                                                               value="<%=rs.getDate("apply_time")%>"
                                                                               class="text" type="text"
                                                                               disabled="disabled"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>应用提交状态</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en">
                <%
                    sql_temp = "select distinct sign_stat from a_property";
                    rs_temp = db.execSQL(sql_temp);
                %>
                <select name="env_status">
                    <option value="<%=rs.getString("env_status")%>"><%=rs.getString("env_status")%>
                    </option>
                    <%while (rs_temp.next()) {%>
                    <%if (rs.getString("env_status").equals(rs_temp.getString("sign_stat"))) {%>

                    <%} else {%>
                    <%if (rs_temp.getString("sign_stat") == null || "".equals(rs_temp.getString("sign_stat"))) {%>
                    <%} else {%>
                    <option value="<%=rs_temp.getString("sign_stat")%>"><%=rs_temp.getString("sign_stat")%>
                    </option>
                    <%}%>
                    <%}%>
                    <%}%>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#D2D2D2" class="en" width="24%"><font
                    color="#3333cc"><strong>数据库提交状态</strong></font></td>
            <td width="76%" align="center" bgcolor="#FCFCFC" class="en">
                <%
                    sql_temp = "select distinct sign_stat from a_property";
                    rs_temp = db.execSQL(sql_temp);
                %>
                <select name="db_status">
                    <option value="<%=rs.getString("db_status")%>"><%=rs.getString("db_status")%>
                    </option>
                    <%while (rs_temp.next()) {%>
                    <%if (rs.getString("db_status").equals(rs_temp.getString("sign_stat"))) {%>

                    <%} else {%>
                    <%if (rs_temp.getString("sign_stat") == null || "".equals(rs_temp.getString("sign_stat"))) {%>
                    <%} else {%>
                    <option value="<%=rs_temp.getString("sign_stat")%>"><%=rs_temp.getString("sign_stat")%>
                    </option>
                    <%}%>
                    <%}%>
                    <%}%>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
    <br>

    <div align="center"><input type="button" name="button1" value="修改" onClick="check()"
                               class="button1">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1">&nbsp;&nbsp;<input
            type="button" name="button2" value="返回" onClick="return_back()" class="button1"></div>
    <%}%>
</form>
<jsp:include page="includes/copyright.jsp"/>
</body>
<%db.close();%>
<%rs.close();%>
</html>
