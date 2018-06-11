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
						 压力计 <small>显示状态</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="index">首页</a></li>
				  <li><a href="piezometer">压力计</a></li>
				  <li class="active">数据展示</li>
				</ol> 
				</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 900px; height: 700px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var data = [];
		var colorList = [ '#4f81bd', '#c0504d', '#4f81bd', '#f3f3f3',
				'#f3f3f3', '#f3f3f3' ];

		function renderItem(params, api) {
			var yValue = api.value(2);
			var start = api.coord([ api.value(0), yValue ]);
			var size = api.size([ api.value(1) - api.value(0), yValue ]);
			var style = api.style();

			return {
				type : 'rect',
				shape : {
					x : start[0],
					y : start[1],
					width : size[0],
					height : size[1]
				},
				style : style
			};
		}

		var option = {
			title : {
				text : '压力计',
				left : 'left'
			},
			tooltip : {},
			
			xAxis : {
				scale : true,
				show : false
			},
			yAxis : {
				show : false
			},
			series : [ {
				type : 'custom',
				renderItem : renderItem,
				label : {
					normal : {
						show : true,
						position : 'top'
					}
				},
				dimensions : [ 'from', 'to', 'profit' ],
				encode : {
					x : [ 0, 1 ],
					y : 2,
					tooltip : [ 0, 1, 2 ],
					itemName : 3
				},
				data : data
			} ]
		};
		setInterval(function() {
			$.post("http://localhost:8080/cqtiq/echart/piezometerData",
					function(eData) {
						data = [ [ 10, 10.1, 100, 'A' ], [ 10.1, 14, 15, 'B' ],
								[ 14, 14.1, '100', 'C' ], [ 26, 32, '', 'D' ],
								[ 32, 56, '', 'E' ], [ 56, 62, '', 'F' ] ];
						
						data[1][2] = eData.h - 0;
					 if(parseInt(data[1][2])>=80){
							colorList = [ '#4f81bd', '#c0504d', '#4f81bd',
									'#f3f3f3', '#f3f3f3', '#f3f3f3' ];
						}else	if(parseInt(data[1][2])<80){
							colorList = [ '#4f81bd', '#099a22', '#4f81bd',
								'#f3f3f3', '#f3f3f3', '#f3f3f3' ];
						}
						data = echarts.util.map(data, function(item, index) {
							return {
								value : item,
								itemStyle : {
									normal : {
										color : colorList[index]
									}
								}
							};
						});
						/* myChart.setOption({
							series : [ {
								data : data
							} ]
						}); */
						option.series[0].data = data;
					}, "json");
			myChart.setOption(option, true);
		}, 2000);
    </script>
</body>
</html>