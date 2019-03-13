<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/17
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顾客登录</title>
    <link href="/css/login.css" type="text/css" rel="stylesheet"/>
</head>
<body onload="alertMsg()">

<div class="top center">
    <div class="logo center">
        <a href="#"><img src="/images/logo.png" width="200px" height="98px"></a>
        <span style="color: red;">为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！</span>
        <a href="/JSP/merchantLogin" style="font-size: 20px">前往商家版</a>
    </div>

</div>
<form action="/customer/customerLogin" method="post" onSubmit="return customerLoginBeforeSubmit(this);" class="form center">
    <div class="login">
        <div class="login_center">
            <div class="login_top">
                <div class="left fl">用户登录</div>
                <div class="right fr">您还不是我们的用户？<a href="/JSP/customerRegister">立即注册</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div class="login_main center">
                <div class="username">用户名:&nbsp;
                    <input class="shurukuang" type="text" name="customer_name" placeholder="请输入你的用户名或手机号"/>
                </div>
                <div class="username">密&emsp;码:&nbsp;
                    <input class="shurukuang" type="password" name="customer_pwd" placeholder="请输入你的密码"/>
                </div>
                <div class="username">
                    <div class="left fl">验证码:&nbsp;
                        <input class="yanzhengma" type="text" name="code" placeholder="请输入验证码"/>
                    </div>
                    <div class="right fl">
                        <img src="/image/code" id="codeImage"  style="cursor:pointer;" onclick="changeCode()">
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="login_submit">
                <input class="submit" type="submit" value="立即登录" >
            </div>
        </div>
    </div>
</form>
<footer>
    <div class="copyright">南昌大学版权所有-赣ICP备10046444-赣公网安备11010802020134号-赣ICP证110507号</div>
</footer>

<img src="/images/login_bg.png" style="position: absolute;left:100px;top:200px;">

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/simple.js"></script>
<script type="text/javascript">
    var msg = "${rtMsg}";
    function changeCode(){
        var rad = Math.floor(Math.random() * Math.pow(10, 8));
        //uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
        $("#codeImage").attr("src", "/image/code.action?uuuy="+rad);
    }
</script>
</body>
</html>
