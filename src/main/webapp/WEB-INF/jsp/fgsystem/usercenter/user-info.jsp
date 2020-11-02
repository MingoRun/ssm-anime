<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
			<div id="user-info" class="common">
				<div class="common-title"><h2>我的信息</h2></div>
				<div class="user-bg-img">
					<img src="<%=basePath%>resources/images/mingo/user-center-bg.jpg" alt="">
					<div class="user-portrait">
						<img src="http://localhost:8081${user.userPortraitUrl }" alt="">
					</div>
					<div class="user-welcome">
						欢迎回来！
					</div>
					<div class="user-nickname">
						<h2>${user.loginName }</h2>
					</div>
					<div class="sys-time">
						当前时间：<span id="sys-time"></span>
					</div>
					<div class="logout">
						<a href="${pageContext.request.contextPath }/userLogout.action">退出</a>
					</div>
				</div>
				<div class="common-line"></div>
				<div class="user-info-show">
					<table border="1" cellspacing="0" cellpadding="0" width="850" height="100" style="text-align:center">
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>手机</th>
							<th>邮箱</th>
						</tr>
						<tr>
							<td>${user.userName }</td>
							<td>${user.userSex }</td>
							<td>${user.userPhone }</td>
							<td>${user.userMail }</td>
						</tr>
					</table>
				</div>
				<div class="common-line"></div>
			</div>