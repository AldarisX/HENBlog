<%@page import="com.ConstPageWriter"%>
<%@page import="java.io.File"%>
<%@page import="tool.Tool"%>
<%@page import="model.Content"%>
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
	
	int id = Integer.valueOf(request.getParameter("tid"));

	out = new ConstPageWriter(fileName);
	out.print(new Content().getJson(id));
	out.close();
	response.sendRedirect(content);
%>