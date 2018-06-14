<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- 引入 echarts.js -->
    <script src="js/echarts.js"></script>
    <script  src="js/common/jquery/jquery1.8.3.min.js"></script>
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
	  <div class="header"> 
					<h1 class="page-header">
						 雨量流量关系图 <small>显示状态</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="index">首页</a></li>
				  <li><a href="echart">雨量流量关系图</a></li>
				  <li class="active">数据展示</li>
				</ol> 
				</div>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 900px;height:700px;"></div></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
        	    title : {
        	        text: '雨量流量关系图',
        	        subtext: '数据来自模拟',
        	        x: 'center',
        	        align: 'right'
        	    },
        	    grid: {
        	        bottom: 80
        	    },
        	  /*   toolbox: {
        	        feature: {
        	            dataZoom: {
        	                yAxisIndex: 'none'
        	            },
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    }, */
        	    tooltip : {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross',
        	            animation: false,
        	            label: {
        	                backgroundColor: '#505765'
        	            }
        	        }
        	    },
        	    legend: {
        	        data:['流量','降雨量'],
        	        x: 'left'
        	    },
        	    dataZoom: [
        	        {
        	            show: false,
        	            realtime: true,
        	            start: 0,
        	            end: 85
        	        },
        	        {
        	            type: 'inside',
        	            realtime: true,
        	            start: 65,
        	            end: 85
        	        }
        	    ],
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	           // axisLine: {onZero: false},
        	            data : [
        	                ]
        	        }
        	    ],
        	    yAxis: [
        	        {
        	            name: '流量(m^3/s)',
        	            type: 'value',
        	            max: 500
        	        },
        	        {
        	            name: '降雨量(mm)',
        	            nameLocation: 'start',
        	            max: 5,
        	            type: 'value',
        	            inverse: true
        	        }
        	    ],
        	    series: [
        	        {
        	            name:'流量',
        	            type:'line',
        	            animation: false,
        	            areaStyle: {
        	                normal: {}
        	            },
        	            lineStyle: {
        	                normal: {
        	                    width: 1
        	                }
        	            },
        	            markArea: {
        	                silent: true,
        	                data: [[{
        	                    xAxis: '2009/9/12\n7:00'
        	                }, {
        	                    xAxis: '2009/9/22\n7:00'
        	                }]]
        	            },
        	            data:[
        	              ]
        	        },
        	        {
        	            name:'降雨量',
        	            type:'line',
        	            yAxisIndex:1,
        	            animation: false,
        	            areaStyle: {
        	                normal: {}
        	            },
        	            lineStyle: {
        	                normal: {
        	                    width: 1
        	                }
        	            },
        	            markArea: {
        	                silent: true,
        	                data: [[{
        	                    xAxis: '2009/9/10\n7:00'
        	                }, {
        	                    xAxis: '2009/9/20\n7:00'
        	                }]]
        	            },
        	            data: [
        	              ]
        	        }
        	    ]
        	};
        	setInterval(function () {
        	   // alert(option.series[1].data[0])
        	   // alert(option.xAxis[0].data[1])
        	            /* 	for (var i = 0; i <160; i++) {
        	         		    
        	         		    if((i>50&&i<70) || (i>140 && i <160)){
        	         		         option.series[0].data[i]=(Math.random() ) * 500;
        	         		    }else{
        	         		        option.series[0].data[i]=(Math.random() ) * 2;
        	         		    }
        	         		     if((i>30&&i<50) || (i>110 && i <160)){
        	         		         option.series[1].data[i]=(Math.random() ) * 5;
        	         		    }else{
        	         		        option.series[1].data[i]=(Math.random() ) * 0.1;
        	         		    }
        	         		    //option.series[1].data[i]=(Math.random() ) * 1;
        	        			option.xAxis[0].data[i]=(new Date()).getSeconds();
        	        			//alert(option.series[0].data[i].value[0]);
        					} */
        					
        					 $.post("/cqtiq/rainfall/rainData",function(rainData){
        						 for (var i = 0; i <500; i++) {
        						 option.series[0].data[i] = rainData[i].freshet;
        						 option.series[1].data[i] = rainData[i].rainfall;
        						 option.xAxis[0].data[i] = rainData[i].time;
        					 }
        					 },"json"); 
        					 myChart.setOption(option,true);
        	},2000);

    </script>
</body>
</html>