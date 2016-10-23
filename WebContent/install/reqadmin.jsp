<%@page import="com.Config"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {
		if (Config.isInstall) {
			if ((boolean) session.getAttribute("isLogin")) {
				User u = (User) session.getAttribute("uInfo");
				if (u.getLevel() > 1) {
					response.sendError(404);
				}
			} else {
				response.sendError(404);
			}
		}
	} catch (Exception e) {
		response.sendError(404);
	}
%>