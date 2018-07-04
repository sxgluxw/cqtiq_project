<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/material-teal/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css"> -->
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<!-- <script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
 -->
<!-- <link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" /> -->
</head>
<body style="overflow: -Scroll; overflow-y: hidden" >
	<jsp:include page="base.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper" style="background-color: #fff">
		<div class="header">

			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
				<li><a href="userprofile">个人信息</a></li>
			</ol>
		</div>
		<div style="margin: 20px 0;"></div>
		<div style="width: 100%; max-width: 400px; padding: 30px 60px;">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="用户名:" labelPosition="top"
					style="width: 100%;" value="${ user.username }" readonly="readonly">
			</div>
		<%-- 	<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="测试" labelPosition="top"
					style="width: 100%;" value="${ msg }" readonly="readonly">
			</div> --%>

			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" label="密码:" labelPosition="top"
					style="width: 100%;" value="${ user.password }" readOnly="true">
			</div>

			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="邮箱:" labelPosition="top"
					style="width: 100%;" readonly="readonly" value="${ user.email }">
			</div>
			<div>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" iconCls="icon-edit"
					style="width: 100%; height: 32px; background-color: #fafafa; border: 0px">
					<strong style="color: #333333"> 编辑个人资料</strong>
				</button>
			</div>
			<!-- 模态框 -->
			<div class="modal fade" id="myModal" style="padding: 90px;">
				<div class="modal-dialog" style="background-color: #333333">
					<div class="modal-content" style="background-color: #1b1b1b">
						<form action="/cqtiq/userprofile/editUser" onsubmit="return tijiao();" method="post">
							<input type="hidden" name = "userid" id="userid" value="${ user.id }">
							<!-- 模态框头部 -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									style="color: #acbed3">x</button>
								<h4 class="modal-title" style="color: #acbed3">个人信息</h4>
							</div>

							<!-- 模态框主体 -->
							<div class="modal-body">
								<div class="form-group">
									<label for="firstname" class="col-sm-5 control-label">设置新用户名：</label>
									<div class="col-sm-5">
										<input name="username" id = "username"
											style="width: 100%; background-color: #212121; border: 0px; outline: none; color: #acbed3"
											value="${ user.username }"> <span id="input1"
											style="color: red"></span>
									</div>

								</div>
							</div>
							<div class="modal-body">

								<div class="form-group">
									<label for="firstname" class="col-sm-5 control-label">请输入原密码：</label>
									<div class="col-sm-5">
										<input type="password" name= "old_password" id = "old_password"
											style="width: 100%; background-color: #212121; border: 1px; color: #acbed3"
											value="">
									</div>

								</div>




							</div>
							<div class="modal-body">

								<div class="form-group">
									<label for="firstname" class="col-sm-5 control-label">设置新的密码：</label>
									<div class="col-sm-5">
										<input id="password" name="password" type="password"
											style="width: 100%; background-color: #212121; border: 1px; color: #acbed3"
											value=""> <span id="input2" style="color: red"></span>
									</div>

								</div>




							</div>
							<div class="modal-body">

								<div class="form-group">
									<label for="firstname" class="col-sm-5 control-label">重复新的密码：</label>
									<div class="col-sm-5">
										<input id="re_password" name="re_password" type="password"
											style="width: 100%; background-color: #212121; border: 1px; color: #acbed3"
											value=""> <span id="input3" style="color: red"></span>
									</div>

								</div>




							</div>
							<div class="modal-body">

								<div class="form-group">
									<label for="firstname" class="col-sm-5 control-label">设置新的邮箱：</label>
									<div class="col-sm-5">
										<input name= "email" id = "email"
											style="width: 100%; background-color: #212121; border: 0px; outline: none; color: #acbed3"
											value="${ user.email }">
									</div>

								</div>



							</div>

							<!-- 模态框底部 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-secondary" class="register" id="btn"
									onclick="tijiao1();">提交</button>

							</div>
						</form>

					</div>
				</div>
			</div>
			
			<c:if test="${cookie['msg'].value eq '400'}">
				<div id="w" class="easyui-window" title="警告" data-options="iconCls:'icon-error'" style="width:500px;height:200px;padding:10px; background-color: #212121;">
        <strong style="color: #acbed3">旧密码输入错误，请尝试与管理员联系！</strong>
    </div>
			</c:if>
			<c:if test="${cookie['loginMsg'].value eq '400'}">
				<div id="w" class="easyui-window" title="警告" data-options="iconCls:'icon-error'" style="width:500px;height:200px;padding:10px; background-color: #212121;">
        <strong style="color: #acbed3">用户名已被占用，请重新操作！</strong>
    </div>
			</c:if>
