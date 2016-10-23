<%@page import="model.GetInstall"%>
<%@page import="com.JDBCUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="reqadmin.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String dbLoc = "jdbc:mysql://" + request.getParameter("dbLoc") + "/";
	String dbUser = request.getParameter("dbUser");
	String dbPasswd = request.getParameter("dbPasswd");
	JDBCUtils.url = dbLoc;
	JDBCUtils.user = dbUser;
	JDBCUtils.passwd = dbPasswd;

	GetInstall.init();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>数据库配置</title>
<link rel="stylesheet" href="../css/page.css" />
<link rel="stylesheet" href="../css/mian.css" />
<style>
.bg {
	top: 0;
}

.main {
	margin-top: 4%;
}

.init .button {
	font-size: 1.2em;
	width: 8.5%;
}
</style>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
	var mysqlIsError =
<%=GetInstall.mysqlIsERROR%>
	;
	var freeSpaceERROR =
<%=GetInstall.freeSpaceIsERROR%>
	;
	var isDBEx =
<%=GetInstall.isDBEx%>
	;
	$(document).ready(function() {
		if (mysqlIsError) {
			$(".mysql").css("color", "#f22");
		} else {
			$(".mysql").css("color", "#5f5");
		}
		if (freeSpaceERROR) {
			$(".disk").css("color", "#f22");
		} else {
			$(".disk").css("color", "#5f5");
		}
		if (isDBEx == 0) {
			$(".dbEx").css("color", "#5f5");
		} else if (isDBEx == 1) {
			$(".dbEx").css("color", "#ff5");
		} else {
			$(".dbEx").css("color", "#f22");
		}
	});
</script>
</head>
<body>
	<jsp:include page="../background.jsp"></jsp:include>
	<div class="page" align="center">
		<div class="main mui-row" align="left">
			<div class="init">
				<legend>条件</legend>
				<p class="mysql">
					MySQL5.5或以上&nbsp;&nbsp;&nbsp;&nbsp;<%=GetInstall.mysqlState%></p>
				<p class="disk">
					磁盘剩余128MB(缓存,上载图片需要)&nbsp;&nbsp;&nbsp;&nbsp;<%=GetInstall.freeSpaceState%></p>
				<p class="dbEx"><%=GetInstall.dbExState%></p>
				<hr>
				<form action="install.jsp" method="post">
					<legend>建立管理员</legend>
					管理员用户名:<input type="text" name="user" required="required" /><br>
					管理员的密码:<input type="text" name="passwd" required="required" /><br>
					<input class="button" type="submit" value="确定" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>