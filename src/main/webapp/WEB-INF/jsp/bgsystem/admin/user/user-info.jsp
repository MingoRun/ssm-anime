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
  	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>用户信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>resources/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>resources/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
           <div class="layui-form-item">
              <label for="userPortraitUrl" class="layui-form-label">
                  <span class="x-red">*</span>用户头像
              </label>
              <div class="layui-input-inline">
                  <img alt="" src="http://localhost:8081${user.userPortraitUrl }" width="50px" height="50px" />
              </div>
          </div>
          <div class="layui-form-item">
              <label for="loginName" class="layui-form-label">
                  <span class="x-red">*</span>登录名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="loginName" name="loginName" autocomplete="off" class="layui-input" readonly="readonly" value="${user.loginName }">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="userName" class="layui-form-label">
                  <span class="x-red">*</span>用户姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="userName" name="userName" readonly="readonly" 
                  autocomplete="off" class="layui-input" value="${user.userName }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="userPhone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="userPhone" name="userPhone" readonly="readonly" 
                  autocomplete="off" class="layui-input" value="${user.userPhone }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="userMail" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="userMail" name="userMail" readonly="readonly" 
                  autocomplete="off" class="layui-input" value="${user.userMail }">
              </div>
          </div>
      </form>
    </div>
  </body>
</html>