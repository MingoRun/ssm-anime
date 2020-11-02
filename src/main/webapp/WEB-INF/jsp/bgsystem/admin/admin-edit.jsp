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
        <meta charset="utf-8">
        <title>
            系统管理员个人信息
        </title>
        <meta name="renderer" content="webkit">
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
        <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="<%=basePath%>resources/css/xadmin.css" media="all">
        <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css" >
    </head>
    
    <body>
        <div class="x-body" style="width:50%;margin:0px auto;">
            <form id="adminInfoForm" class="layui-form" enctype="multipart/form-data" onsubmit="return false" action="##" method="post"> 
            	<div class="layui-form-item" style="display: none;">
                    <label for="userId" class="layui-form-label">
                        <span class="x-red">*</span>用户编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="userid" name="userId" required="" lay-verify="required" value="${admin.getUserId() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="portrait" class="layui-form-label">
                        <span class="x-red">*</span>头像
                    </label>
                    <div class="layui-input-inline">
                        <img id="show-img" src="http://localhost:8081${admin.getUserPortraitUrl()}" alt="图片预览" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2" />
                    </div>
                    <div class="layui-input-inline">
                    	<input id="file" name="file" type="file" accept="image/*" style="display:none;" />
                        <button type="button" class="layui-btn" id="upload-img">
						  <i class="layui-icon">&#xe67c;</i>上传图片
						</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="loginName" class="layui-form-label">
                        <span class="x-red">*</span>登录名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="loginname" name="loginName" lay-verify="required" value="${admin.getLoginName() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="userName" class="layui-form-label">
                        <span class="x-red">*</span>真实姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="username" name="userName" lay-verify="required" value="${admin.getUserName() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
				    <label for="usersex" class="layui-form-label">性别</label>
				    <div class="layui-input-block">
				      <input type="radio" name="userSex" value="男" title="男" <c:if test="${admin.getUserSex()=='男'}"> checked="checked"</c:if> >
				      <input type="radio" name="userSex" value="女" title="女" <c:if test="${admin.getUserSex()=='女'}"> checked="checked"</c:if>>
				      <input type="radio" name="userSex" value="保密" title="保密" <c:if test="${admin.getUserSex()==''}"> checked="checked"</c:if> >
				    </div>
				</div>
                <div class="layui-form-item">
                    <label for="phone" class="layui-form-label">
                        <span class="x-red">*</span>手机
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" value="${admin.getUserPhone() }" name="userPhone" lay-verify="phone"
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_email" class="layui-form-label">
                        <span class="x-red">*</span>邮箱
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_email" name="userMail" lay-verify="email" value="${admin.getUserMail() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="role" class="layui-form-label">
                        <span class="x-red">*</span>角色
                    </label>
                    <div class="layui-input-inline">
                      <input type="text" id="role" name="role" value="${admin.getRoles().get(0).getDescription() }" 
                        autocomplete="off" class="layui-input" style="cursor: not-allowed;background-color:#E0E0E0;" disabled="disabled" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button type="submit" class="layui-btn" lay-filter="save" onclick="updateAdminInfo()">
                        保存
                    </button>
                </div>
            </form>
        </div>
        
        <script src="<%=basePath%>resources/js/jquery-3.3.1.min.js"></script>
        <script src="<%=basePath%>resources/layui/layui.js" charset="utf-8">
        </script>
        <script src="<%=basePath%>resources/js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form
              ,layer = layui.layer;
            });
        </script>
        <!-- 头像图片上传预览    -->
        <script>
        	$(document).ready(function(){
        		$("#upload-img").click(function(){
        			$("#file").trigger("click");
        		});
        		
        		$("#file").change(function(){
        			/* var file = $("#file").get(0).files[0];
        			var reader = new FileReader();
        			reader.readAsDataURL(file);
        			reader.onload=function(e){
        				console.log(e);
        				$("#show-img").get(0).src=e.target.src;
        			} */
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
        </script>
        <!-- ajax异步更新管理员信息  -->
        <script>
             function updateAdminInfo(){
            	 var formData = new FormData(document.getElementById("adminInfoForm"));
            	 $.ajax({
            		 type:"POST", // 请求方式
            		 dataType:"json", //预期服务器返回的类型
            		 url: "${pageContext.request.contextPath}/updateAdmin.action", //访问路径
            		 contentType:false,
            		 processData: false, 
            		 data: formData, //需要传输的表单数据
            		 success:function(data){ //响应成功时的回调函数
            			 if(data.FLAG==1){
            				 layui.use("layer",function(){
            					 var layer = layui.layer;
            					 layer.alert("修改成功！",{icon:1},function(){
            						 layer.close(layer.index);
            						 window.parent.location.reload();
            					 });
            				 });
            			 }else{
            				 layui.use("layer",function(){
            					 var layer = layui.layer;
            					 layer.alert("修改失败！",{icon:2});
            				 });
            			 }
            			 
            		 },
            		
            	 });
             }
        </script>
    </body>

</html>