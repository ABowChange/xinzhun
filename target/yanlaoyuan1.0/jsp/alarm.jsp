<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<%--<table class="layui-hide"  lay-filter="demoEvent" id="test"></table>--%>
<table class="layui-table" lay-data="{data:jsonString, page:true, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{field:'date', sort: true}">报警时间</th>
        <th lay-data="{field:'id'}">人员编号</th>
        <th lay-data="{field:'name'}">名字</th>
        <th lay-data="{field:'action'}">动作</th>
        <th lay-data="{field:'state'}">状态</th>
        <th lay-data="{field:'handleInit', edit: 'text',minWidth: 150,style:'cursor: pointer;'}">处理信息</th>
        <th lay-data="{fixed: 'right', align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>

</table>
</body>
<script type="application/javascript" src="../layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">确认处理</a>
</script>
<script>
    var jsonString =[{"id":10058,"action":"进入值班室","state":"报警中","date":"201708051305","name":"张三","handleInit":""},
                     {"id":10067,"action":"进入值班室","state":"已处理","date":"201708051305","name":"张三","handleInit":"asd"}];

    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,data:jsonString
            ,cols: [[
                {field:'data',  title: '报警时间', sort: true}
                ,{  title: '名字'}
                ,{field:'action',  title: '动作'}
                ,{field:'state',  title: '状态'}
                ,{field:'handleInit', event: 'edit',style:'cursor: pointer;',  title: '处理信息', maxWidth: 150}
                ,{field:'experience', event: 'isTure',title: '处理'}
            ]]
            ,page: true
        });
        table.on('tool(demo)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data;
            if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,title: '修改['+ data.name +'] 的用户签名'
                    ,value: data.handleInit
                }, function(value, index){
                    layer.close(index);


                    //这里一般是发送修改的Ajax请求

                    //同步更新表格和缓存对应的值
                    obj.update({
                        handleInit: value
                    });
                });
            }
            if(obj.event==='isTrue'){
                if(data.handleInit==null){
                    return;
                }
                obj.update({
                    state: 1
                });
            }
        });
    });
</script>
</html>