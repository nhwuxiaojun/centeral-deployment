<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>数据库登陆权限赋予添加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<script language=javascript>
    function closemyself() {
        window.opener = self;
        window.close();
        //self.close();
    }
</script>
<body onLoad="setTimeout('closemyself()',5000);">
<%
    DBean db = new DBean();
    String sql_temp = new String();
    String sql = new String();
    String sql2 = new String();
    ResultSet rs;
    ResultSet rs2;
    int k = 0;
    int j = 0;
    int l = 0;
    int m = 0;

    String staff_name = new String();
    String customer_ip = new String();

    String proj_env = new String();
    String db_sche = new String();
    String db_sid = new String();
    String message_info = new String();
    String datestr = new String();
    String username = (String) session.getAttribute("username");
    DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new java.util.Date();
    datestr = df.format(date);

//db_id = request.getParameter("db_id");
    staff_name = Tools.toGB(request.getParameter("staff_name").trim().toLowerCase());
    customer_ip = Tools.toGB(request.getParameter("customer_ip").trim());
    if (!"".equals(username) && username != null) {
        String[] newString = request.getParameterValues("selectStr");
        //Integer[] artTypeIds=new Integer[newString.length];
        String[] temp_db_str = new String[newString.length];
        for (int i = 0; i < newString.length; i++) {

            String selectStr = newString[i];
            if (!"".equals(selectStr) && selectStr != null) {
                temp_db_str = selectStr.split("/");
                db_sche = temp_db_str[0].toUpperCase();
                db_sid = temp_db_str[1];

                if (!"".equals(db_sche) && !"".equals(db_sid)) {

                    sql2 = "select count(*) count_num from a_login_control where login_ip =" + " '" + customer_ip + "' " + "and login_os_user = " + " '" + staff_name + "' " + "and login_db_user =" + " '" + db_sche + "' " + "  and login_db_sid =" + " '" + db_sid + "' ";

                    rs2 = db.execSQL(sql2);
                    while (rs2.next()) {
                        int count_num = rs2.getInt("count_num");
                        if (count_num < 1) {
                            // for owner user
                            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values(" + "'" + customer_ip + "','" + staff_name + "','" + db_sche + "','" + db_sid + "','" + username + "','" + username + "')";
                            j = 0;
                            System.out.println(sql);

                            j = db.execUpdate(sql);
                            // for app user.
                            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values(" + "'" + customer_ip + "','" + staff_name + "','" + db_sche + "_APP','" + db_sid + "','" + username + "','" + username + "')";
                            System.out.println(sql);
                            k = 0;
                            k = db.execUpdate(sql);
                            //NA for app user.
                            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values(" + "'" + customer_ip + "','NA','" + db_sche + "_APP','" + db_sid + "','" + username + "','" + username + "')";
                            System.out.println(sql);
                            l = 0;
                            l = db.execUpdate(sql);
                            // NA for owner user.
                            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values(" + "'" + customer_ip + "','NA','" + db_sche + "','" + db_sid + "','" + username + "','" + username + "')";
                            System.out.println(sql);
                            m = 0;
                            m = db.execUpdate(sql);
                            //if success
                            if (j == 1 && k==1 && l==1 && m==1) {
                                message_info += db_sche +" and "+ db_sche+"_APP Grant succeed!      ";
                            } else {
                                message_info += db_sche +" and "+ db_sche+"_APP Grant Failed!      ";
                            }
                        } else {
                            message_info += db_sche + " privileges existed!     ";
                        }


                    }


                }
            }
        }
%>
<script type="text/javascript">
 //
    alert('<%out.print(message_info);%>');
    history.go(-1);
</script>
<%
    } else {
        message_info = "登录用户信息有误,请重新登录! ";
    }
%>
<form name="form1" action="db_access_privi_do.jsp" method="post">
    <input type="hidden" name="info" value="<%=message_info%>">
    <input type="hidden" name="staff_name" value="<%=request.getParameter("staff_name")%>">
    <input type="hidden" name="customer_ip" value="<%=request.getParameter("customer_ip")%>">
    <input type="hidden" name="flag" value="y">
    <input type="hidden" name="col_name" value="<%=request.getParameter("col_name")%>">
    <input type="hidden" name="col_name1" value="<%=request.getParameter("col_name1")%>">
    <input type="hidden" name="col_value" value="<%=request.getParameter("col_value")%>">
    <input type="hidden" name="col_value1" value="<%=request.getParameter("col_value1")%>">
</form>
<script language="javascript">
    form1.submit();
</script>
<jsp:include page="includes/copyright.jsp"/>
</body>
<%db.close();%>
</html>
