<%@ page language="java" contentType="text/html; charset=utf-8"%>  
<%  
        String path = request.getContextPath();  
        String basePath = request.getScheme() + "://"  
                + request.getServerName() + ":" + request.getServerPort()  
                + path + "/";  
	System.out.println("Uploadify base path:"+basePath);
	System.out.println("Uploadify path:"+path);
    %>      
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
      <head>  
        <base href="<%=basePath%>">  
          
        <title>Uploadify Testing</title>  
          
     <link href="scripts/uploadify/uploadify.css" rel="stylesheet" type="text/css" />  
     <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>  
     <script type="text/javascript" src="scripts/uploadify/jquery.uploadify.js"></script>  
    <script type="text/javascript">  
    $(document).ready(function() {  
     $("#uploadify").uploadify({  
                    'auto'           : false,  
                    'swf'            : '<%=basePath%>/tsop/scripts/uploadify/uploadify.swf',  
                    'uploader'       : '<%=basePath%>/tsop/uploadify',//后台处理的请求  
		    'folder'	: "/usr/local/deploy/null",
                    'queueID'        : 'fileQueue',//与下面的id对应  
                    'queueSizeLimit' :1,  
                    'fileTypeDesc'   : 'rar文件或zip文件',  
                    'fileTypeExts'   : '*.rar;*.zip', //控制可上传文件的扩展名，启用本项时需同时声明fileDesc  
                    'multi'          : true,  
                    'buttonText'     : 'files',
		'scriptData': {'name':'jiangtao','age':22 },
		'method' : "GET"
     });  
    });  
    </script>  
     </head>  
    <body>  
            <div id="fileQueue"></div>  
            <input type="file" name="uploadify" id="uploadify" />  
            <p>  
                <a href="javascript:$('#uploadify').uploadify('upload')">upload</a>
                <a href="javascript:$('#uploadify').uplaodify('cancel','*')">cancel</a>
            </p>  
      </body>  
    </html>  
