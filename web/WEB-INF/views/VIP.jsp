<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/23
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>VIP中心</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/popup.css">
    <style>
        .ss{
            color: #83c44e;
            font-size: 15px;
            position: relative;
            left: -25px;
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
        <div class="lfnav fl" style="position: fixed;top:200px;width: 350px;">
            <c:choose>
                <c:when test="${customer.customer_VIP==0}">
                    <div style="width: 200px; height: auto;text-align: center;position: relative;top:50px;">
                        <h3 style="color: #ff5930">尊敬的${sessionScope.customer.customer_name},您还不是我们的会员,可注册成为会员,享受超级会员权益!</h3><br>
                        <a href="/customer/applyVIP" style="font-size: 18px;color: #83c44e" onclick="needa()">点击立即申请成为会员!</a>
                    </div>
                </c:when>
                <c:when test="${customer.customer_VIP==1}">
                    <div style="width: 200px; height: auto;text-align: center;position: relative;top:50px;">
                        <h3 style="color: #ff5930">尊敬的${sessionScope.customer.customer_name},您还不是我们的会员,可注册成为会员,享受超级会员权益!</h3><br>
                        <a style="font-size: 18px;color: #83c44e">您的申请已经提交,请耐心等待管理员审核</a>
                    </div>
                </c:when>
                <c:when test="${customer.customer_VIP==2}">
                    <div style="width: 300px; height: auto;text-align: center;position: relative;top:50px;left:-100px;border: 3px solid;">
                        <h3 style="color: #ff5930">尊敬的${sessionScope.customer.customer_name}超级会员,欢迎您</h3><br>
                        <h3 style="color: #1E90FF">可在下方进行发帖</h3><br>
                        <form method="post" action="/customer/VIPpost">
                        <span class="ss">标题:</span><input type="text" name="post_title" width="150px" height="50px" id="post_title"><br><br>
                        <span class="ss" style="position: relative;top:-75px;">内容:</span><textarea id="post_content" name="post_content" style="width: 150px;height: 150px;"></textarea><br><br>
                            <input type="submit" value="发表" class="upBt" onclick="return isPost()">
                        </form>
                    </div>
                </c:when>
            </c:choose>


        </div>



        <div class="rtcont fr" id="buyincang" style="position: relative;top:25px;">
            <div class="rtcont fr">
                <div id="yincang">
                    <div class="grzlbt ml40">所有会员帖</div>
                    <c:forEach var="VipPost" items="${VipPost}">
                    <div class="subgrzl ml40" style="height: auto;">
                        用户名:${VipPost.customer_name}&emsp;&emsp;&emsp;
                        发表时间:${VipPost.post_time}&emsp;&emsp;&emsp;
                        标题:${VipPost.post_title}<br>
                        内容:${VipPost.post_content}
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="clear"></div>
        </div>

    </div>
</div>
</div>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
    function needa() {
        alert("申请已提交,请耐心等待管理员审核!");
    }
    function isPost() {
        var title=$("#post_title").val();
        var content=$("#post_content").val();
        if(title==""||content==""){
            alert("标题或内容不能为空!");
            return false;
        }
        else{
            alert("发表成功!");
            return true;
        }
    }
</script>


</body>
</html>
