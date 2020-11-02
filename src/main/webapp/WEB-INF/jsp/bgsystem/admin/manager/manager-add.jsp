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
    <title>添加用户</title>
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
              <label for="accountName" class="layui-form-label">
                  <span class="x-red">*</span>账户名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="accountName" name="accountName" required="" lay-verify="required|accountName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>管理员姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required="" lay-verify="required|name"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  2到4个汉字
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="password" required="" lay-verify="required|password"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required="" lay-verify="required|repass"
                  autocomplete="off" class="layui-input">
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
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
        	  accountName: function(value){
	              if(value.length < 3){
	                 return '账户名至少得3个字符啊';
	              }
	          }
              ,name:function(value){
            	  if(!/^[\u4e00-\u9fa5]{2,4}$/.test(value)){
              		return '管理员姓名必须为2到4个中文汉字';
              	}
              }
	          ,password: [/(.+){6,12}$/, '密码必须6到12位']
	          ,repass: function(value){
	              if($('#L_pass').val()!=$('#L_repass').val()){
	                return '两次密码不一致';
	              }
	          }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给controller
            $.ajax({
   				type:"POST",
   				dataType:"text",
   				data:data.field,
   				url:"${pageContext.request.contextPath }/addAdmin.action",
   				success:function(data){
   					if(data=="OK"){
   						layui.use('layer',function(){
   							var layer = layui.layer;
   							layer.alert("添加成功",{icon:6},function(){
   								// 获得frame索引
   				                var index = parent.layer.getFrameIndex(window.name);
   				                //关闭当前frame
   				                parent.layer.close(index);
   				             	window.parent.location.reload();
   							});
   						});
   					}else{
   						layui.use('layer',function(){
   							var layer = layui.layer;
   							layer.alert("添加失败",{icon:5});
   						});
   					}
   				}
   			});
            return false;
          });
          
        });
    </script>
  </body>
</html>