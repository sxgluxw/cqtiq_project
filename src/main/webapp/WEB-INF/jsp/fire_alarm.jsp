<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入 echarts.js -->
<script src="js/echarts.js"></script>

    <style type="text/css">
</style>
<link href="assets/css/bootstrap.css" rel="stylesheet" />
 <!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
 <!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
	<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
 <!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
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
	
	<jsp:include page="fire_alarm2.jsp"></jsp:include>
	</div>
</body>
</html>