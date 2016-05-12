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
          
        <title>ÎÄ¼þÉÏ´«</title>  
          
     <link href="scripts/uploadify/uploadify.css" rel="stylesheet" type="text/css" />  
     <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>  
     <script type="text/javascript" src="scripts/uploadify/jquery.uploadify.js"></script>  
    <script type="text/javascript">  
    $(document).ready(function() {  
     $("#uploadify").uploadify({  
                    'auto'           : false,  
                    'swf'            : '<%=path%>/tsop/scripts/uploadify/uploadify.swf',  
                    'uploader'       : '<%=path%>/tsop/uploadify',//ºóÌ¨´¦ÀíµÄÇëÇó  
                    'queueID'        : 'fileQueue',//ÓëÏÂÃæµÄid¶ÔÓ¦  
                    'queueSizeLimit' :1,  
                    'fileTypeDesc'   : 'rarÎÄ¼þ»òzipÎÄ¼þ',  
                    'fileTypeExts'   : '*.rar;*.zip', //¿ØÖÆ¿ÉÉÏ´«ÎÄ¼þµÄÀ©Õ¹Ãû£¬ÆôÓÃ±¾ÏîÊ±ÐèÍ¬Ê±ÉùÃ÷fileDesc  
                    'multi'          : true,  
                    'buttonText'     : 'ÉÏ´«'  
     });  
    });  
    </script>  
     </head>  
    <body>  
            <div id="fileQueue"></div>  
            <input type="file" name="uploadify" id="uploadify" />  
            <p>  
                <a href="javascript:$('#uploadify').uploadify('upload')">¿ªÊ¼ÉÏ´«</a>   
                <a href="javascript:$('#uploadify').uplaodify('cancel','*')">È¡ÏûÉÏ´«</a>  
            </p>  
      </body>  
    </html>  
