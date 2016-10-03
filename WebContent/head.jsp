<%@page import="model.Config"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<head>
<link rel="stylesheet" href="css/navside.css" />
</head>

<div class="navside" align="center">
	<header>
		<nav>
			<ul>
				<%
					for (int i = 0; i < Config.headName.size(); i++) {
						out.println("<li><a href='" + Config.headLink.get(i) + "'>" + Config.headName.get(i) + "</a></li>");
					}
				%>
			</ul>
		</nav>
	</header>
</div>