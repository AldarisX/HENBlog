<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {
		if ((boolean) session.getAttribute("isLogin")) {
			User u = (User) session.getAttribute("uInfo");
			if (u.getLevel() > 2) {
				response.sendError(404);
			}
		}
	} catch (Exception e) {
		response.sendError(404);
	}
%>