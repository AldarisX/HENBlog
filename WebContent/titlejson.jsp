<%@page import="model.Titles"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String index = request.getParameter("index");
	if (index == null) {
		index = "1";
	}

	out.print(new Titles().getJson(Integer.parseInt(index)));
%>