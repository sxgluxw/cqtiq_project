<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/echarts.js"></script>
<script src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="js/echart/echart.js"></script>
<title>畅启科技</title>
<style type="text/css">
.main1 {
	background: linear-gradient(to left, #4b8289, #4b8289) left top
		no-repeat, linear-gradient(to bottom, #4b8289, #4b8289) left top
		no-repeat, linear-gradient(to left, #4b8289, #4b8289) right top
		no-repeat, linear-gradient(to bottom, #4b8289, #4b8289) right top
		no-repeat, linear-gradient(to left, #4b8289, #4b8289) left bottom
		no-repeat, linear-gradient(to bottom, #4b8289, #4b8289) left bottom
		no-repeat, linear-gradient(to left, #4b8289, #4b8289) right bottom
		no-repeat, linear-gradient(to left, #4b8289, #4b8289) right bottom
		no-repeat;
	background-size: 2px 15px, 15px 2px, 2px 15px, 15px 2px;
}

a:link {
	color: #a7b9cb;
	text-decoration: none;
}

#div1 {
	width: 100px;
	height: 40px;
	border-radius: 20px;
	position: relative;
}

#div2 {
	width: 35px;
	height: 35px;
	border-radius: 20px;
	position: absolute;
	background: #5285ce;
}

.open1 {
box-shadow: 0 0 20px #0a78b7 inset;
	background: #c23531;
}

.open2 {
	top: 0px;
	right: 0px;
	border: 2px solid #5285ce;
}

.close1 {
	box-shadow: 0 0 20px #0a78b7 inset;
	border-left: transparent;
}

.close2 {
	left: 0px;
	top: 0px;
	border: 2px solid #5285ce;
	background: #979597;
	
}

td {
	text-align: center;
	color: #96bede;
	font-size: 13px
}

.test {
	width: 50px;
	height: 200px;
	overflow: auto;
	float: left;
	margin: 2px;
	border: none;
}

.scrollbar {
	width: 0px;
	height: 0px;
	margin: 5px auto;
	position: absolute;
	top: 5px;
	left:;
}

.test-1::-webkit-scrollbar { /*滚动条整体样式*/
	width: 5px; /*高宽分别对应横竖滚动条的尺寸*/
	height: 2px;
}

.test-1::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	background: #07a0e5;
}

.test-1::-webkit-scrollbar-track { /*滚动条里面轨道*/
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	background: #0b1e29;
}
</style>
</head>

<body
	style="background-color: #071822; overflow: -Scroll; overflow-y: hidden">
	<div
		style="width: 90%; height: 30px; background-color: #071822; float: left; display: table-cell;">
		<span
			style="color: #45e1ff; font-family: serif; font-size: 25px; margin: 46.8%">数据图展示界面</span>
	</div>
	<div id="a_div"
		style="width: 10%; height: 30px; background-color: #071822; float: left; display: table-cell; float: left">
		<span
			style="color: #a7b9cb; font-family: serif; font-size: 15px; margin: 30%;">
			<a class="a_href" href="index" style="color: #d28f88;">返回首页</a>
		</span>
	</div>
	<div
		style="width: 900px; height: 1200px; background-color: #071822; float: left;">
		<div style="width: 900px; height: 10px;">
			<div id="main0" style="width: 900px; height: 10px;"></div>
		</div>
		<div style="width: 900px; height: 300px;">
			<div id="main1" class="main1"
				style="width: 700px; height: 250px; background-color: #0b1e29; margin: 0px auto; box-shadow: 0 0 20px #0a78b7 inset;"></div>
		</div>
		<div style="width: 900px; height: 300px;">
			<div id="main2" class="main1"
				style="width: 700px; height: 250px; background-color: #0b1e29; margin: 0 auto; box-shadow: 0 0 20px #0a78b7 inset;"></div>
		</div>
		<div style="width: 900px; height: 300px;">
			<div id="main3" class="main1"
				style="width: 700px; height: 250px; background-color: #0b1e29; margin: 0 auto; box-shadow: 0 0 20px #0a78b7 inset;"></div>
		</div>

	</div>
	<div
		style="width: 900px; height: 1200px; background-color: #071822; float: right; float: left;">
		<div style="width: 900px; height: 10px;">
			<div id="main5" style="width: 900px; height: 10px;"></div>
		</div>

		<div style="width: 900px; height: 450px;">
			<div id="main7" class="main1"
				style="width: 800px; height: 400px; background-color: #0b1e29; margin: 0 auto; box-shadow: 0 0 20px #0a78b7 inset;">
				<div id="main7_1"
					style="width: 760px; height: 130px; background-color: #0b1e29; margin: 0 auto; position: absolute; top: 70px; left: 980px; box-shadow: 0 0 20px #0a78b7 inset;">
					<div id="main7_1_1"
						style="width: 240px; height: 130px; background-color: #0b1e29; margin: 0 auto; float: left;">
						<div style="position: absolute; top: 30px; left: 0px;">
							<span id=""
								style="color: #85bbdb; font-family: serif; font-size: 20px; margin: 0%">led灯状态：</span>
						</div>
						<div style="position: absolute; top: 30px; left: 105px;">
							<span id="span1"
								style="color: #85bbdb; font-family: serif; font-size: 20px; margin: 0%"></span>
						</div>
						<div id="div1" class="open1" value="1"
							style="position: absolute; top: 70px; left: 60px;">
							<div id="div2" class="open2" value="2"></div>
						</div>
						<div style="position: absolute; top: 30px; left: 380px;">
							<span
								style="color: #85bbdb; font-family: serif; font-size: 20px; margin: 0%">七日内操作次数：</span>
						</div>
						<div style="position: absolute; top: 72px; left: 530px;">
							<div style="width: 100px; height: 40px; border-radius: 20px;">
								<span
									id = "span2" style="color: #b8de44; font-family: serif; font-size: 17px; margin: 0%"></span>
							</div>
						</div>
					</div>
					<div
						style="width: 20px; height: 130px; background-color: #0b1e29; margin: 0 auto; float: left;"></div>
					<div id="main7_1_2"
						style="width: 240px; height: 130px; background-color: #0b1e29; margin: 0 auto; float: left">

					</div>
					<div
						style="width: 20px; height: 130px; background-color: #0b1e29; margin: 0 auto; float: left;"></div>
					<div id="main7_1_3"
						style="width: 240px; height: 130px; background-color: #0b1e29; margin: 0 auto; float: left">

					</div>
					<div></div>
				</div>
				<div id="main7_2" class="main1"
					style="width: 370px; height: 200px; background-color: #0b1e29; margin: 0 auto; position: absolute; top: 220px; left: 980px; box-shadow: 0 0 10px #0993f3 inset;">
				</div>
				<div id="main7_3" class="main1"
					style="width: 370px; height: 200px; background-color: #0b1e29; margin: 0 auto; position: absolute; top: 220px; left: 1360px; box-shadow: 0 0 10px #0993f3 inset;">

					<div
						style="width: 362px; height: 36px; background-color: #0b1e29; margin: 0 auto; position: absolute; top: 15px; left: 5px;">
						<span
							style="color: #96bede; font-family: serif; font-size: 15px; margin: 10%">类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设备号&nbsp;&nbsp;&nbsp;&nbsp;更新时间</span>
					</div>
					<div class="test test-1"
						style="width: 360px; height: 157px; background-color: #0b1e29; position: absolute; top: 36px; left: 5px;">
						<table
							style="border: 0px solid #314a73; width: 100%; height: 144px;"
							rules="rows">

							<tbody id="tbody">

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
		<div style="width: 900px; height: 450px;">
			<div id="main6" class="main1"
				style="width: 800px; height: 400px; background-color: #0b1e29; margin: 0px auto;">
				<div id="main6_1" class="main1"
					style="width: 200px; height: 400px; background-color: #0b1e29; float: left; box-shadow: 0 0 20px #0a78b7 inset;"></div>
				<div
					style="width: 5px; height: 400px; background-color: #071822; float: left;"></div>
				<div id="main6_2" class="main1"
					style="width: 595px; height: 400px; background-color: #0b1e29; float: left; box-shadow: 0 0 20px #0a78b7 inset;"></div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main7_2'));

		var option = {
			title : {
				text : '七日内LED灯操作次数',
				textStyle : {
					color : '#acbed3'
				}
			},
			color : [ '#009bad' ],
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : [ '一日', '二日', '三日', '四日', '五日', '六日', '七日' ],
				axisTick : {
					alignWithLabel : true
				},
				axisLabel : {
					color : '#354146'
				},
			} ],
			yAxis : [ {
				type : 'value',
				axisLabel : {
					formatter : '{value}次',
					color : '#354146'
				},
				axisPointer : {
					snap : true
				},

			} ],
			series : [ {
				name : '操作次数',
				type : 'bar',
				barWidth : '60%',
				data : []
			} ]
		};

		var div2 = document.getElementById("div2");
		var div1 = document.getElementById("div1");
		var listtemp = null;

		setInterval(
				function() {
					var itme;
					$.ajax({
								type : "post",
								url : "/cqtiq/industry/query",
								dataType : "json",//数据类型为jsonp   
								success : function(list) {
									div1.className = (list[0].data == "1") ? "open1"
											: "close1";
									div2.className = (list[0].data == "1") ? "open2"
											: "close2";
									if (list[0].data == "1"
											&& div1.className == "open1") {
										$("#span1").html("开");
									} else if (list[0].data == "0"
											&& div1.className == "close1") {
										$("#span1").html("关");
									}
									;
									//listtemp = list[0].time;
									var flag = listtemp != list[0].time;
									if ((list[0].time != (listtemp))) {
										$("#tbody").html("");
										for (var i = 0; i < 10; i++) {
											var date = new Date(list[i].time);
											var date1 = new Date();
											if(date.getDate() == date1.getDate()){
												
												var o = {
														//"M+" : date.getMonth()+1,                 //月份   
														//"d+" : date.getDate(),                    //日   
														"h+" : date.getHours(), //小时   
														"m+" : date.getMinutes(), //分   
														"s+" : date.getSeconds(), //秒   
														//"q+" : Math.floor((date.getMonth()+3)/3), //季度   
														"S" : date.getMilliseconds()
													//毫秒   
													};
													var fmt = "hh:mm:ss";
													if (/(y+)/.test(fmt))
														fmt = fmt
																.replace(
																		RegExp.$1,
																		(date
																				.getFullYear() + "")
																				.substr(4 - RegExp.$1.length));
													for ( var k in o)
														if (new RegExp("(" + k + ")")
																.test(fmt))
															fmt = fmt
																	.replace(
																			RegExp.$1,
																			(RegExp.$1.length == 1) ? (o[k])
																					: (("00" + o[k])
																							.substr(("" + o[k]).length)));
												
											itme = "	<tr style=\"height: 36px;\"><td width=\"107px\">led灯</td><td width=\"107px\">"
													+ list[i].devnum
													+ "</td><td width=\"110px\">"
													+ fmt
													+ "</td><td></td></tr>";
											$("#tbody").append(itme);
											}else{
												var o = {
														//"M+" : date.getMonth()+1,                 //月份   
														"d+" : date.getDate(),                    //日   
														"h+" : date.getHours(), //小时   
														"m+" : date.getMinutes(), //分   
														"s+" : date.getSeconds(), //秒   
														//"q+" : Math.floor((date.getMonth()+3)/3), //季度   
														"S" : date.getMilliseconds()
													//毫秒   
													};
													var fmt = "dd日 hh:mm:ss";
													if (/(y+)/.test(fmt))
														fmt = fmt
																.replace(
																		RegExp.$1,
																		(date
																				.getFullYear() + "")
																				.substr(4 - RegExp.$1.length));
													for ( var k in o)
														if (new RegExp("(" + k + ")")
																.test(fmt))
															fmt = fmt
																	.replace(
																			RegExp.$1,
																			(RegExp.$1.length == 1) ? (o[k])
																					: (("00" + o[k])
																							.substr(("" + o[k]).length)));
												
											itme = "	<tr style=\"height: 36px;\"><td width=\"107px\">led灯</td><td width=\"107px\">"
													+ list[i].devnum
													+ "</td><td width=\"110px\">"
													+ fmt
													+ "</td><td></td></tr>";
											$("#tbody").append(itme);
											}
										}
									}

									listtemp = list[0].time;
								}

							});
					$.ajax({
	                    type : "post",
	                    url: "/cqtiq/industry/queryTimeData",
	                    dataType : "json",//数据类型为jsonp   
	             		success : function(list){
							$("#span2").html(list[7]+"次");
								 
							 for(var i = 0 ; i <7;i ++){
								option.series[0].data[i] = list[i]; 
							} 
						}
					});
					myChart.setOption(option, true);

				}, 500);
	</script>
	
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart1 = echarts.init(document.getElementById('main1'));

	// 指定图表的配置项和数据
	var date = [];

	var data =[];
	var option1 = {
			tooltip: {
				trigger: 'axis',
				position: function (pt) {
					return [pt[0], '10%'];
				}
			},
			title: {
				left: 'center',
				text: '大数据量面积图',
				textStyle:{
					color: '#acbed3'
				}
				
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
			xAxis: {
				type: 'category',
				axisLabel:{
					color:'#354146'
				},
				boundaryGap: false,	
				data: date
			},
			yAxis: {
				type: 'value',
				axisLabel:{
					color:'#354146'
				},
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
			//$.post("/cqtiq/gas/listData1",function(listData){
			//alert(listData[0].time);
			//option.xAxis[0].data[0].value=(Math.random()*100);
				//option.series[0].data[0]=(Math.round((Math.random() - 0.5) * 20 + Math.random() * 300));
				$.ajax({
				type : "post",
				url: "/cqtiq/gas/listData1",
				// dataType : "jsonp",//数据类型为jsonp   
				 dataType : "json",//数据类型为jsonp   
		  success : function(listData){
			 for (var i = 0; i <300; i++) {
				//alert("series:"+option.series[0].data[2]);
				 option1.series[0].data[i]=listData[i].gasdata;
				//if(i%5 == 0){
				option1.xAxis.data[i]=listData[i].time;
				 //}
			} 
			
		}
				});
			myChart1.setOption(option1,true);
					
			
			 
		},2000);
</script>

<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart2 = echarts.init(document.getElementById('main2'));

	// 指定图表的配置项和数据
	var option2 = {
			title: {
				left:'center',
				text: '用电量分布',
				
					textStyle:{
						color: '#acbed3'
					}
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
				axisLabel:{
					color:'#354146'
				},
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
					formatter: '{value} W',
					color:'#354146'
				},
				axisPointer: {
					snap: true
				},
				splitLine: {
					show: false
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
					/* markArea: {
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
					} */
					markLine: {
						silent: true,
						data: [{
							name: '低用电量',
							yAxis: 200
						}, {
							yAxis: 600
						}]
					}
				}
			]
		};
		setInterval(function () {
				//alert("l")
			/* $.post("/cqtiq/line/listData1",function(data){
				alert("k")
			alert(data);
			//option.xAxis[0].data[0].value=(Math.random()*100);
			 for (var i = 0; i < data.length; i++) {
				option2.series[0].data[i].value=data[i].numdata;
				option2.xAxis.data[i].value=data[i].time;
				//alert(option.series[0].data[i].value[0]);
			} 
			
			},"application/json"); */
			$.ajax({
				type : "post",
				url: "/cqtiq/line/listData1",
				// dataType : "jsonp",//数据类型为jsonp   
				 dataType : "json",//数据类型为jsonp   
		  //jsonpCallback:"callback",
		  success : function(data){
			  
				//alert(data);
				//option.xAxis[0].data[0].value=(Math.random()*100);
				 for (var i = 0; i < data.length; i++) {
					option2.series[0].data[i].value=data[i].numdata;
					option2.xAxis.data[i].value=data[i].time;
					//alert(option.series[0].data[i].value[0]);
				} 
				
				}
			});
			myChart2.setOption(option2,true);
					
			
			 
		},2000);
</script>

<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart3 = echarts.init(document.getElementById('main3'));

	// 指定图表的配置项和数据
	var option3 = {
			title : {
				left:"center",
				text: '雨量流量关系图',
				x: 'center',
				align: 'right',
				textStyle:{
					color: '#acbed3'
				}
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
					axisLabel:{
						color:'#354146'
					},
					boundaryGap : false,
				   // axisLine: {onZero: false},
					data : [
						]
				}
			],
			yAxis: [
				{
					name: '流量(m^3/s)',
					axisLabel:{
						color:'#354146'
					},
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
						
						 $.post("/cqtiq/rainfall/rainData1",function(rainData){
							 //alert(rainData)
							 for (var i = 0; i <500; i++) {
							 option3.series[0].data[i] = rainData[i].freshet;
							 option3.series[1].data[i] = rainData[i].rainfall;
							 option3.xAxis[0].data[i] = rainData[i].time;
						 }
						 },"json"); 
						 myChart3.setOption(option3,true);
		},2000);

</script>

<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart4 = echarts.init(document.getElementById('main6_1'));

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

	var option0 = {
		title : {
			text : '压力计',
			left : 'left',
			textStyle:{
				color: '#acbed3'
			}
		},
		tooltip : {},
		
		xAxis : {
			 axisLabel:{
				 color:'#354146'
			 },
			scale : true,
			show : false
		},
		yAxis : {
			 axisLabel:{
				 color:'#354146'
			 },
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
		//$.post("/cqtiq/echart/piezometerData1",function(eData) {
			$.ajax({
				type : "post",
				url: "/cqtiq/echart/piezometerData1",
				// dataType : "jsonp",//数据类型为jsonp   
				 dataType : "json",//数据类型为jsonp   
		  success : function(eData){
					data = [ [ 0, 20, '', 'D' ],[ 20, 20.1, 100, 'A' ], [ 20.1, 27, 15, 'B' ],
							[ 27, 27.1, '100', 'C' ],[ 27.1, 40, '', 'D' ],];
					
					data[2][2] = eData.h - 0;
				 if(parseInt(data[2][2])>=80){
						colorList = [ '#4f81bd',  '#4f81bd','#c0504d',
							'#4f81bd', '#f3f3f3', '#f3f3f3' ];
					}else	if(parseInt(data[2][2])<80){
						colorList = [ '#4f81bd',  '#4f81bd','#099a22',
							'#4f81bd', '#f3f3f3', '#f3f3f3' ];
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
					option0.series[0].data = data;
				}
			});
		myChart4.setOption(option0, true);
	}, 2000);
</script>

<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart5 = echarts.init(document.getElementById('main6_2'));

	// 指定图表的配置项和数据
	var option5= {
			tooltip : {
				formatter: "{a} <br/>{c} {b}"
			}, 
		 /*    toolbox: {
				show: true,
				feature: {
					restore: {show: true},
					saveAsImage: {show: true}
				}
			}, */
			series : [
				{
					name: '速度',
					type: 'gauge',
					z: 3,
					min: 0,
					max: 100,
					splitNumber: 10,
					radius: '50%',
					axisLine: {            // 坐标轴线
						lineStyle: {       // 属性lineStyle控制线条样式
							width: 10
						}
					},
					axisTick: {            // 坐标轴小标记
						length: 15,        // 属性length控制线长
						lineStyle: {       // 属性lineStyle控制线条样式
							color: 'auto'
						}
					},
					splitLine: {           // 分隔线
						length: 20,         // 属性length控制线长
						lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
							color: 'auto'
						}
					},
					axisLabel: {
						backgroundColor: 'auto',
						borderRadius: 2,
						color: '#eee',
						padding: 3,
						textShadowBlur: 2,
						textShadowOffsetX: 1,
						textShadowOffsetY: 1,
						textShadowColor: '#222'
					},
					title : {
						 offsetCenter: [0, '-30%'], 
						// 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: '0',
						color:'#acbed3',
						fontSize: 20,
						fontStyle: 'italic'
					},
					detail : {
						fontWeight: '-1',
						width: 32,
						// 其余属性默认使用全局文本样式，详见TEXTSTYLE
					 /*    formatter: function (value) {
							value = (value + '').split('.');
							value.length < 2 && (value.push('00'));
							return ('00' + value[0]).slice(-2)
								+ '.' + (value[1] + '00').slice(0, 2);
						},
						fontWeight: '-1',
						borderRadius: 3,
						backgroundColor: '#acbed3',
						borderColor: '#aaa',
						shadowBlur: 5,
						shadowColor: '#333',
						shadowOffsetX: 0,
						shadowOffsetY: 3,
						borderWidth: 2,
						textBorderColor: '#000',
						textBorderWidth: 2,
						textShadowBlur: 2,
						textShadowColor: '#fff',
						textShadowOffsetX: 0,
						textShadowOffsetY: 0,
						fontFamily: 'Arial',
						width: 32,
						color: '#eee',
						rich: {} */
					},
					data:[{value: 0, name: '压力Pa'}]
				},
				{
					name: '转速',
					type: 'gauge',
					center: ['20%', '55%'],    // 默认全局居中
					radius: '35%',
					min:0,
					max:7,
					endAngle:45,
					splitNumber:7,
					axisLine: {            // 坐标轴线
						lineStyle: {       // 属性lineStyle控制线条样式
							width: 8
						}
					},
					axisTick: {            // 坐标轴小标记
						length:12,        // 属性length控制线长
						lineStyle: {       // 属性lineStyle控制线条样式
							color: 'auto'
						}
					},
					splitLine: {           // 分隔线
						length:20,         // 属性length控制线长
						lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
							color: 'auto'
						}
					},
					pointer: {
						width:5
					},
					title: {
						fontWeight: '0',
						color:'#acbed3',
						offsetCenter: [10, '-20%'],       // x, y，单位px
					},
					detail: {
						// 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: '0'
					},
					data:[{value: 1.5, name: 'x1000 r/min'}]
				},
				{
					name: '油表',
					type: 'gauge',
					center: ['77%', '50%'],    // 默认全局居中
					radius: '25%',
					min: 0,
					max: 2,
					startAngle: 135,
					endAngle: 45,
					splitNumber: 2,
					axisLine: {            // 坐标轴线
						lineStyle: {       // 属性lineStyle控制线条样式
							width: 8
						}
					},
					axisTick: {            // 坐标轴小标记
						splitNumber: 5,
						length: 10,        // 属性length控制线长
						lineStyle: {        // 属性lineStyle控制线条样式
							color: 'auto'
						}
					},
					axisLabel: {
						formatter:function(v){
							switch (v + '') {
								case '0' : return 'E';
								case '1' : return 'Gas';
								case '2' : return 'F';
							}
						}
					},
					splitLine: {           // 分隔线
						length: 15,         // 属性length控制线长
						lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
							color: 'auto'
						}
					},
					pointer: {
						width:2
					},
					title : {
						show: false
					},
					detail : {
						show: false
					},
					data:[{value: 0.5, name: 'gas'}]
				},
				{
					name: '水表',
					type: 'gauge',
					center : ['77%', '50%'],    // 默认全局居中
					radius : '25%',
					min: 0,
					max: 2,
					startAngle: 315,
					endAngle: 225,
					splitNumber: 2,
					axisLine: {            // 坐标轴线
						lineStyle: {       // 属性lineStyle控制线条样式
							width: 8
						}
					},
					axisTick: {            // 坐标轴小标记
						show: false
					},
					axisLabel: {
						formatter:function(v){
							switch (v + '') {
								case '0' : return 'H';
								case '1' : return 'Water';
								case '2' : return 'C';
							}
						}
					},
					splitLine: {           // 分隔线
						length: 15,         // 属性length控制线长
						lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
							color: 'auto'
						}
					},
					pointer: {
						width:2
					},
					title: {
						show: false
					},
					detail: {
						show: false
					},
					data:[{value: 0.5, name: 'gas'}]
				}
			]
		};
