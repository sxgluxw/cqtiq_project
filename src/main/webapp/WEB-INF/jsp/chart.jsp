<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="refresh" content="20">
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
		<div id="page-inner"> 
		 
			<div class="row"> 
				<script type="text/javascript">
				//setTimeout("alert('十秒钟到！')",10000)
				</script>
				  
						   <div class="col-md-6 col-sm-12 col-xs-12">                     
				<div class="panel panel-default">
					<div class="panel-heading">
						Bar Chart
					</div>
					<div class="panel-body">
						<div id="morris-bar-chart"></div>
					</div>
				</div>            
			</div>
				  <div class="col-md-6 col-sm-12 col-xs-12">                     
				<div class="panel panel-default">
					<div class="panel-heading">
						Area Chart
					</div>
					<div class="panel-body">
						<div id="morris-area-chart"></div>
					</div>
				</div>            
			</div> 
			
	   </div>
			 <!-- /. ROW  -->
			<div class="row">                     
				  
						   <div class="col-md-6 col-sm-12 col-xs-12">                     
				<div class="panel panel-default">
					<div class="panel-heading">
						Line Chart
					</div>
					<div class="panel-body">
						<div id="morris-line-chart"></div>
					</div>
				</div>            
			</div>
				  <div class="col-md-6 col-sm-12 col-xs-12">                     
				<div class="panel panel-default">
					<div class="panel-heading">
						Donut Chart
					</div>
					<div class="panel-body">                            
						<div id="morris-donut-chart"></div>
					</div>
				</div>            
			</div> 
			
	   </div>
			 <!-- /. ROW  -->
			 <footer><p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p></footer>
			</div>
		 <!-- /. PAGE INNER  -->
		</div>
	 <!-- /. PAGE WRAPPER  -->
	</div>
 <!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
  <!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
 <!-- Morris Chart Js -->
 <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>
  <!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>


</body>
</html>
