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
            系统管理员修改密码
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
            <form id="changePWD" class="layui-form" onsubmit="return false" action="##" method="post"> 
            	<div class="layui-form-item" style="display: none;">
                    <label for="id" class="layui-form-label">
                        <span class="x-red">*</span>管理员编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="id" name="id" lay-verify="required" value="${admin.getId() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item" style="display: none;">
                    <label for="accountName" class="layui-form-label">
                        <span class="x-red">*</span>账户名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="accountName" name="accountName" lay-verify="required" value="${admin.getAccountName() }" 
                        autocomplete="off" class="layui-input" />
                    </div>
                </div>
               <div class="layui-form-item">
                    <label for="oldPassword" class="layui-form-label">
                        <span class="x-red">*</span>原密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="oldPassword" name="oldPassword" lay-verify="required"
                        autocomplete="off" class="layui-input" placeholder="请输入当前密码" >
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red" id="oldpwd"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="newPassword" class="layui-form-label">
                        <span class="x-red">*</span>新密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="newPassword" name="newPassword" lay-verify="required|newPassword"
                        autocomplete="off" class="layui-input" placeholder="请设置新的登录密码" >
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>密码必须6到12位
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="verifyPassword" class="layui-form-label">
                        <span class="x-red">*</span>确认新密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="verifyPassword" name="verifyPassword" lay-verify="required|verifyPassword"
                        autocomplete="off" class="layui-input" placeholder="请再次填写确认新密码" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="save" >
                        保存
                    </button>
                </div>
            </form>
        </div>
        <!-- Jquery Validate验证组件 -->
        <script src="<%=basePath%>resources/js/jquery-3.3.1.min.js"></script>
        <!--// Jquery Validate验证组件 -->
        <script src="<%=basePath%>resources/layui/layui.js" charset="utf-8">
        </script>
        <script src="<%=basePath%>resources/js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
                var form = layui.form
                ,layer = layui.layer;
      
                form.verify({
                    newPassword:function(value){
                    	if(!/^[\S]{6,12}$/.test(value)){
                    		return '密码必须为6为至12位';
                    	}
                    	if($("#newPassword").val()==$("#oldPassword").val()){
                    		return '原始密码与新密码不能一样';
                    	}
                    }
                    ,verifyPassword: function(value){
                        if($('#verifyPassword').val()!=$('#newPassword').val()){
                            return '两次密码不一致';
                        }
                    }
                  });
                
                form.on('submit(save)',function(data){
                	var path="${pageContext.request.contextPath}";
                	console.log(data.field);
                	var id = data.field.id;
                	var newPass = data.field.newPassword;
                	var accountName = data.field.accountName;
                	if($("#oldpwd").val()=="原始密码输入不正确！"){
            			layui.use('layer',function(){
            				var layer = layui.layer;
            				layer.alert('原始密码不正确，请重新输入',{icon:5});
            			});
            		}else{ 
            			$.ajax({
            				type:"POST",
            				dataType:"json",
            				data:{"id":id,"accountName":accountName,"newPass":newPass},
            				url:path+"/updateAdminPassword.action",
            				success:function(data){
            					if(data.MARK==1){
            						layui.use('layer',function(){
            							var layer = layui.layer;
            							layer.alert("修改密码成功",{icon:6},function(){
            								layer.close(layer.index);
            								window.parent.location="<%=request.getContextPath()%>/logout.action";
            							});
            						});
            					}else{
            						layui.use('layer',function(){
            							var layer = layui.layer;
            							layer.alert("修改密码不成功",{icon:5});
            						});
            					}
            				}
            			});
            		}
                	return false;
                });
            });
        </script>

		<!-- ajax同步验证管理员密码  -->
		<script>
			$("#oldPassword").blur(function(){
				var path="${pageContext.request.contextPath}";
				var id = $("#id").val();
				var oldPassword = $("#oldPassword").val();
				var accountName = $("#accountName").val();
				$.ajax({
					type:"POST",  //请求方式
					dataType:"json", //预期服务器返回的类型
					url:path+"/selectPWDById.action",
					data:{"id":id,"accountName":accountName,"oldPassword":oldPassword},
					async : false,
					success:function(data){
						if(data.SIGN==1){
							//$("#oldpwd").text("原始密码输入正确！");
							layui.use('layer',function(){
		        				var layer = layui.layer;
		        				layer.alert('原始密码输入正确',{icon:6});
		        			});
						}else{
							//$("#oldpwd").text("原始密码输入不正确！");
							layui.use('layer',function(){
		        				var layer = layui.layer;
		        				layer.alert('原始密码输入不正确，请重新输入',{icon:5});
		        			});
						}
					},
					error:function(){
						layui.use("layer",function(){
							var layer = layui.layer;
							layer.alert("操作失败！",{icon:5},function(){
								layer.close(layer.index);
							});
						});
					}
				});
			});
		</script>
    </body>
</html>