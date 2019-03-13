<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/24
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改店铺信息</title>
    <link href="/css/login.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div class="regist">
    <div class="regist_center">
        <div class="regist_top">
            <div class="left fl">信息修改</div>
            <div class="right fr"><span style="color: red;font-size: 18px;">信息一旦提交修改,店铺将被锁定,原有商品暂时无法管理,商家功能暂无法实现,请认真考虑!</span></div>
            <div class="clear"></div>
            <div class="xian center"></div>
        </div>
        <form action="/merchant/updateInfo" method="post" onSubmit="return merchantRegisterBeforeSubmit(this);">
            <div class="regist_main center">
                <div class="username">店&emsp;铺&emsp;名:&emsp;
                    <input class="shurukuang" type="text" name="merchant_name" id="merchant_name" placeholder="请输入你的店铺名" value="${merchant.merchant_name}"/>
                    <span>*</span>
                </div>
                <div class="username">密&emsp;&emsp;&emsp;码:&emsp;
                    <input class="shurukuang" type="password" name="merchant_pwd" id="merchant_pwd" placeholder="请输入你的密码" value="${merchant.merchant_pwd}"/>
                    <span>*</span>
                </div>
                <div class="username">确认密码:&emsp;&emsp;
                    <input class="shurukuang" type="password" name="merchant_pwd2" id="merchant_pwd2" placeholder="请确认你的密码" value="${merchant.merchant_pwd}"/>
                    <span>*</span><label id="checkPwd"></label>
                </div>
                <div class="username">店铺&emsp;类型:&emsp;
                    <input class="shurukuang" type="text" name="merchant_category" id="merchant_category" placeholder="请填写你的店铺的主营类型" value="${merchant.merchant_category}"/>
                    <span>*</span>
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
                <input class="submit" type="submit" name="submit" value="立即提交" onclick="alert('修改完成,请重新登录!')"><br>
            </div>
        </form>
    </div>
</div>

<script  type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/simple.js"></script>

<script type="text/javascript">
    var msg = "${rtMsg}";
</script>
<script>
    $("#merchant_pwd2").change(
        function () {
            var label=document.getElementById("checkPwd");
            label.innerText = "";
            if($("#merchant_pwd").val()!=$("#merchant_pwd2").val()){
                label.innerText = "两次输入的密码不相等!";
                label.style.setProperty('color','red');
            }
        }
    )
    function changeCode(){
        var rad = Math.floor(Math.random() * Math.pow(10, 8));
        //uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
        $("#codeImage").attr("src", "/image/code.action?uuuy="+rad);
    }
</script>

<script>

    function merchantRegisterBeforeSubmit(ss) {
        if(ss.merchant_name.value==""||ss.merchant_pwd.value==""||ss.merchant_pwd2.value==""){
            alert("店铺名或密码不能为空！");
            return false;
        }
        else{
            if(ss.merchant_phone.value==""){
                alert("手机号不能为空");
                return false;
            }
            else{
                if(ss.merchant_category.value==""){
                    alert("店铺类型不能为空!");
                    return false;
                }
                else{
                    if(ss.code.value==""){
                        alert("验证码不能为空");
                        return false;
                    }
                    else{
                        if(ss.merchant_pwd.value!=ss.merchant_pwd2.value){
                            alert("两次输入的密码不一致!")
                            return false;
                        }
                        else
                            return true;
                    }
                }
            }
        }
    }

</script>

</body>
</html>
