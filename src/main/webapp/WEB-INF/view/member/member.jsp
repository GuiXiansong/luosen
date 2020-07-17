<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-4-30
  Time: 上午10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>罗森连锁店分店管理系统</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <div>
        <h3 align="center"><a href="<%=basePath%>/member/toAddMember.do">添加</a></h3>
    </div>
    <%--    <c:if test="${sessionScope.identity_id ne 4}">--%>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;">
            <strong>会员信息列表</strong></legend>
    </fieldset>
    <%--        <h5 style="margin-top: -20px;">
                <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
                <span style="color: #299A74;"><strong>输入查询信息</strong></span>
            </h5>
            <hr style="margin-top: 0;"/>
            <div class="form table">
                <div>
                    <form class="layui-form form-inline" action="<%=basePath%>/article/findByPage.do" role="form"
                          method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>文章作者</strong></label>
                            <div class="layui-input-inline">
                                <input name="a_name" placeholder="请输入文章作者姓名查询" class="layui-input" type="text">
                            </div>
                            <label class="layui-form-label" style="width:8%;"><strong>审核状态</strong></label>
                            <div class="layui-input-inline" style="width: 100px;">
                                <select name="r_verify">
                                    <option></option>
                                    <option>已审核</option>
                                    <option>未审核</option>
                                </select>
                            </div>
                            <label class="layui-form-label" style="width:8%;"><strong>发布状态</strong></label>
                            <div class="layui-input-inline" style="width: 100px;">
                                <select name="r_publish">
                                    <option></option>
                                    <option>已发布</option>
                                    <option>未发布</option>
                                </select>
                            </div>
                            <label class="layui-form-label" style="width:8%;"><strong>存在状态</strong></label>
                            <div class="layui-input-inline" style="width: 100px;">
                                <select name="r_status">
                                    <option></option>
                                    <option>存在</option>
                                    <option>已删除</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="margin-left: 50px;">
                                <button class="layui-btn" type="submit">查询</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
        <h5>
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>查询结果展示</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <c:if test="${sessionScope.identity_id ne 4}">
            <div class="layui-inline">
                <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
                <a href="<%=basePath%>/article/toArticleWrite.do">
                    <button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button>
                </a>
            </div>
        </c:if>
        <br/>
        <br/>--%>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <%--                <th style="text-align: center"><input type="checkbox" id="all"/></th>--%>
                <th style="text-align:center;">编号</th>
                <th style="text-align: center">卡号</th>
                <th style="text-align: center">姓名</th>
                <th style="text-align: center">性别</th>
                <%--                <c:if test="${sessionScope.identity_id ne 4}">--%>
                <th style="text-align: center">手机号</th>
                <th style="text-align: center">积分</th>
                <th style="text-align: center">等级</th>
                <th style="text-align: center;">操作</th>
                <%--                </c:if>--%>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${pagemsg.lists}" var="data">
                <tr>
                        <%--                    <td><input name="r_id" value="${holiday.id}" type="checkbox"/></td>--%>
                    <td>${data.id}</td>
                    <td>${data.cardNumber}</td>
                    <td>${data.name}</td>
                    <td>${data.sex}</td>
                    <td>${data.phone}</td>
                    <td>${data.integral}</td>
                    <td>${data.grade}</td>
                    <td>
                        <button type="button" onclick="return toModifyMember(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">修改
                        </button>
                        <button type="button" onclick="return deleteMember(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">删除
                        </button>
                            <%--                            </a>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--分页--%>

    <table border="0" cellspacing="0" cellpadding="0" width="900px">
        <tr>

            <td class="td2" style="text-align: center">


                <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
                <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
                <span>
       <c:if test="${requestScope.pagemsg.currPage gt 1}">
           <a href="${pageContext.request.contextPath }/member/findAll.do?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/member/findAll.do?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/member/findAll.do?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/member/findAll.do?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
            </td>
        </tr>
    </table>
</div>
</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">


    //销假
    function writeOff(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要销假？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/holiday/writeOff.do',
                    type: 'POST',
                    data: {id: id},
                    success: function (data) {
                        layer.open({
                            title: '提示信息',
                            content: '销假申请发送成功，请耐心等待辅导员审核',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function () {
                        layer.open({
                            title: '提示信息',
                            content: '销假失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    //删除单条员工信息
    function deleteMember(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要删除此条员工信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/member/deleteMember.do',
                    type: 'POST',
                    data: {id: id},
                    success: function (data) {
                        layer.open({
                            title: '提示信息',
                            content: '删除操作进行中',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function () {
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    //修改单条员工信息
    function toModifyMember(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要修改此条员工信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/member/toModifyMember.do',
                    type: 'POST',
                    data: {id: id},
                    success: function (data) {
                        layer.open({
                            title: '提示信息',
                            content: '修改操作进行中',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function () {
                        layer.open({
                            title: '提示信息',
                            content: '修改失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }
</script>
</html>
