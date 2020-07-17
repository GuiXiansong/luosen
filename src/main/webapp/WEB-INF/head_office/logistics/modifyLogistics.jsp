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
    <form id="contact" action="<%=basePath%>/logistics/modifyLogistics.do" method="post">
        <h3>修改单条物流信息</h3>
        <h4><strong>${sessionScope.msg}</strong></h4>
        <fieldset>
            <input type="hidden" value="id" name="id" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="startStoreId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="${logistics.startStoreId}">${logistics.startStoreId}</option>
                <c:forEach items="${storeList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.address}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <select name="endStoreId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="${logistics.endStoreId}">${logistics.endStoreId}</option>
                <c:forEach items="${storeList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.address}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <select name="goodsId" class="select"
                    style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required
                    autofocus>
                <option value="${logistics.goodsId}">${logistics.goodsId}</option>
                <c:forEach items="${goodsList}" var="data">
                    <option value="${data.id}">${data.id}-------${data.name}</option>
                </c:forEach>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="路程（km）" value="${logistics.distance}" type="text" name="distance" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="物品重量（kg）" value="${logistics.weight}" type="text" name="weight" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="运费（￥）" value="${logistics.freight}" type="text" name="freight" tabindex="1" required autofocus>
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