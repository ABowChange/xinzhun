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
                <li class="layui-this">设备查询</li>
                <li>新增设备</li>
            </ul>
            <div class="layui-tab-content">
                <div  class="layui-tab-item layui-show">
                        <div class="demoTable">
                            设备编号：
                            <div class="layui-inline">
                                <input class="layui-input" name="id" id="deviceId" autocomplete="off">
                            </div>
                            <button class="layui-btn" id="idSelect" lay-filter="idSelect">查询</button>
                            &nbsp;&nbsp;设备状态：
                            <div class="layui-inline">
                                <input class="layui-input" name="id" id="deviceState" autocomplete="off">
                            </div>
                            <button class="layui-btn" id="stateSelect" data-type="reload">查询</button>

                            <button class="layui-btn" id="deviceAll" data-type="reload">全部设备</button>

                        </div>
                        <table class="layui-tab" id="deviceTable" lay-filter="deviceTable"></table>
                </div>
                <div class="layui-tab-item">
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">设备编号</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceId" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">X轴坐标</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceX" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">X轴坐标</label>
                            <div class="layui-input-block">
                                <input type="text"  name="deviceY" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">安装房间</label>
                            <div class="layui-input-block">
                                <input type="text"  name="roomId" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">设备状态</label>
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
    var datas = <%=request.getAttribute("allDevice")%>;
    var optionsTable = {
        elem: '#deviceTable' //指定原始表格元素选择器（推荐id选择器）
        , height: 550 //容器高度
        , data: datas
        //,url:'../allDevice.action'
        ,page:true
        //
        , cols: [[
            {field: 'deviceId', title: '设备编号', maxWidth: 65},
            {field: 'deviceX', edit: 'text', title: '设备X坐标', maxWidth: 65},
            {field: 'deviceY', edit: 'text', title: '设备Y坐标', maxWidth: 65},
            {field: 'roomId', edit: 'text', title: '安装房间号', maxWidth: 65},
            {field: 'deviceState', edit: 'text', title: '设备状态', maxWidth: 90},
            {fixed: 'right', align: 'center', width: 200, toolbar: '#barDemo'}
        ]] //设置表头}
    };
    layui.use(['element', 'table','form'], function () {
        var element = layui.element;
        var table = layui.table;
        var form =layui.form;
        table.render(optionsTable);

        //删除修改
        table.on('tool(deviceTable)',function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent ==='del'){
                layer.confirm('真的删除行么', function (index1) {
                    var jsonString=JSON.stringify(data);
                    //删除数据
                    $.ajax({
                        timeout: 3000,
                        async: false,
                        type: "POST",
                        url: "../delectDevice.action",//这个地方需要改为删除数据链接
                        data:jsonString,
                        dataType: "json",
                        success: function (successData) {
                            redata=successData;
                            alert(successData.flag);
                        }
                    });
                    obj.del();
                    layer.close(index1);
                    //return i;
                });
            } else if (layEvent==='update'){
                //需要修改数据部分
                $.ajax({
                    timeout: 3000,
                    async: false,
                    type: "POST",
                    url: "../updateDevice.action",//这个地方需要改为删除数据链接
                    data:data,
                    dataType: "json",
                    success: function (successData) {
                        redata=successData;
                        alert(successData);
                    }
                });
            }
        });
        table.on('edit(deviceTable)',function(obj){
            console.log(obj.edit);
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.deviceId+'] ' + field + ' 字段更改为：'+ value);
        });
        //通过ID查询
        $('#idSelect').on('click',function () {

            var jsonId="{\"deviceId\":\""+$('#deviceId').val()+"\"}";
            console.log(jsonId);
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../selectDeviceById.action",//这个地方需要改为查询 ID查数据
                dataType: "json",
                data:jsonId,
                success: function (successData) {
                    redata=successData;
                }
            });
            table.reload('deviceTable',{
                data:redata
            })

        });
        $('#deviceAll').on('click',function (){
            window.location.reload();
        });
        //通过设备状态查询
        $('#stateSelect').on('click',function () {
            var jsonState="{\"deviceState\":\""+$('#deviceState').val()+"\"}";
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../selectDeviceByState.action",//这个地方需要改为查询 状态查数据
                data:jsonState,
                dataType: "json",
                success: function (successData) {
                    redata=successData;
                    console.log(successData);
                }
            });
            table.reload('deviceTable', {
                data: redata
            });

        });
        form.on('submit(add)',function (obj) {
            var jsonString = JSON.stringify(obj.field);
            var redata=[];
            $.ajax({
                timeout: 3000,
                async: false,
                type: "POST",
                url: "../insertDevice.action",//这个地方需要改为新增数据数据
                data:jsonString,
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
