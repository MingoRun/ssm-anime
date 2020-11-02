<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
	<canvas class="fireworks" style="position:fixed;left:0;top:0;z-index:99999999;pointer-events:none;"></canvas>
	<header class="header">
		<div id="header-main" class="header-main"><!-- login&register -->
			<nav id="header-top">
				<div class="nav-top">
					<div id="user-login" class="user-login" <c:if test="${not empty user && !(user eq null)}">style="display:none;"</c:if> >欢迎光临!</div>
					<div id="nav-set" class="nav-set" <c:if test="${not empty user && !(user eq null)}">style="display:none;"</c:if> >
						<div class="nav-login">
							<a id="login-link" href="javascript:void(0);"><i class="fa fa-user" aria-hidden="true"></i> 登录</a>
						</div>
						<div class="nav-register">
							<a id="register-link" href="javascript:void(0);">注册</a>
						</div>
					</div>
					<div id="user-profile" class="user-profile" <c:if test="${not empty user && !(user eq null)}">style="display:block;"</c:if> <c:if test="${empty user && (user eq null)}">style="display:none;"</c:if>  >
						<div class="user-info">
							<img src="http://localhost:8081${user.userPortraitUrl }" alt="" width="20px" height="20px" style="border-radius:50%;">
							<span class="user-loginname">${user.loginName }, 您好!</span>
							<span class="user"><a href="${pageContext.request.contextPath }/user_toCenter.action?userId=${user.userId}"><i class="fa fa-user-circle-o" aria-hidden="true"></i>个人中心</a></span>
							<span class="user"><a href="${pageContext.request.contextPath }/userLogout.action">退出</a></span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</nav>
		</div><!-- /login&register -->
		<div class="menu-container"><!--导航栏-->
			<div class="menu-content">
				<div class="logo-site">
					<a href="${pageContext.request.contextPath }/toFrontIndex.action"><img src="<%=basePath%>resources/images/mingo/logo.png" alt="Mingo动漫网"></a>
				</div>
				<div class="menu">
					<ul>
						<li class="sub-menu"><a href="${pageContext.request.contextPath }/toFrontIndex.action" <c:if test="${flag==1 }">style="background-color:#FF3366;color:white;"</c:if> ><i class="fa fa-home" aria-hidden="true"></i><span>首页</span></a></li>
						<li class="sub-menu"><a href="${pageContext.request.contextPath }/toFrontNewsList.action" <c:if test="${flag==2 }">style="background-color:#FF3366;color:white;"</c:if> ><i class="fa fa-file-text" aria-hidden="true"></i><span>动漫新闻</span></a></li>
						<li class="sub-menu"><a href="${pageContext.request.contextPath }/toFrontComicsList.action" <c:if test="${flag==3 }">style="background-color:#FF3366;color:white;"</c:if> ><i class="fa fa-list" aria-hidden="true"></i><span>漫画</span></a></li>
						<li class="sub-menu"><a href="${pageContext.request.contextPath }/toFrontMusicList.action" <c:if test="${flag==4 }">style="background-color:#FF3366;color:white;"</c:if> ><i class="fa fa-music" aria-hidden="true"></i><span>动漫音乐</span></a></li>
						<li class="sub-menu"><a id="advert-menu" <c:if test="${flag==5 }">style="background-color:#FF3366;color:white;"</c:if> ><i class="fa fa-picture-o" aria-hidden="true" ></i><span>商务广告</span></a></li>
						<li class="search"><a href="#" id="search"><i class="fa fa-search" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div><!--/导航栏-->
	</header><!-- /header -->
	<!--搜索框-->
	<div id="nav-search" class="nav-search">
		<div id="search-main" class="search-main" style="display:none;">
			<div class="close"><a id="close" style="cursor:pointer;"><i class="fa fa-close" aria-hidden="true"></i></a></div>
			<div class="search-con">
				<form action="${pageContext.request.contextPath }/toQueryAll.action" method="post">
					<input name="user" value="${user }" style="display:none;" />
					<div class="search-input">
						<input type="text" placeholder="请输入搜索内容" name="content" id="content" lay-verify="required">
					</div>
					<div class="search-sel">
						<select name="option" id="option">
							<option value="0" selected="selected">--请选择--</option>
							<option value="1">动漫新闻</option>
							<option value="2">漫画</option>
							<option value="3">动漫音乐</option>
							<option value="4" <c:if test="${not empty user && !(user eq null)}">style="display:block;"</c:if> <c:if test="${empty user && (user eq null)}">style="display:none;"</c:if> >商务广告</option>
						</select>
					</div>
					<div class="search-btn">
						<button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					</div>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</div><!--/搜索框-->