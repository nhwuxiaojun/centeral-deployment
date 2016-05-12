<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<%

DBean db_check = new DBean();
String sql_check = new String();
ResultSet rs_check;
 System.out.println("------------------username-="+session.getAttribute("username"));

   String domainUserName = request.getRemoteUser().toLowerCase().toString();
  int slashIndex1 = domainUserName.indexOf("\\");
  if (domainUserName != null&&slashIndex1 != -1) {
	domainUserName = domainUserName.substring(slashIndex1 + 1);
  }
  int slashIndex2 = domainUserName.indexOf("@");
  if (domainUserName != null&&slashIndex2 != -1) {
	  domainUserName = domainUserName.substring(0,slashIndex2);
   }
    sql_check = "select count(*) from a_user where lower(usr)='" + domainUserName.trim().toLowerCase() + "' and (valid='1' or valid='2')";
//System.out.println(sql);
	rs_check = db_check.execSQL(sql_check);
	int rs_size_check=0;  
	//if(rs_size_check>0){
	
	 while(rs_check.next()){
	    rs_size_check=rs_check.getInt(1);
	       
	 }  
	 System.out.println("------------------rs_size_check-="+rs_size_check); 
	if(rs_size_check>0){
	    if(session.getAttribute("username")==null||"".equals(session.getAttribute("username"))){
		    session.setAttribute("username",domainUserName.trim());
	     }
	 }else{
	    System.out.println("------------------no_auth-="); 
	   response.sendRedirect("../no_auth.jsp");
	 }
	 
	db_check.close();
	rs_check.close();


response.setHeader("Cache-Control","no-cache"); //HTTP 1.1    
response.setHeader("Pragma","no-cache"); //HTTP 1.0    
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server    


System.out.println("=======================================================");
System.out.println("URI: "+request.getRequestURI());
System.out.println("URL: "+request.getRequestURL());
System.out.println("QueryString: "+request.getQueryString());
System.out.println("Protocol: "+request.getProtocol());
System.out.println("IP: "+request.getRemoteHost());
System.out.println("Username: "+session.getAttribute("username"));
System.out.println("-------------------------------------------------------");
%>
