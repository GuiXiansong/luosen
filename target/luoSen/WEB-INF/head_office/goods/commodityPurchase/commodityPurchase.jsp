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
        <h3 align="center"><a href="<%=basePath%>/commodityPurchase/toAddCommodityPurchase.do">添加</a></h3>
    </div>
    <%--    <c:if test="${sessionScope.identity_id ne 4}">--%>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 25px;padding: 0 10px;text-align: left;width: 200px;border-bottom: none;">
            <strong>商品采购信息列表</strong></legend>
    </fieldset>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align:center;">编号</th>
                <th style="text-align: center">商品编号</th>
                <th style="text-align: center">数量/质量</th>
                <th style="text-align: center">采购日期</th>
                <th style="text-align: center">总进价</th>
                <th style="text-align: center">供应商信息</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${pagemsg.lists}" var="data">
                <tr>
                        <%--                    <td><input name="r_id" value="${holiday.id}" type="checkbox"/></td>--%>
                    <td>${data.id}</td>
                    <td>${data.goodsId}</td>
                    <td>${data.quantity}</td>
                    <td>${data.purchaseDate}</td>
                    <td>${data.totalPurchasePrice}</td>
                    <td>${data.supplierInformation}</td>
                    <td>
                        <button type="button" onclick="return modifyCommodityPurchase(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">修改
                        </button>
                        <button type="button" onclick="return deleteCommodityPurchase(${data.id});"
                                class="layui-btn layui-btn-sm layui-btn-danger">删除
                        </button>
                            <%--                            </a>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--分页--%>
        <table border="0" cellspacing="0" cellpadding="0" width="900px">
            <tr>

                <td class="td2" style="text-align: center">


                    <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
                    <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
                    <span>
       <c:if test="${requestScope.pagemsg.currPage gt 1}">
           <a href="${pageContext.request.contextPath }/commodityPurchase/toCommodityPurchase.do?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/commodityPurchase/toCommodityPurchase.do?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/commodityPurchase/toCommodityPurchase.do?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/commodityPurchase/toCommodityPurchase.do?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
                </td>
            </tr>
        </table>
    </div>

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
    //删除商品采购信息
    function deleteCommodityPurchase(id) {
        layer.open({
            title: '警告信息',
            content: '你确定要删除该条信息？',
            btn: ['确定', '取消'],
            btn1: function (index, layero) {
                $.ajax({
                    url: '<%=basePath%>/commodityPurchase/deleteCommodityPurchase.do',
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

    //修改商品采购信息
    function modifyCommodityPurchase(id) {
                $.ajax({
                    url: '<%=basePath%>/commodityPurchase/toModifyCommodityPurchase.do',
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
    }


</script>
</html>
