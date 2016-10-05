<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int id = Integer.valueOf(request.getParameter("tid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=Config.bName%></title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<link rel="stylesheet" href="highlight/styles/default.css">
<script src="highlight/highlight.pack.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON("contjson.jsp?tid=<%=id%>", function(data) {
					if (!jQuery.isEmptyObject(data)) {
						document.title = document.title + "  " + data.title;
						$("#maintext").append("<h2>" + data.title+ "</h2><p>&nbsp;&nbsp;&nbsp;&nbsp;"+ data.content + "</p>");
						$('pre code').each(function(i, block) {
							hljs.highlightBlock(block);
						});
					} else {
						$("#mgr").css("display", "none");
						$("#maintext").append("<p>找不到相关的内容</p>");
					}
				});
			});

	function delSure() {
		var r = confirm("确定删除?");
		if (r == true) {
			$.post("getBlog", {
				"re" : "del",
				"id" :<%=id%>,
			}, function(result) {
				window.location.href = "index.jsp";
			});
		}
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<%@ include file="UserAlert.jsp"%>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main">
			<div id="maintext" align="left"></div>
		</div>
		<%
			if(isLogin&&u.getLevel()<2){
		%>
		<div id="mgr">
			<a href="editor.jsp?re=true&tid=<%=id%>">编辑</a>&nbsp;<a
				onclick="delSure()" href="">删除</a>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>