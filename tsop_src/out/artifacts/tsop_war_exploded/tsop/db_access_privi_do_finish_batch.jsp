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
    function SetWindow() {
        var height = 600;                     //Set height
        var width = 500;
    }
    function closemyself() {
//window.resizeTo(500,300);
        window.opener = self;
        window.close();
        //self.close();
    }
</script>
<body onLoad="setTimeout('closemyself()',5000);">
</script>

<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
String sql2 = new String();
ResultSet rs;
ResultSet rs2;
int j = 0;
int k = 0;
int l = 0;
int m = 0;

String[] newString2=request.getParameterValues("useriplist");
String[] newString3=request.getParameterValues("dblist");
String[] newString1=newString2[0].split("\r\n");
out.println(newString3[0]);

String staff_name = new String();
String customer_ip = new String();


String db_sche = new String();
String db_sid = new String();
db_sche=request.getParameter("dbuser").trim().toUpperCase();
db_sid=request.getParameter("sid").trim();

String message_info = new String();
String datestr = new String();
String username =(String)session.getAttribute("username");
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

//db_id = request.getParameter("db_id");
staff_name = Tools.toGB(request.getParameter("user").trim().toLowerCase());
customer_ip = Tools.toGB(request.getParameter("ip").trim());


if(!"".equals(username)&&username!=null){

    //Integer[] artTypeIds=new Integer[newString.length];
    //	String[] temp_db_str = new String[newString.length];
    //	for(int i=0;i<newString.length;i++){

    //		String selectStr =	newString[i];
    //out.println(selectStr+"test");
    //		if(!"".equals(selectStr)&&selectStr!=null){
    //			temp_db_str = selectStr.split("/");
    //			db_sche =temp_db_str[0].toUpperCase();
    //			db_sid = temp_db_str[1];

    //			if(!"".equals(db_sche)&&!"".equals(db_sid)){
//
    out.println("<font color=black><h3>Result:</h3></font><br>");
    for(int i1=0;i1<newString1.length;i1++){
        String[] tmpuserip=newString1[i1].split(":");
        staff_name=tmpuserip[0].trim().toLowerCase();
        customer_ip=tmpuserip[1].trim();

        sql2=  "select count(*) count_num from a_login_control where login_ip ="+ " '" + customer_ip + "' " + "and login_os_user = "+ " '" + staff_name + "' " +  "and login_db_user ="+ " '" + db_sche + "' " +  "  and login_db_sid ="+ " '" + db_sid + "' " ;
        rs2 = db.execSQL(sql2);
        //out.println(sql2+"<br>");
        int count_num=0;
        if (rs2.next()) {
         count_num=  rs2.getInt("count_num");
        }
        if (count_num < 1) {
            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values("+"'" + customer_ip + "','" + staff_name + "','"  + db_sche+ "','" + db_sid + "','" + username + "','"+username  +"')" ;
            j = 0;
            //out.println(sql+"<br>");
            j = db.execUpdate(sql);

            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values("+"'" + customer_ip + "','" + staff_name + "','"  + db_sche+ "_APP','" + db_sid + "','" + username + "','"+username  +"')" ;
            k = 0;
            //out.println(sql+"<br>");
            k = db.execUpdate(sql);

              sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values("+"'" + customer_ip + "','NA','"  + db_sche+ "','" + db_sid + "','" + username + "','"+username  +"')" ;
           l = 0;
            //out.println(sql+"<br>");
            l = db.execUpdate(sql);

            sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values("+"'" + customer_ip + "','NA','"  + db_sche+ "_APP','" + db_sid + "','" + username + "','"+username  +"')" ;
           m = 0;
            //out.println(sql+"<br>");
            m = db.execUpdate(sql);
            //if success
            if(j==1&&k==1&&l==1&&m==1){
                message_info+="staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",Grant Succeed! ";
                out.println("<font color=green><h4>staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",Grant Succeed! <font><br>");
                out.println("<font color=green><h4>staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+"_APP,SID:"+db_sid+",Grant Succeed! <font><br>");
            }else{
                message_info+="staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",Grant Failed! <br>";
                out.println("staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",Grant Failed! <br>");
                out.println("staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+"_APP,SID:"+db_sid+",Grant Failed! <br>");
            }
        } else {
            message_info+="staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",privileges existed! ";
            out.println("<font color=red><h4>staff:"+staff_name+",IP:"+customer_ip+",DB:"+db_sche+",SID:"+db_sid+",privileges existed!<font><br>");
        }

    }
}else{
    out.println("登录用户信息有误,请重新登录! ");
}
%>
<button onClick='window.close();'>Close</button>
<hr>
        <jsp:include page="includes/copyright.jsp" />
        <%db.close();%>
        </html>

