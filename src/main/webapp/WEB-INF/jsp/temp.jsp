<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta charset="UTF-8">
<title>Basic Window - jQuery EasyUI Demo</title>
<title>Basic TextBox - jQuery EasyUI Demo</title>





<link rel="stylesheet" type="text/css"
	href="easyui/themes/material-teal/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css"> -->
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="js/echarts.js"></script>



</head>
<body>

	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 900px; height: 700px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
        	    title: {
        	        text: '烟雾传感器',
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
        	            formatter: '{value} %FT'
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
        	            lte: 0.3,
        	            color: 'green'
        	        }, {
        	            gt: 0.3,
        	            lte: 0.65,
        	            color: 'green'
        	        }, {
        	            gt: 0.65,
        	            lte: 15.5,
        	            color: 'red'
        	        }]
        	    },
        	    series: [
        	        {
        	            name:'室内颗粒浓度',
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
        	                    yAxis: 200
        	                }, {
        	                    yAxis: 600
        	                }]
        	            }
        	        }
        	    ]
        	};
        	var t = setInterval(function () {
        		$.post("/cqtiq/fire/fireData",function(data){
        			//alert("k")
        		//alert(data[0].timeperature);
        		//option.xAxis[0].data[0].value=(Math.random()*100);
         		for (var i = 0; i < data.length; i++) {
        			option.series[0].data[i].value=data[i].smokescope;
        			option.xAxis.data[i].value=data[i].time;
        			//alert(option.series[0].data[i].value[0]);
				} 
        		
        		},"json");
        	    myChart.setOption(option,true);
        	            alert(${cookie['alarm'].value}== '400')
        	 if(${cookie['alarm'].value} == '400'){
        		 setInterval(t,2000);
        		clearInterval(t);
        		var data = "火警报警，请工作人员疏散人群，查看室内情况";
        		alert("k")
        			
        			 $.messager.alert('警告',data,"warning",function(d){
        				 alert(d)
        			     if (true){
        					 //$.messager.alert('Warning',data,"warning");
        			    	 $.messager.prompt('Prompt', '请再次确认，并输入原因', function(r){
        			    		 alert(r)
        			 			if (r){
									$.post("/cqtiq/confirm/fireAlarm",{"msg":r},function(data){
           			 					
           			 				})
        			 			}else{
        			 				window.location.href = "temp"
        			 			}
        			 		});
        			     }
        			 });
        	} 
        		
        		 
        	},2000);
        	
        	
        	
        	
    </script>



</body>
</html>