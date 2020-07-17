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

    <title>罗森连锁店分店管理系统</title>

    <link rel="stylesheet" href="<%=basePath%>/static/css/formStyle.css" media="screen" type="text/css" />

</head>
<body>

<div class="container">


    <form id="contact" action="<%=basePath%>/employee/modifyEmployee.do" method="post">
        <h3>修改员工信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input type="hidden" name="id" value="${modifyEmployee.id}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="店铺编号" type="hidden" name="storeId" value="${modifyEmployee.storeId}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="员工姓名" type="text" name="name" value="${modifyEmployee.name}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="sex" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <option value="${modifyEmployee.sex}">${modifyEmployee.sex}</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="员工手机号" type="text" name="phone" value="${modifyEmployee.phone}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="position" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <option value="${modifyEmployee.position}">${modifyEmployee.position}</option>
                <option value="店长">店长</option>
                <option value="副店长">副店长</option>
                <option value="督导">督导</option>
                <option value="营业员">营业员</option>
                <option value="收银">收银</option>
                <option value="前台">前台</option>
                <option value="仓管">仓管</option>
                <option value="陈列员">陈列员</option>
                <option value="后勤">后勤</option>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="销售额" type="text" name="sales" value="${modifyEmployee.sales}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="销售提成" type="text" name="salesCommission" value="${modifyEmployee.salesCommission}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
        </fieldset>
    </form>



<%--    <form id="contact" action="<%=basePath%>/employee/modifyEmployee.do" method="post">
        <h3>修改员工信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input type="hidden" name="id" value="${modifyEmployee.id}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="店铺编号" type="text" name="storeId" value="${modifyEmployee.storeId}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="员工姓名" type="text" name="name" value="${modifyEmployee.name}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="员工性别" type="text" name="sex" value="${modifyEmployee.sex}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="员工手机号" type="text" name="phone" value="${modifyEmployee.phone}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="职位" type="text" name="position" value="${modifyEmployee.position}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="销售额" type="text" name="sales" value="${modifyEmployee.sales}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="销售提成" type="text" name="salesCommission" value="${modifyEmployee.salesCommission}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
        </fieldset>
    </form>--%>

</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>