</body>

<script type="text/javascript">
	$(document).ready(function() {
	
		
		$.post("/cqtiq/userprofile/queryUser", function(data) {
		});
		
		
		var flag = $("#re_password").blur(function(){
			var re_password = $("#re_password").val();
			var password = $("#password").val();
			if (password != re_password) {

				$("#input2").html("2次密码输出不一样！");
				$("#input3").html("2次密码输出不一样！");
				setTimeout(function() {
					$("#input2").html("");
					$("#input3").html("");
				}, 5000);
				document.getElementById("btn").disabled="disabled";
				return false;
			} else {
				$("#input2").html("");
				$("#input3").html("");
				document.getElementById("btn").disabled=false;
				return true;
			}
		});
		
		
		
		var flag = $("#username").blur(function(){
			var username = $('#username').val();
			var userid = $('#userid').val();
			$.post("/cqtiq/userprofile/getFlag",{"username":username,"userid":userid}, function(data) {
				if (data == "400") {

					$("#input1").html("用户名已被占用，请重新输入");
					setTimeout(function() {
						$("#input1").html("");
					}, 5000);
					return false;
				} else {
					$("#input1").html("");
					return true;
				}
				
			});
		});
		
		
		var flag = $("#password").blur(function(){
			var re_password = $("#re_password").val();
			var password = $("#password").val();
			if (password != re_password) {

				$("#input2").html("2次密码输出不一样！");
				$("#input3").html("2次密码输出不一样！");
				setTimeout(function() {
					$("#input2").html("");
					$("#input3").html("");
				}, 5000);
				document.getElementById("btn").disabled="disabled";
				return false;
			} else {
				$("#input2").html("");
				$("#input3").html("");
				document.getElementById("btn").disabled=false;
				return true;
			}
		});
		/* function test(){
		alert("alert")
		var msg = ${ msg };
		alert(msg)
		} */
		
	
		
		 var getCookie = document.cookie.replace(/[ ]/g,"");  //获取cookie，并且将获得的cookie格式化，去掉空格字符
	        var arrCookie = getCookie.split(";") ; //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
	        var tips;  //声明变量tips
	        for(var i=0;i<arrCookie.length;i++){   //使用for循环查找cookie中的tips变量
	            var arr=arrCookie[i].split("=");   //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
	            if("loginMsg"==arr[0]){  //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
	                tips=arr[1];   //将cookie的值赋给变量tips
	                break;   //终止for循环遍历
	            }
	        };
	        /* alert(tips);
	         alert(document.cookie) */
	        /* var date = new Date(); //获取当前时间
	         date.setTime(date.getTime()-1); //将date设置为过去的时间
	         document.cookie = "loginMsg" + "="+tips+"; expires=" +date.toGMTString();//设置cookie */
	         var myDate=new Date();    
	            myDate.setTime(-1000);//设置时间    
	            document.cookie="loginMsg"+"=''; expires="+myDate.toGMTString()+";path=/";
		if(tips == "200"){
	         tips = "";
	        alert("修改成功，请重新登录！")
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
	        $.cookie('loginMsg', null); 
	        
		}
			     
		
		
		
	});
	
	
	/* function tijiao(){
			alert("j")
			var re_password = $("#re_password").val();
			var password = $("#password").val();
			alert(password);
			if (password != re_password) {

				$("#input2").html("2次密码输出不一样！");
				$("#input3").html("2次密码输出不一样！");
				setTimeout(function() {
					$("#input2").html("");
					$("#input3").html("");
				}, 5000);
				return;
			} else {
				$("#input2").html("");
				$("#input3").html("");
			}
		});
	} */
</script>


</html>