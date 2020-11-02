<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="u-register" style="display:none;">
        <div class="reg-content">
        <i id="register-close" class="fa fa-close"></i>
        <div style="height:100px;line-height: 100px;font-size:30px;"><strong>用户注册</strong></div>
        <form id="registerForm" class="m-form" id="registerform" onsubmit="return register_check();" action="${pageContext.request.contextPath }/registerUser.action" method="post">
        	<div class="u-formitem">
                <label for="loginName" class="formitem_tt">登录名</label>
                <input id="loginName" name="loginName" autocomplete="off" placeholder="中英文均可，至少3个字符" class="formitem_ct u-ipt yuan"/>
            	<span id="login-name-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="userName" class="formitem_tt">姓名</label>
                <input id="userName" name="userName" autocomplete="off" placeholder="只能中文，至少2个字符" class="formitem_ct u-ipt yuan"/>
                <span id="user-name-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="userPhone" class="formitem_tt">手机号</label>
                <input id="userPhone" name="userPhone" autocomplete="off" placeholder="请输入11位手机号码" class="formitem_ct u-ipt yuan"/>
                <span id="user-phone-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="userMail" class="formitem_tt">邮箱</label>
                <input id="userMail" name="userMail" autocomplete="off" placeholder="请输入邮箱" class="formitem_ct u-ipt yuan"/>
                <span id="user-mail-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="password" class="formitem_tt">密 码</label>
                <input type="password" id="register_password" autocomplete="off" name="password" placeholder="长度6-16个字符，不包含空格" class="yuan formitem_ct u-ipt" />
                <span id="register-password-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="comform_password" class="formitem_tt">确认密码</label>
                <input type="password" id="comform_password" autocomplete="off" name="comform_password" placeholder="" class="yuan formitem_ct u-ipt" />
                <span id="comform-password-error" class="error"></span>
            </div>
            <div class="u-formitem">
                <label for="" class="formitem_tt">性 别</label>
                <div class="formitem_ct">
                    <div class="sex_box">
                        <label class="radio">
                            <input type="radio" name="userSex" checked value="男" />
                            <i class="u-icon u-icon-radio"></i>男
                        </label>
                        <label class="radio">
                            <input type="radio" name="userSex" value="女" />
                            <i class="u-icon u-icon-radio"></i>女
                        </label>
                    </div>
                </div>
            </div>
            <div class="u-formitem">
                <label for="" class="formitem_tt">验证码</label>
                <div class="formitem_ct validate">
                	<canvas id="canvas" width="100px" height="40px"></canvas>
                    <%-- <img class="captchaImg" id="captchaImg" src="<%=request.getContextPath()%>/Kaptcha" alt="" /> --%>
                    <input type="text" autocomplete="off" id="register_captcha" class="u-ipt" placeholder="请输入验证码"/>
                </div>
            </div>
            <div class="u-error f-dn">
                <span class="u-icon-error"></span>
                <span id="errormsg"></span>
            </div>
            <button id="register-btn" class="u-btn u-btn-primary" type="submit">注&nbsp;&nbsp;册</button>
        </form>
        </div>
    </div>