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
    <form id="contact" action="<%=basePath%>/member/modifyMember.do" method="post">
        <h3>修改会员信息</h3>
        <h4>我们将尽快解决您的申请，请耐心等待</h4>
        <fieldset>
            <input type="hidden" name="id" value="${member.id}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="卡号" type="text" name="cardNumber" value="${member.cardNumber}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="姓名" type="text" name="name" value="${member.name}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <select name="sex" class="select" style="width: 100%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus>
                <option value="${member.sex}">${member.sex}</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </fieldset>
        <fieldset>
            <input placeholder="手机号" type="text" name="phone" value="${member.phone}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="会员积分" type="text" name="integral" value="${member.integral}" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="会员等级" type="text" name="grade" value="${member.grade}" tabindex="1" required autofocus>
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