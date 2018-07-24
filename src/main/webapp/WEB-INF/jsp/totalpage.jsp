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
<title>Insert title here</title>
<style type="text/css">
	.main1{
		background: linear-gradient(to left, #4b8289, #4b8289) left top no-repeat, 
	                linear-gradient(to bottom, #4b8289, #4b8289) left top no-repeat, 
	                linear-gradient(to left, #4b8289, #4b8289) right top no-repeat,
	                linear-gradient(to bottom, #4b8289, #4b8289) right top no-repeat, 
	                linear-gradient(to left, #4b8289, #4b8289) left bottom no-repeat,
	                linear-gradient(to bottom, #4b8289, #4b8289) left bottom no-repeat,
	                linear-gradient(to left, #4b8289, #4b8289) right bottom no-repeat,
	                linear-gradient(to left, #4b8289, #4b8289) right bottom no-repeat;
	    background-size: 2px 15px, 15px 2px, 2px 15px, 15px 2px;
	}
	
	a:link {color: #a7b9cb; text-decoration:none;};
</style>
</head>

<body style="background-color: #071822;overflow:-Scroll;overflow-y:hidden" >
	<div style="width: 90%;height: 30px ;background-color: #071822 ;float: left;display:table-cell;">
		<span style="color:#a7b9cb ;font-family: serif;font-size: 25px;margin: 50%">数据图展示界面</span>
	</div >
	<div id = "a_div" style="width: 10%;height: 30px ;background-color: #071822 ;float: left;display:table-cell;float: left">
		<span style="color:#a7b9cb ;font-family: serif;font-size: 15px;margin:30%;">
			<a class = "a_href" href="index" style="color: #97989c;">返回首页</a>
		</span>
	</div>
	<div  style="width: 900px;height: 1200px ;background-color: #071822 ;float: left;">
		<div style="width: 900px;height: 10px;">
			<div id= "main0" style="width: 900px;height: 10px;" ></div>
		</div>
		<div style="width: 900px;height: 300px;">
			<div id= "main1" class = "main1" style="width: 700px;height: 250px;background-color: #0b1e29; margin: 0px auto;" ></div>
		</div>
		<div style="width: 900px;height: 300px; ">
			<div id= "main2" class = "main1" style="width: 700px;height: 250px;background-color: #0b1e29; margin: 0 auto;"></div>
		</div>
		<div style="width: 900px;height: 300px;">
			<div id= "main3" class = "main1" style="width: 700px;height: 250px;background-color: #0b1e29; margin: 0 auto"></div>
		</div>
		
	</div>
	<div  style="width: 900px;height: 1200px ;background-color: #071822;float: right; float: left ;" >
		<div style="width: 900px;height: 10px;">
			<div id= "main5" style="width: 900px;height: 10px;" ></div>
		</div>
		<div style="width: 900px;height: 450px;">
			<div id= "main6" class = "main1" style="width: 800px;height: 400px;background-color: #0b1e29; margin: 0px auto;" >
				<div id = "main6_1" class = "main1" style="width: 200px;height: 400px;background-color: #0b1e29;float: left;"></div>
				<div  style="width: 5px;height: 400px;background-color: #071822;float: left;"></div>
				<div id = "main6_2" class = "main1" style="width: 595px;height: 400px;background-color: #0b1e29;float: left;"></div>
			</div>
		</div>
		<div style="width: 900px;height: 450px; ">
			<div id= "main7" class = "main1" style="width: 800px;height:400px;background-color: #0b1e29; margin: 0 auto;">
				<strong style="color:#acbed3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数据库获取的时间：</strong>
				<span style="color:#acbed3" id="getTime"></span>  
			    <button id="stopit" style="background-color: #0b1e29;color:#acbed3">停止定时器</button>   
			    <button id="startit"  style="background-color: #0b1e29;color:#acbed3">开启定时器</button>  
    			<div id="container" style="min-width:400px; height: 400px;"></div>
			</div>
		</div>
		
	</div>
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

		var option = {
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
						option.series[0].data = data;
					}
				});
			myChart4.setOption(option, true);
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
    
    <script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/highcharts.js"></script>  
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script> 
    <script>          
        Highcharts.setOptions({  
                    global: {  
                        useUTC: false  
                    }  
                });  
                function activeLastPointToolip(chart) {  
                    var points = chart.series[0].points;  
                    chart.tooltip.refresh(points[points.length -1]);  
                }  
                  
                $('#container').highcharts({  
                    chart: {  
                        type: 'spline', 
                        backgroundColor:'#0b1e29',
                        animation: Highcharts.svg,  
                        marginRight: 10,  
                        events: {  
                            load: function () {  
                                //每秒从数据库获取一个数  
                                var series = this.series[0],  
                                    chart = this;  
                                //定时器  
                                var iCount = setInterval(function t(){  
                                    var url = "/cqtiq/datachart/data";  
                                    $("#getTime").load(url,function(backData,textStatus,xmlHttpRequest){  
                                        var $temperature = parseFloat(backData.substr(0,4));//对传过来的数据进行类型转换  
                                        var $time = (new Date(Date.parse((backData.substr(5,21)).replace(/-/g,"/")))).getTime();  
                                        //每隔一秒添加进去的数  
                                        var x = $time;  
                                            y = $temperature;  
                                        series.addPoint([x, y], true, true);  
                                        activeLastPointToolip(chart)  
                                    });  
                                }, 2000);  
                                	var flag = true;
                                //关闭定时器  
                                $("#stopit").click(function(){  
                                     clearInterval(iCount);
                                     return flag = true;
                                }); 
                                $("#startit").click(function(){  
                                	//window.location.href= "chart"; 
                                	//关闭定时器  
                                    $("#stopit").click(function(){  
                                         clearInterval(iCount); 
                                         return flag = true;
                                    });
                                	if(flag){
                                	var iCount = setInterval(function t(){  
                                    var url = "/cqtiq/datachart/data";  
                                    $("#getTime").load(url,function(backData,textStatus,xmlHttpRequest){  
                                        var $temperature = parseFloat(backData.substr(0,4));//对传过来的数据进行类型转换  
                                        var $time = (new Date(Date.parse((backData.substr(5,21)).replace(/-/g,"/")))).getTime();  
                                        //每隔一秒添加进去的数  
                                        var x = $time;  
                                            y = $temperature;  
                                        series.addPoint([x, y], true, true);  
                                        activeLastPointToolip(chart)  
                                    });  
                                }, 2000);
                                	return flag = false;
                                	}
                                	
                                	
                               });
                                  
                            }  
                        }  
                    },  
                    title: {  
                        text: '动态模拟实时数据',
                        style:{color:'#acbed3'}
                    },  
                    xAxis: {  
                        type: 'datetime',  
                        tickPixelInterval: 150  
                    },  
                    yAxis: {  
                        title: {  
                            text: '值'  
                        },  
                        plotLines: [{  
                            value: 0,  
                            width: 1,  
                            color: '#808080'  
                        }]  
                    },  
                    tooltip: {  
                        formatter: function () {  
                            return '<b>' + this.series.name + '</b><br/>' +  
                                Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +  
                                Highcharts.numberFormat(this.y, 1);  
                        }  
                    },  
                    legend: {  
                        enabled: false  
                    },  
                    exporting: {  
                        enabled: false  
                    },  
                    series: [{  
                        name: '数据',  
                        data: (function () {  
                            var data = [],  
                                time = (new Date()).getTime(),  
                                i;  
                            for (i = -19; i <= 0; i += 1) {  
                                data.push({  
                                    x: time + i * 1000,  
                                    y: Math.random()+19  
                                });  
                            }  
                            return data;  
                        }())  
                    }]  
                }, function(c) {  
                    activeLastPointToolip(c)  
                });  
    </script>  
</body>
</html>