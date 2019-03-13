<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/24
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商品管理</title>
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

<div class="xiantiao"></div>
<div class="gwcxqbj" style="height: auto;">
    <div class="gwcxd center">
        <div class="top2 center">
            <div class="sub_top fl">
            </div>
            <div class="sub_top fl" style="position: relative;left: 30px;">商品名称</div>
            <div class="sub_top fl" style="position: relative;left: -120px;">单价</div>
            <div class="sub_top fl" style="position: relative;left: -70px;">类型</div>
            <div class="sub_top fl" style="position: relative;left: -30px;">简介</div>
            <div class="sub_top fr" style="position: relative;left: 15px;">操作</div>
            <div class="clear"></div>
        </div>
        <c:forEach var="product" items="${product}" varStatus="status">
            <div class="content2 center">
                <form action="/product/updateSth" method="post" enctype="multipart/form-data">
                <div class="sub_content fl ">
                </div>
                <div class="sub_content fl" style="position: relative;top:25px;">
                    <input type="hidden" value="${status.index}" id="index${status.index}" name="index">
                  <input type="file" name="file" id="file${status.index}" style="position: relative;top:-20px;">
                    <img src="${product.product_picture}" id="img${status.index}" style="height: 80px;width: 80px;position: relative;top:-20px;"></div>
                <div class="sub_content fl ft20" style="width: 200px;"><input name="product_name" type="text" class="shuliang" value="${product.product_name}" style="width: 180px;position: relative;top:50px;"></div>
                <div class="sub_content fl " style="width: 100px"><input type="number" name="product_price" class="shuliang" value="${product.product_market_price}" style="width: 100px;position: relative;top:50px;"></div>
                <div class="sub_content fl" style="position: relative;top:15px;width: 70px;">
                    <input type="text" class="shuliang" name="product_category" value="${product.product_category}">
                </div>
                <div class="sub_content fl" style="width: 130px"><textarea name="product_description" style="position: relative;top:10px;height: 100px;width: 200px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);resize: none;">${product.product_description}</textarea></div>
                <div class="sub_content fl"><input id="sub${status.index}" style="width: 55px;height: 45px;left:-10px;font-size: 18px;position: relative;top:22px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;color: white;" type="submit" value="修改" onclick="alert('修改成功!')"><a href="/product/delete?product_id=${product.product_id}" onclick="return firm()" style="font-size: 35px;color: red;">×</a></div>
                <div class="clear"></div>
                </form>
            </div>

        </c:forEach>
    </div>


</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-form.js"></script>
<script>
    var size=${product.size()};
    function firm() {
        if(confirm("确认删除吗?此操作不可撤回")){
            return true;
        }
        else{
            return false;
        }
    }
</script>



</body>
</html>
