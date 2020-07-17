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
    <form id="contact" action="<%=basePath%>/employee/addEmployee.do" method="post">
        <h3>增加员工信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <select name="storeId" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                    <option value="${store.id}">${store.id}---${store.roles}---${store.address}</option>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="员工姓名" type="text" name="name" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="sex" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="员工手机号" type="text" name="phone" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="position" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
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
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
        </fieldset>
    </form>

</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>