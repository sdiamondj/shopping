<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/20
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商品列表</title>
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

<div class="danpin center">
    <div class="biaoti center">${key}&emsp;共搜索到${product.size()}条结果
        <nav class="fr">
            <li><a href="/JSP/index">返回主页</a></li>
            <div class="clear"></div>
        </nav>
    </div>
    <c:forEach var="product" items="${product}" varStatus="status">
        <c:choose>
            <c:when test="${status.index%5==0}">
                <div class="main center">
                    <div class="mingxing f1 mb20" style="border:2px solid #fff;width:230px;cursor:pointer;float: left;"onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                        <div class="sub_mingxing"><a href="/product/showDetails/${product.product_id}" target="_blank"><img src="${product.product_picture}"></a></div>
                        <div class="pinpai"><a href="/product/showDetails/${product.product_id}" target="_blank">${product.product_name}</a></div>
                        <div class="youhui">${product.merchant_name}</div>
                        <div class="jiage">￥${product.product_market_price}</div>
                    </div>
            </c:when>
            <c:when test="${status.index%5==4}">
                    <div class="mingxing f1 mb20" style="border:2px solid #fff;width:230px;cursor:pointer;float: left;"onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                        <div class="sub_mingxing"><a href="/product/showDetails/${product.product_id}" target="_blank"><img src="${product.product_picture}"></a></div>
                        <div class="pinpai"><a href="/product/showDetails/${product.product_id}" target="_blank">${product.product_name}</a></div>
                        <div class="youhui">${product.merchant_name}</div>
                        <div class="jiage">￥${product.product_market_price}</div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="mingxing f1 mb20" style="border:2px solid #fff;width:230px;cursor:pointer;float: left;"onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                    <div class="sub_mingxing"><a href="/product/showDetails/${product.product_id}" target="_blank"><img src="${product.product_picture}"></a></div>
                    <div class="pinpai"><a href="/product/showDetails/${product.product_id}" target="_blank">${product.product_name}</a></div>
                    <div class="youhui">${product.merchant_name}</div>
                    <div class="jiage">￥${product.product_market_price}</div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript">
    var msg = "${rtMsg}";
    function checkLogin() {
        var a = <%=session.getAttribute("customer")%>;
        if(a==null){
            alert("您还没有登录,请先登录!")
            return false;
        }
    }
</script>
</body>
</html>
