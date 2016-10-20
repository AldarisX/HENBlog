<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getHeader("Host") + request.getContextPath();
String log=request.getParameter("log");
if(log==null){
	log="1";
}
if(!log.equals("log")){
	int code = Integer.parseInt(request.getParameter("code"));
	String msg = "出现了一些错误,请稍后重试";
	String ipaddr = request.getRemoteAddr();
	String prePage = request.getHeader("Referer");

	switch (code) {
		case 500 :
			msg = "服务器内部错误";
			break;
		case 404 :
			msg = "访问的页面不存在";
			break;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>出现 了错误</title>
<link rel="shortcut icon" href="favicon.ico" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var wipage=window.location.href;
		$(".wipage").text("访问的页面:"+wipage);
		$.post("error/error.jsp", {
			"log":"log",
			"code":"<%=code%>",
			"ipaddr":"<%=ipaddr%>",
			"prepage":"<%=prePage%>",
			"wipage":wipage
		}, function(result) {
			
		});
	});
</script>
</head>
<body>
	<p>错误:<%=msg%></p>
	<p>返回<a href="http://<%=root%>/">主页</a></p>
	<br>
	<p>代号<%=code%></p>
	<p>你的IP:<%=ipaddr%></p>
	<p>之前访问的页面:<a href="<%=prePage%>"><%=prePage%></a></p>
	<p class="wipage"></p>
</body>
</html>
<%
}else{
	String code = request.getParameter("code");
	String ipaddr = request.getParameter("ipaddr");
	String prePage = request.getParameter("prepage");
	String wipage = request.getParameter("wipage");
	System.out.println("HENBlog出现错误\nHTTP错误码" + code + "\n用户IP:" + ipaddr + "\n访问的页面"+wipage +"\n之前访问的页面" + prePage);
}
%>