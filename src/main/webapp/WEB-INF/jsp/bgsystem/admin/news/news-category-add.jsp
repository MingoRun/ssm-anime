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
    <title>添加新闻分类</title>
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
    <div class="x-body layui-anim layui-anim-up">
        <form id="categoryForm" class="layui-form" onsubmit="return false" action="##" method="post">
          <div class="layui-form-item">
              <label for="newsCategory" class="layui-form-label">
                  <span class="x-red">*</span>新闻分类
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required=""
                  autocomplete="off" class="layui-input" placeholder="请输入新闻分类名称">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button type="submit" class="layui-btn" onclick="addCategory()"> 
                  添加
              </button>
          </div>
      </form>
    </div>
    <!-- ajax向后台传输数据  -->
    <script>
    	function addCategory(){
    		layui.use('layer',function(){
    			var layer = layui.layer;
    			 $.post("${pageContext.request.contextPath}/addNewsCategory.action",$("#categoryForm").serialize(),function(data){
   				  if(data == "OK"){
   					 layer.alert("添加成功！",{icon:1},function(){
						 layer.close(layer.index);
						 window.parent.location.reload();
					 });
   				  }else{
   					layer.alert("添加失败！",{icon:2});
   				  }
   			    });
    		 });
    	}
    </script>
  </body>
</html>