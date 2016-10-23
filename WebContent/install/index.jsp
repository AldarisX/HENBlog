<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="reqadmin.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>安装</title>
<link rel="stylesheet" href="../css/page.css" />
<link rel="stylesheet" href="../css/mian.css" />
<style>
.bg {
	top: 0;
}

.main {
	margin-top: 4%;
}

.req .button {
	font-size: 1.2em;
	width: 8.5%;
}
</style>
<script type="text/javascript">
	function startInstall() {
		window.window.location.href = "checkDB.jsp";
	}
</script>
</head>
<body>
	<jsp:include page="../background.jsp"></jsp:include>
	<div class="page" align="center">
		<div class="main mui-row" align="left">
			<div class="init">
				<div class="env">
					<legend>系统环境</legend>
					<p>
						是否安装:<%=Config.isInstall%></p>
					<p>
						JAVA版本:<%=System.getProperty("java.version")%></p>
					<p>
						操作系统的名称:<%=System.getProperty("os.name")%></p>
					<p>
						操作系统的架构:<%=System.getProperty("os.arch")%></p>
					<p>
						操作系统的版本:<%=System.getProperty("os.version")%></p>
					<p>
						服务器编码:<%=System.getProperty("file.encoding")%></p>
				</div>
				<hr>
				<div class="req">
					<legend>请确认是否符合以下条件</legend>
					<p>MySQL5.5或以上</p>
					<p>磁盘剩余128MB(缓存,上载图片需要)</p>
					<form method="post" action="checkDB.jsp">
						MySQL的地址:<input type="text" name="dbLoc" value="127.0.0.1:3306"
							required="required" /><br> MySQL用户名:<input type="text"
							name="dbUser" required="required" />(不建议使用root用户)<br>
						MySQL的密码:<input type="text" name="dbPasswd" required="required" /><br>
						<input class="button" type="submit" value="确定" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>