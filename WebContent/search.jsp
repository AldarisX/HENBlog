<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>搜索</title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<link rel="stylesheet" href="highlight/styles/default.css">
<style type="text/css">
.main {
	background-color: rgba(0, 0, 0, 0);
	padding: 0px;
	border-left: 0px;
	border-right: 0px;
	box-shadow: 0px 0px 0px #000;
	width: 68%;
	padding-bottom: 0 auto;
	margin-left: 4%;
	margin-bottom: 1.5%;
}

.seForm{
	width:75%;
}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="highlight/highlight.pack.js"></script>
<script type="text/javascript">
	function serBtnClick() {
		var key = $("#inbox").val();
		$(".main").css("display", "block");
		$.getJSON("searchresultjson.jsp?key=" + key, function(data) {
			console.log(data);
			$(".main").empty();
			for ( var x in data) {
				console.log(data[x].title);
				$(".main").append("<div class='tblock' onclick='window.location.href=\"blog.jsp?tid="+data[x].id+"\"'><div class='tcblock'><h2>"+data[x].title+"</h2><p>&nbsp;&nbsp;&nbsp;&nbsp;"+data[x].pre+"</p></div></div>")
			}
			$('pre code').each(function(i, block) {
				hljs.highlightBlock(block);
			});
		});
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<%@ include file="UserAlert.jsp"%>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="search">
			<form class="mui-form--inline" onsubmit="return serBtnClick();">
 				<div class="mui-textfield mui-textfield--float-label seForm">
    				<input type="text" name="inBox" id="inbox" required="required">
    				<label>输入想要搜索的内容</label>
 			 	</div>
  				<input type="submit" class="mui-btn" value="搜索" />
			</form>
		</div>
		<div class="main mui-row" align="left" style="display: none;"></div>
		<jsp:include page="HENMenu.jsp">
			<jsp:param value="<%=isLogin%>" name="isLogin"/>
			<jsp:param value="<%=u.getLevel()%>" name="uLv"/>
		</jsp:include>
	</div>
</body>
</html>