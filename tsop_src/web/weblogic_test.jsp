<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>读取监测信息</title>
<meta http-equiv="refresh" content="10">
</head>
<body>
<%
String path=request.getRealPath(".") + "/";
FileWriter fw=new FileWriter(path + "mail.log");//建立FileWriter对象，并实例化fw
//将字符串写入文件
fw.write("cluster one");
fw.write("\n");
fw.write("15");
fw.write("\n");
fw.write("cluster two");
fw.write("\n");
fw.write("80");
fw.write("\n");
fw.write("cluster three");
fw.write("\n");
fw.write("390");
fw.close();

FileReader fr=new FileReader(path + "mail.log");
BufferedReader br=new BufferedReader(fr);//建立BufferedReader对象，并实例化为br
String Line=br.readLine();
//读取一行数据
//判断读取到的字符串是否不为空
/*
boolean isNumber(String s){
  for(int i=0;i<s.length();i++){
      char c = s.charAt(i);
      if(c>'9'||c<'0')
	    return false;
  }
  return true;
}
*/
int flag = 0;
while(Line!=null){
  flag = 0;
  for(int i=0;i<Line.length();i++){
    char c = Line.charAt(i);
    if(c>'9'||c<'0'){
	
	}else{
	  flag = flag + 1;
	}
  }
  out.print(flag + "<br>");
  if(flag==Line.length()){
  	out.print("OK" + "<br>");  
  }else{
  	out.print("ERR" + "<br>");
  }
  Line=br.readLine();//从文件中继续读取一行数据
}
br.close();//关闭BufferedReader对象
fr.close();
%>
</body>
</html>