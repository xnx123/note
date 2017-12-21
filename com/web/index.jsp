<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src="WEB-INF/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<a href="hello.do">1问候SpringMVC11111</a>
<button onclick="copyText1()">Copy Text</button>
</body>
<script>
    function copyText() {
        alert(123);
    }
    function copyText1()
    {
        $.ajax(
            {
                url:"hello.action",
                data:{"username":username,"age":age},
                type:"post",
                dataType:"json",
                success:function(data)
                {
                    alert(data);
                }
            }

        );
    }
</script>
</html>