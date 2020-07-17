<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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

    <meta charset="UTF-8">

    <title>罗森连锁店管理系统</title>

    <link rel="stylesheet" href="<%=basePath%>/static/css/formStyle.css" media="screen" type="text/css" />

</head>

<body>

<div class="container">
    <form id="contact" action="<%=basePath%>/stock/addOutOfStock.do" method="post">
        <h3>增加商品出库信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <h4><strong>${sessionScope.addOutOfStockMsg}</strong></h4>
        <fieldset>
            <input placeholder="库存编号" type="hidden" name="id" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="storeId" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <%--                <c:forEach items="${storeList}" var="store">--%>
                <%--                    <option value="${store.id}">${store.id}---${store.roles}---${store.address}</option>--%>
                <%--                </c:forEach>--%>
                <option value="${storeId}">${storeId}</option>
            </select>
        </fieldset>
        <fieldset>
            <select name="goodsId" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <c:forEach items="${goodsList}" var="goods">
                    <option value="${goods.id}">${goods.id}---${goods.name}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="出库数量/重量" type="text" name="sum" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="日期" type="date" name="stockDate" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
        </fieldset>
    </form>

</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>