<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int id = 0;
	try {
		id = Integer.valueOf(request.getParameter("tid"));
	} catch (Exception e) {

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=Config.bName%>的新博客</title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<style type="text/css">
.title {
	text-decoration: none;
	color: #494949;
	font-family: Arial;
	text-shadow: 5px 5px 4px #666;
	font-size: 86%;
	resize: none;
	width:99.5%;
}

#btn{
	width:16%;
	font-size: 100%;
	padding:0.5%;
}
</style>

<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
var re="false";
var id=0;

	$(document).ready(function() {
		if(GetQueryString("re")=="true"){
			re="true";
			id=<%=id%>;
			$.getJSON("contjson.jsp?tid=<%=id%>", function(data) {
				$(".title").val(data.title);
				CKEDITOR.instances.pretitle.setData(data.pretitle);
				CKEDITOR.instances.uinput.setData(data.content);
			});
		}
	});

	function btn_Sure() {
		var title = $(".title").val();
		var pretitle = CKEDITOR.instances.pretitle.getData();
		var stem = CKEDITOR.instances.uinput.getData();

		$.post("getBlog", {
			"re" : re,
			"id" : id,
			"title" : title,
			"pretitle" : pretitle,
			"inner" : stem
		}, function(result) {
			alert("提交成功");
		});
	}

	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left">
			<h2>
				标题:<br>
				<textarea name="title" class="title" rows="1" cols="32"></textarea>
			</h2>
			<br>
			<p>摘要:</p>
			<textarea id="pretitle" class="ckeditor"></textarea>
			<br> <br>
			<p>正文:</p>
			<textarea id="uinput" cols="0" rows="0" class="ckeditor"></textarea>
			<br>
			<button id="btn" onclick="btn_Sure()">提交</button>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>