<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/22
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商品评价</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        .be{
            color: #1E90FF;
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

<div class="xiangqing">
    <div class="neirong w">
        <div class="xiaomi6 fl">${product.product_name}</div>
        <nav class="fr">
            <li>&emsp;&emsp;&emsp;&emsp;</li>
            <li><a href="/product/showDetails/${product.product_id}">返回商品详情页</a> </li>
            <li>|</li>
            <li><a href="/JSP/index">返回主页</a></li>
            <div class="clear"></div>
        </nav>
        <div class="clear"></div>
    </div>
</div>

<div class="jieshao mt20 w">
    <div class="left fl"><img src="${product.product_picture}" width="600px" height="600px"></div>
    <div class="right fr" style="margin: 5px;padding: 5px;overflow-y:scroll;position: relative;left: 25px;">

        <c:forEach var="product_comment" items="${product_comment}">
            <div class="comment_div" style="font-size: 20px;">
                <span class="be">评论用户名称:</span>${product_comment.customer_name}&emsp;&emsp;&emsp;&emsp;
                <span class="be">评论分数:</span>${product_comment.comment_score}/5.0&emsp;&emsp;&emsp;&emsp;<br>
                <span class="be">评论时间:</span>${product_comment.comment_time}<br>
                <span class="be">评论内容:</span>${product_comment.comment_content}
            </div>
            <br>
        </c:forEach>

    </div>
    <div class="clear"></div>
</div>


<script type="text/javascript" src="/js/jquery.min.js"></script>
</body>
</html>
