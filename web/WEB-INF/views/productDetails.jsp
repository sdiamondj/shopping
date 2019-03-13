<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/20
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${product.product_name}</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/popup.css">
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


<form>
    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">${product.product_name}</div>
            <nav class="fr">
                <li><a href="/JSP/index">&emsp;&emsp;&emsp;&emsp;&emsp;返回主页</a></li>
                <div class="clear"></div>
            </nav>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl"><img src="${product.product_picture}" width="600px" height="600px"></div>
        <div class="right fr">
            <div class="h3 ml20 mt20">${product.product_name}</div>
            <div class="jianjie mr40 ml20 mt10"></div>
            <div class="jiage ml20 mt10">${product.product_market_price}</div>
            <div class="ft20 ml20 mt20">${product.merchant_name}</div>
            <div class="xzbb ml20 mt10">
                <div class="banben fl">
                    <span><a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                document.getElementById('fade').style.display='block'">&emsp;&emsp;&emsp;&emsp;&emsp;商品简介</a></span>
                </div>
                <div class="banben fr">
                    <span><a href = "/product/customerComment?product_id=${product.product_id}">&emsp;&emsp;&emsp;&emsp;&emsp;用户评论</a></span>
                </div>
                <div class="clear"></div>
            </div>
            <div class="ft20 ml20 mt20">近期销售情况:</div>
            <div class="xzbb ml20 mt10">
                &emsp;&emsp;&emsp;&emsp;
                <span class="yanse" style="font-size: 30px">销量:${product.product_sell_count}</span>
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                <span class="yanse" style="font-size: 30px">评论数:${product.product_comment_count}</span>
            </div>
            <div class="xqxq mt20 ml20">
                <div class="top1 mt10">
                    <div class="left1 fl">${product.product_name}&emsp;${product.product_subheading}</div>
                    <div class="right1 fr">${product.product_market_price}</div>
                    <div class="clear"></div>
                </div>
                <div class="bot mt20 ft20 ftbc">合计:${product.product_market_price}元</div>
            </div>
            <div class="xiadan ml20 mt20">
                <button class="jrgwc"  id="add" onclick="return checkLogin()" style="position: relative;
                 left: 180px;top:25px;">加入购物车</button>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</form>


<div id="light1" class="white_content">
    <button onclick = "document.getElementById('light1').style.display='none';
    document.getElementById('fade').style.display='none'" class="close" href="#">X</button>
    <div class="mainForm">
        <img src="${product.product_picture}" width="200px" height="200px" style="position: relative;left: 200px;top:-70px;">
        <table style="position: relative;top:-250px;">
            <tr>
                <td class="td1">商品名称:</td>
                <td class="td2">${product.product_name}</td>
            </tr>
            <tr>
                <td class="td1">商品类型:</td>
                <td class="td2">${product.product_category}</td>
            </tr>
            <tr>
                <td class="td1">商家名称:</td>
                <td class="td2">${product.merchant_name}</td>
            </tr>
            <tr>
                <td class="td1">上架时间:</td>
                <td class="td2">${product.product_addedTime}</td>
            </tr>
            <tr>
                <td class="td1" style="text-align: center">简介:</td>
                <td class="td2">${product.product_description}</td>
            </tr>
        </table>
    </div>
</div>
<div id="fade" class="black_overlay"></div>



<script>
    function checkLogin() {
        var a = <%=session.getAttribute("customer")%>;
        if(a==null){
            alert("您还没有登录,请先登录!")
            return false;
        }
    }
</script>

<script type="text/javascript" src="/js/jquery.min.js"></script>

<script>
    $("#add").click(function(){
        alert("添加购物车成功!");
        $.ajax({
            data:{"product_id":${product.product_id},"customer_id":${sessionScope.customer.customer_id}},
            type:"post",
            url:"/cart/addToCart",
            dateType:"text"
        });
    });
</script>
</body>
</html>
