<html>
<head>
<script type="text/javascript" src="/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("input").keyup(function(){
    txt=$("input").val();
    $("span").load("gethint.php",{suggest:txt});
  });
});
</script>
</head>
<body>
<p>�����������������������֣�a �� z ���ַ�����</p>
���֣�<input name="q" type="text" />
<p>���飺<span></span></p>
<p>ע�ͣ������� <a href="/ajax/ajax_asp_php.asp" target="_blank">AJAX �̳�</a> �н����������ʹ�õ��ļ���gethint.asp����</p>
</body>
</html>