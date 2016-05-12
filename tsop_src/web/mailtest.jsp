<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.Tools" %>
<%
Properties props = new Properties();
props.put("mail.smtp.host","mail.ebaotech.com");
props.put("mail.smtp.auth","true");
//设定发送邮件时需要进行身份验证
Session s = Session.getInstance(props);
String content = new String();
MimeMessage message = new MimeMessage(s);
InternetAddress from = new InternetAddress("jerry.lu@ebaotech.com");
message.setFrom(from);
//InternetAddress to = new InternetAddress("nsclaims@nissay-sva.com.cn");
InternetAddress to = new InternetAddress("skip.qian@ebaotech.com");
message.addRecipient(Message.RecipientType.TO,to);
message.setSubject("hello");
message.setDataHandler(new DataHandler(message,"text/html"));

//给消息对象设置内容
BodyPart mdp = new MimeBodyPart();//新建一个存放信件内容的BodyPart对象

content = "下班前给老子把图片改好！";

mdp.setContent(content,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
Multipart mm = new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
//象(事实上可以存放多个)
mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
message.setContent(mm);//把mm作为消息对象的内容
message.saveChanges();

try{
Transport transport = s.getTransport("smtp");
transport.connect("mail.ebaotech.com","op","Ebaotech2006");
transport.sendMessage(message,message.getAllRecipients());
transport.close();
}
catch(Exception e)
{
  System.err.println(e.getMessage());
}
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>mail test</title>
  </head>
  <body>
  <%out.println(request.getRealPath(""));%>
  </body>
</html>