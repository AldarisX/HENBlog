<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String root = request.getHeader("Host") + request.getContextPath();
%>
<html>
<head>
<link href="http://<%=root%>/res/mui/css/mui.min.css" rel="stylesheet" type="text/css" />
<script src="http://<%=root%>/res/mui/js/mui.min.js"></script>
</head>
<body>
<img class="bg" src="img/background.jpg" width="100%" />
</body>
</html>