<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <meta http-equiv="refresh" content="20"> -->
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
</head>
<!-- <script  src="js/common/jquery/jquery1.8.3.min.js"></script>
	<script>
	jQuery(document).ready(function() {
		alert("准备中")
        setInterval(function () {
        	alert("刷新开始")
            $("#panel-body").load(location.href + " #panel-body");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
        }, 8000);//8秒自动刷新
    })

</script> -->
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
	  <div class="header"> 
					<h1 class="page-header">
						 Charts <small>Show up your stats</small>
					</h1>
					<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li><a href="#">Charts</a></li>
				  <li class="active">Data</li>
				</ol> 
								
	</div>
	<jsp:include page="datachart.jsp"></jsp:include>
	</div>
		
		
	   
			

</body>
</html>
