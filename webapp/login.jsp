<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
    <title>Login</title>
    <script src="${ctxStatic}/jquery.cookie.js"></script>
    <script>

        function foo() {
            alert("hello");
        }

        $(document).ready(function () {
            //拿到cookie
            var username = $.cookie("username");

            $('#username').val(username);

            setInterval(function () {
                $('div.alert-warning').hide("slow");
            },3000)
        });

        /*$(document).ready(function () {
            //取username和passwordTalent
            debugger;
            var username = $.cookie('username');
            var password = $.cookie('password');
            // document.getElementById("username").value = username;

            //通过jquery的选择器获得input对象并且赋值
            $('#username').val(username);
            $('#password').val(password);
        });*/

        //拿到所有的cookie
        /*function getCookies() {
            var cookies = document.cookie;
            var cookkieArr = cookies.split(";");
            for(var i=0;i<cookkieArr.length;i++){
                console.log(cookkieArr[i]);
                var keyValue = cookkieArr[i].split("=");
                //"username=root"
                keyValue = ["username","root"];
                console.log(keyValue[0]);
                console.log(keyValue[1]);
                if("username"==keyValue[0]){
                    var usernameInput = document.getElementById("username");
                    debugger;
                    usernameInput.value = keyValue[1];
                }
            }
        }


        window.onload = function () {
            getCookies();
        };*/


    </script>
</head>

<body>
<c:if test="${message != null}">
    <div class="alert alert-warning" role="alert">${message}</div>
</c:if>

<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="${ctxStatic}/img/logo.gif" alt="Klorofil Logo">
                            </div>
                            <p class="lead">请输入账号登录</p>
                        </div>
                        <form class="form-auth-small" action="${ctx}/login" method="post">
                            <div class="form-group">
                                <label for="username" class="control-label sr-only">Email</label>
                                <input type="text" name="username" class="form-control" id="username" value=""
                                       placeholder="登录名">
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label sr-only">Password</label>
                                <input type="password" name="password" class="form-control" id="password" value=""
                                       placeholder="密码">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox" name="remember" value="remember">
                                    <span>保存登录信息</span>
                                </label>
                            </div>
                            <button type="submit"  class="btn btn-primary btn-lg btn-block">登录</button>
                            <%--<div class="bottom">
                                <span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot password?</a></span>
                            </div>--%>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">HR人事管理系统</h1>
                        <p>作者：钱XX,宝XX</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>

