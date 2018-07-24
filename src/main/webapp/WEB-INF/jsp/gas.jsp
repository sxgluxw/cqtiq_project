<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>畅启科技</title>
<!-- 引入 echarts.js -->
<script src="js/echarts.js"></script>
<script src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
	  <div class="header"> 
					<h1 class="page-header">
						 模拟数据图 <small>显示状态</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="index">首页</a></li>
				  <li><a href="echart">模拟数据图</a></li>
				  <li class="active">数据展示</li>
				</ol> 
				</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 900px; height: 700px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var date = [];

		var data =[];
        var option = {
        	    tooltip: {
        	        trigger: 'axis',
        	        position: function (pt) {
        	            return [pt[0], '10%'];
        	        }
        	    },
        	    title: {
        	        left: 'center',
        	        text: '大数据量面积图',
        	    },
        	    toolbox: {
        	        feature: {
        	            dataZoom: {
        	                yAxisIndex: 'none'
        	            },
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    },
        	    xAxis: {
        	        type: 'category',
        	        boundaryGap: false,
        	        data: date
        	    },
        	    yAxis: {
        	        type: 'value',
        	        boundaryGap: [0, '100%']
        	    },
        	    dataZoom: [{
        	        type: 'inside',
        	        start: 0,
        	        end: 80
        	    }, {
        	    	show: false,
        	        start: 0,
        	        end: 80,
        	        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        	        handleSize: '80%',
        	        handleStyle: {
        	            color: '#fff',
        	            shadowBlur: 3,
        	            shadowColor: 'rgba(0, 0, 0, 0.6)',
        	            shadowOffsetX: 2,
        	            shadowOffsetY: 2
        	        }
        	    }],
        	    series: [
        	        {
        	            name:'模拟数据',
        	            type:'line',
        	            smooth:true,
        	            symbol: 'none',
        	            sampling: 'average',
        	            itemStyle: {
        	                normal: {
        	                    color: 'rgb(255, 70, 131)'
        	                }
        	            },
        	            areaStyle: {
        	                normal: {
        	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
        	                        offset: 0,
        	                        color: 'rgb(255, 158, 68)'
        	                    }, {
        	                        offset: 1,
        	                        color: 'rgb(255, 70, 131)'
        	                    }])
        	                }
        	            },
        	            data: data
        	        }
        	    ]
        	};
        	setInterval(function () {
        		$.post("/cqtiq/gas/listData",function(listData){
        		//alert(listData[0].time);
        		//option.xAxis[0].data[0].value=(Math.random()*100);
        			//option.series[0].data[0]=(Math.round((Math.random() - 0.5) * 20 + Math.random() * 300));
         		for (var i = 0; i <300; i++) {
        			//alert("series:"+option.series[0].data[2]);
         		    option.series[0].data[i]=listData[i].gasdata;
         		   //if(i%5 == 0){
        			option.xAxis.data[i]=listData[i].time;
         		    //}
				} 
        		
        	},"json");
        	    myChart.setOption(option,true);
        	            
        		
        		 
        	},2000);
    </script>
</body>
</html>