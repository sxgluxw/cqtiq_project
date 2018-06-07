<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入 echarts.js -->
<script src="js/echarts.js"></script>
<script src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
	  <div class="header"> 
					<h1 class="page-header">
						 电量数据图 <small>显示状态</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="index">首页</a></li>
				  <li><a href="echart">电量数据图</a></li>
				  <li class="active">数据展示</li>
				</ol> 
				</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 900px; height: 700px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
        	    title: {
        	        text: '用电量分布',
        	        subtext: '测试用的'
        	    },
        	   tooltip: {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross'
        	        }
        	    }, 
        	  /*   toolbox: {
        	        show: true,
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    }, */
        	    xAxis:  {
        	        type: 'category',
        	        boundaryGap: false,
        	        /* axisLabel: {
        	            formatter: function(data){
        	                var date = new Date();
        	                return date.getSeconds();
        	            }
        	        }, */
        	        data: [{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''}]
        	    },
        	    yAxis: {
        	        type: 'value',
        	        axisLabel: {
        	            formatter: '{value} W'
        	        },
        	        axisPointer: {
        	            snap: true
        	        }
        	    },
        	    visualMap: {
        	        show: false,
        	        dimension:1,
        	        pieces: [{
        	            lte: 0,
        	            color: 'green'
        	        }, {
        	            gt: 0,
        	            lte: 200,
        	            color: 'blue'
        	        }, {
        	            gt: 200,
        	            lte: 600,
        	            color: 'green'
        	        }, {
        	            gt: 600,
        	            lte: 800,
        	            color: 'red'
        	        }]
        	    },
        	    series: [
        	        {
        	            name:'用电量',
        	            type:'line',
        	            smooth: true,
        	            data:[{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''},{value:''}],
        	            markArea: {
        	                data: [ [{
        	                    name: '低用电量',
        	                    yAxis: '0'
        	                }, {    
        	                    yAxis: '200'
        	                }], [{
        	                    name: '高用电量',
        	                    yAxis: '600'
        	                }, {
        	                    yAxis: '800'
        	                }] ]
        	            }
        	        }
        	    ]
        	};
        	setInterval(function () {
        		$.post("http://localhost:8080/cqtiq/line/listData",function(data){
        		//alert(data[0].timeperature);
        		//option.xAxis[0].data[0].value=(Math.random()*100);
        		for (var i = 0; i < data.length; i++) {
        			option.series[0].data[i].value=data[i].numdata;
        			option.xAxis.data[i].value=data[i].time;
        			//alert(option.series[0].data[i].value[0]);
				}
        		
        		},"json");
        	    myChart.setOption(option,true);
        	            
        		
        		 
        	},2000);
    </script>
</body>
</html>