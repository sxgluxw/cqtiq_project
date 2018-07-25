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
					myChart.setOption(option, true);
						}
					});
					myChart.setOption(option, true);
					//建立websocket
				      var websocket = null;
				      if('WebSocket' in window){
				          var webhost = location.hostname;
				          var loginname = "zs";
				          websocket = new WebSocket("ws://192.168.31.174:8081/websocket/information/"+loginname);
					  alert(websocket);
				      }
				      else {
				          winTip.alert('Not support websocket')
				      }

				      websocket.onerror = function () {
				          alert("error");
				      };

				      websocket.onopen = function (event) {
				         alert("open");
				      }

				      websocket.onmessage = function (event) {
					alert("l")
				          //setMessageInnerHTML(event.data);
				          var str = event.data;
				          var strs = str.split(",");
				          //数组第一个为命令字，用于判断是什么业务
				          var cmd = strs[0];
				          alert(cmd);
				      }
	</script>
	
	
	
</body>
</html>