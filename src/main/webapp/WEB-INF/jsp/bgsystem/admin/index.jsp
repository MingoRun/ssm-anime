<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>Mingo动漫网后台首页</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>resources/css/font.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/xadmin.css">
    <script src="<%=basePath%>resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>resources/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/xadmin.js"></script>
</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="javascript:void(0);">Mingo动漫网后台管理系统</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${user.loginName}&nbsp;&nbsp;${user.userName }</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <%-- <dd><a onclick="x_admin_show('设置个人信息','<%=basePath%>jsp/bgsystem/admin/admin-edit.jsp')">设置个人信息</a></dd> --%>
              <dd><a onclick="x_admin_show('修改密码','<%=basePath%>jsp/bgsystem/admin/change-pwd.jsp')">修改密码</a></dd>
              <dd><a href="logout.action">退出</a></dd>
            </dl>
          </li>
         <%--  <li class="layui-nav-item to-index"><a href="<%=basePath%>jsp/fgsystem/index.jsp">前台首页</a></li> --%>
        </ul>
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav" class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-file"></i>
                    <cite>动漫新闻管理</cite>
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/newsList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻信息列表</cite>
                        </a>
                    </li >
                </ul>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showNewsCategory.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻分类</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-picture"></i>
                    <cite>漫画信息管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showComicsList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>漫画信息列表</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath }/showComicsChapterList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>漫画章节管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/showComicsCategoryList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>漫画类型</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-headset"></i>
                    <cite>动漫音乐管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showMusicAll.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>音乐信息列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-list"></i>
                    <cite>商务广告管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showAdvertAll.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>广告列表</cite>
                        </a>
                    </li >
                     <%-- <li>
                        <a _href="${pageContext.request.contextPath }/showAdvertCategoryList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>广告分类</cite>
                        </a>
                    </li > --%>
                </ul>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-dialogue"></i>
                    <cite>评论管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showNewsCommentAll.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻评论列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath }/showChapterCommentAll.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>漫画评论列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-user"></i>
                    <cite>用户信息管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showUserList.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
       		<li class="layui-nav-item" <c:if test="${admin.identity!='超级管理员' }">style="display:none;"</c:if>>
                <a href="javascript:;">
                    <i class="iconfont layui-icon layui-icon-user"></i>
                    <cite>管理员信息管理</cite>
                    <!-- <i class="iconfont nav_right">&#xe697;</i> -->
                </a>
                <ul class="sub-menu layui-nav-child">
                    <li>
                        <a _href="${pageContext.request.contextPath }/showAdminAll.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
      </div>

    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>首页</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='<%=basePath %>jsp/bgsystem/admin/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2019 mingoxu All Rights Reserved</div>  
    </div>
    <!-- 底部结束 -->
</body>
</html>