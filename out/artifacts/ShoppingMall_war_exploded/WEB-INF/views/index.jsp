<%--
  Created by IntelliJ IDEA.
  User: 95493
  Date: 2018/12/17
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商城</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        #container {
            position: relative;
            left: 450px;
            top: -455px;
            width: 900px;
            height: 460px;
            overflow: hidden;
            z-index: -100;
        }

        #photo {
            width: 3600px;
            animation: switch 10s ease-out infinite;
        }

        #photo > img {
            float: left;
            width: 900px;
            height: 460px;
        }

        @keyframes switch {
            0%, 18% {
                margin-left: 0;
            }
            28%, 46% {
                margin-left: -900px;
            }
            56%, 74% {
                margin-left: -1800px;
            }
            84%,100%{
                margin-left: -2700px;
            }
        }
    </style>
</head>
<body onload="alertMsg()">

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



<div class="banner_y center" style="position: relative;left: 65px;">
    <div class="nav" style="position: relative;left:10px;top:10px;">
        <ul>
            <li>
                <a href="/product/productList?key=数码" style="color: #ff5930;font-size: 25px;">数码</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=手机">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">手机</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=电脑">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">电脑</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=平板">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">平板</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=相机">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">相机</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=耳机">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">耳机</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=键盘">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">键盘</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    </div>
                    <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=鞋服" style="color: #ff5930;font-size: 25px;">鞋服</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=T恤">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">T恤</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=衬衫">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">衬衫</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=鞋">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">鞋</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=帽子">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">帽子</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=裙子">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">裙子</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=裤子">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">裤子</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=食品" style="color: #ff5930;font-size: 25px;">食品</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=水果">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">水果</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=零食">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">零食</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=速冻">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">速冻</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=生鲜">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">生鲜</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=主食">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">主食</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=方便食品">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">方便食品</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=饮品" style="color: #ff5930;font-size: 25px;">饮品</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=碳酸饮料">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">碳酸饮料</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=果汁">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">果汁</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=牛奶">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">牛奶</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=酒">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">酒</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=家电" style="color: #ff5930;font-size: 25px;">家电</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=电视">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">电视</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=冰箱">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">冰箱</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=空调">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">空调</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=洗衣机">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">洗衣机</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=油烟机">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">油烟机</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=吸尘器">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">吸尘器</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=洗护" style="color: #ff5930;font-size: 25px;">洗护</a>
                <div class="pop" style="width: 170px;">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=牙膏">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">牙膏</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=洗发水">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">洗发水</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=沐浴露">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">沐浴露</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="/product/productList?key=洗面奶">
                                    <span class="fl" style="color: #ff3f9a;font-size: 22px;">洗面奶</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </li>
            <li>
                <a href="/product/productList?key=图书" style="color: #ff5930;font-size: 25px;">图书</a>
            </li>
            <li>
                <a href="/product/productList?key=汽车" style="color: #ff5930;font-size: 25px;">汽车</a>
            </li>
            <li>
                <a href="/product/productList?key=虚拟产品" style="color: #ff5930;font-size: 25px;">虚拟产品</a>
            </li>
        </ul>
    </div>

</div>

<div id="container">
    <div id="photo">
        <img src="/images/banner1.jpg">
        <img src="/images/banner2.jpg">
        <img src="/images/banner3.jpg">
        <img src="/images/banner4.jpg">
    </div>
</div>
<img src="/images/indexbg1.jpg" style="position: relative;top:-410px;left:110px;width: 80%">
<img src="/images/indexbg2.jpg" style="position: absolute;top:145px;left:1px;width: 170px;">
<img src="/images/indexbg3.jpg" style="position: absolute;top:145px;right:1px;width: 170px;">



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

<script type="text/javascript" src="/js/simple.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
</body>
</html>
