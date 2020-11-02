<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div id="user-edit" class="common" style="display:none;">
				<div class="common-title"><h2>修改信息</h2></div>
				<div class="user-info-list">
					<form id="userEditForm" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
						<table cellspacing="0" cellpadding="0" width="850">
							<tr style="display:none;">
								<td width="200">
									<label for="userId"><span class="star">*</span>用户编号</label>
								</td>
								<td width="200">
									<input id="user-id" class="input" type="text" name="userId" value="${user.userId }">
								</td>
								<td></td>
							</tr>
							<tr>
								<td width="200">
									<label for="loginName"><span class="star">*</span>登录名</label>
								</td>
								<td width="200">
									<input class="input" type="text" id="login-name" readonly="readonly" name="loginName" value="${user.loginName }">
								</td>
								<td><span id="login-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="userName"><span class="star">*</span>姓名（2个到4个中文汉字）</label>
								</td>
								<td>
									<input class="input" type="text" id="user-name" name="userName" value="${user.userName }">
								</td>
								<td><span id="name-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="userSex"><span class="star">*</span>性别（必选）</label>
								</td>
								<td>
									<input type="radio" id="man" name="userSex" value="男" <c:if test="${user.userSex=='男' }">checked</c:if> > 男
									&nbsp;&nbsp;
									<input type="radio" id="woman" name="userSex" value="女" <c:if test="${user.userSex=='女' }">checked</c:if> > 女
								</td>
								<td><span id="error"></span></td>
							</tr>
							<tr>
								<td>
									<label for="userPhone"><span class="star">*</span>手机（11位数字）</label>
								</td>
								<td>
									<input class="input" type="text" id="user-phone" name="userPhone" value="${user.userPhone }" >
								</td>
								<td><span id="phone-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="userMail"><span class="star">*</span>邮箱（必填）</label>
								</td>
								<td>
									<input class="input" type="text" id="user-mail" name="userMail" value="${user.userMail }" >
								</td>
								<td><span id="mail-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="password"><span class="star">*</span>新密码</label>
								</td>
								<td>
									<input class="input" type="password" id="newPassword" name="newPassword">
								</td>
								<td><span id="newPassword-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="rePassword"><span class="star">*</span>重复新密码</label>
								</td>
								<td>
									<input class="input" type="password" id="rePassword">
								</td>
								<td><span id="rePassword-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="userPortrait"><span class="star">*</span>头像</label>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr class="up-img">
								<td>
									<img id="show-img" src="http://localhost:8081${user.userPortraitUrl }" alt="图片预览" width="100px" height="100px" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2">
								</td>
								<td>
									<input type="file" id="userPortrait" name="file" accept="image/*" style="display:none;" >
									<button type="button" class="layui-btn" id="upload-img">
									  <i class="fa fa-upload" aria-hidden="true"></i> 上传图片
									</button>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<button type="submit" onclick="edit_check()">更新个人信息</button>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="common-line"></div>
			</div>