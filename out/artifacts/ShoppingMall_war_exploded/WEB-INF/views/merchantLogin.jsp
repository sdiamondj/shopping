<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/23
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家登录</title>
    <link href="/css/login.css" type="text/css" rel="stylesheet"/>
</head>
<body onload="alertMsg()">

<div class="top center">
    <div class="logo center">
        <a href="#"><img src="/images/logo.png" width="200px" height="98px"></a><span style="font-size: 45px;color: #d544ff">商家版</span>
        <span style="color: red;">请自觉遵守宪法和法律,拒绝违法犯罪行为,共建和谐社会,本平台一律实名!&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
        <a href="/JSP/customerLogin" style="font-size: 20px">前往顾客版</a>
    </div>

</div>
<form action="/merchant/merchantLogin" method="post" onSubmit="return merchantLoginBeforeSubmit(this);" class="form center">
    <div class="login">
        <div class="login_center">
            <div class="login_top">
                <div class="left fl">商家登录</div>
                <div class="right fr">您还不是我们的商家？<a href="/JSP/merchantRegister">立即注册</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div class="login_main center">
                <div class="username">商家id:&nbsp;
                    <input class="shurukuang" type="text" name="merchant_id" placeholder="请输入你的商家id或手机号"/>
                </div>
                <div class="username">密&emsp;码:&nbsp;
                    <input class="shurukuang" type="password" name="merchant_pwd" placeholder="请输入你的密码"/>
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
<script>
    function merchantLoginBeforeSubmit(ss) {
        if(ss.merchant_id.value==""||ss.merchant_pwd.value==""){
            alert("id或密码不能为空！");
            return false;
        }
        else{
            if(ss.code.value ==""){
                alert("验证码不能为空!");
                return false;
            }
            else
                return true;
        }
    }
</script>


</body>
</html>
