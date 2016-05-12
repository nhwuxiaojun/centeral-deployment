<%
if(session.getAttribute("username")==null||"".equals(session.getAttribute("username"))){
	String domainUserName = request.getRemoteUser().toString();
	int slashIndex1 = domainUserName.indexOf("\\");
	if (domainUserName != null&&slashIndex1 != -1) {
		domainUserName = domainUserName.substring(slashIndex1 + 1);
	}
	int slashIndex2 = domainUserName.indexOf("@");
	if (domainUserName != null&&slashIndex2 != -1) {
		domainUserName = domainUserName.substring(0,slashIndex2);
	}
	session.setAttribute("username",domainUserName.trim());
}
System.out.println("=======================================================");
System.out.println("URI: "+request.getRequestURI());
System.out.println("URL: "+request.getRequestURL());
System.out.println("QueryString: "+request.getQueryString());
System.out.println("Protocol: "+request.getProtocol());
System.out.println("IP: "+request.getRemoteHost());
System.out.println("Username: "+session.getAttribute("username"));
System.out.println("-------------------------------------------------------");
%>
