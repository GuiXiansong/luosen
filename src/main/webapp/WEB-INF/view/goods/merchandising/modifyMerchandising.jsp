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
    <form id="contact" action="<%=basePath%>/merchandising/modifyMerchanisingInfo.do" method="post">
        <h3>修改商品采购信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input placeholder="编号" value="${merchandising.id}" type="hidden" name="id" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="店铺编号" type="hidden" name="storeId" value="${storeId}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="goodsId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="">${merchandising.goodsId}</option>
                <c:forEach items="${goodsList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.name}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <select name="employeeId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="">${merchandising.employeeId}</option>
                <c:forEach items="${employeeList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.name}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="销售数量/重量" value="${merchandising.count}" type="text" name="count" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="销售额" value="${merchandising.sales}" type="text" name="sales" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="销售日期" value="${merchandising.salesDate}" type="date" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" name="salesDate" tabindex="1" required autofocus>
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