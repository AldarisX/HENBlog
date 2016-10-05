<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mgr/reqadmin.jsp"%>
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
	width: 99.5%;
}

#btn {
	width: 16%;
	font-size: 100%;
	padding: 0.5%;
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
		}).error(function(){alert("提交失败,请检查数据的完整性");});
		
		return false;
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
	<%@ include file="UserAlert.jsp"%>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left">
			<form method="post" onsubmit="return btn_Sure();">
				<legend>写一个新博客</legend>
				<div class="mui-textfield mui-textfield--float-label">
					<input type="text" name="title" class="title" required="required"> <label class="h2">这里写标题</label>
				</div>
				<div>
					<label class="h2">这里写内容</label>
					<textarea id="pretitle" class="ckeditor" required="required"></textarea>
				</div>
				<br>
				<div>
					<label class="h2">这里写内容</label>
					<textarea id="uinput" class="ckeditor"></textarea>
				</div>
				<button type="submit" class="mui-btn mui-btn--raised" required="required">提交</button>
			</form>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>