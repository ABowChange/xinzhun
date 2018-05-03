<%--
  Created by IntelliJ IDEA.
  User: ABowChang
  Date: 2018/4/27
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        .layout-col-h {
            height: 50vh;
        }

        .layout-col-h1 {
            height: 3vh;
        }
    </style>
</head>
<body>
<div class="layui-row layout-col-h1"></div>
<div class="layui-row">
    <div class="layui-col-md4 layui-col-md-offset1">
        <div id="lineTable" class="layout-col-h"></div>
    </div>
    <div class="layui-col-md4 layui-col-md-offset1">
        <div id="lineTable1" class="layout-col-h"></div>
    </div>
</div>

<script type="application/javascript" src="../layui/jquery.min.js"></script>
<script type="application/javascript" src="../layui/echarts.min.js"></script>
<script>
    var option1 = {
        width: 'auto',
        title: {
            text: '进入房间人次'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['1502', '1503', '1504', '1505', '1508']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: '1502',
                type: 'line',
                
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '1503',
                type: 'line',
                
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '1504',
                type: 'line',
                
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: '1505',
                type: 'line',
                
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: '1508',
                type: 'line',
                
                data: [820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };
    var option2 = {
        width: 'auto',
        title: {
            text: '进入房间人次'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['1502', '1503', '1504', '1505', '1508']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: (function () {
                var now = new Date();
                var res = [];
                var len = 5;
                while (len--) {
                    res.unshift(now.toLocaleTimeString().replace(/^\D*!/, ''));
                    now = new Date(now - 1000*60*60);
                }
                return res;
            })()
        },
        yAxis: {
            type: 'value',
            splitNumber: 10,
            max: 1000,
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: ['#fff'],
                    opacity: 0.06
                }
            }
        },
        series: [
            {
                name: '1502',
                type: 'line',
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '1503',
                type: 'line',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '1504',
                type: 'line',
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: '1505',
                type: 'line',
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: '1508',
                type: 'line',
                data: [820, 932, 901, 934, 190, 130, 820]
            }
        ]
    };
    var myChart1 = echarts.init(document.getElementById('lineTable'));
    var myChart2 = echarts.init(document.getElementById('lineTable1'));

    console.log(myChart1);
    myChart1.setOption(option1, true);
    myChart2.setOption(option2, true);
    window.onresize = function () {
        myChart1.resize();
    };

</script>
</body>
</html>
