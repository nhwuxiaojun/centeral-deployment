<html>
<head>
    <script type="text/javascript" language="javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" language="javascript" src="scripts/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript">
        $(function () {
            var d = new Date();
            var onehour_milliseconds = d.getTime() - 2000 * 60 * 60;
            var t = new Date();
            t.setTime(onehour_milliseconds);
//            $('#start_time').datetimepicker({
//		dateFormat: "yy-mm-dd",
//               hour: t.getHours()-1
//            });
//$( "#end_time" ).datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());

            $("#start_time").datetimepicker({dateFormat: "yy-mm-dd"}).datepicker("setDate", t);
            $("#end_time").datetimepicker({dateFormat: "yy-mm-dd"}).datepicker("setDate", new Date());

            $('#submit_btn').click(function () {
                //	alert("This feature is under development, thanks for visting...");
                $('#info').html("<font color=red><b>Start generating AWR, please wait for about 20 seconds...<br>Or you can exit now, and you will receive AWR by email. </b></font><br><font color=blue><b>You also can get AWR from path \\\\172.17.1.7\\Application\\deploy\\awr </b></font>"); //$('#submit_btn').attr("disabled",true);
                window.resizeTo(900, 700);
                $('#mainform').submit();
            });
        });
    </script>
    <style type="text/css">
        #ui-datepicker-div {
            font-size: 80%;
        }
    </style>
    <link rel="stylesheet" media="all" type="text/css" href="scripts/jquery-ui-1.11.1/jquery-ui.css"/>
    <title>DB AWR Extract</title>
</head>
<body>
<form method="post" id="mainform" action="extract_awr_do.jsp">
    <h2>Generate AWR:
        <font color=red><%=request.getParameter("env_name")%>
        </font></h2>
    <hr>
    <input type=hidden name="env_name" value="<%=request.getParameter("env_name")%>">
    Start Time: <input name="start_time" id="start_time">
    <br>
    End Time:&nbsp;&nbsp; <input name="end_time" id="end_time">
    <br>
    DB TNSNAME: <input name="db_ldap_name" value="<%=request.getParameter("db_ldap_name")%>">
    <br>
    DB SID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="db_sid" value="<%=request.getParameter("db_sid")%>">
    <br>
    <hr>
    <button type="submit" id="submit_btn" name="submit" value="query">Generate</button>
    &nbsp;
    <button type="close" name="close" value="close" onclick="window.close()">Close</button>
</form>
<div id="info">
</body>
</html>
