<%-- 
    Document   : index
    Created on : 2018/11/26, 下午 03:36:04
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>登入畫面</title>

        <link href="login.css" rel="stylesheet" type="text/css">
    </head>


    <body>


        <div class="login">
            <form method=post name=FORM1> 
                <h1>後台管理系統</h1>
                <p>密碼：<input type="password" name="pwd" size="20"  onkeydown='runScript(event)'></p>
                <input name=button1 type=button value="登入" onClick='SS()'><br>
            </form>
            <script type="text/javascript">

                function CheckData()
                {
                    if (FORM1.pwd.value === "")
                    {
                        window.alert("請輸入密碼");
                    } else
                        FORM1.submit();
                }

                function SS()
                {
                    document.FORM1.action = "SS.jsp";
                    CheckData();
                }

                function runScript(event) {
                    if (event.which === 13 || event.keyCode === 13) {
                        SS();
                    }
                }
            </script>	


        </div>
    </body>
</html>
