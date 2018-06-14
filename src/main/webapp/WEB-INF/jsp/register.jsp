<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" class="no-js">

  <head>

        <meta charset="utf-8">
        <title>Shiro Demo | 注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <!--link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'-->
		<link rel="stylesheet" href="css/login/reset.css"/>
        <link rel="stylesheet" href="css/login/supersized.css"/>
        <link rel="stylesheet" href="css/login/style.css"/>
		<style>
			#vcode >img{cursor:pointer;margin-bottom: -15px;border-radius:5px;}
		</style>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="js/common/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body id="body">
        <div class="page-container" style="margin: 100px auto 0px;">
            <h1>注册</h1>
            <form id="_form" action="/register/userRegister" method="post">
                <input type="text" name="username" id="username" class="username" placeholder="username">
                <input type="text" name="email"  id="email" placeholder="Email账号" style="color: blue;"><span id="input1" style="color: red"></span>
                <input type="password" name="password" id="password" class="password" placeholder="输入密码"><span id="input2" style="color: red"></span>
                <input type="password" id="re_password" name="re_password"  placeholder="确认密码"><span id="input3" style="color: red"></span>
                <div style="text-align: left; margin-left: 10px;" id="vcode">
	                <input type="text" name="vcode"   placeholder="验证码" style="width: 110px; margin-left: -8px; margin-right: 8px;">
                	<img src="/cqtiq/open/valicode.do" />
                <span id="input4" style="color: red"></span>
                </div>
                <button type="button" class="register">注册</button>
                <button type="button" id="login" >登录</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>

        <!-- Javascript -->
        <script  src="js/common/jquery/jquery1.8.3.min.js"></script>
        <script  src="js/common/MD5.js"></script>
        <script  src="js/common/supersized.3.2.7.min.js"></script>
        <script  src="js/common/supersized-init.js"></script>
		<script  src="js/common/layer/layer.js"></script>
        <script >
			jQuery(document).ready(function() {
			
				//验证码
				$("#vcode").on("click",'img',function(){
					/**动态验证码，改变地址，多次在火狐浏览器下，不会变化的BUG，故这样解决*/
					var i = new Image();
					i.src = '/cqtiq/open/valicode.do?'  + Math.random() ;
					$(i).replaceAll(this);
					/* $(this).clone(true).attr("src",'/open/getGifCode.shtml?'  + Math.random()).replaceAll(this); */
				});
			    $('.register').click(function(){
			    	var form = $('#_form');
			    	var error= form.find(".error");
			    	var tops = ['27px','96px','165px','235px','304px','372px'];
			    	var inputs = $("form :text,form :password");
			    	for(var i=0;i<inputs.length;i++){
			    		var self = $(inputs[i]);
			    		if(self.val() == ''){
			    			 error.fadeOut('fast', function(){
			               		 $(this).css('top', tops[i]);
				            });
				            error.fadeIn('fast', function(){
				               self.focus();
				            });
				            return !1;
			    		}
			    	}
			    	var re_password = $("#re_password").val();
			    	var password = $("#password").val();
			    	if(password != re_password){
			    		
			    		$("#input2").html("2次密码输出不一样！");
			    		$("#input3").html("2次密码输出不一样！");
			    		setTimeout(function(){
			    			$("#input2").html("");
			    			$("#input3").html("");
			    			},5000);
			    		return;
			    	}else{
			    		$("#input2").html("");
			    		$("#input3").html("");
			    	}
			    	
			    	if($('[name=vcode]').val().length !=4){
			    		
			    		$("#input4").html("验证码长度为4位!");
			    		setTimeout(function(){
			    			$("#input4").html("");
			    			},5000);
			    		return;
			    	}else{
			    		$("#input4").html("");
			    	}
			    	$.post("/cqtiq/register/userRegister",$("#_form").serialize() ,function(result){
			    		if( result == "400"){
			    			alert("用户名已被占用，请重新注册！")
			    			window.location.href="register";
			    		}else if(result == "200"){
			    			alert('注册成功！请登录' );
			    			window.location.href= "login";
			    		}else if(result =="500"){
			    			alert('验证码不正确！')
			    			window.location.href= 'register'
			    		}
			    	},"json");
			        
			    });
			    $("form :text,form :password").keyup(function(){
			        $(this).parent().find('.error').fadeOut('fast');
			    });
			    //跳转
			    $("#login").click(function(){
			    	window.location.href="login";
			    });
			    $("#register").click(function(){
			    	window.location.href="register";
			    });
			    
			
			});
        </script>
    </body>

</html>

