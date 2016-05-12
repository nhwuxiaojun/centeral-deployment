<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title>检测服务器列表</title>
</head>
<body>
<%
String path=request.getRealPath(".") + "/";
FileWriter fw=new FileWriter(path + "db.log");//建立FileWriter对象，并实例化fw
//将字符串写入文件
fw.write("192.168.0.1 7001 USER1 PASSWORD1");
fw.write("\n");
fw.write("192.168.0.2 7002 USER2 PASSWORD2");
fw.write("\n");
fw.write("192.168.0.3 7003 USER3 PASSWORD3");
fw.write("\n");
fw.write("192.168.0.4 7004 USER4 PASSWORD4");
fw.write("\n");
fw.write("192.168.0.5 7005 USER5 PASSWORD5");
fw.write("\n");
fw.close();
FileReader fr=new FileReader(path + "db.log");
BufferedReader br=new BufferedReader(fr);//建立BufferedReader对象，并实例化为br
int c = 0;//从文件中读取一个字符
//判断是否已读到文件结尾
out.print("<table border=\"1\" align=\"center\" width=\"80%\"><caption>检测服务器列表</caption><tr><td width=\"25%\" align=\"center\">");
while(c!=-1){
  c=fr.read();//从文件中继续读取数据
  if(c==10){//判断是否为换行字符
    out.print("</tr><tr><td width=\"25%\" align=\"center\">");
    //out.print("<br>");//输出换行标签
    //fr.skip(1);//略过一个字符
  }else{
  	if(c==32){//判断是否为空格字符
 	  //out.print("|");//输出读到的数据
	  out.print("</td><td width=\"25%\" align=\"center\">");
	}else{
	  out.print((char)c);//输出读到的数据
	}
  }
}
out.print("</td></tr></table>");
fr.close();
%>
<br><br>
<div align="center"><input type="button" name="button1" value="添加" onClick="add()"></div>
</body>
<script language="javascript">
function add(){
  window.location = "server_add.jsp";
}
</script>
</html>