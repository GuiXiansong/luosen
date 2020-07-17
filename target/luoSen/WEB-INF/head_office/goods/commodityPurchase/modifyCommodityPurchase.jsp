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

    <title>罗森连锁店总店管理系统</title>

    <link rel="stylesheet" href="<%=basePath%>/static/css/formStyle.css" media="screen" type="text/css" />

</head>

<body>

<div class="container">
    <form id="contact" action="<%=basePath%>/commodityPurchase/modifyCommodityPurchase.do" method="post">
        <h3>修改商品采购信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input placeholder="编号" type="hidden" name="id" value="${modifyCommodityPurchase.id}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="goodsId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="${modifyCommodityPurchase.goodsId}">${modifyCommodityPurchase.goodsId}</option>
                <c:forEach items="${goodsList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.name}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="数量/质量" type="text" name="quantity" value="${modifyCommodityPurchase.quantity}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="采购日期" type="date" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" name="purchaseDate" value="${modifyCommodityPurchase.purchaseDate}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="总进价" type="text" name="totalPurchasePrice" value="${modifyCommodityPurchase.totalPurchasePrice}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="供应商信息" type="text" name="supplierInformation" value="${modifyCommodityPurchase.supplierInformation}" tabindex="1" required autofocus>
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