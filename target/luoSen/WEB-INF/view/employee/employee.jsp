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
        <h3 align="center"><a href="<%=basePath%>/employee/toAddEmployee2.do">添加</a></h3>
    </div>
    <%--    <c:if test="${sessionScope.identity_id ne 4}">--%>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;">
            <strong>员工信息列表</strong></legend>
    </fieldset>
    <div class="table-responsive">
        <c:if test="${!empty requestScope.pagemsg}">
            <table class="table table-striped table-hover" id="countTable">
                <thead>
                <tr>
                        <%--                <th style="text-align: center"><input type="checkbox" id="all"/></th>--%>
                    <th style="text-align:center;">编号</th>
                    <th style="text-align:center;">店铺编号</th>
                    <th style="text-align: center">姓名</th>
                    <th style="text-align: center">性别</th>
                        <%--                <c:if test="${sessionScope.identity_id ne 4}">--%>
                    <th style="text-align: center">手机号</th>
                    <th style="text-align: center">职位</th>
                    <th style="text-align: center">销售额</th>
                    <th style="text-align: center">销售提成</th>
                    <th style="text-align: center;">操作</th>
                        <%--                </c:if>--%>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${requestScope.pagemsg.lists}" var="data">
                    <tr>
                            <%--                    <td><input name="r_id" value="${holiday.id}" type="checkbox"/></td>--%>
                        <td>${data.id}</td>
                        <td>${data.storeId}</td>
                        <td>${data.name}</td>
                        <td>${data.sex}</td>
                        <td>${data.phone}</td>
                        <td>${data.position}</td>
                        <td>${data.sales}</td>
                        <td>${data.salesCommission}</td>
                        <td>
                            <c:if test="${data.id!=null}">
                                <button type="button" onclick="return toModifyEmployee(${data.id});"
                                        class="layui-btn layui-btn-sm layui-btn-danger">修改
                                </button>
                                <button type="button" onclick="return deleteEmployee(${data.id});"
                                        class="layui-btn layui-btn-sm layui-btn-danger">删除
                                </button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>

<%--分页--%>

<table border="0" cellspacing="0" cellpadding="0" width="900px">
    <tr>

        <td class="td2" style="text-align: center">


            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
            <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
            <span>
       <c:if test="${requestScope.pagemsg.currPage gt 1}">
           <a href="${pageContext.request.contextPath }/employee/findEmployeeByStoreId.do?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/employee/findEmployeeByStoreId.do?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>
       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/employee/findEmployeeByStoreId.do?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/employee/findEmployeeByStoreId.do?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>


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
    //删除员工信息
    function deleteEmployee(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要删除该条信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/employee/deleteEmployee.do',
                    type: 'POST',
                    data: {id: id},
                    success: function (data) {
                        layer.open({
                            title: '提示信息',
                            content: '删除申请发送成功，请耐心等待',
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

    //修改员工信息
    function toModifyEmployee(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要修改该条信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/employee/toModifyEmployee.do',
                    type: 'POST',
                    data: {id: id},
                    success: function (data) {
                        layer.open({
                            title: '提示信息',
                            content: '修改申请发送成功，请耐心等待',
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
