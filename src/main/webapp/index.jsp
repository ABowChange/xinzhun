<%--
  Created by IntelliJ IDEA.
  User: ABowChang
  Date: 2018/4/12
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>星准人员定位系统</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div><a href="index.jsp" class="layui-logo">星准人员定位管理系统</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a data-scroll href="javascript:void(0);" onclick="showPage(0)">报警查看</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="showPage(1)">历史轨迹</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="showPage(2)">设备管理</a> </li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="showPage(3)">人员管理</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="showPage(4)">数据管理</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);"onclick="showPage(5)">房间管理</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);"onclick="showPage(6)">电子围栏</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <%--<iframe src="index.jsp"></iframe>--%>
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">A区5楼</li>
                <li>B区2楼</li>
                <li>标题三</li>
            </ul>
            <div class="layui-tab-content">
                <button onclick="s()">qwe</button>
                <div  class="layui-tab-item layui-show">
                    <div id="3d_view"></div>
                </div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item">内容3</div>
            </div>
        </div>

    </div>

    <div class="layui-footer">

    </div>
</div>
<script src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/TWaver/t.js"></script>
<script type="text/javascript" src="./js/TWaver/twaver.js"></script>
<script type="text/javascript" src="./js/TWaver/twaver-make.js"></script>
<script type="text/javascript" src="./layui/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.all.js"></script>
<%--3D建模初始化--%>
<script type="text/javascript"  >
    //创建视图
    var webSocket = new WebSocket('ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/socketServer');

    webSocket.onerror = function (event) {
        alert(event.data);
    };
    //与WebSocket建立连接
    webSocket.onopen = function (event) {
        var datas = $.parseJSON(event.data);
        console.log(datas);
    };
    //处理服务器返回的信息
    webSocket.onmessage = function (event) {
        console.log(event.data);
        console.log("onmessage");
        box.getDataAt(29).setPositionX(box.getDataAt(29).getPositionX() - 200);
    };

    webSocket.onclose = function (event) {
    };
    var network = new mono.Network3D();
    var box = network.getDataBox();
    $(function () {
        make.Default.path = './';
        //相机
        var camera = new mono.PerspectiveCamera(30, 1.5, 30, 30000);
        camera.setPosition(200, 5000, 5000);
        camera.lookAt(new mono.Vec3(147, -300, -91));
        network.setCamera(camera);


        //相当于创建控制器
        var interaction = network.getDefaultInteraction();
        //设置最远距离
        interaction.setMaxDistance(20000);
        interaction.setMinDistance(30);
        //设置变焦速度
        interaction.setZoomSpeed(3);
        interaction.setPanSpeed(0.2);
        //指定输出
        document.getElementById('3d_view').appendChild(network.getRootView());
        //当页面调整大小时，自动调整network画布宽度，铺满整个页面
        mono.Utils.autoAdjustNetworkBounds(network, document.documentElement, 'clientWidth', 'clientHeight');
        //在坐标1000、1000、1000处放置一个颜色为0xFFFFFF色、强度为0.1的点光源
        var pointLight = new mono.PointLight(0x7EC0EE, 1.1);
        pointLight.setPosition(3000, 3000, 3000);
        box.add(pointLight);
        //颜色设置为白色
        box.add(new mono.AmbientLight('green'));
        //展示fps
        network.setShowFps(true);

        //监控鼠标事件
        var findFirstObjectByMouse = function (network, e) {
            var objects = network.getElementsByMouseEvent(e);
            if (objects.length) {
                for (var i = 0; i < objects.length; i++) {
                    var first = objects[i];
                    var object3d = first.element;
                    if (!(object3d instanceof mono.Billboard)) {
                        return first;
                    }
                }
            }
            return null;
        };
        //创建活动相机
        var animateCamera = function (camera, interaction, oldPoint, newPoint, onDone) {
            var offset = camera.getPosition().sub(camera.getTarget());
            var animation = new twaver.Animate({
                from: 0,
                to: 1,
                dur: 500,
                easing: 'easeBoth',
                onUpdate: function (value) {
                    var x = oldPoint.x + (newPoint.x - oldPoint.x) * value;
                    var y = oldPoint.y + (newPoint.y - oldPoint.y) * value;
                    var z = oldPoint.z + (newPoint.z - oldPoint.z) * value;
                    var target = new mono.Vec3(x, y, z);
                    camera.lookAt(target);
                    interaction.target = target;
                    var position = new mono.Vec3().addVectors(offset, target);
                    camera.setPosition(position);
                }
            });
            animation.onDone = onDone;
            animation.play();
        };

        network.getRootView().addEventListener('dblclick', function (e) {
            var firstClickObject = findFirstObjectByMouse(network, e);
            if (firstClickObject) {
                var element = firstClickObject.element;
                var oldPoint = camera.t();
                var newPoint = firstClickObject.point;
                var interaction = network.getDefaultInteraction()
                if (element.getClient('animation')) {
                    make.Default.playAnimation(element, element.getClient('animation'));
                } else {
                    animateCamera(camera, interaction, oldPoint, newPoint);
                }
            }
        });

        //房间
        var jsonObject = [
            //地板
            {
                "id": "twaver.idc.floor", "data": [-2335, 960, 2335, 960, 2335, -960, -2335, -920, -2335, 960]
            },
            //外墙
            {
                "id": "twaver.idc.wall", "data": [-2335, 960, 2335, 960, 2335, -960, -2335, -920, -2335, 960]
            },
            //过道墙
            {
                "id": "twaver.idc.innerWall", "data": [-2335, -150, 2335, -150],
                //这里设置门
                "children": [
                    //左上楼梯间
                    {"id": "twaver.idc.door1", "position": [-2150, 0, -150]},
                    //1502
                    {"id": "twaver.idc.door1", "position": [-1800, 0, -150]},
                    //1504
                    {"id": "twaver.idc.door1", "position": [-1060, 0, -150]},
                    //1506
                    {"id": "twaver.idc.door1", "position": [-800, 0, -150]},
                    //1508
                    {"id": "twaver.idc.door1", "position": [100, 0, -150]},
                    //电梯
                    {"id": "twaver.idc.door1", "position": [400, 0, -150]},
                    //主楼梯间
                    {"id": "twaver.idc.door1", "position": [800, 0, -150]},
                    //1510
                    {"id": "twaver.idc.door1", "position": [1100, 0, -150]},
                    //男厕
                    {"id": "twaver.idc.door1", "position": [1300, 0, -150]},
                    //女厕
                    {"id": "twaver.idc.door1", "position": [1500, 0, -150]},
                    //1512
                    {"id": "twaver.idc.door1", "position": [1700, 0, -150]}]
            },
            //过道奇数房间
            {
                "id": "twaver.idc.innerWall", "data": [-2335, 150, 2335, 150],
                //这里设置门
                "children": [
                    //1501
                    {"id": "twaver.idc.door1", "position": [-2200, 0, 150]},
                    //1503-1
                    {"id": "twaver.idc.door1", "position": [-1550, 0, 150]},
                    //1503-2
                    {"id": "twaver.idc.door1", "position": [-1350, 0, 150]},
                    //1503-3
                    {"id": "twaver.idc.door1", "position": [-900, 0, 150]},
                    //1505
                    {"id": "twaver.idc.door1", "position": [-600, 0, 150]},
                    //1507-1
                    {"id": "twaver.idc.door1", "position": [-300, 0, 150]},
                    //1507-2
                    {"id": "twaver.idc.door1", "position": [300, 0, 150]},
                    //1509-1
                    {"id": "twaver.idc.door1", "position": [600, 0, 150]},
                    //1509-2
                    {"id": "twaver.idc.door1", "position": [900, 0, 150]},
                    //1511
                    {"id": "twaver.idc.door1", "position": [1500, 0, 150]},
                    //1513-2
                    {"id": "twaver.idc.door1", "position": [1800, 0, 150]},
                    //1513-2
                    {"id": "twaver.idc.door1", "position": [2200, 0, 150]}]
            },
            //隔断墙
            {
                "id": "twaver.idc.innerWall", "data": [-2025, 960, -2025, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-790, 960, -790, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-470, 960, -470, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [500, 960, 500, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [955, 960, 955, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [1455, 960, 1455, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [1695, 960, 1695, 150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [300, -960, 300, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [675, -960, 675, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [975, -960, 975, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [1215, -960, 1215, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [1455, -960, 1455, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [1695, -960, 1695, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-600, -960, -600, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-960, -960, -960, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-1260, -960, -1260, -150]
            },
            {
                "id": "twaver.idc.innerWall", "data": [-2035, -960, -2035, -150]
            },

        ];
        var jsonObject1 = [{
            "id": "twaver.sphere",
            "radius": "20",
            "position": [-2300, 200, 900]
        }];
        var jsonObject2 = [{"id":"twaver.sphere",
            "radius":"20",
            "position":[-2300,200,500]}];
        var object3ds = make.Default.load({id: "twaver.combo", data: jsonObject});
        var object3ds1 = make.Default.load({id: "twaver.combo", data: jsonObject1});
        var object3ds2 = make.Default.load({id: "twaver.combo", data: jsonObject2});
        object3ds1.setName("person");


        //box.addByDescendant("sphere");
        box.addByDescendant(object3ds);
        console.log(object3ds1);
        box.add(object3ds1);
        box.add(object3ds2);
        console.log(object3ds1.getId());
        box.addDataBoxChangeListener(function (e) {
            var element = e.source, property = e.property, oldValue = e.oldValue, newValue = e.newValue;
            if (property == 'position') {
                element.setPositionY(newValue.y);
                element.setPositionY(newValue.x);
            }
        });
    });

    function s() {
        console.log(box.getDatas());
        //console.log(box.getDataById("twaver.combo"));
        var date1 = box.getDataAt(29).setPositionX(box.getDataAt(29).getPositionX() - 200);
        //date1.setPositionX(500);
        console.log(box.getDataAt(29)._position);
    }
</script>

<script>
    //JavaScript代码区域
    /*layui.use('element', function(){
        var element = layui.element;
        var form = layui.form;
    });*/
    function showPage(page) {
        var array = ['/jsp/alarm.jsp', 'historicalTrack.action',
            '/showDevice.action', 'person.action',
            'jsp/showData.jsp', 'page/天线倒伏联动监控.html',
            'jsp/antenna.jsp', 'z-page/uva.html',
            'jsp/cloud.jsp'];
        var titlemsg = ['', '', '大屏翻转', '', '', '', '天线倒伏', '', '云台', '', '', '', '', '', '', '', '', '', ''];
        var param =  {
            type: 2,
            title: titlemsg[page],
            shadeClose: false,
            closeBtn: 2,
            anim: 3,
            shade: 0,
            tipsMore: true,
            scrollbar: true,
            maxmin: false, //开启最大化最小化按钮
            area: ['80%', '90%'],
            content: array[page]
        };
        if(page == 8){
            param.area = ['710px','480px'];
        }
        var index = layer.open(param);
    }
    function showiframe(page) {

    }
</script>
</body>
</html>