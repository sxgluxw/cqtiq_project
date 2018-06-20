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
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<style type="text/css">





</style>
</head>
<body>

	<div style="margin:20px 0;"></div>
    <div style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" label="用户名:" labelPosition="top" style="width:100%; "  value="${ user.username }" readonly="readonly">
        </div>
        
        <div style="margin-bottom:20px">
            <input class="easyui-passwordbox" label="密码:" labelPosition="top" style="width:100%;" value="${ user.password }" readOnly="true"  >
        </div>
        
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" label="邮箱:" labelPosition="top" style="width:100%;" readonly="readonly" value="${ user.email }">
        </div>
        <div>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#wode').window('open')" iconCls="icon-edit" style="width:100%;height:32px">编辑</a>
        </div>
	<div id="wode" class="easyui-window" title="Fluid Window"
		style="width: 50%; height: 800px; padding: 10px; background-color: #020e35" inline: true
		data-options="<!-- modal:true,closed:true, -->
            iconCls:'icon-save',
            onResize:function(){
                $(this).window('hcenter');
            }">
		<div style="width: 200px ;height: 800px;background-color: blue;float: left;"></div>
		<div style="width:495;height: 800px;background-color: red;float: left;">
			
		</div>
		<div style="width: 200px ;height: 800px;background-color: green;"></div>
	</div>
    </div>
    </body>
    <script type="text/javascript">
    
    </script>
</html>