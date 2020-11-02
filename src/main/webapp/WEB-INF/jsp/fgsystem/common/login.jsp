<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
	<div id="u-modal" class="u-modal" style="display:none;">
	    <div class="modal-cnt">
           <div class="modal-tt">
                <strong>用户登录 </strong>
                <i id="login-close" class="fa fa-close"></i>
            </div>
            <div class="m-form">
            <!-- <form id="loginForm" class="m-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false"> --><!--登录表单-->
                <div class="u-formitem">
                	<input id="loginname" name="loginName" type="text" autocomplete="off" placeholder="登录名\手机号\邮箱" class="u-input"> 
                </div>
                <div class="u-formitem u-formitem1">
                	<input id="password" name="password" autocomplete="off" type="password" placeholder="密码" class="u-input"> 
                </div>
                <div class="u-formitem u-formitem1" style="position: relative;">
                	<input id="login_captcha" autocomplete="off" type="text" placeholder="请输入验证码" class="u-input" > 
                	<canvas id="login_canvas" width="100px" height="40px" style="position:absolute;top:0px;right:31px;border:1px solid #a5f1e1;box-sizing:border-box;border-radius:0 4px 4px 0;cursor:pointer;"></canvas>
                </div>
                <div class="u-formitem u-formitem2">
                    <div class="u-check">
                       <!--注册链接-->
                       <span>还没有账号？ <a id="u-r-link" class="u-link" id="goregister" href="javascript:void(0);">立即注册</a></span>
                       <!--//注册链接-->
                    </div>
                </div>
                <div class="u-error f-dn">
                    <span class="u-icon-error"></span>
                    <span id="errorMsg" class="errorMsg"></span>
                </div>
                <button id="login-btn" class="u-btn-primary" type="submit">登&nbsp;&nbsp;录</button>
            <!-- </form> -->
            </div>
        </div>
	</div>