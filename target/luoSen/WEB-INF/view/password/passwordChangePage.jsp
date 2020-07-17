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
    <title>罗森连锁店分店管理系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>罗森连锁店管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/user/toPage.do"
                                          style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/static/img/avatar.jpg" class="layui-nav-img">
                    <strong>${user.username}</strong>
                </a>
                <dl class="layui-nav-child">
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
<%--            <ul class="layui-nav layui-nav-tree" lay-filter="test">--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;文章管理</strong></a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();"--%>
<%--                               style="text-decoration: none;"><strong>文章列表</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();"--%>
<%--                               style="text-decoration: none;"><strong>文章草稿</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();"--%>
<%--                               style="text-decoration: none;"><strong>回收站</strong></a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;预约服务</strong></a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();"--%>
<%--                               style="text-decoration: none;"><strong>请假销假</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();"--%>
<%--                               style="text-decoration: none;"><strong>教室申请</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();"--%>
<%--                               style="text-decoration: none;"><strong>心理咨询</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();"--%>
<%--                               style="text-decoration: none;"><strong>户籍办理</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();"--%>
<%--                               style="text-decoration: none;"><strong>打印成绩单</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();"--%>
<%--                               style="text-decoration: none;"><strong>就业推荐</strong></a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;失物招领</strong></a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();"--%>
<%--                               style="text-decoration: none;"><strong>失物列表</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();"--%>
<%--                               style="text-decoration: none;"><strong>发布失物信息</strong></a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;报修</strong></a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();"--%>
<%--                               style="text-decoration: none;"><strong>报修列表</strong></a></dd>--%>
<%--                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();"--%>
<%--                               style="text-decoration: none;"><strong>宿舍保修</strong></a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--            </ul>--%>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="container">
        <div id="content">
            <h2 class="text-nowrap" style="color: #393D49;text-align:center;padding-top:10%;font-family: Menlo">
                密码修改界面</h2>
            <%--<div style="text-align: center;">
                <br/>
                <br/>
                <label style="font-size:20px;color:white;padding-right:8%;">
                    <a href="#" id="login" style="text-decoration: none;border-bottom:2px solid #009688;color:#009688">密码修改</a>
                </label>
            </div>--%>
            <hr style="color: #484848;text-align:center;"/>
            <!-- 登录的表单 -->
            <form action="<%=basePath%>/user/changePassword.do" id="loginform" method="post" class="layui-form"
                  style="text-align: center;margin-right:12%;margin-top:10%;">
                <input name="id" hidden="hidden" value="${id}"/>
                <div align="center">
                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">
                            <span class="fa fa-lock fa-fw"></span>
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" name="oldPassword" class="layui-input"
                                   style="background:none;border: none;border-bottom:1px solid white;"
                                   placeholder="请输入旧密码"/>
                        </div>
                    </div>

                    <br/>
                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">
                            <span class="fa fa-lock fa-fw"></span>
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" name="newPassword1" class="layui-input"
                                   style="background:none;border: none;border-bottom:1px solid white;"
                                   placeholder="请输入新密码"/>
                        </div>
                    </div>
                    <br/>

                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">
                            <span class="fa fa-lock fa-fw"></span>
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" name="newPassword2" class="layui-input"
                                   style="background:none;border: none;border-bottom:1px solid white;"
                                   placeholder="请再次输入新密码"/>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div style="text-align:center;color: #009688;background-color: #01AAED;width:15%;/*margin-left:138px;*/">
                        <input type="submit" class="layui-btn layui-btn-lg" style="background: none;" value="确认修改"/>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 罗森连锁店管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by 皮皮桂</strong>
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
    function toArticleWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleWrite.do\" width=\"100%\" height=\"100%\"></object>";
    }

    function toArticleManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleManage.do\" width=\"100%\" height=\"100%\"></object>";
    }

    function toArticleTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleTrash.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>