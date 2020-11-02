<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div id="user-comics-upload" class="common" style="display:none;">
				<div class="common-title"><h2>上传漫画</h2></div>
				<div class="user-info-list">
					<form id="uploadComicsForm" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
						<table cellspacing="0" cellpadding="0" width="850">
							<tr style="display:none;">
								<td width="200">
									<label for="userId"><span class="star">*</span>用户编号</label>
								</td>
								<td width="200">
									<input class="input" type="text" name="userId" value="${user.userId }">
								</td>
								<td></td>
							</tr>
							<tr>
								<td width="200">
									<label for="comicsName"><span class="star">*</span>漫画名称（必填）</label>
								</td>
								<td width="200">
									<input class="input" type="text" id="comicsName" name="comicsName" value="">
								</td>
								<td><span id="comicsName-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="comicsAuthor"><span class="star">*</span>漫画作者（必填）</label>
								</td>
								<td>
									<input class="input" type="text" id="comicsAuthor" name="comicsAuthor" value="${user.loginName }">
								</td>
								<td><span id="comicsAuthor-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="comicsState"><span class="star">*</span>漫画状态（必选）</label>
								</td>
								<td>
									<input type="radio" name="state" id="seri" value="1"> 连载
									&nbsp;&nbsp;
									<input type="radio" name="state" id="seri" value="0"> 完结
								</td>
								<td><span id="comicsState-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="comicsCoverUrl"><span class="star">*</span>漫画封面</label>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<img id="show-comics-img" src="" alt="图片预览" style="width:100px;height:100px;border:1px solid #F0F0F0;background-color:#f2f2f2" />
								</td>
								<td>
									<input type="file" id="comicsUrlImg" name="uploadCoverImg" accept="image/*" style="display:none;" >
									<button type="button" id="upload-comics-img">
									  <i class="fa fa-upload" aria-hidden="true"></i> 上传漫画封面
									</button>
								</td>
								<td><span id="comicsUrlImg-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="comicsCategoryId"><span class="star">*</span>漫画类型（必选）</label>
								</td>
								<td>
									<select name="comicsCategoryId" id="comicsCategoryId">
										<option value="">暂无类型信息</option>
										<c:forEach items="${categories }" var="category">
											<option value="${category.comicsCategoryId }">${category.comicsCategoryName }</option>
										</c:forEach>
									</select>
								</td>
								<td><span id="comicsType-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<button type="submit" onclick="addComics()">上传漫画</button>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="common-line" style="border-bottom:1px solid #D0D0D0"></div>
				<div class="common-title"><h2>上传漫画章节</h2></div>
				<div class="user-info-list">
					<form id="uploadChapterForm" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
						<table cellspacing="0" cellpadding="0" width="850">
							<tr>
								<td width="200">
									<label for="chapterNum"><span class="star">*</span>漫画章节序号（必填）</label>
								</td>
								<td width="200">
									<input class="input" type="text" id="chapterNum" name="chapterNum" value="">
								</td>
								<td><span id="chapterNum-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="chapterName"><span class="star">*</span>漫画章节名称（必填）</label>
								</td>
								<td>
									<input class="input" type="text" id="chapterName" name="chapterName" value="">
								</td>
								<td><span id="chapterName-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="updateTime"><span class="star">*</span>更新时间（必选）</label>
								</td>
								<td>
									<input type="date" id="updateTime" name="updateTime">
								</td>
								<td><span id="updateTime-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<label for="chapterPage"><span class="star">*</span>章节图片</label>
								</td>
								<td>
									<input id="uploadChapterPage" name="uploadChapterPage" type="file" accept="image/*" multiple="multiple" style="display:none;" />
				                   <button type="button" id="upload-chapter-img"><i class="fa fa-upload" aria-hidden="true"></i> 上传章节图片</button>
								</td>
								<td><span id="chapterPage-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td colspan="3">
									<div id="dd" style=" width:850px;"></div>
								</td>
							</tr>
							<tr>
								<td>
									<label for="comicsId"><span class="star">*</span>所属漫画（必选）</label>
								</td>
								<td>
									<select name="comicsId" id="comicsId">
										<option value="">暂无漫画信息</option>
										<c:forEach items="${comicsNameList }" var="comics">
											<option value="${comics.comicsId }">${comics.comicsName }</option>
										</c:forEach>
									</select>
								</td>
								<td><span id="comicsType-error" style="color:red;"></span></td>
							</tr>
							<tr>
								<td>
									<button type="submit" onclick="addComicsChapter()">上传漫画章节</button>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="common-line"></div>
			</div>