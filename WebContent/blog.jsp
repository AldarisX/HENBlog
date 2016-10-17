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
<style type="text/css">
.talk{
	margin-top:2%;
}

.talks{
	margin:0 auto;
	text-align:left;
}

.talkuName{
	text-align:right;
}
</style>
<script src="highlight/highlight.pack.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON("contjson.jsp?tid=<%=id%>", function(data) {
					if (!jQuery.isEmptyObject(data)) {
						document.title = document.title + "  " + data.title;
						$("#maintext").append("<h2>" + data.title+ "</h2><p>&nbsp;&nbsp;&nbsp;&nbsp;"+ data.content + "</p>");
					} else {
						$("#mgr").css("display", "none");
						$("#maintext").append("<p>找不到相关的内容</p>");
					}
				});
		loadTalk();
		$('pre code').each(function(i, block) {
			hljs.highlightBlock(block);
		});
	});

	function delSure() {
		var r = confirm("确定删除?");
		if (r == true) {
			$.post("GetBlog", {
				"cm" : "del",
				"id" :<%=id%>,
			}, function(result) {
				window.location.href = "index.jsp";
			});
		}
	}
	
	function loadTalk(){
		var url = "talkjson.jsp?tid="+GetQueryString("tid");
		$.getJSON(url,function(data) {
			if(data.maxCount!=0){
				console.log(data);
				$(".talks").empty();
				var talks = data.talks;
				for(var x in talks){
					$(".talks").append("<div><p>"+talks[x].content+"</p><p class='talkuName'>"+talks[x].uName+"</p></div><hr>")
				}
			}
		});
	}
	
	function talk_Sure(){
		var content=CKEDITOR.instances.talkCK.getData();
		if(content.trim!=""){
			$.post("getBlog", {
				"cm" : "addTalk",
				"tid" : GetQueryString("tid"),
				"content" : CKEDITOR.instances.talkCK.getData()
			}, function(result) {
				//alert("提交成功");
				loadTalk();
				CKEDITOR.instances.talkCK.setData("");
			}).error(function(){alert("提交失败");});
		}else{
			alert("不能什么都不说哦!");
		}
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
			}if(isLogin){
		%>
		<div class="talk main">
			<form method="post" onsubmit="return talk_Sure();">
  				<textarea id="talkCK" class="ckeditor" required="required"></textarea>
  				<button type="submit" class="mui-btn mui-btn--raised">评论</button>
			</form>
			<hr>
			<div class="talks">
				没有评论
			</div>
		</div>
		<%
			}else{
		%>
		<div class="talk main">
			<p>您还没有登陆,无法查看/留下评论</p>
			<p><a href="login.jsp">登陆</a>||<a href="register.jsp">注册</a></p>
		</div>
		<%
			}
		%>
		<jsp:include page="HENMenu.jsp">
			<jsp:param value="<%=isLogin%>" name="isLogin"/>
			<jsp:param value="<%=u.getLevel()%>" name="uLv"/>
		</jsp:include>
	</div>
</body>
</html>