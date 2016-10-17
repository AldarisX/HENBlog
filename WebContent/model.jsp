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
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<jsp:include page="UserAlert.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main mui-row" align="left"></div>
		<div class="bottom"></div>
	</div>
</body>
</html>