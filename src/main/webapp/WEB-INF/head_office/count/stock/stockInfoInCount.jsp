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
    <%--    <c:if test="${sessionScope.identity_id ne 4}">--%>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;">
            <strong>商品入库信息统计列表</strong></legend>
    </fieldset>
    <fieldset>
        <form action="<%=basePath%>/stock/toCountInStockInfoPage.do" method="post">
            <select name="storeIdd"
                    style="width: 20%;height: 40px; vertical-align: middle; line-height: 40px;" tabindex="1"
                    >
                <option value='' <%--onclick="return selectContractType()"--%>> — 请选择店铺 —</option>
                <c:forEach items="${storeList}" var="data">
                    <option value="${data.id}">${data.id}---${data.address}</option>
                </c:forEach>
            </select>
            <select name="year" id="" style="width: 20%;height: 40px; vertical-align: middle; line-height: 40px;">
                <option value="">-请选择年份-</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
            </select>
            <select name="month" style="width: 20%;height: 40px; vertical-align: middle; line-height: 40px;">
                <option value="">-请选择月份-</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>
                <option value="09">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            <button type="submit" value="查询" style="width: 20%;height: 40px; vertical-align: middle; line-height: 40px;">查询</button>
        </form>
    </fieldset>
    <div class="table-responsive">
        <c:if test="${!empty requestScope.stockInfoCounts}">
            <table class="table table-striped table-hover" id="countTable">
                <thead>
                <tr>
                        <%--                <th style="text-align: center"><input type="checkbox" id="all"/></th>--%>
                    <th style="text-align:center;">商品编号</th>
                    <th style="text-align:center;">总数量/质量</th>
                        <%--                </c:if>--%>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${requestScope.stockInfoCounts}" var="data">
                    <tr>
                            <%--                    <td><input name="r_id" value="${holiday.id}" type="checkbox"/></td>--%>
                        <td>${data.goodsId}</td>
                        <td>${data.sum}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>

</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.easyui.min.js"></script>
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


    //选择员工信息
    function selectEmployeeInfoById(id) {
        $.ajax({
            url: '<%=basePath%>/employee/selectEmployeeInfoById.do',
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

    $(function () {
        $('#db').datebox({
            onShowPanel: function () {//显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层
                span.trigger('click'); //触发click事件弹出月份层
                if (!tds) setTimeout(function () {//延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔
                    tds = p.find('div.calendar-menu-month-inner td');
                    tds.click(function (e) {
                        e.stopPropagation(); //禁止冒泡执行easyui给月份绑定的事件
                        var year = /\d{4}/.exec(span.html())[0]//得到年份
                            , month = parseInt($(this).attr('abbr'), 10); //月份，这里不需要+1
                        $('#db').datebox('hidePanel')//隐藏日期对象
                            .datebox('setValue', year + '-' + month); //设置日期的值
                    });
                }, 0);
                yearIpt.unbind();//解绑年份输入框中任何事件
            },
            parser: function (s) {
                if (!s) return new Date();
                var arr = s.split('-');
                return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
            },
            formatter: function (d) {
                return d.getFullYear() + '-' + (d.getMonth() + 1);
            }
        });
        var p = $('#db').datebox('panel'), //日期选择对象
            tds = false, //日期选择对象中月份
            yearIpt = p.find('input.calendar-menu-year'),//年份输入框
            span = p.find('span.calendar-text'); //显示月份层的触发控件


    });

</script>
</html>
