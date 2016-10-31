<%@page import="servlet.OnStartUP"%>
<%@page import="tool.MD5Util"%>
<%@page import="model.GetInstall"%>
<%@page import="com.JDBCUtils"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="reqadmin.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	boolean down = false;
	try {
		JDBCUtils.installDB();

		String uName = request.getParameter("user");
		String uPasswd = MD5Util.string2MD5(request.getParameter("passwd"));
		User u = new User(uName, uPasswd);
		int i = u.addUser(1);
		if (i > 1 || i < 0) {
			down = true;
		} else {
			u.setLevel(1);
			session.setAttribute("uInfo", u);
			session.setAttribute("isLogin", true);

			JDBCUtils.saveDBConfig();
			
			new OnStartUP().init(this);
		}
	} catch (Exception e) {
		down = true;
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>安装结果</title>
<link rel="stylesheet" href="../css/page.css" />
<link rel="stylesheet" href="../css/mian.css" />
<style>
.bg {
	top: 0;
}

.main {
	margin-top: 4%;
}
</style>
</head>
<body>
	<jsp:include page="../background.jsp"></jsp:include>
	<div class="page" align="center">
		<div class="main mui-row" align="left">
			<%
				if (!down) {
			%>
			<div class="result">
				<legend>安装成功</legend>
				<p>
					<a href="../mgr/" target="_blank">开始配置</a>
				</p>
				<p>
					<a href="../editor.jsp" target="_blank">写一篇博客</a>
				</p>
				<p>
					<a href="../index.jsp">进入主页</a>
				</p>
			</div>
			<%
				} else {
			%>
			<p>发生严重错误</p>
			<p>发生严重错误</p>
			<p>发生严重错误</p>
			<p>请手动清理此程序的相关信息并重新安装</p>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>