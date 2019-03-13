<%--
  Created by IntelliJ IDEA.
  User: ChangmengLai
  Date: 2018/12/25
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/js/html5shiv.js"></script>
    <script type="text/javascript" src="/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/css/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>我的桌面</title>
</head>
<body>
<div class="page-container">
    <p class="f-20 text-success">欢迎使用南大商城 <span class="f-14">v1.0</span>后台版！</p>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="6" scope="col" style="text-align: center">信息统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>用户</th>
            <th>商家</th>
            <th>商品</th>
            <th>会员</th>
            <th>订单</th>
        </tr>
        </thead>
        <tbody>
        <tr class="text-c">
            <td>总数</td>
            <td>${customer.size()}</td>
            <td>${merchant.size()}</td>
            <td>${product.size()}</td>
            <td>${VIP.size()}</td>
            <td>${order.size()}</td>
        </tr>
        </tbody>
    </table>
    <%--<table class="table table-border table-bordered table-bg mt-20">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th colspan="2" scope="col">服务器信息</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<tr>--%>
            <%--<th width="30%">服务器计算机名</th>--%>
            <%--<td><span id="lbServerName">http://127.0.0.1/</span></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器IP地址</td>--%>
            <%--<td>192.168.1.1</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器域名</td>--%>
            <%--<td>www.h-ui.net</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器端口 </td>--%>
            <%--<td>80</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器IIS版本 </td>--%>
            <%--<td>Microsoft-IIS/6.0</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>本文件所在文件夹 </td>--%>
            <%--<td>D:\WebSite\HanXiPuTai.com\XinYiCMS.Web\</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器操作系统 </td>--%>
            <%--<td>Microsoft Windows NT 5.2.3790 Service Pack 2</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>系统所在文件夹 </td>--%>
            <%--<td>C:\WINDOWS\system32</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器脚本超时时间 </td>--%>
            <%--<td>30000秒</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器的语言种类 </td>--%>
            <%--<td>Chinese (People's Republic of China)</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>.NET Framework 版本 </td>--%>
            <%--<td>2.050727.3655</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器当前时间 </td>--%>
            <%--<td>2014-6-14 12:06:23</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器IE版本 </td>--%>
            <%--<td>6.0000</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>服务器上次启动到现在已运行 </td>--%>
            <%--<td>7210分钟</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>逻辑驱动器 </td>--%>
            <%--<td>C:\D:\</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>CPU 总数 </td>--%>
            <%--<td>4</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>CPU 类型 </td>--%>
            <%--<td>x86 Family 6 Model 42 Stepping 1, GenuineIntel</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>虚拟内存 </td>--%>
            <%--<td>52480M</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>当前程序占用内存 </td>--%>
            <%--<td>3.29M</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Asp.net所占内存 </td>--%>
            <%--<td>51.46M</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>当前Session数量 </td>--%>
            <%--<td>8</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>当前SessionID </td>--%>
            <%--<td>gznhpwmp34004345jz2q3l45</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>当前系统用户名 </td>--%>
            <%--<td>NETWORK SERVICE</td>--%>
        <%--</tr>--%>
        <%--</tbody>--%>
    <%--</table>--%>
</div>
<footer class="footer mt-20">
    <div class="container">
        <p>Copyright 南昌大学 by 南大商城</p>
    </div>
</footer>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/H-ui.min.js"></script>

</body>
</html>

</body>
</html>
