<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/22
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/popup.css">
    <style>
        .cp{
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body onload="test()">

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
            <li><a href="/JSP/index">返回主页</a></li>
            <li>|</li>
            <li><a href="/order/myOrder/${sessionScope.customer.customer_id}">我的订单</a></li>
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
            <div class="sub_top fr">操作</div>
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
                    <div class="sub_content fl"><a href="#" onclick="return checkIsGet(this)" id="comment${status.index}" style="font-size: 15px;width: 50px;height: 50px;">评价</a></div>
                    <div class="clear"></div>
                </div>


                <div id="light${status.index}" class="white_content">
                    <button onclick = "document.getElementById('light${status.index}').style.display='none';
    document.getElementById('fade').style.display='none'" class="close" href="#">X</button>
                    <div class="mainForm" style="font-size: 25px;position: relative;top:-35px;">
                        <form action="/product/submitComment" method="post">
                            <label>商品名称:${orderProduct.product_name}</label><br><br>
                            <label>总体评价分(0-5):</label><input type="number" value="5" name="comment_score" min="0" max="5" style="height: 30px;font-size: 20px;">
                            <br><br>
                            <input type="hidden" name="order_id" value="${orderProduct.order_id}" id="order_id${status.index}">
                            <input type="hidden" name="product_id" value="${orderProduct.product_id}">
                            <label>简评</label><br><textarea name="comment_content" style="width: 500px;height: 150px;padding: 10px;margin: 10px;"></textarea><br><br>
                            <input type="submit" value="确认提交" onclick="doitforme(this)" id="dd${status.index}" class="upBt">
                        </form>
                    </div>
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
            <form method="post" action="/order/sureToGet">
                <input type="hidden" name="order_id" value="${order.order_id}">
                <input type="hidden" name="customer_id" value="${sessionScope.customer.customer_id}">
                <input type="hidden" name="order_count" id="order_count" value="0">
                <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="确认收货" onclick="return confirmGet();"/></div>
            </form>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>



<div id="fade" class="black_overlay"></div>

<script>
    var size=${orderProduct.size()};
    function doitforme(oo) {
        var ii=oo.id;
        var iii=ii.charAt(ii.length-1);
        var order_id=$("#order_id"+iii);
        alert("提交成功!");
        document.getElementById('light'+iii).style.display='none';
        document.getElementById('fade').style.display='none';


    }
    var status = ${order.order_status};
    function confirmGet() {
        if(status==1){
            if(confirm("确认已经收到货物了吗?如果您没有收到货物而确认收货,可能物财两空哦!")){
                return true;
            }
            else {
                return false;
            }
        }
        else if(status==0){
            alert("卖家尚未发货!");
            return false;
        }
        else{
            alert("已经确认收货,无需再次确认!");
            return false;
        }
    }
    function checkIsGet(obj) {
        if(status==0||status==1){
            alert("您还没有确认收货,请确认收货后再评价!");
            return false;
        }
        else if(status==2){
            var id=obj.id;
            var i=id.charAt(id.length-1);
                        $.ajax({
                            data:{"order_id":$("#order_id"+i).val(),"product_id":$("#product_id"+i).val()},
                            type:"post",
                            url:"/product/checkIsComment",
                            dateType: "text",
                            success:function (msg) {
                                if(msg==false){
                                    alert("该商品已经做过评价,请评价其他商品!");
                                }
                                else{
                                    document.getElementById('light'+i).style.display='block';
                                    document.getElementById('fade').style.display='block';

                                }
                            }
                        });
        }
        else{
            alert("订单已完成,无需再次评价!");
            return false;
        }
    }
</script>

<script>
    var order_id=${order.order_id};
    function test() {
        $.ajax({
            data:{"order_id":order_id,"size":size},
            type:"post",
            url:"/product/isAllBeCommented",
            dateType: "text",
            success:function (msg) {
                if(msg==true){
                    $.ajax({
                        data:{"order_id":order_id},
                        type:"post",
                        url:"/order/makeOrderFinished",
                        dateType: "text",
                        success:function (msg) {
                            if(msg==true){
                                $("#statusSpan").text("订单状态:已完成");
                            }
                        },
                        error:function () {
                            alert("error2");
                        }
                    });
                }
            },
            error:function () {
                alert("error");
            }
        });
    }
</script>


<script type="text/javascript" src="/js/jquery.min.js"></script>
</body>
</html>
