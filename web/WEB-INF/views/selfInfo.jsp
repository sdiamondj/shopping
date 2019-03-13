<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/23
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="/JSP/index">南大商城</a></li>
                <li>|</li>
                <li><a href="/JSP/merchantLogin">南大商城商家版</a></li>
                <li>|</li>
                <li><a href="/admin/login">后台管理系统</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="/cart/myCart" onclick="return checkLogin()" style="font-size:16px;">购物车</a></div>
            <div class="fr">
                <ul>
                    <c:if test="${sessionScope.customer==null}">
                        <li><a href="/JSP/customerLogin">登录</a></li>
                        <li>|</li>
                        <li><a href="/JSP/customerRegister">注册</a></li>
                    </c:if>
                    <c:if test="${sessionScope.customer!=null}">
                        <li><a href="/customer/self">${sessionScope.customer.customer_name},个人中心</a></li>
                        <li>|</li>
                        <li><a href="/customer/cancel">注销</a></li>
                    </c:if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <a href="/JSP/index" target="_blank"><div class="logo fl"><img src="/images/logo.png"></div></a>
    <div class="nav fl">
        <ul>
            <li><a href="/product/special?what=new">最新上架</a></li>
            <li><a href="/product/special?what=hot">热卖商品</a></li>
            <li><a href="/product/special?what=expensive">奢华品牌</a></li>
            <li><a href="/product/special?what=cheap">低价好物</a> </li>
            <li><a href="/product/special?what=NCU">南大超市</a></li>
            <li><a href="/JSP/VIPcenter" onclick="return checkLogin()">会员中心</a></li>
        </ul>
    </div>
    <div class="search fr">
        <form action="/product/productList" method="post">
            <div class="text fl">
                <input type="text" class="shuru" name="key" placeholder="搜商品、店铺" value="手机">
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>

<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl" style="position: fixed;top:200px;">
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="#" style="color:#ff6700;font-weight:bold;" >个人信息</a></li>
                    <li><a href="/order/myOrder/${sessionScope.customer.customer_id}">个人订单</a> </li>
                    <li><a href="/JSP/VIPcenter"  class="click">会员中心</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" id="buyincang" style="position: relative;top:25px;">
            <div class="rtcont fr">
                <div id="yincang">
                <div class="grzlbt ml40">我的资料</div>
                <div class="subgrzl ml40"><span>用户名</span><span style="font-size: 18px;">${customer.customer_name}</span></div>
                <div class="subgrzl ml40"><span>手机号</span><span id="sp1" style="font-size: 18px;">${customer.customer_phone}</span><span><a id="a1" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>密码</span><span id="sp2" style="font-size: 18px;">${customer.customer_pwd}</span><span><a id="a2" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>真实姓名</span><span id="sp3" style="font-size: 18px;">${customer.customer_trueName}&nbsp;</span><span><a id="a3" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>性别</span><span id="sp4" style="font-size: 18px;">${customer.customer_sex}&nbsp;</span><span><a id="a4" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>年龄</span><span id="sp5" style="font-size: 18px;"><c:if test="${customer.customer_age!=0}">${customer.customer_age}</c:if>&nbsp;</span><span><a id="a5" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>所在省份</span><span id="sp6" style="font-size: 18px;">${customer.customer_province}&nbsp;</span><span><a id="a6" href="javascript:" onclick="cg(this)">编辑</a></span></div>
                <div class="subgrzl ml40"><span>所在城市</span><span id="sp7" style="font-size: 18px;">${customer.customer_city}&nbsp;</span><span><a id="a7" href="javascript:" onclick="cg(this)">编辑</a></span></div><div class="subgrzl ml40"><span>注册时间</span><span style="font-size: 18px;">${customer.customer_regTime}</span></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>

    </div>
    </div>
</div>

<input type="text" style="position: absolute;left: 600px;top:315px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in1">
<input type="text" style="position: absolute;left: 600px;top:370px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in2">
<input type="text" style="position: absolute;left: 600px;top:426px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in3">
<input type="text" style="position: absolute;left: 600px;top:478px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in4">
<input type="number" min="1" step="1" style="position: absolute;left: 600px;top:545px;height: 40px;width: 100px;font-size: 18px;display: none;" id="in5">
<input type="text" style="position: absolute;left: 600px;top:600px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in6">
<input type="text" style="position: absolute;left: 600px;top:659px;height: 40px;width: 200px;font-size: 18px;display: none;" id="in7">




<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
    function cg(obj) {
        var index=obj.id.toString().substr(1);
        if($("#a"+index).text()=="编辑"){
            $("#a"+index).text("确认");
            var a=$("#sp"+index).text();
            $("#in"+index).val(a);
            $("#in"+index).css("display","block");
        }
        else {
            $("#a"+index).text("编辑");
            var data=$("#in"+index).val();
            $("#in"+index).css("display","none");
            $.ajax({
                data:{"index":index,"data":data},
                type:"post",
                url:"/customer/updateSelfInfo",
                dateType:"text",
                success:function (msg) {
                    if(msg==true){
                        $("#sp"+index).text(data);
                    }
                    else {
                        alert("该手机号已被注册!");
                    }
                }
            });

        }
    }
</script>



</body>
</html>
