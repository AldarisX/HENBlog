<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	String msg = "出现了一些错误,请稍后重试";
	String ipaddr = request.getRemoteAddr();
	String prePage = request.getHeader("Referer");

	switch (code) {
	case 500:
		boolean retry = false;
		try {
			retry = (boolean) session.getAttribute("retry");
		} catch (Exception e) {
			retry = true;
		}
		if (retry) {
			//session.invalidate();
			session.removeAttribute("isLogin");
			session.removeAttribute("uInfo");
			session.setAttribute("retry", false);
			response.sendRedirect(prePage);
		}
		msg = "服务器内部错误";
		break;
	case 404:
		msg = "访问的页面不存在";
		break;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>出现 了错误</title>
</head>
<body>
	<p><%=msg%></p>
	<br>
	<p>
		代号<%=code%></p>
	<p>
		你的IP:<%=ipaddr%></p>
	<p>
		访问的页面<%=prePage%></p>
</body>
</html>
<%
	System.out.println("HENBlog出现错误\nHTTP错误码" + code + "\n用户IP:" + ipaddr + "\n访问的页面" + prePage);
%>