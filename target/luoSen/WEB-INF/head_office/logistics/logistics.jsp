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
    <title>罗森连锁店总店管理系统</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <div>
        <h3 align="center"><a href="<%=basePath%>/logistics/toAddLogistics.do">添加</a></h3>
    </div>
    <%--    <c:if test="${sessionScope.identity_id ne 4}">--%>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;">
            <strong>物流信息</strong></legend>
    </fieldset>
    <fieldset>
        <select id="contractType" class="select" style="width: 20%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1" required autofocus name="contractType">
            <option value='' <%--onclick="return selectContractType()"--%>> — 请选择 —</option>
            <c:forEach items="${selectList}" var="data">
                <option value="${data.id}">${data.id}---${data.address}</option>
            </c:forEach>
        </select>
    </fieldset>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <%--                <th style="text-align: center"><input type="checkbox" id="all"/></th>--%>
                <th style="text-align:center;">编号</th>
                <th style="text-align: center">出发地店铺id</th>
                <th style="text-align: center">目的地店铺id</th>
                <th style="text-align: center">商品id</th>
                <th style="text-align: center">路程（km）</th>
                <th style="text-align: center">货物重量（kg）</th>
                <th style="text-align: center">运费</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${pagemsg.lists}" var="data">
                <tr>
                    <td>${data.id}</td>
                    <td>${data.startStoreId}</td>
                    <td>${data.endStoreId}</td>
                    <td>${data.goodsId}</td>
                    <td>${data.distance}</td>
                    <td>${data.weight}</td>
                    <td>${data.freight}</td>
                    <td>
                        <button type="button" onclick="return modifyLogistics(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">修改
                        </button>
                        <button type="button" onclick="return deleteLogistics(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">删除
                        </button>
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
           <a href="${pageContext.request.contextPath }/logistics/findLogisticsByStoreId.do?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/logistics/findLogisticsByStoreId.do?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/logistics/findLogisticsByStoreId.do?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/logistics/findLogisticsByStoreId.do?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
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
    //删除单条员工信息
    function deleteLogistics(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要删除此条物流信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/logistics/deleteLogistics.do',
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
    function modifyLogistics(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要修改此条物流信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/logistics/toModifyLogistics.do',
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


    $("#contractType").change(function () {

        var opval = $("#contractType").val();
        selectLogisticsInfoById(opval);
    })

    function selectContractType() {
        $('#contractType').empty();//先清空避免重复查询，此段也可省略
        $.ajax({
            url: '<%=basePath%>/logistics/selectAllLogistics.do',//后台的url地址
            type: 'post',
            success: function (data) {

                $.each(data, function (i, item) {//data为所有的数据，i表示编号，item表示第i行的数据

                    if (item == null) {
                        return;
                    }
                    <%--$('#contractType').append('<option value="+${data[i].id}+">'+data[i].address+'</option>');--%>

                    <%--var option='<option value="'+ data[i].id +'" onclick="return selectemployeeInfoById('+${data[i].id}+')">' + data[i].address + '</option>';--%>

                    // $("#queryType").append(option)
                });

                /*                var employeeList = data;
                                for (var i = 0; i < data.length; i++) {
                                    $("#contractType").append((new Option(employeeList[i].id + " " + employeeList[i].address, employeeList[i].name)));
                                }*/
            }
        });
    }

    //选择员工信息
    function selectLogisticsInfoById(id) {
        $.ajax({
            url: '<%=basePath%>/logistics/selectLogisticsInfoById.do',
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
    }
</script>
</html>