<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Insert title here</title>  
<!-- <script type="text/javascript" src="../../bootstrap/js/jquery-3.1.1.js"></script>  --> 
<!-- <script src="assets/js/jquery-1.10.2.js"></script> -->
<script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/highcharts.js"></script>  
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>  
</head>  
<body>  
<%-- <jsp:include page="base.jsp"></jsp:include> --%>

    数据库获取的时间：<span id="getTime"></span>  
  
    <button id="stopit">停止定时器</button>   
    <button id="startit">开启定时器</button>  
      
      
    <div id="container" style="min-width:400px; height: 400px;"></div>  
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
                        animation: Highcharts.svg,  
                        marginRight: 10,  
                        events: {  
                            load: function () {  
                                //每秒从数据库获取一个数  
                                var series = this.series[0],  
                                    chart = this;  
                                //定时器  
                                var iCount = setInterval(function t(){  
                                    var url = "http://localhost:8080/cqtiq/datachart/data";  
                                    $("#getTime").load(url,function(backData,textStatus,xmlHttpRequest){  
                                        var $temperature = parseFloat(backData.substr(0,4));//对传过来的数据进行类型转换  
                                        var $time = (new Date(Date.parse((backData.substr(5,21)).replace(/-/g,"/")))).getTime();  
                                        //每隔一秒添加进去的数  
                                        var x = $time;  
                                            y = $temperature;  
                                        series.addPoint([x, y], true, true);  
                                        activeLastPointToolip(chart)  
                                    });  
                                }, 1000);  
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
                                    var url = "http://localhost:8080/cqtiq/datachart/data";  
                                    $("#getTime").load(url,function(backData,textStatus,xmlHttpRequest){  
                                        var $temperature = parseFloat(backData.substr(0,4));//对传过来的数据进行类型转换  
                                        var $time = (new Date(Date.parse((backData.substr(5,21)).replace(/-/g,"/")))).getTime();  
                                        //每隔一秒添加进去的数  
                                        var x = $time;  
                                            y = $temperature;  
                                        series.addPoint([x, y], true, true);  
                                        activeLastPointToolip(chart)  
                                    });  
                                }, 1000);
                                	return flag = false;
                                	}
                                	
                                	
                               });
                                  
                            }  
                        }  
                    },  
                    title: {  
                        text: '动态模拟实时数据'  
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