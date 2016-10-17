<%@page import="model.Talk"%>
<%@page import="com.ConstPageWriter"%>
<%@page import="java.io.File"%>
<%@page import="tool.Tool"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
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

	int tid = Integer.parseInt(request.getParameter("tid"));

	out = new ConstPageWriter(fileName);
	out.print(new Talk().getJson(tid));
	out.close();
	response.sendRedirect(content);
%>