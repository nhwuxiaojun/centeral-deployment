<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.Tools" %>
<%
Properties props = new Properties();
props.put("mail.smtp.host","mail.ebaotech.com");
props.put("mail.smtp.auth","true");
//�趨�����ʼ�ʱ��Ҫ���������֤
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

//����Ϣ������������
BodyPart mdp = new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart����

content = "�°�ǰ�����Ӱ�ͼƬ�ĺã�";

mdp.setContent(content,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ
Multipart mm = new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart��
//��(��ʵ�Ͽ��Դ�Ŷ��)
mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
message.setContent(mm);//��mm��Ϊ��Ϣ���������
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