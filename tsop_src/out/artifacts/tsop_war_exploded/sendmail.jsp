<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*,java.util.*" %> 
<%@ page import="ebao.Tools" %> 
<html> 
<head> 
<title> JSP meets JavaMail, what a sweet combo.</title> 
</head> 
<body> 
<% 
try{ 
Properties props = new Properties(); 
Session sendMailSession; 
Store store; 
Transport transport; 
sendMailSession = Session.getInstance(props, null); 
props.put("mail.smtp.host", "mail.ebaotech.com"); 
Message newMessage = new MimeMessage(sendMailSession); 
newMessage.setFrom(new InternetAddress(request.getParameter("from"))); 
newMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("to"))); 
newMessage.setSubject(Tools.toGB(request.getParameter("subject"))); 
newMessage.setSentDate(new Date()); 
newMessage.setText(Tools.toGB(request.getParameter("text1"))); 
transport = sendMailSession.getTransport("smtp"); 
transport.send(newMessage); 
%> 
<p>Your mail has been sent.</p> 
<% 
} 
catch(MessagingException m) 
{ 
out.println(m.toString()); 
} 
%> 
</body> 
</html>