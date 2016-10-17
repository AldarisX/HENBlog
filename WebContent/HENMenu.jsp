<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {
		boolean isLogin = Boolean.parseBoolean(request.getParameter("isLogin"));
		int userLv = Integer.parseInt(request.getParameter("uLv"));
%>
<head>
<style>
.HENMenu {
	position: fixed;
	right: 6%;
	bottom: 2%;
}
</style>
<script type="text/javascript">
var sdelay=0;
function returnTop() {
 window.scrollBy(0,-80);//Only for y vertical-axis
 if(document.body.scrollTop>0) { 
  sdelay= setTimeout('returnTop()',15);
 }
}
</script>
</head>
<div class="HENMenu">
	<%
		if (isLogin) {
				if (userLv < 2) {
	%>
	<a href="editor.jsp"><button
			class="mui-btn mui-btn--fab mui-btn--primary">+</button></a><br>
	<%
		}
	%>
	<a href="UserMGR?cm=logout"><button
			class="mui-btn mui-btn--fab mui-btn--primary">E</button></a><br>
	<%
		} else {
	%>
	<a href="register.jsp"><button
			class="mui-btn mui-btn--fab mui-btn--primary">R</button></a><br> <a
		href="login.jsp"><button
			class="mui-btn mui-btn--fab mui-btn--primary">L</button></a><br>
	<%
		}
	%>
	<button class="mui-btn mui-btn--fab mui-btn--primary"
		onclick="returnTop();">↑</button>
</div>
<%
	} catch (Exception e) {

	}
%>