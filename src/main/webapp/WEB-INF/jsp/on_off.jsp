<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="assets/css/bootstrap.css" rel="stylesheet">

<link href="dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="dist/js/bootstrap-switch.js"></script>
<body>
	<input type="checkbox" name="my-checkbox" checked>

	<div class="btn-group" data-toggle="buttons">
	<label class="btn btn-primary">
		<input type="radio" name="options" id="option1"> 开
	</label>
	<label class="btn btn-primary">
		<input type="radio" name="options" id="option2" style="background-color: red"> 关
	</label>
	
</div>
</body>
<script type="text/javascript">
	$("[name='my-checkbox']").bootstrapSwitch();
</script>
</html>