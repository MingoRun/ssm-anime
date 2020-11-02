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
    <title>添加新闻</title>
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
        <form id="advertAddForm" class="layui-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
          <div class="layui-form-item">
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>广告名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" lay-verify="required|name"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
               <label for="newsCoverUrl" class="layui-form-label">
                   <span class="x-red">*</span>新闻封面
               </label>
               <div class="layui-input-inline">
                   <img id="show-img" src="" alt="图片预览" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2" />
               </div>
               <div class="layui-input-inline">
               	<input id="uploadCoverImg" name="uploadCoverImg" type="file" accept="image/*" style="display:none;" lay-verify="required|uploadCoverImg" />
                   <button type="button" class="layui-btn" id="upload-img">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
               </div>
           </div>
          <div class="layui-form-item">
              <label for="business" class="layui-form-label">
                  <span class="x-red">*</span>商家
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="business" name="business" lay-verify="required|business"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="businessPhone" class="layui-form-label">
                  <span class="x-red">*</span>商家电话
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="businessPhone" name="businessPhone" lay-verify="required|phone"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="content" class="layui-form-label">
                  <span class="x-red">*</span>广告内容
              </label>
              <div class="layui-input-block">
                  <textarea id="content" name="content" class="layui-textarea" lay-verify="required|businessPhone" placeholder="请输入广告内容" rows="20"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button type="submit" class="layui-btn" lay-filter="add" lay-submit="">
                  添加
              </button>
              <button type="reset" class="layui-btn">
                  重置
              </button>
          </div>
      </form>
    </div>
	
	<script>
		//广告封面图片上传预览   
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
       	
       	//表单 验证
       	layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer;
  
            form.verify({
            	name:function(value){
            		if(!/[\u4e00-\u9fa5a-zA-Z0-9]{5,20}/.test(value)){
            			return '广告名称至少5到20个任意字符';
            		}
            	}
            	,uploadCoverImg:function(value){
            		if($("#uploadCoverImg").val().length==0){
            			return '广告封面不能为空';
            		}
            	}
                ,business:function(value){
                	if(!/^[\u4e00-\u9fa5]{2,4}$/.test(value)){
                		return '商家必须为2到4个中文汉字';
                	}
                }
            	/* ,businessPhone:function(value){
            		if(!/^1[0-9]{10}$/.test(value)){
            			return '手机号必须为11位有效数字';
            		}
            	} */
            	,content:function(value){
            		if($("#content").val()==""){
            			return '广告内容不能为空';
            		}
            	}
              });
            //表单提交添加广告
            form.on('submit(add)',function(data){
            	var path="${pageContext.request.contextPath}";
            	console.log(data.field);
            	var formData = new FormData(document.getElementById("advertAddForm"));
       			$.ajax({
       				type:"POST",
       				dataType:"text",
       				data:formData,
       				url:path+"/addAdvert.action",
	       			contentType:false,
	           		processData: false, 
       				success:function(data){
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
       				}
       			});
            	return false;
            });
        });
       	
       	/* function addAdvert(){
       	 var formData = new FormData(document.getElementById("advertAddForm"));
       	
       	 $.ajax({
       		 type:"POST", // 请求方式
       		 dataType:"text", //预期服务器返回的类型
       		 url: "${pageContext.request.contextPath}/addAdvert.action", //访问路径
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
        } */
	</script>
  </body>
</html>