<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
			<div class="about-site">
				<div class="about-title">
					<i class="fa fa-ellipsis-v" aria-hidden="true"></i>
					<span>关于本站</span>
				</div>
				<div class="about-img">
					<img src="<%=basePath%>resources/images/mingo/bb.jpg" alt="">
				</div>
				<div class="about-name">Mingo动漫网</div>
				<div class="about-info">
					Mingo动漫网，分享最新的动漫新闻，提供优质的漫画，动漫音乐以及动漫周边商务广告等动漫相关内容。
				</div>
			</div>