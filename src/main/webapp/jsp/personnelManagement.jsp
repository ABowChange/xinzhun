<%--
  Created by IntelliJ IDEA.
  User: ABowChang
  Date: 2018/4/24
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        body {
            width: 75%;
        }

        .layout-col-h {
            height: 2vh;
        }
    </style>
</head>
<body>
<div class="layui-col-md10 layui-col-md-offset1">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">人员查询</li>
            <li>新增人员</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                ID查询：
                <div class="layui-inline">
                    <input class="layui-input" name="id" id="personId" autocomplete="off">
                </div>
                <button class="layui-btn" id="selectID" data-type="reload">ID查询</button>
                &nbsp;&nbsp;&nbsp;姓名查询
                <div class="layui-inline">
                    <input class="layui-input" name="id" id="personName" autocomplete="off">
                </div>
                <button class="layui-btn" id="selectName" data-type="reload">姓名查询</button>
                &nbsp;&nbsp;&nbsp;性别查询
                <div class="layui-inline">
                    <input class="layui-input" name="id" id="personSex" autocomplete="off">
                </div>
                <button class="layui-btn" id="selectSex" data-type="reload">性别查询</button>
            </div>
            <table class="layui-hide" id="personnelManagementTable" lay-filter="personnelManagementTable"></table>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">人员ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="deviceId" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="personName" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="text" name="personSex" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="personTel" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">人员状态</label>
                    <div class="layui-input-block">
                        <input type="text" name="deviceState" class="layui-input">
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md3 layui-col-md-offset2">
                        <button lay-submit="" class="layui-btn layui-btn-normal" lay-filter="add">添加</button>
                    </div>
                    <div class="layui-col-md3 layui-col-md-offset2">
                        <button type="reset" class="layui-btn layui-btn-normal">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="application/javascript" src="../layui/jquery.min.js"></script>
<script type="application/javascript" src="../layui/layui.js"></script>
<script type="application/javascript">
    var datas = <%=request.getAttribute("jsonString")%>
        layui.use('table', function () {
            var table = layui.table;

            //方法级渲染
            table.render({
                elem: '#personnelManagementTable'
                , data: datas
                , cols: [[
                    {field: 'personId', title: 'ID', width: 80}
                    , {field: 'personName', title: '姓名', width: 80}
                    , {field: 'personTel', title: '电话', width: 80}
                    , {field: 'personSex', title: '性别', width: 80}
                    , {field: 'personState', title: '状态', sort: true, width: 80}
                ]]
                , id: 'personnelManagementTable'
                , page: true
                , height: 315
            });

            $('#selectID').on('click', function () {

                var jsonId = "{\"personId\":\"" + $('#personId').val() + "\"}";
                console.log(jsonId);
                var redata = [];
                $.ajax({
                    timeout: 3000,
                    async: false,
                    type: "POST",
                    url: "/selectPersonnelManagementById.action",//这个地方需要改为查询 ID查数据
                    dataType: "json",
                    data: jsonId,
                    success: function (successData) {
                        redata = successData;
                        console.log(redata);
                    }
                });
                table.reload('personnelManagementTable', {
                    data: redata
                })

            });

        });
</script>


</body>
</html>
