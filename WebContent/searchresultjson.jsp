<%@page import="model.Titles"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String key = request.getParameter("key");

	out.print(new Titles().SearchAll(key));
%>