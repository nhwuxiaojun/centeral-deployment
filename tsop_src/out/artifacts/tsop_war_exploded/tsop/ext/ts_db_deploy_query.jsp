<%@ include file="../interface/check_non_ts.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.MySQLDBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@page import="com.mysql.jdbc.Driver" %>

<html>
<head>
    <title>DB Deployment Query</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <meta http-equiv="refresh" content="300">
    <script src="../scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(":text").focus(function () {
                $(this).css("background", "yellow");
            }).blur(function () {
                $(this).css("background", "#fff");
            });
            $("#maintable tbody tr").hover(function () {
                // $("#orderedlist li:last").hover(function() {
                $(this).addClass("blue");
            }, function () {
                $(this).removeClass("blue");
            });
        });
    </script>
    <style>
        .blue {
            background: #ffff00;
        }
    </style>
    <link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../includes/common.js"></script>
</head>
<%
    Socket s = null;
    DBean db = new DBean();
    MySQLDBean db1 = new MySQLDBean();
    String sql = new String();
    String sql1 = new String();
    String sql2 = new String();
    String sql3 = new String();
    String sql4 = new String();
    int i = 0;
    int sum = 0;
    float sum1 = 0;
    float sum2 = 0;
    String array1[][];
    array1 = new String[50][2];
    ResultSet rs;
    ResultSet rs1;
    ResultSet rs2;
    ResultSet rs3;
    ResultSet rs4;
%>
<script language="JavaScript">
    var subcat = [];
    subcat.length = 0;
    <%
    sql1="select * from ts_proj where valid=1 order by proj_name";
    System.out.println(sql1);
    rs1=db.execSQL(sql1);
    int count = 0;
    while(rs1.next()){
        %>
    subcat[<%=count%>] = ["<%=rs1.getString("proj_grp")%>", "<%=rs1.getString("proj_name")%>", "<%=rs1.getString("proj_id")%>"];
    <%
        count++;
}
rs1.close();
    %>


    function change_proj(pname) {
        //var form11 = document.getElementById("form1");
        //var act1=document.getElementById("flag");
        //act1.value="y";
        //form11.target="_blank";
        //form11.action="ts_deploy_query.jsp?proj_name="+pname;
        //form11.method="post";
        form1.submit();
    }
    function change(team_id) {
        document.form1.proj_name.length = 0;
        document.form1.proj_name.options[0] = new Option('Please select', '');
        var team_id = team_id;
        for (i = 0; i < subcat.length; i++) {
            if (subcat[i][0] == team_id) {
                document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][2]);
            }
        }
        // document.form1.proj_name.options[0].selected = true;
    }

    function query_proj() {
        //alert("query by select change.");
        var form11 = document.getElementById("form1");
        var act1 = document.getElementById("flag");
        act1.value = "y";
        //form11.target="_blank";
        //form11.action="ts_project_support_query.jsp";
        form11.method = "get";
        form11.submit();
    }

    function search_proj() {
        if (form1.col_value1.value.length < 2) {
            alert("Please input more letters!");
            form1.col_value1.select();

        } else {
            form1.proj_grp.selectedIndex = 0;
            form1.proj_name.selectedIndex = 0;
            form1.submit();
        }
    }

</script>
<script language="JavaScript" for="document" event="onkeypress">
    if (event.keyCode == 13) {
        check();
    }
</script>
<script language="JavaScript" for="window" event="onload">
    form1.col_value1.select();
</script>
<body>
<%@include file="head.jsp" %>
<%

    // For search
    String tmpact = request.getParameter("act");
    String tmpid = request.getParameter("proj_id");
    String tmpproj_name = request.getParameter("proj_name");
    String tmpproj_grp = request.getParameter("proj_grp");
    String proj_id = request.getParameter("prod_id");
    String col_name1 = request.getParameter("col_name1");
    String col_value1 = request.getParameter("col_value1");
// For print
    String tmpflag = request.getParameter("flag");
    System.out.println("Flag is:" + tmpflag);

    System.out.println("proj_name:" + tmpproj_name);
    System.out.println("proj_grp:" + tmpproj_grp);
//System.out.println("env_state:"+env_state);
    System.out.println("col_name1:" + col_name1);
    System.out.println("col_value1:" + col_value1);

    int flag = 0;

//query by procode
    String proj_code_sql = "";
//String proj_name=(String)request.getParameter("proj_name");
//if (proj_name != null&& !"".equals(proj_name)) {
//	proj_code_sql=" and  proj_code= " + proj_name.trim() + "  ";
//}

