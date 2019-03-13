<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/25
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        .cp{
            width: 80px;
            height: 80px;
        }
    </style>
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
            <div class="fr">
                <ul>
                    <li><a href="/JSP/merchantIndex">${sessionScope.merchant.merchant_name},返回商家主页</a></li>
                    <li>|</li>
                    <li><a href="/merchant/cancel" onclick="alert('注销成功')">注销</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>

<div class="banner_x center">
    <a href="/JSP/index"><div class="logo fl"><img src="/images/logo_mi.png" style="position: relative;
left: 25px;top:25px;"></div></a>

    <div class="wdgwc fl ml40">订单详情</div>
    <div class="wxts fl ml20"><span style="font-size: 25px;">订单号:${order.order_id}</span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="font-size: 25px;" id="statusSpan">订单状态:
        <c:choose>
            <c:when test="${order.order_status==0}">待发货</c:when>
            <c:when test="${order.order_status==1}">待收货</c:when>
            <c:when test="${order.order_status==2}">待评价</c:when>
            <c:when test="${order.order_status==3}">已完成</c:when>
        </c:choose>
        </span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="font-size: 25px;">订单更新时间:${order.order_generatedTime}</span></div>
    <div class="dlzc fr">
        <ul>
            <li><a href="/JSP/merchantIndex">返回主页</a></li>
            <li>|</li>
            <li><a href="/order/myOrder/${sessionScope.merchant.merchant_id}">我的订单</a></li>
        </ul>
    </div>
    <div class="clear"></div>
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
            <div class="sub_top fl">备注</div>
            <div class="clear"></div>
        </div>
        <c:forEach var="orderProduct" items="${orderProduct}" varStatus="status">
            <div class="content2 center">
                <div class="sub_content fl ">
                </div>
                <div class="sub_content fl" style="position: relative;top:25px;">
                    <img src="${orderProduct.product_picture}" class="cp"></div>
                <div class="sub_content fl ft20">${orderProduct.product_name}&emsp;<span style="font-size: 13px;color: #ff5930;">${orderProduct.merchant_name}</span></div>
                <div class="sub_content fl ">￥${orderProduct.product_price}</div>
                <div class="sub_content fl" style="position: relative;top:10px;">
                    <input class="shuliang" type="text" value="${orderProduct.product_count}" readonly>
                </div>
                <div class="sub_content fl"><span>￥${orderProduct.product_total_price}</span></div>
                <input type="hidden" id="order_id${status.index}" value="${orderProduct.order_id}">
                <input type="hidden" id="product_id${status.index}" value="${orderProduct.product_id}">
                <div class="sub_content fl"></div>
                <div class="clear"></div>
            </div>

        </c:forEach>
    </div>
    <div class="jiesuandan mt20 center">
        <div class="tishi fl ml20">
            <ul>
                <li>共<span>${orderProduct.size()}</span>种商品</li>
                <li>|</li>
                <li>收货地址:${order.order_address}</li>
            </ul>
        </div>
        <div class="jiesuan fr">
            <div class="jiesuanjiage fl">合计（不含运费）：<span id="totalMoney">${order.order_count}</span>元</div>
            <form method="post" action="/order/sureToPost">
                <input type="hidden" name="order_id" value="${order.order_id}">
                <input type="hidden" name="customer_id" value="${sessionScope.merchant.merchant_id}">
                <input type="hidden" name="order_count" id="order_count" value="0">
                <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="确认发货" onclick="return confirmGet();"/></div>
            </form>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>

<script>
    var status=${order.order_status}
    function confirmGet() {
        if(status==0){
            if(confirm("确认已经发货了吗?虚假发货平台将严惩!")){
                return true;
            }
            else {
                return false;
            }
        }
        else{
            alert("已经发货啦,无需再次发货!");
            return false;
        }
    }
</script>

</body>
</html>
