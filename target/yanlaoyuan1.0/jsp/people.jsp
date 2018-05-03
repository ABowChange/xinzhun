<%--
  Created by IntelliJ IDEA.
  User: ABowChang
  Date: 2018/4/26
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        body{
            width: 75%;
        }
        .layout-col-h {
            height: 2vh;
        }
    </style>
</head>
<body>
<div class="layui-row layout-col-h"></div>
<div class="layui-row">
    <%--<div class="layui-col-md4 layui-col-md-offset1">
        <form class="layui-form layui-form-pane">

        </form>
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">设备状态</label>
                <div class="layui-input-block">
                    <input type="text" id="deviceState" name="deviceState" class="layui-input">
                </div>
            </div>
        </form>
    </div>--%>
        <div class="layui-col-md10 layui-col-md-offset1">
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">人员查询</li>
                <li>新增人员</li>
            </ul>
            <div class="layui-tab-content">
                <div  class="layui-tab-item layui-show">
                        <div class="demoTable">
                            人员编号：
                            <div class="layui-inline">
                                <input class="layui-input" name="id" id="deviceId" autocomplete="off">
                            </div>
                            <button class="layui-btn" id="idSelect" data-type="reload">查询</button>
                            &nbsp;&nbsp;人员状态：
                            <div class="layui-inline">
                                <input class="layui-input" name="id" id="deviceState" autocomplete="off">
                            </div>
                            <button class="layui-btn" id="stateSelect" data-type="reload">查询</button>
                        </div>
                        <table class="layui-tab" id="deviceTable" lay-filter="deviceTable"></table>
                </div>
                <div class="layui-tab-item">
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">人员编号</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceId" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceX" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceState" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceY" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">关联设备</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceState" class="layui-input">
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
        </div>
</div>
<script type="application/javascript" src="../layui/layui.js"></script>
<script type="application/javascript" src="../layui/jquery.min.js"></script>
<script>
    var datas = [{'deviceID': 002, 'deviceX': 100, 'deviceY': 300, 'deviceState': '正常'}];
    var optionsTable = {
        elem: '#deviceTable' //指定原始表格元素选择器（推荐id选择器）
        , height: 550 //容器高度
        , data: datas
        ,page:true
        , cols: [[
            {field: 'deviceID', title: '设备编号', maxWidth: 65},
            {field: 'deviceX', title: '设备X坐标', maxWidth: 65},
            {field: 'deviceY', title: '设备Y坐标', maxWidth: 65},
            {field: 'deviceState', title: '设备状态', maxWidth: 90},
            {fixed: 'right', align: 'center', width: 200, toolbar: '#barDemo'}
        ]] //设置表头}
    };
    layui.use(['element', 'table','form'], function () {
        var element = layui.element;
        var table = layui.table;
        var form =layui.form;
        console.log(table);
        table.render(optionsTable);

        //通过设备状态查询
        table.on('tool(deviceTable)',function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent ==='del'){
                layer.confirm('真的删除行么', function (index1) {
                    //删除数据
                    $.ajax({
                        timeout: 3000,
                        async: false,
                        type: "POST",
                        url: "../goCommand.action",//这个地方需要改为删除数据链接
                        dataType: "json",
                        success: function (successData) {
                            redata=successData;
                            alert(successData);
                        }
                    });
                    obj.del();
                    layer.close(index1);
                    //return i;
                });
            } else if (layEvent==='update'){

            }
        });
        //通过ID查询
        $('#idSelect').on('click',function () {
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../goCommand.action",//这个地方需要改为查询 ID查数据
                dataType: "json",
                success: function (successData) {
                    redata=successData;
                    alert(successData);
                }
            });
            table.reload('deviceTable', {
                data: redata
            });

        });
        $('#stateSelect').on('click',function () {
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../goCommand.action",//这个地方需要改为查询 状态查数据
                dataType: "json",
                success: function (successData) {
                    redata=successData;
                    console.log(
                        successData);
                }
            });
            table.reload('deviceTable', {
                data: redata
            });

        });
        form.on('submit()',function (obj) {
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../goCommand.action",//这个地方需要改为查询 状态查数据
                data:obj.field,
                dataType: "json",
                success: function (successData) {
                    redata=successData;
                }
            });
            table.reload('deviceTable',{
                data:redata
            })
        });
    })
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>
