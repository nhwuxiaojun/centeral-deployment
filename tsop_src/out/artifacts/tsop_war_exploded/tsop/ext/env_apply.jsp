<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
    <title>Environment Application</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <script type="text/javascript" src="../scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="../scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" src="../scripts/spin.min.js"></script>
    <link href="../scripts/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="../css/ebao.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            $('#app_ver_input').autocomplete({source: ["WebLogic", "WebSphere", "Tomcat"]});
            $('#db_ver_input').autocomplete({source: ["Oracle", "Oracle", "Oracle", "MySQL", "MSSQL"]});
            $('table tr td').attr("height", "25");
            $('table tr td').removeClass("en");
            $(":text").focus(function () {
                $(this).css("background", "yellow");
            }).blur(function () {
                $(this).css("background", "#fff");
            });
            $("#target_env").css("background", "yellow");
            $('#proj_name').blur(function () {
                $('#target_env').val($('#proj_name').val());
            });
            $('#env_creator').blur(function () {
                $('#db_creator').val(self.val());
            });
            $('#src_env').change(function () {
                $(window.location).attr('href', "<%=request.getRequestURI()%>?src_env=" + $(this).val());
            });
            $('#version').blur(function () {
                $('#target_env').val($('#proj_name').val().toUpperCase() + "_" + $('#version').val().toUpperCase() + "_" + $('#type_1').val() + "_" + $('#type_2').val() + "_" + $('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/___/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/__/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/_$/, ""));
            });
            $('#type_1').blur(function () {
                $('#target_env').val($('#proj_name').val().toUpperCase() + "_" + $('#version').val().toUpperCase() + "_" + $('#type_1').val() + "_" + $('#type_2').val() + "_" + $('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/___/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/__/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/_$/, ""));
            });
            $('#type_2').blur(function () {
                $('#target_env').val($('#proj_name').val().toUpperCase() + "_" + $('#version').val().toUpperCase() + "_" + $('#type_1').val() + "_" + $('#type_2').val() + "_" + $('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/___/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/__/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/_$/, ""));
            });
            $('#type_3').blur(function () {
                $('#target_env').val($('#proj_name').val().toUpperCase() + "_" + $('#version').val().toUpperCase() + "_" + $('#type_1').val() + "_" + $('#type_2').val() + "_" + $('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/___/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/__/g, "_"));
                $('#target_env').val($('#target_env').val().replace(/_$/, ""));
            });

            $('#submit1').click(function () {
                check();
                //        $('#mainform').submit();
            });
        });
    </script>
</head>
<%
    String error_msg = new String();

    try {
        DBean db = new DBean();
        String sql = new String();
        ResultSet rs;
        ResultSet rs_tmp;
        String proj_grp = new String();
        String proj_name = new String();
        String app_soft = new String();
        String db_soft = new String();
        String ts_owner = new String();
%>
<script src="calendar.js" language="javascript" type="text/javascript"></script>

<%
    sql = "select * from ts_proj order by proj_name";
    rs = db.execSQL(sql);
%>
<script type="text/javascript">

    var onecount;
    onecount = 0;
    subcat = [];
    <%
    int count = 0;
    while(rs.next()){
    %>
    subcat[<%=count%>] = ["<%=rs.getString("proj_grp").trim()%>", "<%=rs.getString("proj_name").trim()%>"];
    <%
    count++;
    }
    rs.close();
    %>
    temp =<%=count%>;

    function change(team_id) {
        document.form1.proj_name.length = 0;
        var team_id = team_id;
        var i;
        for (i = 0; i < temp; i++) {
            if (subcat[i][0] == team_id) {
                document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][1]);
            }
        }
        document.form1.proj_name.options[0].selected = true;
    }
</script>

<body>
<br>

<div align="center"><font color="#3333cc"><strong><br>

    <h2>New Environment Application</h2></font>
</div>

<form name="form1" id="mainform" action="../project_build_add_finish.jsp" method="post" class="en">
    <%if ("".equals(request.getParameter("info"))) {%>
    <%} else {%>
    <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div><br>
    <div align="center">

        <%}%>
        <table width="900" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
               bordercolordark="#EFEFEF" align="center">
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><b>Source Environment:</b></td>
                <td class="en">
                    <%
                        sql = "select a.env_name,b.proj_name from ts_env a, ts_proj b where a.proj_id=b.proj_id(+) order by a.env_name";
                        rs = db.execSQL(sql);
                    %>
                    <SELECT name="src_env" id="src_env"
                            onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)">
                        <option value="">Please Choose</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("env_name")%>" <%
                            if (rs.getString("env_name").equals(request.getParameter("src_env"))) {
                                out.print("selected='selected'");
                            }%>><%=rs.getString("env_name")%>
                        </option>
                        <%}%>
                    </select>
                    <%
                        System.out.println("Env info" + proj_grp + proj_name + app_soft + db_soft + ts_owner);
                        rs_tmp = db.execSQL("select * from ts_env_app a, ts_env b, ts_env_db c, ts_db d, ts_proj e, ts_member f where a.env_id=b.env_id and a.env_id=c.env_id(+) and c.db_id=d.DB_ID(+) and b.proj_id=e.proj_id(+) and e.owner1=f.no(+) and a.env_state='running' and b.env_name='" + request.getParameter("src_env") + "'");
                        while (rs_tmp.next()) {
                            proj_grp = rs_tmp.getString("PROJ_GRP");
                            proj_name = rs_tmp.getString("PROJ_NAME");
                            app_soft = rs_tmp.getString("APP_TYPE");
                            db_soft = rs_tmp.getString("DB_VERSION");
                            ts_owner = rs_tmp.getString("ACCOUNT");
                            System.out.println("Env info" + proj_grp + proj_name + app_soft + db_soft + ts_owner);
                    %>
                    &nbsp;<a href="<%=rs_tmp.getString("APP_URL")%>" TARGET="_blank">Access</a>&nbsp;<a
                        href="/tsop/ext/env_info_detail.jsp?id=<%=rs_tmp.getInt("ENV_ID")%>&env_name=<%=rs_tmp.getString("ENV_NAME")%>"
                        target="_BLANK">Details</a>
                    <%}%>
                </td>
            </tr>

            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><b>Environment Group:</b></td>
                <%
                    sql = "select distinct proj_grp from ts_proj";
                    rs = db.execSQL(sql);
                %>
                <td class="en" width="78%">

                    <SELECT name="proj_grp" id="proj_grp"
                            onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)">
                        <option value="">Please Choose</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("proj_grp")%>" <%
                            if (proj_grp.equals(rs.getString("proj_grp"))) {
                                out.print("selected=selected");
                            }%>><%=rs.getString("proj_grp")%>
                        </option>
                        <%}%>
                    </select>

                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><b>Environment Name Generator:</b></td>
                <td class="en">
                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="center" valign="bottom">Project Name(<font color="#FF0000">*</font>)</td>
                            <td align="center" valign="bottom">Version</td>
                            <td align="center" valign="bottom">Type1</td>
                            <td align="center" valign="bottom">Type2</td>
                            <td align="center" valign="bottom">Type3</td>
                        </tr>
                        <tr>
                            <td align="center">

                                <select name="proj_name" class="select7" ID="proj_name">
                                    <option value="<%=proj_name%>" selected="selected">
                                        <%=proj_name%>
                                    </option>
                                </SELECT>

                            </td>
                            <td align="center"><input type="text" name="ver" value="" class="text1" size="6"
                                                      id="version"></td>
                            <td>
                                <%
                                    sql = "select distinct a_type_1 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                <select name="type_1" class="select3" id="type_1">
                                    <option value="">Please Choose</option>
                                    <%while (rs.next()) {%>
                                    <%if (rs.getString("a_type_1") != null) {%>
                                    <option value="<%=rs.getString("a_type_1")%>"><%=rs.getString("a_type_1")%>
                                    </option>
                                    <%}%>
                                    <%}%>
                                </select>
                            </td>
                            <td align="center">
                                <%
                                    sql = "select distinct a_type_2 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                <select name="type_2" class="select4" id="type_2">
                                    <option value="">Please Choose1</option>
                                    <%while (rs.next()) {%>
                                    <%if (rs.getString("a_type_2") != null) {%>
                                    <option value="<%=rs.getString("a_type_2")%>"><%=rs.getString("a_type_2")%>
                                    </option>
                                    <%}%>
                                    <%}%>
                                </select>
                            </td>
                            <td align="center">
                                <%
                                    sql = "select distinct a_type_3 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                <select name="type_3" class="select2" id="type_3">
                                    <option value="">Please Choose</option>
                                    <%while (rs.next()) {%>
                                    <%if (rs.getString("a_type_3") == null || "".equals(rs.getString("a_type_3"))) {%>

                                    <%} else {%>
                                    <option value="<%=rs.getString("a_type_3")%>"><%=rs.getString("a_type_3")%>
                                    </option>
                                    <%}%>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><b>New Environment Name:</b></td>
                <td class="en"><input id="target_env" size="40" name="target_env" readonly="readonly">
                    ( * Please generate from "New Environment Name"）
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Operating System:</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct sys_ver from a_property";
                        rs = db.execSQL(sql);
                    %>
                    <select name="sys_ver" class="select6">
                        <option value="">Please Choose</option>
                        <%while (rs.next()) {%>
                        <%if (rs.getString("sys_ver") != null) {%>
                        <option value="<%=rs.getString("sys_ver")%>" <%
                            if (app_soft.equals(rs.getString("sys_ver"))) {
                                out.print("selected=selected");
                            }%>><%=rs.getString("sys_ver")%>
                        </option>
                        <%}%>db
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>APP Server Type & Version:</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct appsoft_ver from a_property order by appsoft_ver";
                        rs = db.execSQL(sql);
                    %>

                    <div style="position:relative;">
                        <select name="appsoft_ver" class="select5"
                                onchange="document.getElementById('app_ver_input').value=this.value">
                            <option value="">Please Choose</option>
                            <%while (rs.next()) {%>
                            <%if (rs.getString("appsoft_ver") != null) {%>
                            <option value="<%=rs.getString("appsoft_ver")%>" <%
                                if (app_soft.equals(rs.getString("appsoft_ver"))) {
                                    out.print("selected=selected");
                                }%>><%=rs.getString("appsoft_ver")%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        <input id="app_ver_input" name="app_ver_input" placeholder="Please choose" VALUE="<%=app_soft%>"
                               style="position:absolute;width:118px;height:16px;left:4px;top:4px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>APP VM Specification:</strong></td>
                <td width="78%" class="en">
                    CPU(Core):<select name="num_cpu">
                    <option value="2">2</option>
                    <option value="4">4</option>
                    <option value="8">8</option>
                </select>&nbsp;
                    RAM(G):<select name="num_ram">
                    <option value="4">4</option>
                    <option value="6">6</option>
                    <option value="8">8</option>
                </select>&nbsp;
                    DISK(G):<select name="num_disk">
                    <option value="35">35</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
                </td>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DB Server Type & Version:</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct db_ver from a_property order by db_ver";
                        rs = db.execSQL(sql);
                    %>
                    <div style="position:relative;">
                        <select name="db_ver" class="select5"
                                onchange="document.getElementById('db_ver_input').value=this.value">
                            <option value="xxxxxxxxxxxxxxxxxxxxxxxxxx">Please Choose:</option>
                            <%while (rs.next()) {%>
                            <%if (rs.getString("db_ver") != null) {%>
                            <option value="<%=rs.getString("db_ver")%>"><%=rs.getString("db_ver")%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        <input id="db_ver_input" name="db_ver_input" placeholder="Please Choose" VALUE="<%=db_soft%>"
                               style="position:absolute;width:102px;height:16px;left:4px;top:4px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>TS Owner:</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select account from ts_member where resign=0 order by account";
                        rs = db.execSQL(sql);
                    %>
                    <input type="hidden" name="db_creator" id="db_creator" value="<%=ts_owner%>">
                    <input type="hidden" name="proj_proposer" id="proj_proposer"
                           value="<%=session.getAttribute("username")%>">

                    <select name="env_creator" id="env_creator" class="select5">
                        <option value="">Please Choose</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("account")%>" <%
                            if (ts_owner.equals(rs.getString("account"))) {
                                out.print("selected=selected");
                            }%>><%=rs.getString("account")%>
                        </option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Print Server?</strong></td>
                <td width="78%" class="en">
                    <input type="radio" name="print_svr" value="YES">YES
                    <input type="radio" name="print_svr" value="NO" checked="checked">NO
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Backup?</strong></td>
                <td width="78%" class="en">
                    <input type="radio" name="backup_type" value="YES" checked="checked">YES
                    <input type="radio" name="backup_type" value="NO">NO
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Tablespace Size:</strong></td>
                <td width="78%" class="en">
                    <input type="text" name="db_size" value="5000" class="text2">M
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Email Notification?</strong></td>
                <td width="78%" class="en">
                    <input type="checkbox" name="send_email" checked="checked" value="1">
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Memo:</strong></td>
                <td width="78%" class="en">
                    <textarea name="note" cols="56" rows="3"></textarea>
                </td>
            </tr>
        </table>
        <br><br>
        <input type="button" name="button1" id="submit1" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
                                                                                                       name="reset1"
                                                                                                       value="Reset">
    </div>
</form>
<%
        db.close();
        rs.close();
    } catch (Exception e) {
        e.printStackTrace();
            error_msg=e.toString();
//        response.sendRedirect(request.getRequestURI() + "?" + request.getQueryString() + "&info=" + e.toString());
             response.sendRedirect(request.getRequestURI() + "?info=" + e.toString());

        } finally {
            response.sendRedirect(request.getRequestURI() + "?info=" +error_msg);
        }
%>
</body>
<script language="JavaScript">
    function IsNumber(str) {
        for (i = 0; i < str.length; i++) {
            if (str.charAt(i) < '0' || str.charAt(i) > '9')
                return false;
        }
        return true;
    }
    function check() {
        if (form1.target_env.value == "") {
            alert("Please generate target environment name!");
            form1.proj_grp.focus();
            return;
        }

        if (target_env.length > 25) {
            alert(target_env + ", environment name length must less than 25 chars!");
            return;
        }
        if (form1.sys_ver.value == "") {
            alert("Please choose OS type!");
            form1.sys_ver.focus();
            return;
        }

        if (form1.env_creator.value == "") {
            alert("Please choose your TS owner!");
            form1.env_creator.focus();
            return;
        }
        if (isNumber(form1.db_size.value) == false) {
            alert("Tablespace size must be number!");
            form1.db_size.focus();
            return false;
        }
        if (form1.app_ver_input.value == "") {
            alert("Please choose App software and version!");
            form1.env_creator.focus();
            return;
        }
        if (form1.db_ver_input.value == "") {
            alert("Please choose DB software and version!");
            form1.env_creator.focus();
            return;
        }
        form1.submit();

    }
    function check1() {
        if (document.getElementById("proj_grp").value == "TS-PG1") {
            document.getElementById("select3").disabled = false;
        } else {
            document.getElementById("select3").disabled = true;
        }
    }
    function isNumber(oNum) {
        var i, j, strTemp;
        strTemp = "0123456789";
        if (oNum.length == 0)
            return 0;
        for (i = 0; i < oNum.length; i++) {
            j = strTemp.indexOf(oNum.charAt(i));
            if (j == -1) {
                return 0;
            }
        }
        return 1;
    }
</script>
</html>
