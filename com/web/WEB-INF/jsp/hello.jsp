<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="js/esl.js"></script>

    <script>setTimeout("location=location; ", 1000000); </script>
</head>
<body>
<div id="main" style="height:400px"></div>
<script type="text/javascript">
    require.config({
        paths:{
            'echarts' : 'js/echarts',
            'echarts/chart/pie' : 'js/echarts'
        }
    });
    require(
        [
            'echarts',
            'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main'));
            option = {
                title : {
                    text: '各污染物折线图',
                    subtext: ''
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:[]
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : [1,2,3,4,5,6,7,8,9]
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} kg'
                        }
                    }
                ],
                series : [

                ]
            };
            option.legend.data=['co','so2','o3'];
            var a = [];
            var item1 = {
                    name:option.legend.data[0],
                    type:'line',
                    data:[1,2,3,4,5,6,7,8,9],
                };
            a.push(item1);
            var item2 = {
                name:option.legend.data[1],
                type:'line',
                data:[1,2,3,4,5,6,7,8,9],
            };
            a.push(item2);
            option.series.push(a[0]);
            option.series.push(a[1]);
            myChart.setOption(option);
        }
    );
</script>
</body>