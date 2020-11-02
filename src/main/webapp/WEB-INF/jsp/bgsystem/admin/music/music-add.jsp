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
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>添加音乐</title>
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
        <form id="musicAddForm" class="layui-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
          <div class="layui-form-item" style="display:none;">
              <label for="userId" class="layui-form-label">
                  <span class="x-red">*</span>当前用户编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="userId" name="userId"
                  autocomplete="off" class="layui-input" value="">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="musicName" class="layui-form-label">
                  <span class="x-red">*</span>歌曲名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="musicName" name="musicName" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="musicSinger" class="layui-form-label">
                  <span class="x-red">*</span>歌手
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="musicSinger" name="musicSinger" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
               <label for="musicUrl" class="layui-form-label">
                   <span class="x-red">*</span>音乐文件
               </label>
               <div class="layui-input-inline">
                   <audio id="show-music" src="" controls="controls" style="width:200px;"></audio>
               </div>
               <div class="layui-input-inline">
               	<input id="musicFile" name="musicFile" type="file" accept="audio/mp3" style="display:none;" />
                   <button type="button" class="layui-btn" id="upload-music">
					  <i class="layui-icon">&#xe67c;</i>上传音乐
					</button>
               </div>
           </div>
           <div class="layui-form-item">
               <label for="coverUrl" class="layui-form-label">
                   <span class="x-red">*</span>音乐封面
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
              <label for="L_repass" class="layui-form-label">
              </label>
              <button type="submit" class="layui-btn" lay-filter="add" lay-submit="" onclick="addMusic()">
                  添加
              </button>
          </div>
      </form>
    </div>
	
	<script>
		//音乐文件上传预览   
       	$(document).ready(function(){
       		$("#upload-music").click(function(){
       			$("#musicFile").trigger("click");
       		});
       		
       		$("#musicFile").change(function(){
       			var url = getObjectURL(this.files[0]);
       			console.log("objUrl = "+url);
       			if(url){
       				$("#show-music").attr("src",url);
       			}
       		});
       	});
		
       //音乐预览   
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
       	
       	function addMusic(){
       	 var formData = new FormData(document.getElementById("musicAddForm"));
       	 console.log(formData);
       	 $.ajax({
       		 type:"POST", // 请求方式
       		 dataType:"text", //预期服务器返回的类型
       		 url: "${pageContext.request.contextPath}/addMusic.action", //访问路径
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
        }
	</script>
  </body>
</html>