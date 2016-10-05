<%@page import="model.User"%>
<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String root = request.getHeader("Host") + request.getContextPath();

	boolean isLogin = false;
	try {
		isLogin = (boolean) session.getAttribute("isLogin");
	} catch (Exception e) {
		session.setAttribute("isLogin", false);
	}
	isLogin = (boolean) session.getAttribute("isLogin");
	User u = new User();
	if (isLogin) {
		u = (User) session.getAttribute("uInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://<%=root%>/css/topnav.css" />
</head>
<body>
	<div class="z_top_container">
		<div class="z_top b-header-blur">
			<div class="b-header-mask-wrp">
				<div class="b-header-mask"></div>
			</div>
			<div class="z_header">
				<div class="z_top_nav">
					<ul>
						<li class="home"><a class="i-link" href="http://<%=root%>/"><span><button
										class="mui-btn mui-btn--raised mui-btn--small mui-btn--primary">主站</button></span></a></li>
					</ul>
				</div>
				<div class="uns_box">
					<ul class="menu">
						<li id="i_menu_fav_btn" guest="no" i_menu="#i_menu_fav"
							class="u-i" style="display: list-item;"><a class="i-link"
							href="http://<%=root%>/mgr/"><button
									class="mui-btn mui-btn--raised mui-btn--small mui-btn--primary">后台</button></a></li>
						<li id="i_menu_history_btn" guest="no" class="u-i"
							style="display: list-item;"><a class="i-link"
							href="http://<%=root%>/editor.jsp"><button
									class="mui-btn mui-btn--raised mui-btn--small mui-btn--primary">写博客</button></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>