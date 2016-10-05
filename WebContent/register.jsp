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
<title>在<%=Config.bName%>的博客注册
</title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function reg_Sure() {
		if(Trim($(".uName")).length==0){
			alert("请好好输入用户名");
		}else{
			if ($(".passwd").val() == $(".passwd2").val()) {
				$.post("UserMGR", {
					"cm":"regist",
					"uName":$(".uName").val(),
					"passwd":$(".passwd").val(),
					"passwd2":$(".passwd2").val(),
					"email":$(".email").val()
				}, function(result) {
					alert(result);
					if(result.indexOf("成功")>0){
						window.location.href = "index.jsp";
					}
				}) .error(function(){alert("登陆失败,请检查账号或者密码");});
			} else {
				alert("两次输入的密码不匹配");
			}
		}
		return false;
	}
	
	function Trim(str)
    { 
        return str.replace(/(^\s*)|(\s*$)/g, ""); 
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left">
			<form method="post" onsubmit="return reg_Sure();">
				<legend>注册</legend>
				<div class="mui-textfield mui-textfield--float-label">
					<input class="uName" type="text" name="uName" required="required">
					<label>请输入用户名</label>
				</div>
				<div class="mui-textfield mui-textfield--float-label">
					<input class="passwd" type="password" name="passwd"
						required="required"> <label>请输入密码</label>
				</div>
				<div class="mui-textfield mui-textfield--float-label">
					<input class="passwd2" type="password" name="passwd2"
						required="required"> <label>请再次输入密码</label>
				</div>
				<div class="mui-textfield mui-textfield--float-label">
					<input class="email" type="text" name="email">
					<label>请输入邮箱</label>
				</div>
				<button type="submit" class="mui-btn mui-btn--raised">注册</button>
			</form>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>