var one = setInterval(function (){
		option5.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
		option5.series[1].data[0].value = (Math.random()*7).toFixed(2) - 0;
		option5.series[2].data[0].value = (Math.random()*2).toFixed(2) - 0;
		option5.series[3].data[0].value = (Math.random()*2).toFixed(2) - 0;
		myChart.setOption(option5,true);
	},2000);
   clearInterval(one);
		var flag = true;
		setInterval(function (){
		   /*  option.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
			option.series[1].data[0].value = (Math.random()*7).toFixed(2) - 0;
			option.series[2].data[0].value = (Math.random()*2).toFixed(2) - 0;
			option.series[3].data[0].value = (Math.random()*2).toFixed(2) - 0;
			myChart.setOption(option,true); */
			//alert("j");
			//$.post("/cqtiq/echart/queryData1",function(data){
				//alert(data.h)
				$.ajax({
				type : "post",
				url: "/cqtiq/echart/queryData1",
				// dataType : "jsonp",//数据类型为jsonp   
				 dataType : "json",//数据类型为jsonp   
		  success : function(data){
				option5.series[0].data[0].value =data.h - 0;
				option5.series[1].data[0].value =data.tach - 0;
				option5.series[2].data[0].value = data.gas - 0;
				option5.series[3].data[0].value = data.water - 0;
				myChart5.setOption(option5,true); 
				//alert("")
			}
				});  
		   
			
		
		},2000);

</script>
	
</body>
</html>