<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    
      
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page"><title>cssmoban</title>
    	<link rel="stylesheet" type="text/css" href="http://sandbox.runjs.cn/uploads/rs/55/sjckzedf/lanrenzhijia.css">
		<script type="text/javascript" src="http://sandbox.runjs.cn/uploads/rs/55/sjckzedf/jquery-1.8.0.min.js"></script>
<style>
    #div1{
        width: 170px;
        height: 100px;
        border-radius: 50px;
        position: relative;
    }
    #div2{
        width: 96px;
        height: 96px;
        border-radius: 48px;
        position: absolute;
        background: white;
        box-shadow: 0px 2px 4px rgba(0,0,0,0.4);
    }
    .open1{
        background: rgba(238, 8, 96, 0.8);
    }
    .open2{
        top: 2px;
        right: 1px;
    }
    .close1{
        background: rgba(255,255,255,0.4);
        border:3px solid rgba(0,0,0,0.15);
        border-left: transparent;
    }
    .close2{
        left: 0px;
        top: 0px;
        border:2px solid rgba(0,0,0,0.1);
    }
    </style>
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link href="assets/css/bootstrap.css" rel="stylesheet">

<!-- <link href="dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="dist/js/bootstrap-switch.js"></script> -->

</head>
<body>
	<%-- <jsp:include page="base.jsp"></jsp:include> --%>
	<%@ include file="base.jsp" %>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">
				灯光 <small>控制灯光效果</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li><a href="#">灯光</a></li>
				<li class="active">数据</li>
			</ol>

			

			<script>
				window.onload = function() {
					
					var div2 = document.getElementById("div2");
					var div1 = document.getElementById("div1");
					/* 	$.post("http://localhost:8080/cqtiq/switch/queryPerson",{"id":1},function(data){
							$("#a").html(data.name);
							$("#b").html(data.sex);
							$("#c").html(data.age);
						}); */
					//从后台查询开关状态，然后初始化开关
						$.post("http://localhost:8080/cqtiq/switch/query",{},function(list){
							div1.className = (list.onoff == "open") ? "open1"
									: "close1";
							div2.className = (list.onoff == "open") ? "open2": "close2";
						},"json");
					//按钮点击事件
					div2.onclick = function() {
						var name = "";
						//alert(name);
						div1.className = (div1.className == "close1") ? "open1"
								: "close1"; 
						if (div1.className == "open1") {
							/* alert('开') */
							$.post("http://localhost:8080/cqtiq/switch/save",{"name":"open"},function(data){},"json")
						}
						div2.className = (div2.className == "close2") ? "open2"
								: "close2";
						if (div1.className == "close1") {
							/* alert("关") */
							$.post("http://localhost:8080/cqtiq/switch/save",{"name":"close"},function(){
								
							},"json");
						}
						
					}
				}
			</script>
			
				<div id="div1" class="open1" value="1">
					<div id="div2" class="open2" value="2"></div>
				</div>
				<div>
				<br>
				<br>
				<br>
				<br>
				
				<div class="theme-popover">
		 <div class="theme-poptit">
			  <a href="javascript:;" title="关闭" class="close">×</a>
			  <h3>保存测试</h3>
		 </div>
		 <div class="theme-popbod dform">
			   <form class="theme-signin" name="loginform" action="http://localhost:8080/cqtiq/switch/saveUser" method="post">
					<ol>
						  <li><h4></h4></li>
						 <li><strong>名字：</strong><input class="ipt" type="text" name="name" value="" size="20" /></li>
						 <li><strong>性别：</strong><input class="ipt" type="text" name="sex" value="" size="20" /></li>
						 <li><strong>年龄：</strong><input class="ipt" type="text" name="age" value="" size="20" /></li>
						 <li><input class="btn btn-primary" type="submit" name="submit" value=" 保存 " /></li>
					</ol>
			   </form>
		 </div>
	</div>
					<script>
	jQuery(document).ready(function($) {
		$('.theme-login').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
		})
		$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
		})
	
	})
	</script>
	<form action="" method="post" id="userForm">
					<table border="1">
					<tr>
						<td><a class="btn btn-primary btn-large theme-login" href="javascript:;">增加</a></td>
						
					</tr>
						<tr>
							<td >名字</td>
							<td >性别</td>
							<td >年龄</td>
							<td >操作</td>
						</tr>
						<c:forEach items="${ uList }" var="l" varStatus="i">
						
							<tr  id="grid">
								<td><input type="text" value="${ l.name }" name="name${ l.id }"></td>
								<td><input type="text" value="${ l.sex }" name="sex${ l.id }"></td>
								<td><input type="text" value="${ l.age }" name="age${ l.id }"></td>
								<td style="display: none;" id="mytd"><input type="text" value="${ l.id }" name="id" id="id"></td>
								<td><input type="button" value="修改"  onclick="buttonSub1(${l.id});">/<input type="button" value="删除" onclick="buttonSub(${l.id});"></td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<script type="text/javascript">
					function buttonSub(id){
						alert("确认删除吗？")
						//alert(id);
						$.post("http://localhost:8080/cqtiq/switch/deleteUser",{"id":id},function(data){
							//alert(data)
							if(data == "true"){
								alert("删除成功！");
								window.location="switch"
							}
						});
					}
					function buttonSub1(id){
						var name =$("#userForm [name=name"+id+"]").val();
						var age =$("#userForm [name=age"+id+"]").val();
						var sex =$("#userForm [name=sex"+id+"]").val();
						$.post("http://localhost:8080/cqtiq/switch/updateUser",{"name":name,"age":age,"sex":sex,"id":id},function(data){
							//alert(data)
							if(data == "true"){
								alert("修改成功");
								window.location="switch";
							}
						})
					}
				</script>
			</div>
		</div>
		<div id="page-inner"></div>
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
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>

</body>
</html>
<script type="text/javascript">
	function empty() {
		var i = $('input[name="options"]:checked').val();
		/* alert(i); */
	}
</script>