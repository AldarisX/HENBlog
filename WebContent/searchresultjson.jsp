<%@page import="java.io.File"%>
<%@page import="tool.Tool"%>
<%@page import="com.ConstPageWriter"%>
<%@page import="model.Titles"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String content = "vmsp" + request.getServletPath() + Tool.transMapToString(request.getParameterMap())
	+ ".json";
	String fileName = request.getRealPath("") + content;
	if (Tool.isFileExist(new File(fileName))) {
		response.sendRedirect(content);
		return;
	}
	
	String key = request.getParameter("key");

	out = new ConstPageWriter(fileName);
	out.print(new Titles().SearchAll(key));
	out.close();
	response.sendRedirect(content);
%>