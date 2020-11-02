<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div id="user-music-upload" class="common" style="display:none;">
				<div class="common-title"><h2>上传音乐</h2></div>
				<div class="user-info-list">
					<form id="uploadMusicForm" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
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
									<label for="musicName"><span class="star">*</span>歌曲名称（必填）</label>
								</td>
								<td width="200">
									<input class="input" type="text" id="musicName" name="musicName" value="">
								</td>
								<td><span id="musicName-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="musicSinger"><span class="star">*</span>歌手（必填）</label>
								</td>
								<td>
									<input class="input" type="text" id="musicSinger" name="musicSinger" value="">
								</td>
								<td><span id="musicSinger-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="musicUrl"><span class="star">*</span>音乐文件</label>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<audio id="show-music" src="" controls="controls" style="width:200px;"></audio>
								</td>
								<td>
									<input id="musicFile" name="musicFile" type="file" accept="audio/mp3" style="display:none;" />
									<button type="button" id="upload-music">
									  <i class="fa fa-upload" aria-hidden="true"></i> 上传音乐文件
									</button>
								</td>
								<td><span id="musicFile-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="coverUrl"><span class="star">*</span>音乐封面</label>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr class="up-img">
								<td>
									<img id="show-music-img" src="" alt="图片预览" width="100px" height="100px" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2">
								</td>
								<td>
									<input type="file" id="coverUrl" name="uploadCoverImg" accept="image/*" style="display:none;" >
									<button type="button" id="upload-music-img">
									  <i class="fa fa-upload" aria-hidden="true"></i> 上传图片
									</button>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<button type="submit" onclick="addMusic()">上传音乐</button>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="common-line"></div>
			</div>