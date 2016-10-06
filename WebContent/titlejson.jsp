<%@page import="java.io.File"%>
<%@page import="com.ConstPageWriter"%>
<%@page import="tool.Tool"%>
<%@page import="model.Titles"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	String index = request.getParameter("index");
	if (index == null) {
		index = "1";
	}

	out = new ConstPageWriter(fileName);
	out.print(new Titles().getJson(Integer.parseInt(index)));
	out.close();
	response.sendRedirect(content);
%>