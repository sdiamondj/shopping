<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/20
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<style>
    .cp{
        width: 80px;
        height: 80px;
    }
</style>

<body onload="getTotal()">



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
            <a href="/order/myOrder/${sessionScope.customer.customer_id}"
            style="font-size: 25px;color: #ff3f9a;position: relative;left: 200px;">订单中心</a>
        <div class="clear"></div>
    </div>
</div>
<div class="xiantiao"></div>
<div class="gwcxqbj" style="height: auto;">
    <div class="gwcxd center">
        <div class="top2 center">
            <div class="sub_top fl">
            </div>
            <div class="sub_top fl">商品名称</div>
            <div class="sub_top fl">单价</div>
            <div class="sub_top fl">数量</div>
            <div class="sub_top fl">小计</div>
            <div class="sub_top fr">操作</div>
            <div class="clear"></div>
        </div>
        <c:if test="${cart.get(0).product_price!=0}">
        <c:forEach var="cart" items="${cart}" varStatus="status">
            <div class="content2 center">
                <div class="sub_content fl ">
                </div>
                <div class="sub_content fl" style="position: relative;top:25px;">
                    <img src="${cart.product_picture}" class="cp"></div>
                <div class="sub_content fl ft20">${cart.product_name}</div>
                <div class="sub_content fl ">￥${cart.product_price}</div>
                <div class="sub_content fl" style="position: relative;top:10px;">
                    <input type="hidden" id="singlePrice${status.index}" value="${cart.product_price}">
                    <input type="hidden" id="index${status.index}" value="${status.index}">
                    <input class="shuliang" type="number" value="${cart.product_count}" step="1" min="1" id="number${status.index}">
                </div>
                <div class="sub_content fl"><span>￥</span><span id="totalspan${status.index}">${cart.product_total_price}</span></div>
                <div class="sub_content fl"><a href="/cart/deleteFromCart?cart_id=${cart.cart_id}">×</a></div>
                <div class="clear"></div>
            </div>
        </c:forEach>
        </c:if>
    </div>
    <div class="jiesuandan mt20 center">
        <div class="tishi fl ml20">
            <ul>
                <li>共<span><c:if test="${cart.get(0).product_price==0}">0</c:if>
                    <c:if test="${cart.get(0).product_price!=0}">${cart.size()}</c:if></span>种商品</li>
            </ul>
        </div>
        <div class="jiesuan fr">
            <div class="jiesuanjiage fl">合计（不含运费）：<span id="totalMoney">0</span>元</div>
            <form method="post" action="/order/submitOrder">
                <span style="position: relative;left: -700px;font-size: 20px;">收货地址:</span><input name="order_address" id="order_address" type="text" style="width: 350px;height: 50px;font-size: 18px;position: relative;left: -400px;top:-50px;">
                <input type="hidden" name="customer_id" value="${sessionScope.customer.customer_id}">
                <input type="hidden" name="order_count" id="order_count" value="0">
                <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="提交订单" onclick="return successalert();" style="position: relative;top:-105px;"/></div>
            </form>
                <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>
<script>
    var size=${cart.size()};
    var price=${cart.get(0).product_price};
    function getTotal() {
        var total=0;
        if(size>0 && price != 0){
            for(var i=0; i<size;i++){
                var singlePrice=$("#singlePrice"+i).val();
                var count=$("#number"+i).val();
                total += singlePrice * count;
            }
            $("#order_count").val(total);
            $("#totalMoney").text(total);
        }
    }
    function successalert() {
        if(size>0 && price !=0){
            if($("#order_address").val()==""){
                alert("收货地址不能为空!");
                return false;
            }
            else{
                alert("订单提交成功!");
                return true;
            }
        }
        else{
            alert("购物车为空!");
            return  false;
        }
    }

</script>
<script type="text/javascript" src="/js/jquery.min.js"></script>

<script>
    for(var i=0;i<size;i++){
        (function (i) {
            $("#number"+i).change(function(){
                $.ajax({
                    data:{"product_count":$("#number"+i).val(),"index":$("#index"+i).val()},
                    type:"post",
                    url:"/cart/updateCount",
                    dateType: "text",
                    success:function (msg) {
                        if(msg==true){
                            var count=$("#number"+i).val();
                            var price=$("#singlePrice"+i).val();
                            var total=count * price;
                            $("#totalspan"+i).text(total.toFixed(1));
                            getTotal();
                        }
                    }
                });
            });
        })(i)
    }
</script>
</body>
</html>
