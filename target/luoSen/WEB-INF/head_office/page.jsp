<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-3-17
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>罗森连锁店总店管理系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>总店管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/user/toHeadOfficePage.do"
                                          style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/static/img/beauty.jpg" class="layui-nav-img">
                    <strong>${user.username}</strong>
                </a>
                <dl class="layui-nav-child">
<%--                    <dd><a href="" style="text-decoration: none;"><strong>基本资料</strong></a></dd>--%>
                    <dd><a href="<%=basePath%>/user/toPasswordChangePage.do"
                           style="text-decoration: none;"><strong>修改密码</strong></a></dd>
                    <hr/>
                    <dd><a href="<%=basePath%>/user/outLogin.do"
                           style="text-decoration: none;;"><strong>退出登录</strong></a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: findAllStoreInfo();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;店铺信息管理</strong></a>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: findEmployeeByStoreId();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;员工信息管理</strong></a>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: toMember();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;会员信息管理</strong></a>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: toGoods();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;商品信息管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toGoods();"
                               style="text-decoration: none;"><strong>基本信息</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toCommodityPurchase();"
                               style="text-decoration: none;"><strong>采购信息</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toMerchandising();"
                               style="text-decoration: none;"><strong>销售信息</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toStock();"
                               style="text-decoration: none;"><strong>库存信息</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: toLogistics();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;物流信息管理</strong></a>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;" href="javascript:;"
                       onclick="javascript: toLogistics();"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;统计</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toCountInStockInfoPage();"
                               style="text-decoration: none;"><strong>商品入库统计</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toCountOutStockInfoPage();"
                               style="text-decoration: none;"><strong>商品出库统计</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toCountMerchandisingInfo();"
                               style="text-decoration: none;"><strong>商品销售信息</strong></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 45px;color: #1D9D73;margin-top: 300px;" class="text-center">
                <strong>欢迎登录总店管理系统</strong></div>
            <p class="text-center">
                <strong style="color: #1D9D73;">祝您本次使用愉快！</strong>
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 总店管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by 皮皮桂</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function findAllStoreInfo() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/store/findAllStoreInfo.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function findEmployeeByStoreId() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/employee/findEmployeeByStoreId.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toMember() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/member/toMember.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toGoods() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/goods/toGoods.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCommodityPurchase() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/commodityPurchase/toCommodityPurchase.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toLogistics() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/logistics/findLogisticsByStoreId.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toMerchandising() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/merchandising/findMerchandisingByStoreId.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toStock() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/stock/findStockByStoreId.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCountInStockInfoPage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/stock/toCountInStockInfoPage.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCountOutStockInfoPage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/stock/toCountOutStockInfoPage.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCountMerchandising() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/merchandising/toCountMerchandising.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCountMerchandisingInfo() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/merchandising/toCountMerchandisingInfo.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>