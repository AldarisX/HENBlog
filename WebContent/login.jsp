<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<style type="text/css">
	.main input{
		font-family: Arial;
		font-size: 128%;
		margin:1%;
	}
	
	.main .btn{
		padding:1.2%;
		padding-top: 0.1%;
		padding-bottom: 0.1%;
	}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function login_Sure() {
		$.post("UserMGR", {
			"cm":"login",
			"uName":$(".uName").val(),
			"passwd":$(".passwd").val()
		}, function(result) {
			window.location.href = "index.jsp";
		}) .error(function(){alert("登陆失败,请检查账号或者密码");});
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left">
			<p><input class="uName" type="text" name="uName" placeholder="请输入用户名" /></p>
			<p><input class="passwd" type="password" name="passwd" placeholder="请输入密码" /></p>
			<p><input class="btn" type="submit" value="登陆" onclick="login_Sure()" /></p>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>