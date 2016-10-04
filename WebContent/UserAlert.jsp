<%@page import="com.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String root = request.getHeader("Host") + request.getContextPath();
	
	boolean isLogin = false;
	try {
		isLogin = (boolean) session.getAttribute("isLogin");
	} catch (Exception e) {
		session.setAttribute("isLogin", false);
	}
	isLogin = (boolean) session.getAttribute("isLogin");
	if(isLogin){
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<div class="z_top_container">
		<div class="z_top b-header-blur">
			<%
				
			%>
			<div class="b-header-mask-wrp">
				<div class="b-header-mask-bg"
					style="background-image: url(&quot;http://i0.hdslb.com/group1/M00/B7/30/oYYBAFcjKTGANfoVAAGAcG7aL64682.jpg&quot;);"></div>
				<div class="b-header-mask"></div>
			</div>
			<%
				
			%>
			<div class="z_header">
				<div class="z_top_nav">
					<ul>
						<li class="home"><a class="i-link" href="http://<%=root%>/"><span>主站</span></a></li>
					</ul>
				</div>
				<div class="uns_box">
					<ul class="menu">
						<%
							if (isLogin) {
						%>
						<li id="i_menu_profile_btn" class="u-i i_user"
							style="display: list-item;" onmouseover="faceover()"
							onmouseout="faceout()"><a class="i-link"
							href="http://<%=root%>/bilibili/space/"> <img class="i_face"
								src="">
						</a>
							<div id="i_menu_profile" class="i_menu" style="display: none;">
								<div class="i_menu_bg_t"></div>
								<div class="info clearfix">
									<div class="uname">
										<b></b><a href="http://www.bilibili.com/html/help.html#k_1"
											class=""></a>
									</div>
									<a href="https://account.bilibili.com/site/coin"><div
											class="coin" title="硬币">
											<b class="b-back"></b><b class="b-icon"></b>
											<div class="outside">
												<div class="pre"></div>
											</div>
										</div></a><a class="phone"
										href="https://passport.bilibili.com/member/bindPhone"
										target="_blank" tips="前去绑定手机" tips-pos="l" initialized="true"></a><a
										class="email verified" href="https://account.bilibili.com/"
										target="_blank" tips="已绑定" tips-pos="l" initialized="true"></a>
								</div>
								<div class="" id="lv_info">
									<div class="user-info-hd">
										<span class="t">等级</span>
									</div>
									<div class="points-wrp" id="exp_wrp">
										<a href="https://account.bilibili.com/site/record?type=exp"
											target="_blank"><div class="points-cnt">
												<div class="lt"></div>
												<div class="fill-el"></div>
												<div class="bar">
													<div class="points" style=""></div>
												</div>
												<div class="points-schedule">
													<span class="now-points"></span><span class="next-points">/</span>
												</div>
											</div></a>
									</div>
								</div>
								<div class="member-menu-wrp">
									<ul class="member-menu">
										<li><a href="http://<%=root%>/bilibili/space/"
											class="account"><i class="b-icon b-icon-p-account"></i>个人中心</a></li>
									</ul>
								</div>
								<div class="member-bottom">
									<a class="logout" href="http://<%=root%>/logout.jsp">退出</a>
								</div>
							</div></li>
						<li id="i_menu_fav_btn" guest="no" i_menu="#i_menu_fav"
							class="u-i" style="display: list-item;"><a class="i-link"
							href="http://<%=root%>/bilibili/space/">收藏夹</a></li>
						<li id="i_menu_history_btn" guest="no" class="u-i"
							style="display: list-item;"><a class="i-link"
							href="http://<%=root%>/bilibili/history.jsp">历史</a></li>
						<%
							} else {
						%>
						<li id="i_menu_login_reg" class="u-i"><a
							id="i_menu_login_btn" class="i-link login"
							href="http://<%=root%>/login.jsp"> <span>登录</span>
						</a> <i class="s-line"></i> <a id="i_menu_register_btn"
							class="i-link reg" target="_blank"
							href="https://www.bilibili.com/register"> <span>注册</span>
						</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>