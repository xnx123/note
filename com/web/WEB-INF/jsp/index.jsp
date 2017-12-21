
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e) {
    System.out.println("加载数据库驱动时抛出异常，内容如下：");
    e.printStackTrace();
  }
  Connection conn = DriverManager
          .getConnection(
                  "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8","root", "123456");
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt
          .executeQuery("SELECT * FROM (select * from year y \n" +
                  "ORDER BY y.id DESC limit 30) as Y \n" +
                  "ORDER BY Y.id");
  ArrayList<String> list = new ArrayList<String>();
  while (rs.next()) {
    list.add(rs.getString(2));
    //out.println(rs.getString(2));
  }
  rs.close();
  stmt.close();
  conn.close();
%>
<head>
  <meta charset="utf-8">
  <title>ECharts</title>
  <script src="js/esl.js"></script>
  <script>setTimeout("location=location; ", 1000000); </script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main1" style="position:absolute;margin-left:50px ;margin-top: 30px;height:20px">so2排放量</div>
<div >
  污染物选择<br /><br />
  <label><input name="Fruit" type="checkbox" value="" />苹果 </label>
  <label><input name="Fruit" type="checkbox" value="" />桃子 </label>
  <label><input name="Fruit" type="checkbox" value="" />香蕉 </label>
  <label><input name="Fruit" type="checkbox" value="" />梨 </label>
  <button onclick="del()"></button>
</div>
<div id="main" style="height:400px"></div>
<script type="text/javascript">
    // 路径配置
    require.config({
        paths:{
            'echarts' : 'js/echarts',
            'echarts/chart/pie' : 'js/echarts'
        }
    });
    // 使用
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
                    text: '未来一周气温变化',
                    subtext: '纯属虚构'
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['最高气温','最低气温']
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
                        data : ['周一','周二','周三','周四','周五','周六','周日']
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} °C'
                        }
                    }
                ],
                series : [
                    {
                        name:'最高气温',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        },
                        markLine : {
                            data : [
                                {type : 'average', name: '平均值'}
                            ]
                        }
                    },
                    {
                        name:'最低气温',
                        type:'line',
                        data:[1, -2, 2, 5, 3, 2, 0],
                        markPoint : {
                            data : [
                                {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                            ]
                        },
                        markLine : {
                            data : [
                                {type : 'average', name : '平均值'}
                            ]
                        }
                    }
                ]
            };
            myChart.setOption(option);
        }
    );
</script>
</body>