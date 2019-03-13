<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/20
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>我的订单</title>
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
            <div class="ddzx">订单中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="#" style="color:#ff6700;font-weight:bold;" id="all" class="orderStatus" onclick="isClicked(this)">全部订单</a></li>
                    <li><a href="#" id="status0" class="orderStatus" onclick="isClicked(this)">待发货订单</a></li>
                    <li><a href="#" id="status1" class="orderStatus" onclick="isClicked(this)">待收货订单</a></li>
                    <li><a href="#" id="status2" class="orderStatus" onclick="isClicked(this)">待评价订单</a></li>
                    <li><a href="#" id="status3" class="orderStatus" onclick="isClicked(this)">已完成订单</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" id="buyincang" style="position: relative;top:25px;">
            <div class="ddzxbt">交易订单&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <a href="/JSP/index" style="position: relative;left:500px;">返回主页</a>
            </div>
            <div id="yincang">
        <c:forEach var="order" items="${order}" varStatus="status">
            <div class="ddxq">
                <div class="ddspt fl"><img src="${order.order_picture}" alt="" width="80px" height="80px"></div>
                <div class="ddbh fl" style="width: 180px;">订单号:${order.order_id}</div>
                <div class="ztxx fr" style="position: relative;">
                    <ul>
                        <c:choose>
                            <c:when test="${order.order_status==0}"><li>待发货</li></c:when>
                            <c:when test="${order.order_status==1}"><li>待收货</li></c:when>
                            <c:when test="${order.order_status==2}"><li>待评价</li></c:when>
                            <c:when test="${order.order_status==3}"><li>已完成</li></c:when>
                        </c:choose>
                        <li>${order.order_count}元</li>
                        <li style="width: 250px;">${order.order_generatedTime}</li>
                        <li><a href="/order/details?order_id=${order.order_id}" target="_blank">订单详情></a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>

        <div class="clear"></div>
        </c:forEach>
        </div></div>
        </div>

    </div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
    function isClicked(obj){
        $("#yincang").empty();
        var id=obj.getAttribute("id");
        $(".orderStatus").css("color","#757575");
        $("#"+id).css("color","#ff6700");
        $(".orderStatus").css("font-weight","normal");
        $("#"+id).css("font-weight","bold");
        $.ajax({
            data:{"order_status":id},
            type:"post",
            url:"/order/orderStatus",
            dateType:"json",
            success:function (date) {
                var obj=JSON.parse(date);
                var list='';
                for(var i in obj){
                    var order_id=obj[i].order_id;
                    var order_picture=obj[i].order_picture;
                    var order_status=obj[i].order_status;
                    var order_count=obj[i].order_count;
                    var order_generatedTime=obj[i].order_generatedTime;
                    list+='<div class="ddxq">\n' +
                        '                <div class="ddspt fl"><img src="'+order_picture+'" alt="" width="80px" height="80px"></div>\n' +
                        '                <div class="ddbh fl" style="width: 180px;">订单号:'
                        +order_id+'</div>\n' +
                        '                <div class="ztxx fr" style="position: relative;">\n' +
                        '                    <ul>';
                    if(order_status==0){
                        list+='<li>待发货</li>';
                    }
                    else if(order_status==1){
                        list+='<li>待收货</li>';
                    }
                    else if(order_status==2){
                        list+='<li>待评价</li>';
                    }
                    else {
                        list+='<li>已完成</li>'
                    }
                    list+='<li>'+order_count+'元</li>\n' +
                        '                        <li style="width: 250px;">'+order_generatedTime
                    +'</li>\n' +
                        '                        <li><a href="/order/details?order_id='+order_id+'" target="_blank">订单详情></a></li>\n' +
                        '                        <div class="clear"></div>\n' +
                        '                    </ul>\n' +
                        '                </div>\n' +
                        '                <div class="clear"></div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '        <div class="clear"></div>';
                }
                $("#yincang").prepend(list);
            }
        });
    }
</script>
</body>
</html>
