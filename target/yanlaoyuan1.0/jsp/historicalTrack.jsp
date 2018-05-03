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
<div class="demoTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="personId" autocomplete="off">
    </div>
    <button class="layui-btn" id="selectID" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="historicalTrackTable" lay-filter="historicalTrackTable"></table>
<script type="application/javascript" src="../layui/jquery.min.js"></script>
<script type="application/javascript" src="../layui/layui.js"></script>
<script type="application/javascript">
    var datas = <%=request.getAttribute("jsonString")%>
        layui.use('table', function () {
            var table = layui.table;

            //方法级渲染
            table.render({
                elem: '#historicalTrackTable'
                , data: datas
                , cols: [[
                    {field: 'personId', title: 'ID', width: 80}
                    , {field: 'date',  title: '时间', sort: true, width: 180}
                    , {field: 'personName', title: '姓名', width: 80}
                    , {field: 'personX', title: 'x轴', width: 80}
                    , {field: 'personY', title: 'y轴', width: 80}
                    , {field: 'roomId', title: '房间号', sort: true, width: 80}
                ]]
                , id: 'historicalTrackTable'
                , page: true
                , height: 315
            });

            $('#selectID').on('click',function () {

                var jsonId="{\"personId\":\""+$('#personId').val()+"\"}";
                console.log(jsonId);
                var redata=[];
                $.ajax({
                    timeout: 3000,
                    async: false,
                    type: "POST",
                    url: "/selectHistoricalTrackById.action",//这个地方需要改为查询 ID查数据
                    dataType: "json",
                    data:jsonId,
                    success: function (successData) {
                        redata=successData;
                        console.log(redata);
                    }
                });
                table.reload('historicalTrackTable',{
                    data:redata
                })

            });

        });
</script>


</body>
</html>
