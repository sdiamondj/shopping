<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/17
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顾客注册</title>
    <link href="/css/login.css" type="text/css" rel="stylesheet"/>
</head>

<body onload="alertMsg()">


<div class="regist">
        <div class="regist_center">
            <div class="regist_top">
                <div class="left fl">用户注册</div>
                <div class="right fr">已有账号？<a href="/JSP/customerLogin">返回登录</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <form action="/customer/customerRegister" method="post" onSubmit="return customerRegisterBeforeSubmit(this);">
                <div class="regist_main center">
                    <div class="username">用&emsp;户&emsp;名:&emsp;
                        <input class="shurukuang" type="text" name="customer_name" id="customer_name" placeholder="请输入你的用户名"/>
                        <span>*</span><label id="checkName"></label>
                    </div>
                    <div class="username">密&emsp;&emsp;&emsp;码:&emsp;
                        <input class="shurukuang" type="password" name="customer_pwd" id="customer_pwd" placeholder="请输入你的密码"/>
                        <span>*</span>
                    </div>
                    <div class="username">确认密码:&emsp;&emsp;
                        <input class="shurukuang" type="password" name="customer_pwd2" id="customer_pwd2" placeholder="请确认你的密码"/>
                        <span>*</span><label id="checkPwd"></label>
                    </div>
                    <div class="username">手&emsp;机&emsp;号:&emsp;
                        <input class="shurukuang" type="text" name="customer_phone" id="customer_phone" placeholder="请填写正确的手机号"/>
                        <span>*</span><label id="checkPhone"></label>
                    </div>
                    <div class="username">
                        <div class="left fl">验&emsp;证&emsp;码:&emsp;
                            <input class="yanzhengma" type="text" name="code" placeholder="请输入验证码"/><span>*</span>
                        </div>
                        <div class="right fl"><img src="/image/code" id="codeImage" style="cursor:pointer;" onclick="changeCode()"></div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="regist_submit">
                    <input class="submit" type="submit" name="submit" value="立即注册" ><br>
                </div>
        </form>
</div>
</div>
<footer style="position: relative;top:100px;">
    <div class="copyright">南昌大学版权所有-赣ICP备10046444-赣公网安备11010802020134号-赣ICP证110507号</div>
</footer>
<img src="/images/logo.png" style="position: absolute;left:900px;top:220px;">
<script  type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/simple.js"></script>
<script type="text/javascript">
    var msg = "${rtMsg}";
</script>
<script>
    $("#customer_name").change(function(){
        $.ajax({
            data:{"customer_sth":$("#customer_name").val()},
            type:"post",
            url:"/customer/isRegistered",
            dateType: "json",
            success:function (msg) {
                var label=document.getElementById("checkName");
                if(msg==true){
                    label.innerText="用户名可以使用";
                    label.style.setProperty('color','green');
                }
                else {
                    label.innerText = "用户名已存在";
                    label.style.setProperty('color','red');
                }
            },
        });
    });
    $("#customer_pwd2").change(
        function () {
            var label=document.getElementById("checkPwd");
            label.innerText = "";
            if($("#customer_pwd").val()!=$("#customer_pwd2").val()){
                label.innerText = "两次输入的密码不相等!";
                label.style.setProperty('color','red');
            }
        }
    )
    $("#customer_phone").change(function(){
        $.ajax({
            data:{"customer_sth":$("#customer_phone").val()},
            type:"post",
            url:"/customer/isRegistered",
            dateType: "json",
            success:function (msg) {
                var label=document.getElementById("checkPhone");
                if(msg==true){
                    label.innerText="手机号可以使用";
                    label.style.setProperty('color','green');
                }
                else {
                    label.innerText = "手机号已存在";
                    label.style.setProperty('color','red');
                }
            },
        });
    });
    function changeCode(){
        var rad = Math.floor(Math.random() * Math.pow(10, 8));
        //uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
        $("#codeImage").attr("src", "/image/code.action?uuuy="+rad);
    }

</script>

</body>
</html>
