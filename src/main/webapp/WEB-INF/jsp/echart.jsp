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
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
	  <div class="header"> 
					<h1 class="page-header">
						 测量表 <small>显示状态</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="index">首页</a></li>
				  <li><a href="echart">测量表</a></li>
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
        	            max: 220,
        	            splitNumber: 11,
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
        	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        	                fontWeight: 'bolder',
        	                fontSize: 20,
        	                fontStyle: 'italic'
        	            },
        	            detail : {
        	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        	                formatter: function (value) {
        	                    value = (value + '').split('.');
        	                    value.length < 2 && (value.push('00'));
        	                    return ('00' + value[0]).slice(-2)
        	                        + '.' + (value[1] + '00').slice(0, 2);
        	                },
        	                fontWeight: 'bolder',
        	                borderRadius: 3,
        	                backgroundColor: '#444',
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
        	                width: 100,
        	                color: '#eee',
        	                rich: {}
        	            },
        	            data:[{value: 0, name: 'km/h'}]
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
        	                offsetCenter: [0, '-30%'],       // x, y，单位px
        	            },
        	            detail: {
        	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        	                fontWeight: 'bolder'
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
            option.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
            option.series[1].data[0].value = (Math.random()*7).toFixed(2) - 0;
            option.series[2].data[0].value = (Math.random()*2).toFixed(2) - 0;
            option.series[3].data[0].value = (Math.random()*2).toFixed(2) - 0;
            myChart.setOption(option,true);
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
        	    $.post("http://localhost:8080/cqtiq/echart/queryData",function(data){
        	    	//alert(data.h)
        	    	option.series[0].data[0].value =data.h - 0;
            	    option.series[1].data[0].value =data.tach - 0;
            	    option.series[2].data[0].value = data.gas - 0;
            	    option.series[3].data[0].value = data.water - 0;
            	    myChart.setOption(option,true); 
            	    //alert("")
        	    },"json");  
        	   
        	    
        	
        	},2000);

    </script>
</body>
</html>