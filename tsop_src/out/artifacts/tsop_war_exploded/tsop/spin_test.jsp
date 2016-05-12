<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI ��ת����Spinner�� - Ĭ�Ϲ���</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://jqueryui.com/resources/demos/external/jquery.mousewheel.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
  <script>
  $(function() {
    var spinner = $( "#spinner" ).spinner();
 
    $( "#disable" ).click(function() {
      if ( spinner.spinner( "option", "disabled" ) ) {
        spinner.spinner( "enable" );
      } else {
        spinner.spinner( "disable" );
      }
    });
    $( "#destroy" ).click(function() {
      if ( spinner.data( "ui-spinner" ) ) {
        spinner.spinner( "destroy" );
      } else {
        spinner.spinner();
      }
    });
    $( "#getvalue" ).click(function() {
      alert( spinner.spinner( "value" ) );
    });
    $( "#setvalue" ).click(function() {
      spinner.spinner( "value", 5 );
    });
 
    $( "button" ).button();
  });
  </script>
</head>
<body>
 
<p>
  <label for="spinner">ѡ��һ��ֵ��</label>
  <input id="spinner" name="value">
</p>
 
<p>
  <button id="disable">�л�����/����</button>
  <button id="destroy">�л�����</button>
</p>
 
<p>
  <button id="getvalue">��ȡֵ</button>
  <button id="setvalue">����ֵΪ 5</button>
</p>
 
 
</body>
</html>
