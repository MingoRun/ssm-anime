<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>404页面 </title>
		<meta name="renderer" content="webkit" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/style.css">
	</head>
	<body>
		<div class="container">
			<img class="bg" src="<%=basePath%>resources/images/404.png"/>
			<!-- <div class="btn">
				<a href="/" class="goindex">返回首页</a>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=33731790&site=qq&menu=yes" target="_blank" class="lx">咨询站长</a>
				<div style="clear:both;"></div>
			</div> -->
		</div>
	</body>
</html>