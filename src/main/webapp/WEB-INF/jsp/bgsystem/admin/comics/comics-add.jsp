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
    <title>添加漫画</title>
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
        <form id="comicsAddForm" class="layui-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
          <div class="layui-form-item">
              <label for="comicsName" class="layui-form-label">
                  <span class="x-red">*</span>漫画名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="comicsName" name="comicsName" required="" lay-verify="required|comicsName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="comicsAuthor" class="layui-form-label">
                  <span class="x-red">*</span>漫画作者
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="comicsAuthor" name="comicsAuthor" required="" lay-verify="required|comicsAuthor"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="comicsState" class="layui-form-label">
                  <span class="x-red">*</span>漫画状态
              </label>
              <div class="layui-input-inline">
                  <select id="state" name="state" lay-verify="required">
	                <option value="" selected="selected"></option>
	               	<option value="0">完结</option>
	               	<option value="1">连载</option>
	              </select>
              </div>
          </div>
         <div class="layui-form-item">
               <label for="comicsCoverUrl" class="layui-form-label">
                   <span class="x-red">*</span>漫画封面
               </label>
               <div class="layui-input-inline">
                   <img id="show-img" src="" alt="图片预览" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2" />
               </div>
               <div class="layui-input-inline">
               	<input id="uploadCoverImg" name="uploadCoverImg" type="file" accept="image/*" style="display:none;" lay-verify="required" />
                   <button type="button" class="layui-btn" id="upload-img">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
               </div>
           </div>
           <div class="layui-form-item">
              <label for="comicsCategoryId" class="layui-form-label">
                  <span class="x-red">*</span>漫画类型
              </label>
              <div class="layui-input-inline">
                  <select id="comicsCategoryId" name="comicsCategoryId" lay-verify="required">
	                 <option value="" selected="selected"></option>
	                <c:forEach items="${comicsCategoryList}" var="category">
	                	<option value="${category.comicsCategoryId }" >${category.comicsCategoryName }</option>
	                </c:forEach>
	              </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  添加
              </button>
          </div>
      </form>
    </div>
    <script>
	  	//头像图片上传预览   
	   	$(document).ready(function(){
	   		$("#upload-img").click(function(){
	   			$("#uploadCoverImg").trigger("click");
	   		});
	   		
	   		$("#uploadCoverImg").change(function(){
	   			var url = getObjectURL(this.files[0]);
	   			console.log("objUrl = "+url);
	   			if(url){
	   				$("#show-img").attr("src",url);
	   			}
	   		});
	   	});
	   	
	   	function getObjectURL(file) {
			var url = null;
			if(window.createObjectURL!=undefined){
				url = window.createObjectURL(file);
			}else if(window.URL!=undefined){ // mozilla(firefox)  
				url = window.URL.createObjectURL(file);
			}else if(window.webkitURL!=undefined){ // webkit or chrome  
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}
	   	
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
        	comicsName: function(value){
        		 if(!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(value)){
          			return '只能输入字母、数字和汉字';
          		}
            }
            ,comicsAuthor: function(value){
                if(!/^[A-Za-z\u4e00-\u9fa5]+$/.test(value)){
                    return '只能输入字母和汉字';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
        	 var formData = new FormData(document.getElementById("comicsAddForm"));
      	   	
     	   	 $.ajax({
     	   		 type:"POST", // 请求方式
     	   		 dataType:"text", //预期服务器返回的类型
     	   		 url: "${pageContext.request.contextPath}/addComics.action", //访问路径
     	   		 contentType:false,
     	   		 processData: false, 
     	   		 data: formData, //需要传输的表单数据
     	   		 success:function(data){ //响应成功时的回调函数
     	   			 if(data=="OK"){
     	   				 layui.use("layer",function(){
     	   					 var layer = layui.layer;
     	   					 layer.alert("添加成功！",{icon:1},function(){
     	   						 layer.close(layer.index);
     	   						 window.parent.location.reload();
     	   					 });
     	   				 });
     	   			 }else{
     	   				 layui.use("layer",function(){
     	   					 var layer = layui.layer;
     	   					 layer.alert("添加失败！",{icon:2});
     	   				 });
     	   			 }
     	   			 
     	   		 },
     	   		
     	   	 });
            return false;
          });
          
          
        });
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>