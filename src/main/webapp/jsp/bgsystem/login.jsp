<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/jsp/bgsystem/common.jsp"%>
<!doctype html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Mingo动漫网后台管理系统登录页</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <jsp:include page="/jsp/bgsystem/header.jsp"/>
</head>
<body class="login-bg">
<div class="login"> <!--layui-anim layui-anim-up -->
    <div class="message"><h2>Mingo动漫网后台管理系统</h2></div>
    <div id="darkbannerwrap"></div>

    <form id="loginform" method="post" class="layui-form" >
        <input name="loginName" placeholder="登录名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input id="checkcode" name="checkcode" placeholder="请输入验证码" type="text" lay-verify="required"  class="layui-input" style="margin-right:10px;width:190px;float:left;" />
        <img src="<%=request.getContextPath()%>/Kaptcha" alt="验证码" id="kaptchaImage" style="border-radius:3px;" />
        <hr class="hr15">
        <%--<input value="登录" style="width:100%;" type="button" class="btn" lay-submit lay-filter="login" />--%>
        <button class="btn" lay-submit lay-filter="login">登录</button>
        <hr class="hr20" >
    </form>
</div>
<script>
    $(function(){

        /**
         * 登录
         */
        layui.use('form',function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            //监听提交
            form.on('submit(login)', function(data){
                // alert(888)
                //提交登陆验证
                $.ajax({
                    url: 'user/login',
                    data: data.field,
                    dataType: 'json',
                    type: 'post',
                    success:function(result){
                        //登陆成功
                        if(result.statusCode == 200){
                            window.location.href = "user/index"
                        }else {
                            layer.msg(result.message);
                        }
                    }
                });
                //layer.msg(JSON.stringify(data.field));
                return false;
            });
        });

        $('#kaptchaImage').click(function () {//生成验证码
            $(this).hide().attr('src', '<%=request.getContextPath()%>/Kaptcha?' + Math.floor(Math.random()*100) ).fadeIn();
            event.cancelBubble=true;
        });
    });

</script>
</body>
</html>