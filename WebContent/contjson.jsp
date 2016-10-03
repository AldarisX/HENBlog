<%@page import="model.Content"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int id = Integer.valueOf(request.getParameter("tid"));

	out.print(new Content().getJson(id));
%>