%>
<center>
    <table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <form name="form1" action="ts_db_deploy_query.jsp" method="get" class="en">
            <input name="flag" value="y" type=hidden>
            <tr>
                <td align="left" class="en" width="20%">
                    &nbsp;<strong><font color="#006699" class="MenuBarItemSubmenu">DB Deployment Query</font></strong>
                    &nbsp;&nbsp;

                    <SELECT disabled="disabled" name="proj_grp"
                            onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)">
                        <option
                                <%
                                    if ("".equals(request.getParameter("proj_grp"))) {
                                        out.print("selected=selected ");
                                    }
                                %>
                                value="%">Project Group
                        </option>
                        <%
                            sql3 = "select distinct proj_grp from ts_proj where valid=1";
                            System.out.println(sql3);
                            rs3 = db.execSQL(sql3);
                            while (rs3.next()) {%>
                        <option <%
                            if (rs3.getString("proj_grp").equals(request.getParameter("proj_grp"))) {
                                out.print("selected=selected ");
                            }
                        %>
                                value="<%=rs3.getString("proj_grp")%>"><%=rs3.getString("proj_grp")%>
                        </option>
                        <%}%>
                    </select>
                    &nbsp;
                    <select name="proj_name"
                            onChange="change_proj(document.form1.proj_name.options[document.form1.proj_name.selectedIndex].value)">
                        <option
                                <%
                                    if ("".equals(request.getParameter("proj_name"))) {
                                        out.print("selected=selected ");
                                    }
                                %>
                                value="">Project Name
                        </option>
                        <%
                            sql1 = "select * from ts_proj where valid=1 order by proj_name ";
                            System.out.println(sql1);
                            rs3 = db.execSQL(sql1);
                            while (rs3.next()) {
                        %>
                        <option
                                <%
                                    if (rs3.getString("proj_id").equals(request.getParameter("proj_name"))) {
                                        out.print("selected=selected ");
                                    }
                                %>
                                value="<%=rs3.getString("proj_id")%>"><%=rs3.getString("proj_name")%>
                        </option>
                        <%}%>
                    </select>
                    &nbsp;
                    <select name="col_name1">
                        <option value="version" <%
                            if ("version".equals(request.getParameter("col_name1"))) {
                                out.print("selected");
                            }
                        %>>Version
                        </option>
                        <option value="env_name" <%
                            if ("env_name".equals(request.getParameter("col_name1"))) {
                                out.print("selected");
                            }
                        %>>Environment Name
                        </option>
                        <option value="deployer" <%
                            if ("deployer".equals(request.getParameter("col_name1"))) {
                                out.print("selected");
                            }
                        %>>Deploy By
                        </option>
                        <option value="env_ip" <%
                            if ("env_ip".equals(request.getParameter("col_name1"))) {
                                out.print("selected");
                            }
                        %>>Internal Env IP
                        </option>
                    </select>
                    <%
                        // Start Search by project_name, group, code, etc.
                        if ("".equals(request.getParameter("col_value1")) || request.getParameter("col_value1") == null) {%>
                    <input type="text" id="search" name="col_value1" value="" size="30"
                           placeholder="Environment IP or Name">&nbsp;
                    <%} else {%>
                    <input type="text" id="search" name="col_value1" value="<%=request.getParameter("col_value1")%>"
                           class="en" size="30">&nbsp;
                    <%
                        }
