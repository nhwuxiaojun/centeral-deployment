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
    <title>环境搭建流程提交</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/spin.min.js"></script>
    <link href="scripts/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .text1 {
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

        .text2 {
            font-size: 9pt;
            color: black;
            border-bottom-width: 1pt;
            border-bottom-color: Black;
            border-top-width: 0pt;
            border-top-color: Black;
            border-left-width: 0pt;
            border-left-color: Black;
            border-right-width: 0pt;
            border-right-color: Black;
        }

        .text3 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 19px;
            border: 1px solid #000000;
            padding-top: 2px;
            font-family: Verdana;
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

        .select1 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 70px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select2 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 100px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select3 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 60px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select4 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 80px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select5 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 140px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select6 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 360px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .select7 {
            font-weight: normal;
            color: #000000;
            font-size: 11px;
            height: 20px;
            width: 120px;
            border: 1px solid #7C96B1;
            font-family: Verdana;
        }

        .STYLE1 {
            color: #3333cc
        }

        -->
    </style>
    <script type="text/javascript">
        $(function () {
            $('#app_ver_input').autocomplete({source: ["WebLogic", "WebSphere", "Tomcat"]});
            $('#db_ver_input').autocomplete({source: ["Oracle", "Oracle", "Oracle", "MySQL", "MSSQL"]});
            $('table tr td').attr("height", "25");
            $('table tr td').removeClass("en");
            $(":text").focus(function () {
                $(this).css("background", "yellow");
            }).blur(function () {
                $(this).css("background", "#fff");rb
            });
            $("#target_env").css("background", "yellow");
            $('#proj_name').blur(function () {
                $('#target_env').val($('#proj_name').val().toUpperCase()+"_"+$('#version').val().toUpperCase()+"_"+$('#type_1').val()+"_"+$('#type_2').val()+"_"+$('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/___/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/__/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/_$/,""));
            });
            $('#version').change(function(){
                $('#target_env').val($('#proj_name').val().toUpperCase()+"_"+$('#version').val().toUpperCase()+"_"+$('#type_1').val()+"_"+$('#type_2').val()+"_"+$('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/___/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/__/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/_$/,""));
            });
            $('#type_1').blur(function(){
                $('#target_env').val($('#proj_name').val().toUpperCase()+"_"+$('#version').val().toUpperCase()+"_"+$('#type_1').val()+"_"+$('#type_2').val()+"_"+$('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/___/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/__/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/_$/,""));
            });
            $('#type_2').blur(function(){
                $('#target_env').val($('#proj_name').val().toUpperCase()+"_"+$('#version').val().toUpperCase()+"_"+$('#type_1').val()+"_"+$('#type_2').val()+"_"+$('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/___/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/__/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/_$/,""));
            });
            $('#type_3').blur(function(){
                $('#target_env').val($('#proj_name').val().toUpperCase()+"_"+$('#version').val().toUpperCase()+"_"+$('#type_1').val()+"_"+$('#type_2').val()+"_"+$('#type_3').val());
                $('#target_env').val($('#target_env').val().replace(/____/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/___/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/__/g,"_"));
                $('#target_env').val($('#target_env').val().replace(/_$/,""));
            });
        });
    </script>
</head>
<%
    DBean db = new DBean();
    String sql = new String();
    ResultSet rs;
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
<%@include file="includes/head.html" %>
<br>

<div align="center"><font color="#3333cc"><strong><br>
    <span class="s105">搭建申请（<font color="#FF0000">*</font>项为必填）</span></strong></font>
</div>

<form name="form1" action="project_build_add_finish.jsp" method="post" class="en">
    <%if ("".equals(request.getParameter("info"))) {%>

    <%} else {%>
    <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%>
    </font>
        <%}%>
        <table width="900" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
               bordercolordark="#EFEFEF" align="center">
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境属组：</strong></td>
                <%
                    sql = "select distinct proj_grp from ts_proj";
                    rs = db.execSQL(sql);
                %>
                <td class="en" width="78%">

                    &nbsp;<SELECT name="proj_grp"
                                  onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)">
                    <option value="">请选择</option>
                    <%while (rs.next()) {%>
                    <option value="<%=rs.getString("proj_grp")%>"><%=rs.getString("proj_grp")%>
                    </option>
                    <%}%>
                </select>

                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境名称生成器：</strong></td>
                <td class="en">
                    <table width="80%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="left" valign="bottom">&nbsp;项目名(<font color="#FF0000">*</font>)</td>
                            <td align="left" valign="bottom">版本</td>
                            <td align="left" valign="bottom">类型1</td>
                            <td align="left" valign="bottom">类型2</td>
                            <td align="left" valign="bottom">类型3</td>
                        </tr>
                        <tr>
                            <td align="left">

                                &nbsp;<select name="proj_name" class="select7" id="proj_name">
                                    <option value="">请选择</option>
                                </SELECT>

                            </td>
                            <td align="left"><input type="text" name="ver" value="" class="text1" size="6" id="version"></td>
                            <td>
                                <%
                                    sql = "select distinct a_type_1 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                &nbsp;<select name="type_1" class="select3" id="type_1">
                                <option value="">请选择</option>
                                <%while (rs.next()) {%>
                                <%if (rs.getString("a_type_1") != null) {%>
                                <option value="<%=rs.getString("a_type_1")%>"><%=rs.getString("a_type_1")%>
                                </option>
                                <%}%>
                                <%}%>
                            </select>
                            </td>
                            <td align="left">
                                <%
                                    sql = "select distinct a_type_2 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                <select name="type_2" class="select4" id="type_2">
                                    <option value="">请选择</option>
                                    <%while (rs.next()) {%>
                                    <%if (rs.getString("a_type_2") != null) {%>
                                    <option value="<%=rs.getString("a_type_2")%>"><%=rs.getString("a_type_2")%>
                                    </option>
                                    <%}%>
                                    <%}%>
                                </select>
                            </td>
                            <td align="left">
                                <%
                                    sql = "select distinct a_type_3 from a_type";
                                    rs = db.execSQL(sql);
                                %>
                                <select name="type_3" class="select2" id="type_3">
                                    <option value="">请选择</option>
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
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>新环境名称：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input id="src_env" type="hidden" name="src_env" value="internal"><input id="target_env" name="target_env" size="40">
                    &nbsp;<font color="red">*此处在保证环境命名规范的前提下可手工修改</font>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>系统平台：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct sys_ver from a_property";
                        rs = db.execSQL(sql);
                    %>
                    &nbsp;<select name="sys_ver" class="select6">
                    <option value="">请选择</option>
                    <%while (rs.next()) {%>
                    <%if (rs.getString("sys_ver") != null) {%>
                    <option value="<%=rs.getString("sys_ver")%>"><%=rs.getString("sys_ver")%>
                    </option>
                    <%}%>
                    <%}%>
                </select>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用中间件平台：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct appsoft_ver from a_property order by appsoft_ver";
                        rs = db.execSQL(sql);
                    %>

                    <div style="position:relative;">
                        &nbsp;<select name="appsoft_ver" class="select5"
                                      onchange="document.getElementById('app_ver_input').value=this.value">
                        <option value="">请选择</option>
                        <%while (rs.next()) {%>
                        <%if (rs.getString("appsoft_ver") != null) {%>
                        <option value="<%=rs.getString("appsoft_ver")%>"><%=rs.getString("appsoft_ver")%>
                        </option>
                        <%}%>
                        <%}%>
                    </select>
                        &nbsp;<input id="app_ver_input" name="app_ver_input" placeholder="Input or select"
                                     style="position:absolute;width:118px;height:16px;left:6px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>VM Specification:</strong></td>
                <td width="78%" class="en">
                    &nbsp;CPU(Core):<select name="num_cpu">
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
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库版本：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct db_ver from a_property order by db_ver";
                        rs = db.execSQL(sql);
                    %>
                    <div style="position:relative;">
                        &nbsp;<select name="db_ver" class="select5"
                                onchange="document.getElementById('db_ver_input').value=this.value">
                            <option value="">请选择</option>
                            <%while (rs.next()) {%>
                            <%if (rs.getString("db_ver") != null) {%>
                            <option value="<%=rs.getString("db_ver")%>"><%=rs.getString("db_ver")%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        &nbsp;<input id="db_ver_input" name="db_ver_input" placeholder="Input or select"
                               style="position:absolute;width:118px;height:16px;left:6px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用搭建人：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select account from ts_member where resign=0 order by account";
                        rs = db.execSQL(sql);
                    %>
                    &nbsp;<select name="env_creator" class="select5">
                        <option value="<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%>
                        </option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("account")%>"><%=rs.getString("account")%>
                        </option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库搭建人：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select account from ts_member where resign=0 order by account";
                        rs = db.execSQL(sql);
                    %>
                    &nbsp;<select name="db_creator" class="select5">
                        <option value="<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%>
                        </option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("account")%>"><%=rs.getString("account")%>
                        </option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境搭建申请人：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input required="required" type="text" name="proj_proposer" value="" class="text2">
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Print Server</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input type="radio" name="print_svr" value="YES">是
                    <input type="radio" name="print_svr" value="NO" checked="checked">否
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否需要备份：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input type="radio" name="backup_type" value="YES" checked="checked">是
                    <input type="radio" name="backup_type" value="NO">否
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>表空间大小：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input type="text" name="db_size" value="5000" class="text2">（单位：M）
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<input type="checkbox" name="send_email" checked="checked" value="1">
                </td>
            </tr>
            <tr>
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>备注：</strong></td>
                <td width="78%" class="en">
                    &nbsp;<textarea name="note" cols="56" rows="3"></textarea>
                </td>
            </tr>
        </table>
        <br><br>
        <input type="button" name="button1" value="Submit" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
                                                                                                            name="reset1"
                                                                                                            value="Reset">
    </div>
</form>
<%
    db.close();
    rs.close();
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
        if (form1.proj_grp.value == "") {
            alert("请选择项目环境组属");
            form1.proj_grp.focus();
            return;
        }
        if (form1.target_env.value == "") {
            alert("请生成或输入新环境名称");
            form1.target_env.focus();
            return;
        }
        if (form1.target_env.length > 25) {
            alert(form1.target_env.value + "项目名称长度不能超过25个字符！否则app,read用户无法创建！");
            return;
        }
        if (form1.proj_name.value == "") {
            alert("请选择项目名");
            form1.proj_name.focus();
            return;
        }
        /*
         if(form1.type_2.value==""){
         alert("请选择类型");
         form1.type_2.focus();
         return;
         }
         if(form1.type_3.value==""){
         alert("请选择类型");
         form1.type_3.focus();
         return;
         }
         */
        var new_env = form1.proj_name.value + "_" + form1.ver.value + "_" + form1.type_1.value + "_" + form1.type_2.value + "_" + form1.type_3.value;
        //alert(new_env);
        //alert(new_env.length);
        if (new_env.length > 25) {
            alert(new_env + "项目名称长度不能超过25个字符！否则app,read用户无法创建！");
            return;
        }
        if (form1.sys_ver.value == "") {
            alert("请选择系统平台");
            form1.sys_ver.focus();
            return;
        }
        /*
         if(form1.appsoft_ver.value==""){
         form1.appsoft_ver.value=form1.app_ver_input.value;
         }
         if(form1.appsoft_ver.value=="" && form1.app_ver_input.value==""){
         alert("应用中间件平台");
         form1.appsoft_ver.focus();
         return;
         }
         if(form1.db_ver.value==""){
         form1.db_ver.value=form1.db_ver_input.value;
         }
         if(form1.db_ver.value=="" && form1.db_ver_input.value==""){
         alert("数据库版本");
         form1.db_ver.focus();
         return;
         }
         */
        if (form1.env_creator.value == "") {
            alert("请输入环境搭建人");
            form1.env_creator.focus();
            return;
        }
        if (form1.db_creator.value == "") {
            alert("请输入数据库搭建人");
            form1.db_creator.focus();
            return;
        }
        if (form1.proj_proposer.value == "") {
            alert("请输入环境搭建申请人");
            form1.proj_proposer.focus();
            return;
        }
        if (isNumber(form1.db_size.value) == false) {
            alert("表空间大小必须为数字");
            form1.db_size.focus();
            return false;
        }
        if (form1.app_ver_input.value == "") {
            alert("未选择中间件软件版本");
            form1.app_ver_input.focus();
            return false;
        }
        if (form1.db_ver_input.value == "") {
            alert("未选择数据库版本");
            form1.db_ver_input.focus();
            return false;
        }
        if (form1.appsoft_ver.value == "" || form1.db_ver_input.value == "") {
            var a = window.confirm("你没有填写应用中间件平台或数据库版本，确定提交吗？");
            if (a == true) {
                form1.submit();
            } else {
                return false;
            }
        } else {
            form1.submit();
        }
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
