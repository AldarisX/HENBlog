<%@page import="model.User"%>
<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int index=1;
	try{
		index = Integer.parseInt(request.getParameter("index"));
	}catch(Exception e){
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=Config.bName%>的主页</title>
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

.HENMenu{
	position:fixed;
	left:86%;
	bottom:2%;
}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="highlight/highlight.pack.js"></script>
<script type="text/javascript">
var index=1;
	$(document).ready(function(){
		var url = "";
		if(GetQueryString("index")==null){
			url = "titlejson.jsp";
		}else{
			url = "titlejson.jsp?index="+GetQueryString("index");
			index = GetQueryString("index");
		}
		$.getJSON(url,function(data) {
			var titles = data.titles;
			for(var x in titles){
				$(".main").append("<div class='tblock' onclick='window.location.href=\"blog.jsp?tid="+titles[x].id+"\"'><div class='tcblock'><h2>"+titles[x].title+"</h2><p class='ptime'></p><p>&nbsp;&nbsp;&nbsp;&nbsp;"+titles[x].pre+"</p></div></div>")
			}
			$('pre code').each(function(i, block) {
				hljs.highlightBlock(block);
			});
			if(index!="1"){
				$(".pnpage").append("<a href='index.jsp?index=<%=index-1%>'>上一页</a>");
			}
			if(data.maxCount/(<%=Config.logCount*index%>)>=1){
				$(".pnpage").append("<a href='index.jsp?index=<%=index+1%>'>下一页</a>");
			}
		});
	});

	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	
	var sdelay=0;
	function returnTop() {
	 window.scrollBy(0,-80);//Only for y vertical-axis
	 if(document.body.scrollTop>0) { 
	  sdelay= setTimeout('returnTop()',15);
	 }
	}
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<%@ include file="UserAlert.jsp"%>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main mui-row" align="left"></div>
		<div class="pnpage mui-row"></div>
		<jsp:include page="HENMenu.jsp">
			<jsp:param value="<%=isLogin%>" name="isLogin"/>
			<jsp:param value="<%=u.getLevel()%>" name="uLv"/>
		</jsp:include>
		
	</div>
</body>
</html>