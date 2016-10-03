<%@page import="model.Config"%>
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
<title>Aldaris的主页</title>
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/mian.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
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
				$(".main").append("<hr><br><h2><a href='blog.jsp?tid="+titles[x].id+"'>"+titles[x].title+"</a></h2><p class='ptime'></p><p>&nbsp;&nbsp;&nbsp;&nbsp;"+titles[x].pre+"</p><br>")
			}
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
</script>
</head>
<body>
	<jsp:include page="background.jsp"></jsp:include>
	<div class="page" align="center">
		<jsp:include page="head.jsp"></jsp:include>

		<div class="main" align="left"></div>
		<div class="pnpage"></div>
		<div class="bottom">
		
		</div>
	</div>
</body>
</html>