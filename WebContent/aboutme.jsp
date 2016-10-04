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
<title>关于<%=Config.bName%></title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>
		<div class="main" align="left">
			<hr>
			<br>
			<p>
				<b>基本信息：</b><br> <br> 性&nbsp;&nbsp;&nbsp;别：<%=Config.sex%><br>
				<br> 生&nbsp;&nbsp;&nbsp;日：<%=Config.birthday%><br> <br>
				职&nbsp;&nbsp;&nbsp;业：<%=Config.job%><br> <br> 现居地：<%=Config.loc%><br>
				<br>
			</p>
			<hr>
			<p>
				<br> <b>个人简介：</b><br> <br><%=Config.desc%><br>
			</p>
			<br> <br>
			<hr>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>