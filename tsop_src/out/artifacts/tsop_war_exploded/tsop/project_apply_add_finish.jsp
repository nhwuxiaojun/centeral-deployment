<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.SYSDBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
    <title>搭建申请答复提交处理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%@include file="includes/head.html" %>
<%
    DBean db = new DBean();
    String sql_temp = new String();
    String sql_temp_read = new String();
    String sql_temp_app = new String();
    String sql_temp_oper = new String();
    String sql = new String();
    String sql_apply = new String();
    String sql_checkdb = new String();
    String sql_updatedb = new String();
    String sql_ip = new String();
    String shell = new String();
    String shell_ex = new String();
    String url = new String();
    String error = new String();
    ResultSet rs;
    ResultSet rs_apply;
    ResultSet rs_ip;
    ResultSet rs_checkdb;
    int i = 0;
    int j = 0;
    int k = 0;
    int l = 0;
    int h = 0;
    int id = 0;
    int flag = 0;
    String new_env = new String();
    String mac_ip = new String();
    String env_ip = new String();
    String db_sid = new String();
    String db_ldap_name = new String();
    String db_ip = new String();
    String print_ip = new String();
    String owner_name = new String();
    String file_dir = new String();
    String datestr = new String();
    String app_user = new String();
    String app_dir = new String();
    String app_soft = new String();
    String proj_code = new String();

    String appsoft_ver = new String();
    String env_creator = new String();
    String db_creator = new String();
    String db_port_num = new String();
    String proposer = new String();
    String proj_grp = new String();
    int apply_year = 0;
    int apply_month = 0;
    int apply_date = 0;
    int apply_hour = 0;
    int apply_minute = 0;
    int apply_second = 0;
    int db_size = 0;
    int db_conut_flag = 0;


    new_env = request.getParameter("new_env").trim().toUpperCase();
    mac_ip = Tools.toGB(request.getParameter("mac_ip").trim());
    if (!"".equals(request.getParameter("env_ip_input"))) {
        env_ip = request.getParameter("env_ip_input").trim();
    } else {
        env_ip = request.getParameter("env_ip").trim();
    }
    System.out.println(request.getParameter("onsite_env"));
    db_sid = Tools.toGB(request.getParameter("db_sid").trim());
    db_ldap_name = request.getParameter("db_ldap_name").trim();
    db_ip = Tools.toGB(request.getParameter("db_ip").trim());
    print_ip = Tools.toGB(request.getParameter("print_ip").trim());
    owner_name = Tools.toGB(request.getParameter("owner_name").trim());
    file_dir = Tools.toGB(request.getParameter("file_dir").trim());
    app_user = Tools.toGB(request.getParameter("app_user").trim());
    app_dir = Tools.toGB(request.getParameter("app_dir").trim());

    System.out.println("onsite_env is:" + request.getParameter("onsite_env"));
    System.out.println("send_email is:" + request.getParameter("send_email"));

    if ("1".equals(request.getParameter("onsite_env"))) {
        response.sendRedirect("project_apply_manage.jsp?info=Create Succeed!");
    }


    sql_temp = "select * from  a_db_svr_main where rownum=1 and  db_sid = '" + db_sid + "'";
    System.out.println(sql_temp);
    try {
        rs = db.execSQL(sql_temp);
        if (rs.next()) {
            db_port_num = String.valueOf(rs.getInt("db_port_num"));
        }
    } catch (Exception e) {
        e.printStackTrace();
        error = e.toString();
    }


    sql_apply = "select * from a_apply where upper(new_env) = '" + new_env + "'";
    System.out.println(sql_apply);
    try {
        rs_apply = db.execSQL(sql_apply);
        while (rs_apply.next()) {
            appsoft_ver = rs_apply.getString("app_soft");
            env_creator = rs_apply.getString("env_creator");
            db_creator = rs_apply.getString("db_creator");
            apply_year = rs_apply.getDate("apply_time").getYear() + 1900;
            apply_month = rs_apply.getDate("apply_time").getMonth() + 1;
            apply_date = rs_apply.getDate("apply_time").getDate();
            apply_hour = rs_apply.getTime("apply_time").getHours();
            apply_minute = rs_apply.getTime("apply_time").getMinutes();
            apply_second = rs_apply.getTime("apply_time").getSeconds();
            proposer = rs_apply.getString("proj_proposer");
            db_size = rs_apply.getInt("db_size");
            app_soft = rs_apply.getString("app_soft");
            proj_code = rs_apply.getString("proj_code");
            proj_grp = rs_apply.getString("proj_grp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        error = e.toString();
    } // end of try

    url = "jdbc:oracle:thin:@" + db_ip + ":" + db_port_num + ":" + db_sid;
    System.out.println("Target DB to create user:" + url);

    DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new java.util.Date();
    datestr = df.format(date);

    sql_checkdb = " select count(1) count_db from a_db_svr where upper(db_user)= upper('" + owner_name + "') ";
    try {
        rs_checkdb = db.execSQL(sql_checkdb);
        System.out.println(sql_checkdb);
        while (rs_checkdb.next()) {
            if (rs_checkdb.getInt("count_db") > 0) {
                db_conut_flag = 1;
            }
        }
        rs_checkdb.close();
    } catch (Exception e) {
        e.printStackTrace();
        error = e.toString();
    } //end of try

    if (db_conut_flag == 1) {
        response.sendRedirect("project_apply_add.jsp?info=Database username existed, please re-input!");
    } else {


        sql_temp = "select a_supply__id.nextval as id from dual";
        //out.print(sql_temp+"<br>");
        try {
            rs = db.execSQL(sql_temp);
            if (rs.next()) {
                id = rs.getInt("id");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            error = e.toString();
        }

        sql_ip = "select * from a_proj_env_svr_del where trim(env_ip) = '" + env_ip.trim() + "'";
        rs_ip = db.execSQL(sql_ip);
        while (rs_ip.next()) {
            flag = 1;
            l = db.execUpdate("update a_proj_env_svr_del set env_ip_state = 'YES' where env_ip = '" + env_ip + "'");
        }
        rs_ip.close();


        System.out.println("Start to create db account..:" + owner_name + ":" + file_dir + ":" + db_size + "\n");
        try {
            System.out.println("create db account...\n");
            //DBADBean dbadb = new DBADBean(url,"dbadmin","dbadmin");
            SYSDBADBean dbadb = new SYSDBADBean(url, "sys", "EbaoDba0730");
            Connection conn = dbadb.getConnection();
            String procedure1 = "{call p_create_user(?,?,?)}";
            CallableStatement cstmt1;
            cstmt1 = conn.prepareCall(procedure1);
            cstmt1.setString(1, owner_name);
            cstmt1.setString(2, file_dir);
            cstmt1.setInt(3, db_size);
            cstmt1.execute();
            System.out.println("End of create db account...\n");
            conn.close();
            dbadb.close();
        } catch (Exception e) {
            e.printStackTrace();
            error = e.toString();
            response.sendRedirect("project_apply_manage.jsp?info=Create Failed! create db account Failed<br>" + error);
        }

        //db.close();
        System.out.println("send_email:" + request.getParameter("send_email") + "\n");
        System.out.println("flag:" + Integer.toString(flag) + "\n");
        if (flag == 1) {
            //	if(j==1&&k==1){
            if ("1".equals(request.getParameter("send_email"))) {
                System.out.println("If Start to send email...");
                Properties props = new Properties();
                props.put("mail.smtp.host", "mail.ebaotech.com");
                props.put("mail.smtp.auth", "true");
                Session s = Session.getInstance(props);
                String content = new String();
                MimeMessage message = new MimeMessage(s);
                InternetAddress from = new InternetAddress("op@ebaotech.com");
                message.setFrom(from);
                if (env_creator.equals(db_creator)) {
                    InternetAddress toAddress[] = new InternetAddress[1];
                    toAddress[0] = new InternetAddress(env_creator + "@ebaotech.com");
                    message.setRecipients(Message.RecipientType.TO, toAddress);
                } else {
                    InternetAddress toAddress[] = new InternetAddress[2];
                    toAddress[0] = new InternetAddress(env_creator + "@ebaotech.com");
                    toAddress[1] = new InternetAddress(db_creator + "@ebaotech.com");
                    message.setRecipients(Message.RecipientType.TO, toAddress);
                }
                //InternetAddress ccAddress = new InternetAddress("op@ebaotech.com");
                //message.addRecipient(Message.RecipientType.CC,ccAddress);
                message.setSubject("New Environment Information: " + new_env);
                message.setDataHandler(new DataHandler(message, "text/html"));
                BodyPart mdp = new MimeBodyPart();
                content = "Environment Name: " + new_env + "<br>";
                content = content + "======================================<br>";
                //	content = content + "APP SERVER: " + mac_ip + "<br>";
                content = content + "APP IP: " + env_ip + "<br>";
                content = content + "APP USER: " + app_user.toLowerCase() + "<br>";
                content = content + "APP PASSWORD: " + app_user.toLowerCase() + "<br>";
                content = content + "APP DIR: " + app_dir + "<br>";
                content = content + "======================================<br>";
                content = content + "DB SERVER: " + db_ip + "<br>";
                content = content + "DB PORT: " + db_port_num + "<br>";
                content = content + "DB SID: " + db_sid + "<br>";
                content = content + "JDBC Connection: " + "jdbc:oracle:thin:@" + db_ip + ":" + db_port_num + ":" + db_sid;
                content = content + "<br>LDAP TNSNAME: " + db_ldap_name + "<br>";
                if (owner_name == null || "".equals(owner_name)) {

                } else {
                    content = content + "Tablespace: " + owner_name + "_tbs<br>";
                    content = content + "DB Username/password:" + "<br>";
                    content = content + owner_name + "     " + owner_name + "pwd" + "<br>";
                    content = content + owner_name + "_APP     " + owner_name + "_APP_ONLY" + "<br>";
                    content = content + owner_name + "_READ     " + owner_name + "_READ_ONLY" + "<br>";
//						content = content + owner_name + "_OPER     " + owner_name + "_OPER_ONLY" + "<br>";
                }
                content = content + "======================================<br>";
                mdp.setContent(content, "text/html;charset=gbk");
                Multipart mm = new MimeMultipart();
                mm.addBodyPart(mdp);
                message.setContent(mm);
                message.saveChanges();
                //db.close();
                System.out.println("Start to create account and IP for new env by shell...");
                try {
                    Session s1 = Session.getInstance(props);
                    Transport transport = s1.getTransport("smtp");
                    transport.connect("mail.ebaotech.com", "op", "Sudn1105");
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                    shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/addcert.sh " + env_creator + " " + mac_ip;
                    System.out.print("Xiaojun'log: " + shell);
                    Runtime.getRuntime().exec(shell);
                    shell_ex = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/env_allocate.sh " + mac_ip + " " + env_ip + " " + new_env + " " + appsoft_ver;
                    System.out.print("Eymit'log: " + shell_ex);
                    Runtime.getRuntime().exec(shell_ex);
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            } else {
                try {
                    //Transport transport = s.getTransport("smtp");
                    //transport.connect("mail.ebaotech.com","op","Sudn1105");
                    //transport.sendMessage(message,message.getAllRecipients());
                    //transport.close();
                    shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/addcert.sh " + env_creator + " " + mac_ip;
                    System.out.print("Xiaojun'log: " + shell);
                    Runtime.getRuntime().exec(shell);
                    shell_ex = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/env_allocate.sh " + mac_ip + " " + env_ip + " " + new_env + " " + appsoft_ver;
                    System.out.print("Eymit'log: " + shell_ex);
                    Runtime.getRuntime().exec(shell_ex);
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            }
//				response.sendRedirect("project_apply_manage.jsp?info=Create Succeed!");
//			}else{
//				db.close();
//				response.sendRedirect("project_apply_manage.jsp?info=Create Failed!update Failed！<br>"+error);
//			}
        } else {
//			if(j==1&&k==1){
            if ("1".equals(request.getParameter("send_email"))) {
                System.out.println("else Start to send email...");
                Properties props = new Properties();
                props.put("mail.smtp.host", "mail.ebaotech.com");
                props.put("mail.smtp.auth", "true");
                Session s = Session.getInstance(props);
                String content = new String();
                MimeMessage message = new MimeMessage(s);
                InternetAddress from = new InternetAddress("op@ebaotech.com");
                message.setFrom(from);
                if (env_creator.equals(db_creator)) {
                    InternetAddress toAddress[] = new InternetAddress[1];
                    toAddress[0] = new InternetAddress(env_creator + "@ebaotech.com");
                    message.setRecipients(Message.RecipientType.TO, toAddress);
                } else {
                    InternetAddress toAddress[] = new InternetAddress[2];
                    toAddress[0] = new InternetAddress(env_creator + "@ebaotech.com");
                    toAddress[1] = new InternetAddress(db_creator + "@ebaotech.com");
                    message.setRecipients(Message.RecipientType.TO, toAddress);
                }
                //InternetAddress ccAddress = new InternetAddress("op@ebaotech.com");
                //message.addRecipient(Message.RecipientType.CC,ccAddress);
                message.setSubject("Reply of environment application: " + new_env);
                message.setDataHandler(new DataHandler(message, "text/html"));
                BodyPart mdp = new MimeBodyPart();
                content = "NEW ENVIRONMENT: " + new_env + "<br>";
                content = content + "======================================<br>";
                content = content + "APP SERVER: " + mac_ip + "<br>";
                content = content + "APP IP: " + env_ip + "<br>";
                content = content + "APP USER: " + app_user.toLowerCase() + "<br>";
                content = content + "APP PASSWORD: " + app_user.toLowerCase() + "<br>";
                content = content + "APP DIR: " + app_dir + "<br>";
                content = content + "======================================<br>";
                content = content + "DB SID: " + db_sid + "<br>";
                content = content + "DB PORT: " + db_port_num + "<br>";
                content = content + "DB SERVER: " + db_ip + "<br>";
                content = content + "JDBC Connection: " + "jdbc:oracle:thin:@" + db_ip + ":" + db_port_num + ":" + db_sid;
                content = content + "<br>LDAP TNSNAME: " + db_ldap_name + "<br>";
                if (owner_name == null || "".equals(owner_name)) {

                } else {
                    content = content + "Tablespace: " + owner_name + "_tbs<br>";
                    content = content + "DB Username/password:" + "<br>";
                    content = content + owner_name + "     " + owner_name + "pwd" + "<br>";
                    content = content + owner_name + "_APP     " + owner_name + "_APP_ONLY" + "<br>";
                    content = content + owner_name + "_READ     " + owner_name + "_READ_ONLY" + "<br>";
                    content = content + owner_name + "_OPER     " + owner_name + "_OPER_ONLY" + "<br>";
                }
                content = content + "======================================<br>";
                mdp.setContent(content, "text/html;charset=gbk");
                Multipart mm = new MimeMultipart();
                mm.addBodyPart(mdp);
                message.setContent(mm);
                message.saveChanges();
                //db.close();

                System.out.println("Start to create account and IP for new env by shell...");
                try {
                    Transport transport = s.getTransport("smtp");
                    transport.connect("mail.ebaotech.com", "op", "Sudn1105");
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                    shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/addcert.sh " + env_creator + " " + mac_ip;
                    System.out.print("Xiaojun'log: " + shell);
                    Runtime.getRuntime().exec(shell);
                    shell_ex = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/env_allocate.sh " + mac_ip + " " + env_ip + " " + new_env + " " + appsoft_ver;
                    System.out.print("Eymit'log: " + shell_ex);
                    Runtime.getRuntime().exec(shell_ex);
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            }
//				response.sendRedirect("project_apply_manage.jsp?info=Create Succeed!");
//			}else{
//				db.close();
//				response.sendRedirect("project_apply_manage.jsp?info=Create Failed!update Failed！<br>"+error);
//			}
        }

        try {
// start of app env insert

            String web_inst_path = "/usr/local/" + new_env.toLowerCase() + "/apache";
            String html_path = "NA";
            String appSoftLow = appsoft_ver.toLowerCase();
            String proj_dns = "http://" + env_ip + "/insurance/mainMenu.do";
            String env_user = new_env.toLowerCase();
            String env_pwd = new_env.toLowerCase();
            String app_name = appsoft_ver;
            String app_port = new String();
            String con_user = new String();
            String con_pwd = new String();
            String app_path = new String();
            String app_console = new String();
            String web_path = new String();
            String console_protocol = new String();
            String note = new String();
            String dms_type = new String();
            String apply_type = new String();
            String print_type = new String();
            String print_dir = "c:\\" + new_env.toLowerCase();

            System.out.println(appSoftLow);
            if (appSoftLow.indexOf("weblogic") == 0) {
                app_port = "7001";
                app_path = "/usr/local/weblogic/user_projects/domains/" + new_env.toLowerCase();
                con_user = "weblogic";
                con_pwd = "weblogic123";
            } else if (appSoftLow.indexOf("tomcat") == 0) {
                app_port = "8080";
                app_path = "/usr/local/tomcat";
                con_user = "tomcat";
                con_pwd = "tomcat";
            } else if (appSoftLow.indexOf("jues") == 0) {
                app_port = "9900";
                app_path = "/usr/local/jues";
                con_user = "jues";
                con_pwd = "jues";
            } else if (appSoftLow.indexOf("jboss") == 0) {
                app_port = "8093";
                app_path = "/usr/local/jboss";
                con_user = "admin";
                con_pwd = "admin";
            } else if (appSoftLow.indexOf("websphere") == 0 || appSoftLow.indexOf("was") == 0) {
                app_port = "9043";
                app_path = "/usr/local/was/IBM/WebSphere/AppServer/profiles/" + new_env.toLowerCase();
                web_inst_path = "/usr/local/was/IBM/HTTPServer";
                app_console = "ibm/console";
                console_protocol = "https";
                con_user = "admin";
                con_pwd = "admin";
            } else if (appSoftLow.indexOf("ias") == 0) {
                app_port = "6003";
                app_path = "/usr/local/ias";
                con_user = "ias10g";
                con_pwd = "ias10g";
            } else {
                app_port = "8080";
                app_path = "/usr/local/other";
                con_user = "admin";
                con_pwd = "admin";
            }
            String startup_script = app_path + "/restart.sh";
            app_console = "http://" + env_ip + ":" + app_port + "/console";

            sql = "insert into a_proj_env_svr(mac_ip,env_ip,proj_env,web_inst_path,html_path,app_name,app_inst_path,app_port,env_usr,env_pwd,con_usr,con_pwd,proj_grp,proj_dns,creater,crt_date,proposer,env_state,proj_code,env_id,startup_script,note,dms_type,apply_type,print_type,print_ip,print_dir,app_console) values('" + mac_ip + "','" + env_ip + "','" + new_env + "','" + web_inst_path;
            sql = sql + "','" + html_path + "','" + app_name + "','" + app_path + "','" + app_port + "','";
            sql = sql + env_user + "','" + env_pwd + "','" + con_user + "','" + con_pwd + "','";
            sql = sql + proj_grp + "','" + proj_dns + "','" + env_creator + "',sysdate,'" + proposer + "','running','" + proj_code + "'," + id + ",'" + startup_script + "','" + note + "','" + dms_type + "','" + apply_type + "','" + print_type + "','" + print_ip + "','" + print_dir + "','" + app_console + "')";

            // Submit into ts_env_db directly
            System.out.println(sql);
            i = db.execUpdate(sql);
// end of app env insert

            // insert owner, app, and oper user for db
            sql_temp = "insert into a_db_svr(db_ip,db_sid,db_ldap_name,db_user,db_user_passwd,db_user_type,proj_env,creater,db_status,proj_code,db_id) values('" + db_ip + "','" + db_sid + "','" + db_ldap_name + "','" + owner_name + "','" + owner_name + "pwd','owner','" + new_env + "','" + env_creator + "','running','" + proj_code + "',s_db__id.nextval)";
            System.out.println(sql_temp);
            h = db.execUpdate(sql_temp);
//		sql_temp_app = "insert into a_db_svr(db_ip,db_sid,db_ldap_name,db_user,db_user_passwd,db_user_type,proj_env,creater,db_status,proj_code,db_id) values('"+db_ip+"','"+db_sid+"','" + db_ldap_name + "','" + owner_name + "_app','" + owner_name + "_app_only','app','" + new_env + "','" + env_creator + "','running','" + proj_code  + "',s_db__id.nextval)";
//		h=db.execUpdate(sql_temp_app);
//		sql_temp_read = "insert into a_db_svr(db_ip,db_sid,db_ldap_name,db_user,db_user_passwd,db_user_type,proj_env,creater,db_status,proj_code,db_id) values('"+db_ip+"','"+db_sid+"','" + db_ldap_name + "','" + owner_name + "_read','" + owner_name + "_read_only','read','" + new_env + "','" + env_creator + "','running','" + proj_code  + "',s_db__id.nextval)";
//		h=db.execUpdate(sql_temp_read);
//		sql_temp_oper = "insert into a_db_svr(db_ip,db_sid,db_ldap_name,db_user,db_user_passwd,db_user_type,proj_env,creater,db_status,proj_code,db_id) values('"+db_ip+"','"+db_sid+"','" + db_ldap_name + "','" + owner_name + "_oper','" + owner_name + "_oper_only','oper','" + new_env + "','" + env_creator + "','running','" + proj_code  + "',s_db__id.nextval)";
//		h=db.execUpdate(sql_temp_oper);
            j = db.execUpdate("update a_apply set status='DONE' where new_env = '" + new_env + "' and status = 'DOING'");
            k = db.execUpdate("update a_ip set ip_status='YES' where trim(ip_list) = '" + env_ip.trim() + "'");
            sql = "insert into a_supply(id,new_env,mac_ip,env_ip,env_creator,db_sid,db_ip,print_ip,db_creator,env_status,db_status,owner_name,file_dir,app_user,app_dir,app_soft,db_ldap_name) values(" + id + ",'" + new_env + "','" + mac_ip + "','" + env_ip + "','" + env_creator + "','" + db_sid + "','" + db_ip + "','" + print_ip + "','" + db_creator + "','DONE','DONE','" + owner_name + "','" + file_dir + "','" + app_user + "','" + app_dir + "','" + app_soft + "','" + db_ldap_name + "')";
            // Submit into ts_env_db directly
            System.out.println(sql);
            i = db.execUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
            error = e.toString();
        }
        if (i == 1) {
            response.sendRedirect("project_apply_manage.jsp?info=Create Succeed!<br>" + error);
        } else {
            response.sendRedirect("project_apply_manage.jsp?info=Create Failed!insert Failed<br>" + error);
        }
        db.close();
    }
%>
<jsp:include page="includes/copyright.jsp"/>
</body>
</html>
