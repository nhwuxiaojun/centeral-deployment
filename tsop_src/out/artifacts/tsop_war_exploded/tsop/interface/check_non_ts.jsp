<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<%

    DBean db_check = new DBean();
    String sql_check = new String();
    String sql_add = new String();
    ResultSet rs_check, rs_add;
    System.out.println("------------------username-=" + session.getAttribute("username"));

    String domainUserName = request.getRemoteUser().toLowerCase().toString();
//String domainUserName = "ebaotech\\Keen.wang@ebaotech.com";
//System.out.println(domainUserName);
    int slashIndex1 = domainUserName.indexOf("\\");
    if (domainUserName != null && slashIndex1 != -1) {
        domainUserName = domainUserName.substring(slashIndex1 + 1);
    }
    int slashIndex2 = domainUserName.indexOf("@");
    if (domainUserName != null && slashIndex2 != -1) {
        domainUserName = domainUserName.substring(0, slashIndex2);
    }
    sql_check = "select count(*) from ts_user where lower(usr)='" + domainUserName.trim() + "' and (valid='1' or valid='2' or valid='3')";
    System.out.println(sql_check);
    rs_check = db_check.execSQL(sql_check);
    int rs_size_check = 0;
    //if(rs_size_check>0){

    while (rs_check.next()) {
        rs_size_check = rs_check.getInt(1);

    }
    System.out.println("------------------rs_size_check-=" + rs_size_check);
    if (rs_size_check > 0) {
        if (session.getAttribute("username") == null || "".equals(session.getAttribute("username"))) {
            session.setAttribute("username", domainUserName.trim());
        }
    } else {
        sql_add = "insert into ts_user(usr,valid) values('" + domainUserName.trim() + "','3')";
        System.out.println("New SQL:" + sql_add);
        db_check.execUpdate(sql_add);
        sql_add = "insert into a_user(usr,valid) values('" + domainUserName.trim() + "','3')";
        System.out.println("Old SQL:" + sql_add);
        db_check.execUpdate(sql_add);
        System.out.println("------------------no_auth-=");
        //response.sendRedirect("../no_auth.jsp");
        session.setAttribute("username", domainUserName.trim());
    }

// access log
    String audit_sql = new String();
    audit_sql = "insert into ts_access_log values(s_access_log__no.nextval,'" + session.getAttribute("username") + "',sysdate,'" + request.getRequestURL() + "','" + request.getQueryString() + "','" + request.getHeader("x-forwarded-for") + "')";
    System.out.println(audit_sql);
//db_check.execUpdate(audit_sql);

    db_check.close();
    rs_check.close();

    System.out.println("=======================================================");
    System.out.println("URI: " + request.getRequestURI());
    System.out.println("URL: " + request.getRequestURL());
    System.out.println("QueryString: " + request.getQueryString());
    System.out.println("Protocol: " + request.getProtocol());
    System.out.println("IP: " + request.getRemoteHost());
    System.out.println("Username: " + session.getAttribute("username"));
    System.out.println("-------------------------------------------------------");
// set no-cache for JSP files
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
