<%@page import="java.io.File"%>
<%@page import="tool.Tool"%>
<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="reqadmin.jsp"%>
<%
	String root = request.getHeader("Host") + request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=Config.bName%>的后台</title>
<link rel="shortcut icon" href="http://<%=root%>/favicon.ico" />
<link rel="stylesheet" href="http://<%=root%>/css/page.css" />
<link rel="stylesheet" href="http://<%=root%>/css/mian.css" />
<link href="http://<%=root%>/res/mui/css/mui.min.css" rel="stylesheet" type="text/css" />
<style>
p{
	font-size:1.5em !important;
}

.main {
	margin-top: 2%;
}

.in_BG{
	margin-top:1%;
}
</style>
<script type="text/javascript" src="http://<%=root%>/js/jquery.min.js"></script>
<script type="text/javascript">
function cleanVmsp(){
	$.post("http://<%=root%>/AdminMGR", {
		"cm" : "delVMSP",
	}, function(result) {
		location.reload(false);
	}).error(function(){alert("提交失败");});
}

function in_BG_Change(files){
	var file  = files[0];
	var reader = new FileReader();
	reader.onloadend = function () {
		$(".preBG").attr("src",reader.result);
		$(".bg").attr("src",reader.result);
	}
	if (file) {
		reader.readAsDataURL(file);
	} else {
	  preview.src = "";
	}
}

function bbgConfig_Sure(){
	$(".config_BG").submit();
	return false;
}

function bConfig_Sure(){
	$(".config_B").submit();
	return false;
}
</script>
<script src="http://<%=root%>/res/mui/js/mui.min.js"></script>
</head>
<body>
	<jsp:include page="../background.jsp"></jsp:include>
	<jsp:include page="../UserAlert.jsp"></jsp:include>
	<div class="page" align="center">
		<div class="main mui-row" align="left">
			<div class="vmsp">
				<p>JSON缓存已经使用<%=Tool.FormetFileSize(Tool.getFileSize(new File(Config.warLoc + "/vmsp/")))%>&nbsp;&nbsp;<a href="javascript:cleanVmsp();">清空</a></p>
			</div>
			<div class="config">
				<hr>
				<form class="config_BG" action="../AdminMGR?cm=getIMG" method="post" enctype="multipart/form-data" onsubmit="return bbgConfig_Sure();">
					<legend>背景设定</legend>
					<img src="http://<%=root%>/<%=Config.background%>" class="preBG" width="100%" />
					<input type="file" name="in_BG" class="in_BG" onchange="in_BG_Change(this.files)"/><br>
					<button type="submit" class="mui-btn mui-btn--raised">确定</button>
				</form>
				<hr>
				<form class="config_B" action="../AdminMGR?cm=getBConfig" method="post" onsubmit="return bConfig_Sure();">
					<legend>博主信息设定</legend>
					<div class="mui-textfield mui-textfield--float-label">
    					<input class="bName" type="text" name="bName" value="<%=Config.bName%>" required="required">
    					<label>名字</label>
  					</div>
  					<div class="mui-select">
    					<select name="bSex" required="required">
    						<%
    							if(Config.sex.equals("男")){
    						%>
      						<option selected="selected">男</option>
      						<option>女</option>
      						<%
    							}else{
      						%>
      						<option>男</option>
      						<option selected="selected">女</option>
      						<%
    							}
      						%>
    					</select>
    					<label>选择一个性别</label>
  					</div>
  					<div class="mui-textfield mui-textfield--float-label">
    					<input class="bBirthday" type="text" name="bBirthday" value="<%=Config.birthday%>" required="required">
    					<label>生日</label>
  					</div>
  					<div class="mui-textfield mui-textfield--float-label">
    					<input class="bJob" type="text" name="bJob" value="<%=Config.job%>" required="required">
    					<label>工作</label>
  					</div>
  					<div class="mui-textfield mui-textfield--float-label">
    					<input class="bLoc" type="text" name="bLoc" value="<%=Config.loc%>" required="required">
    					<label>现居地</label>
  					</div>
  					<div class="mui-textfield mui-textfield--float-label">
    					<input class="desc" type="text" name="desc" value="<%=Config.desc%>" required="required">
    					<label>介绍</label>
  					</div>
  					<button type="submit" class="mui-btn mui-btn--raised">确定</button>
				</form>
			</div>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>