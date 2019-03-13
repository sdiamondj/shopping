<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/25
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>录入商品</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        .td1{
            text-align: right;
            width: 200px;
        }
        .td2{
            text-align: left;
            width: 300px;
        }
        td{
            height: 50px;
        }
        input{
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
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
                    <li><a href="/JSP/merchantIndex" >基本信息</a></li>
                        <li><a href="/merchant/merchantProduct" >商品管理</a></li>
                        <li><a href="/merchant/merchantOrder" >订单管理</a></li>
                        <li><a href="/JSP/uploadProduct" style="color:#ff6700;font-weight:bold;">录入商品</a></li>
                    <li><a href="/merchant/delete" id="status3" class="orderStatus" onclick="return isDelete()">注销店铺</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" id="buyincang" style="position: relative;top:25px;background-color: #f8ffa8;border: 6px solid;">
            <h3 style="color: rebeccapurple;text-align: center;"></h3>
            <div style="width: 900px;height: 450px; font-size: 25px;color: #83c44e;position: relative;top:0px;left: 200px;">
                <form method="post" action="/product/addProduct" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td class="td1">商品名称:</td>
                            <td class="td2"><input type="text" id="name" name="product_name"></td>
                        </tr>
                        <tr>
                            <td class="td1">商品类型:</td>
                            <td class="td2"><input type="text" id="type" name="product_category"></td>
                        </tr>
                        <tr>
                            <td class="td1">商品价格:</td>
                            <td class="td2"><input type="number" id="price" name="product_market_price"></td>
                        </tr>
                        <tr>
                            <td class="td1">商品副标题:</td>
                            <td class="td2"><input type="text" id="sss" name="product_subheading"></td>
                        </tr>
                        <tr>
                            <td class="td1" style="height: 150px;">商品描述:</td>
                            <td class="td2" style="height: 150px;"><textarea name="product_description" id="description" style="width:200px;height: 150px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);resize: none;""></textarea></td>
                        </tr>
                        <tr>
                            <td class="td1">商品图片</td>
                            <td class="td2"><input type="file" name="file" id="file"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center"><input type="submit" style="border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;color: white;width: 100px;height: 50px;" value="提交" onclick="return isNull()"></td>
                        </tr>
                    </table>
                </form>
            </div>
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

    function isNull() {
        if($("#name").val()==""||$("#type").val()==""||$("#price").val()==""||$("#description").val()==""||$("#file").val()==""||$("#sss").val()==""){
            alert("任何一项不能为空!");
            return false;
        }
        else {
            alert("录入成功!");
            return true;
        }
    }
</script>

</body>
</html>
