<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登陆到<%=Config.bName%>的博客</title>
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
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left">
			<form method="post" onsubmit="return login_Sure();">
				<legend>登陆</legend>
				<div class="mui-textfield mui-textfield--float-label">
    				<input class="uName" type="text" name="uName" required="required">
    				<label>请输入用户名</label>
  				</div>
  				<div class="mui-textfield mui-textfield--float-label">
    				<input class="passwd" type="password" name="passwd" required="required">
    				<label>请输入密码</label>
  				</div>
  				<button type="submit" class="mui-btn mui-btn--raised">登陆</button>
			</form>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>