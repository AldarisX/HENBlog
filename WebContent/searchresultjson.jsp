<%@page import="java.net.URLEncoder"%>
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
	String content2 = "vmsp" + request.getServletPath()
			+ URLEncoder.encode(Tool.transMapToString(request.getParameterMap()), "UTF-8") + ".json";
	String fileName = request.getRealPath("") + content;
	if (Tool.isFileExist(new File(fileName), 300)) {
		response.sendRedirect(content2);
		return;
	}

	String key = request.getParameter("key");

	out = new ConstPageWriter(fileName);
	out.print(new Titles().SearchAll(key));
	out.close();
	response.sendRedirect(content2);
%>