// End Search by project_name, group, code, etc.   
                    %>

                    <input type="button" name="button1" value="Query" onClick="search_proj()">
                    <input type="button" name="button2" value="Back" onClick="history.go(-1);">
                    &nbsp;Deployment Stats:&nbsp;Current-
                    <font color="red">
                        <%
                            rs3 = db.execSQL("select count(*) from ts_deploy_log a where a.end_time is null");
                            while (rs3.next()) {
                                out.print(rs3.getInt(1));
                            }
                        %></font>
                    &nbsp;Today-
                    <font color="red">
                        <%
                            rs3 = db.execSQL("select count(*) from ts_deploy_log a where trunc(a.start_time)=trunc(sysdate)");
                            while (rs3.next()) {
                                out.print(rs3.getInt(1));
                            }
                        %></font>
                    &nbsp;Total-
                    <font color="red">
                        <%
                            rs3 = db.execSQL("select count(*) from ts_deploy_log");
                            while (rs3.next()) {
                                out.print(rs3.getInt(1));
                            }
                        %></font>
                    <%
                        String common_sql = new String();
                        common_sql = "select c.proj_env env_name, c.db_id env_id, g.version, g.result, b.LDAP_NAME, c.DB_USER, c.DB_USER_PASSWD, f.account, g.start_time, g.end_time, g.deployer from ts_db b, ts_env_db c, ts_env d, ts_proj e, ts_member f, ts_deploy_log g where c.db_ldap_name = b.LDAP_NAME(+) and c.env_id = d.env_id(+) and d.proj_id = e.proj_id(+) and lower(c.DB_USER_TYPE) = 'owner' and e.owner1 = f.no(+) and g.start_time is not null and g.env_id=c.db_id(+) ";

                        if ("".equals(col_value1) || (col_value1 == null)) {
                            if (tmpproj_name == null || "".equals(tmpproj_name)) {
                                // default access
                                //	sql=common_sql+" and env_state='running' and rownum<18 order by a.create_date desc";
                                //sql="select * from ("+common_sql+" and env_state='running' order by a.create_date desc ) where  rownum<18";
                                sql = "select * from (" + common_sql + " and env_db_status='running' order by g.start_time desc ) where  rownum<18";
                                System.out.println("---sql1---");
                            } else {
                                // search by project name
                                sql = common_sql + " and env_db_status='running' and d.proj_id like '" + tmpproj_name + "' order by g.start_time desc";
                                System.out.println("---sql2---");
                            }
                        } else {
                            // search by input
                            System.out.println(col_value1.indexOf("%"));
                            System.out.println(col_value1.length());
                            if (col_value1.indexOf("%") >= 0 || col_value1.trim() == "" || col_value1.trim().indexOf(" ") >= 0 || col_value1.length() < 2) {
                                //if (1==2) {
                                sql = common_sql + " and env_db_status='running' and rownum<18 order by g.start_time desc";
                                System.out.println("---sql3---");
                                out.print("<font color=red>Please input more letters.</font>");
                            } else {
                                if ("ext_env_ip".equals(col_name1)) {
                                    sql4 = "select * from ts_ip_map_matrix where external_ip like '%" + col_value1.toString().trim() + "%'";
                                    //System.out.println(sql4);
                                    rs4 = db1.execSQL(sql4);
                                    sql = common_sql + " and env_db_status='running' and env_ip in (";
                                    while (rs4.next()) {
                                        sql = sql + "'" + rs4.getString("INTERNAL_IP") + "',";
                                    }
                                    sql = sql + "'')";
                                } else {
                                    sql = common_sql + " and env_db_status='running' and upper(" + col_name1.toString() + ") like '%" + col_value1.toString().trim().toUpperCase() + "%' order by g.start_time desc";
                                }
                                System.out.println("query sql:" + sql);
//		out.print("Search Condition: <font color=red><b>"+col_name1.toString()+"="+col_value1.toString().trim()+"</b><font>");
                            }
                        }
                        System.out.println(sql);
                        rs = db.execSQL(sql);

                    %>


                </td>
            </tr>
        </form>

        <%sql = "select * from a_user where usr='" + session.getAttribute("username") + "'";%>
        <%rs2 = db.execSQL(sql);%>
        <%while (rs2.next()) {%>
        <%if ("0".equals(rs2.getString("valid"))) {%>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <form name="form3" action="ts_db_deploy_query.jsp">
                    Project Group��<select name="a_proj_grp">
                    <%
                        sql = "select distinct proj_grp from ts_proj order by proj_grp";
                        rs3 = db.execSQL(sql);
                        while (rs3.next()) {
                            out.print("<option value=" + rs3.getString("PROJ_GRP") + ">" + rs3.getString("PROJ_GRP") + "</option>");
                        }

                    %></select>
                    Project Name��<input name="a_proj_name" size=15>
                    Project Code��<input name="a_proj_id" size=10>
                    OWNER1:<select name="a_owner1">
                    <%
                        for (int j = 0; j < i; j++) {
                            out.print("<option value=" + array1[j][0] + ">" + array1[j][1] + "</option>");
                        }
                    %>
                </select>
                    <input type="submit" name="button2" value="Add" class="en">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <input type="hidden" name="flag" value="y">
    </form>
    <form name="form2">
        <input name="act" type=hidden>
        <input name="proj_id" type=hidden>
        <input name="s_owner1" type=hidden>
        <input name="s_owner2" type=hidden>
        <input name="cost1" type=hidden>
        <input name="cost2" type=hidden>
        <br>
        <table id="maintable" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
               bordercolordark="#EFEFEF" align="center">
            <thead>
            <tr bgcolor="#006699" height="24">
                <td align="center" class="en" width="2%"><font color="#ffffff"><b>No</b></font></td>
                <td align="left" class="en" width="7%"><font color="#ffffff"><b>Env IP</b></font></td>
                <td align="left" class="en" width="10%"><font color="#ffffff"><b>Env Information</b></font></td>
                <td align="center" class="en" width="7%"><font color="#ffffff"><b>Check Log</b></font></td>
                <td align="center" class="en" width="25%"><font color="#ffffff"><b>Version</b></font></td>
                <td align="center" class="en" width="5%"><font color="#ffffff"><b>Result</b></font></td>
                <td align="center" class="en" width="5%"><font color="#ffffff"><b>Deploy</b></font></td>
                <td align="center" class="en" width="14%"><font color="#ffffff"><b>Deploy Start Time</b></font></td>
                <td align="center" class="en" width="4%"><font color="#ffffff"><b>Finish Time</b></font></td>
                <td align="center" class="en" width="4%"><font color="#ffffff"><b>Deploy By</b></font></td>
            </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
                    sum++;
                    if ((sum % 2) == 1) {
                        out.println("<tr bgcolor=#eeeeee height=20>");
                    } else {
                        out.println("<tr bgcolor=#ffffff height=20>");
                    }
            %>
            <td align="center" class="en" width="3%"><%=sum%></font></td>
            <td align="left" class="en">-</font></td>
            <td align="left" class="en"><a href="#"
                                           onClick="open_win('db_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',850,640);"><%=rs.getString("ENV_NAME")%>
            </a></font></td>
            <td align=center><a href="javascript:"
                                onClick="execPutty('172.17.1.7','tsop_deploy','eBaotechts1.')">SSH</a>
                <a href="javascript:"
                   onClick="execSamba('\\\\172.17.1.7\\Application\\deploy\\<%=rs.getString("ENV_NAME")%>')">Samba</a>
            </td>

            <td align="left" class="en">
                [<a href="#"
                    onClick="open_win('../ts_db_deploy_history.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',1000,600)">History</a>]
                <a href="/tsop/realtime_show_log.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>&filename=<%=rs.getString("VERSION")%>"
                   target="_blank"><%=rs.getString("VERSION")%>
                </a>
            </td>
            <td align="center" class="en"<% if ("failed".equals(rs.getString("result"))) {
                out.print("bgcolor=red");
            }
                if ("warning".equals(rs.getString("result"))) {
                    out.print("bgcolor=purple");
                }
                if ("succeed".equals(rs.getString("result"))) {
                    out.print("bgcolor=green");
                }%>>
                <font color="#dddddd"><%=rs.getString("result")%>
                </font>
            </td>
            <td align="center" class="en">
                <a href="#"
                   onClick="open_win('../ts_db_deploy_env.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',800,550);"><font
                        color=red><b>Deploy</b></font></a>
            </td>

            <%
                DateFormat df1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
                DateFormat df2 = new java.text.SimpleDateFormat("HH:mm:ss");
//System.out.println(df1.format(rs.getDate("start_time")));
//System.out.println(df2.format(rs.getTime("start_time")));
            %>
            <td align="center" class="en"
                width="10%"><%out.print(df1.format(rs.getDate("start_time"))+" "+df2.format(rs.getTime("start_time")));%></a></td>
            <td align="center" class="en"
                width="10%"><%if ( null!=rs.getString("end_time")) { out.print(df2.format(rs.getTime("end_time"))); } else { out.println("-"); } %></a></td>
            <td align="center" class="en" width="10%"><%=rs.getString("deployer")%></a></td>
            </tr>
            <%}%>
            </tbody>
        </table>
</center>
</form>
<%

    //select trunc(a.start_time), count(*) from ts_deploy_log a group by trunc(a.start_time);

%>
<%db.close();%>
<%rs.close();%>
<%rs1.close();%>
<%rs2.close();%>
<%rs3.close();%>
<br>
<small>&nbsp;&nbsp;Notice: If you want to use SSH, please download and install Putty from <a
        href="http://ts.ebaotech.com/tsop/software/putty-2014-04-02-installer.exe">here</a>.
    &nbsp;&nbsp;And IE is strongly recommended for browsing this site.</a>.
</small>
<jsp:include page="copyright.jsp"/>
</body>
</html>
