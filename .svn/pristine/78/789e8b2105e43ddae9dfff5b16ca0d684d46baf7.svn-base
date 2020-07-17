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
    <form id="contact" action="<%=basePath%>/goods/modifyGoodsInfo.do" method="post">
        <h3>增加商品信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input placeholder="商品编号" value="${goods.id}" type="hidden" name="id" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="商品名" value="${goods.name}" type="text" name="name" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="单位" value="${goods.unit}" type="text" name="unit" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="进价" value="${goods.purchasePrice}" type="text" name="purchasePrice" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="售价" value="${goods.price}" type="text" name="price" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="积分" value="${goods.integral}" type="text" name="integral" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="顾客青睐度" value="${goods.satisfaction}" type="text" name="satisfaction" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="折扣率" value="${goods.discountRate}" type="text" name="discountRate" tabindex="1" required autofocus>
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