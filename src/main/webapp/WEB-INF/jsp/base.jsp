<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>cssmoban</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>
     <div id="wrapper" style="background-color: #222222">
        <nav class="navbar navbar-default top-navbar" role="navigation" >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index" style="background-image: url('images/cqtiq2.png');"></a>
<!-- <div id="sideNav" href=""><i class="fa fa-caret-right"></i></div> -->
            </div>

            <ul class="nav navbar-top-links navbar-right">
                
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="userprofile"><i class="fa fa-user fa-fw"></i> 用户简介</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a class="a_post"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
         <script  src="js/common/jquery/jquery1.8.3.min.js"></script> 
        
        <script>
        jQuery(document).ready(function() {
        $(".a_post").on("click",function(){
        	
            event.preventDefault();//使a自带的方法失效，即无法调整到href中的URL(http://www.baidu.com)
            $.ajax({
                   type: "POST",
                   url: "/cqtiq/switch/exit",
                   contentType:"application/json",
                   dataType:"json",
                   success: function(result){
                      //请求正确之后的操作
                      if(result){
                    	 // alert("成功")
                    	  window.location="login";
                      }
                   },
                   error: function(result){
                      //请求失败之后的操作
                   }
            });
        });
        });
        </script>
         <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <!-- <li>
                        <a class="active-menu" href="index"><i class="fa fa-dashboard"></i> 仪表板</a>
                    </li> -->
                   <!--  <li>
                        <a href="ui-elements"><i class="fa fa-desktop"></i> UI 元素</a>
                    </li> -->
                    <li>
                        <a class="active-menu" href="table"><i class="fa fa-table"></i> 分页表</a>
                    </li>
                    <li>
                        <a class="active-menu" href="switch"><i class="fa fa-desktop"></i>灯光控制</a>
                    </li>
                    <li>
                        <a class="active-menu" href="echart"><i class="fa fa-dashboard"></i>测量表gauge</a>
                    </li>
					<li>
                        <a class="active-menu" href="chart"><i class="fa fa-bar-chart-o"></i> 图表</a>
                    </li>
                   <!--  <li>
                        <a href="tab-panel"><i class="fa fa-qrcode"></i> Tabs & 面板</a>
                    </li> -->
                    
                   <!--  <li>
                        <a href="form"><i class="fa fa-edit"></i> 表单</a>
                    </li> -->


                    <!-- <li>
                        <a href="#"><i class="fa fa-sitemap"></i>多级下拉菜单<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </li> -->
                    
                    
                    <li>
                        <a class="active-menu" href="line_sections"><i class="fa fa-bar-chart-o"></i>电量数据图</a>
                    </li>
                    <li>
                        <a class="active-menu" href="piezometer"><i class="fa fa-bar-chart-o"></i>压力计</a>
                    </li>
                    <li>
                        <a class="active-menu" href="gas"><i class="fa fa-bar-chart-o"></i>模拟图</a>
                    </li>
                    <li>
                        <a class="active-menu" href="rainfall"><i class="fa fa-bar-chart-o"></i>雨量图</a>
                    </li>
                    <li>
                        <a class="active-menu" href="totalpage"><i class="fa fa-bar-chart-o"></i>总体图</a>
                    </li>
                    <li>
                        <a class="active-menu" href="fire_alarm"><i class="fa fa-bar-chart-o"></i>火警图</a>
                    </li>
                </ul>

            </div>

        </nav>
        </body>