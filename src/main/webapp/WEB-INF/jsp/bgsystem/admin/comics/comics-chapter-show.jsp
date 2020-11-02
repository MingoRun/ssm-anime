<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>展示漫画章节</title>
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
        <form class="layui-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
          <div class="layui-form-item" style="display:none;">
              <label for="chapterId" class="layui-form-label">
                  <span class="x-red">*</span>章节编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterId" name="chapterId" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${chapter.chapterId }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="chapterNum" class="layui-form-label">
                  <span class="x-red">*</span>章节序号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterNum" name="chapterNum" required="" lay-verify="required|chapterNum"
                  autocomplete="off" class="layui-input" value="${chapter.chapterNum }" readonly="readonly">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="chapterName" class="layui-form-label">
                  <span class="x-red">*</span>章节名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterName" name="chapterName" required="" lay-verify="required|chapterName"
                  autocomplete="off" class="layui-input" value="${chapter.chapterName }" readonly="readonly">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="updateTime" class="layui-form-label">
                  <span class="x-red">*</span>更新时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="updateTime" name="updateTime" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${chapter.updateTime }" readonly="readonly">
              </div>
          </div>
           <div class="layui-form-item">
               <label for="chapterPage" class="layui-form-label">
                   <span class="x-red">*</span>章节图片
               </label>
               <!-- 预览图片  -->
               <div id="dd" style=" width:990px;">
               		<div style='float:left' > 
	               		<c:forEach items="${pageUrls }" var="pageUrl">
	               			<img src="http://localhost:8081${pageUrl }" width="100px" height="100px" /> 
	               		</c:forEach>
               		</div>
               </div>
           </div>
          <div class="layui-form-item">
              <label for="comicsId" class="layui-form-label">
                  <span class="x-red">*</span>所属漫画
              </label>
              <div class="layui-input-inline">
                 <select id="comicsId" name="comicsId" lay-verify="required" disabled="disabled">
		              <option value=""></option>
		              <c:forEach items="${comicsNameList }" var="comics">
		              	<option value="${comics.comicsId }" <c:if test="${comics.comicsId==chapter.getComics().getComicsId() }">selected = "selected"</c:if> >${comics.comicsName }</option>
		              </c:forEach>
            </select>
              </div>
          </div>
      </form>
    </div>
  </body>
</html>