<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/23
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商家主页</title>
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
                    <li><a href="#">${sessionScope.merchant.merchant_name}</a></li>
                    <li>|</li>
                    <li><a href="/merchant/cancel" onclick="alert('注销成功')">注销</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>


<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl" style="position: fixed;top:200px;">
            <div class="ddzx">店铺管理</div>
            <div class="subddzx">
                <ul>
                    <li><a href="/JSP/merchantIndex" style="color:#ff6700;font-weight:bold;">基本信息</a></li>
                    <c:if test="${merchant.merchant_status==2}">
                        <li><a href="/merchant/merchantProduct" >商品管理</a></li>
                        <li><a href="/merchant/merchantOrder" >订单管理</a></li>
                        <li><a href="/JSP/uploadProduct" >录入商品</a></li>
                    </c:if>
                    <li><a href="/merchant/delete" id="status3" class="orderStatus" onclick="return isDelete()">注销店铺</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" id="buyincang" style="position: relative;top:25px;background-color: #f8ffa8;">
            <img src="/images/merchantbg1.jpg" width="400px" height="100px" style="position: relative;left: 150px;">
            <div class="rtcont fr">
                <div id="yincang">
                    <div class="grzlbt ml40">店铺资料&emsp;&emsp;&emsp;<c:if test="${merchant.merchant_status==0||merchant.merchant_status==1}"><sapn style="font-size: 15px;color: red;">你的店铺尚未通过审核,暂时无法完成其他操作,请耐心等待管理员审核!</sapn></c:if></div>
                    <div class="subgrzl ml40"><span>商家id</span><span style="font-size: 18px;">${merchant.merchant_id}</span></div>
                    <div class="subgrzl ml40"><span>店铺名</span><span style="font-size: 18px;">${merchant.merchant_name}</span></div>
                    <div class="subgrzl ml40"><span>手机号</span><span style="font-size: 18px;">${merchant.merchant_phone}</span></div>
                    <div class="subgrzl ml40"><span>密码</span><span style="font-size: 18px;">${merchant.merchant_pwd}</span></div>
                    <div class="subgrzl ml40"><span>店铺主营</span><span style="font-size: 18px;">${merchant.merchant_category}</span></div>
                    <div class="subgrzl ml40"><span>店铺状态</span><span style="font-size: 18px;">
                    <c:if test="${merchant.merchant_status==0}">未审核</c:if>
                    <c:if test="${merchant.merchant_status==1}">审核不通过&emsp;<a href="/JSP/merchantUpdate?merchant_id=${sessionScope.merchant.merchant_id}">点击申请修改信息</a></c:if>
                    <c:if test="${merchant.merchant_status==2}">已审核&emsp;&emsp;&emsp;<a href="/JSP/merchantUpdate?merchant_id=${sessionScope.merchant.merchant_id}">点击申请修改信息</a></c:if>
                </span></div>
                    <div class="subgrzl ml40"><span>注册时间</span><span style="font-size: 18px;">${merchant.merchant_regTime}</span></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>

    </div>
</div>





<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
    function isDelete() {
        var pwd=${sessionScope.merchant.merchant_pwd};
        if(confirm("确定要彻底注销店铺吗?所有商品会一并删除,且一经操作无法撤回!")){
            if(prompt("请输入账户密码以验证身份!")==pwd){
                alert("验证成功,账户已彻底删除!");
                return true;
            }
            else{
                alert("密码错误!");
                return false;
            }
        }
        else {
            return false;
        }
    }
</script>


</body>
</html>
