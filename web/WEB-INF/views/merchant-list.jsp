<%--
  Created by IntelliJ IDEA.
  User: ChangmengLai
  Date: 2018/12/25
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/css/html5shiv.js"></script>
    <script type="text/javascript" src="/css/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/css/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>商家管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 商家管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <%--<div class="text-c"> --%>
    <%--<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">--%>
    <%--<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>--%>
    <%--</div>--%>
    <%--<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> --%><span class="r">共有数据：<strong>${merchant.size()}</strong> 条</span> </div>
<div class="mt-20">
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value="0"></th>
            <th width="100">ID</th>
            <th width="200">店铺名</th>
            <th width="150">联系方式</th>
            <th width="150">密码</th>
            <th width="">店铺经营种类</th>
            <th width="220">注册时间</th>
            <th width="120">状态</th>
            <th>特殊</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="merchant" items="${merchant}" varStatus="status">
            <tr class="text-c">
                <td><input type="checkbox" value="1" name=""></td>
                <td>${merchant.merchant_id}</td>
                <td>${merchant.merchant_name}</td>
                <td>${merchant.merchant_phone}</td>
                <td>${merchant.merchant_pwd}</td>
                <td class="text-l">${merchant.merchant_category}</td>
                <td>${merchant.merchant_regTime}</td>
                <td class="td-status"><span class="label label-success radius"><c:if test="${merchant.merchant_status==0}">未审核</c:if>
                    <c:if test="${merchant.merchant_status==1}">审核未通过</c:if><c:if test="${merchant.merchant_status==2}">已审核</c:if></span></td>
                <td></td>
                <td class="td-manage">
                  <%-- <a style="text-decoration:none" id="index${status.index}" href="#" onclick="isOK(this)"  title="审批"><i class="Hui-iconfont">&#xe631;</i></a></c:if>--%>
                    <c:if test="${merchant.merchant_status==0}"><a id="index${status.index}" href="#" onclick="isOK(this)"  title="审批"  class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </c:if>
                        <%--<a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> --%>
                        <a title="删除" id="del${status.index}" href="#" onclick="return isSureToDelete(this)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/layer.js"></script>
<script type="text/javascript" src="/js/H-ui.min.js"></script>
<script type="text/javascript" src="/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/js/WdatePicker.js"></script>
<script type="text/javascript" src="/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/js/laypage.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ]
        });

    });
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要修改吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
    /*用户-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*密码-修改*/
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    function isOK(a) {
        var id=a.id;
        var index=id.substring(id.indexOf("x")+1);
        if(confirm("点击确定同意申请,取消拒绝申请!")){
            window.location.href="/admin/agreeMerchant?status=2&&index="+index;
        }
        else{
            window.location.href="/admin/agreeMerchant?status=1&&index="+index;
        }
        alert("操作成功!");
    }
    function isSureToDelete(a) {
        var id=a.id;
        var index=id.substring(id.indexOf("l")+1);
        if(confirm("确定要删除吗?此操作不可恢复!")){
            window.location.href="/admin/delete?status=1&&index="+index;
        }
        else{
            return false;
        }
        alert("操作成功!");
    }
</script>
</body>
</html>