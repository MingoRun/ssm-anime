<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>修改漫画章节</title>
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
        <form id="chapterEditForm" class="layui-form" enctype="multipart/form-data" method="post" action="##" onsubmit="return false">
          <div class="layui-form-item" style="display:none;">
              <label for="chapterId" class="layui-form-label">
                  <span class="x-red">*</span>章节编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterId" name="chapterId" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${chapter.chapterId }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="chapterNum" class="layui-form-label">
                  <span class="x-red">*</span>章节序号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterNum" name="chapterNum" required="" lay-verify="required|chapterNum"
                  autocomplete="off" class="layui-input" value="${chapter.chapterNum }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="chapterName" class="layui-form-label">
                  <span class="x-red">*</span>章节名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="chapterName" name="chapterName" required="" lay-verify="required|chapterName"
                  autocomplete="off" class="layui-input" value="${chapter.chapterName }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="updateTime" class="layui-form-label">
                  <span class="x-red">*</span>更新时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="updateTime" name="updateTime" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${chapter.updateTime }">
              </div>
          </div>
           <div class="layui-form-item">
               <label for="chapterPage" class="layui-form-label">
                   <span class="x-red">*</span>章节图片
               </label>
               <div class="layui-input-inline">
               	<input id="uploadChapterPage" name="uploadChapterPage" type="file" accept="image/*" multiple="multiple" style="display:none;" />
                   <button type="button" class="layui-btn" id="upload-img">
					  <i class="layui-icon">&#xe67c;</i>上传章节图片
					</button>
               </div>
               <!-- 预览图片  -->
               <div id="dd" style=" width:990px;">
               		<div style='float:left' > 
	               		<c:forEach items="${pageUrls }" var="pageUrl">
	               			<img src="http://localhost:8081${pageUrl }" width="100px" height="100px" /> 
	               		</c:forEach>
               		</div>
               </div>
           </div>
          <div class="layui-form-item">
              <label for="comicsId" class="layui-form-label">
                  <span class="x-red">*</span>所属漫画
              </label>
              <div class="layui-input-inline">
                 <select id="comicsId" name="comicsId" lay-verify="required">
		              <option value=""></option>
		              <c:forEach items="${comicsNameList }" var="comics">
		              	<option value="${comics.comicsId }" <c:if test="${comics.comicsId==chapter.getComics().getComicsId() }">selected = "selected"</c:if> >${comics.comicsName }</option>
		              </c:forEach>
            </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="edit" lay-submit="">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
  //头像图片上传预览   
   	$(document).ready(function(){
   		$("#upload-img").click(function(){
   			$("#uploadChapterPage").trigger("click");
   		});
   		
   		$("#uploadChapterPage").change(function(){
   			var docObj = document.getElementById("uploadChapterPage");
   	        var dd = document.getElementById("dd");
   	        dd.innerHTML = "";
   	        var fileList = docObj.files;
   	        for (var i = 0; i < fileList.length; i++) { 
   	            dd.innerHTML += "<div style='float:left' > <img id='img" + i + "' /> </div>";
   	            var imgObjPreview = document.getElementById("img"+i); 
   	            if (docObj.files && docObj.files[i]) {
   	                //火狐下，直接设img属性
   	                imgObjPreview.style.display = 'block';
   	                imgObjPreview.style.width = '100px';
   	                imgObjPreview.style.height = '100px';
   	                //imgObjPreview.src = docObj.files[0].getAsDataURL();
   	                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
   	                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
   	            }else {
   	                //IE下，使用滤镜
   	                docObj.select();
   	                var imgSrc = document.selection.createRange().text;
   	                alert(imgSrc);
   	                var localImagId = document.getElementById("img" + i);
   	                //必须设置初始大小
   	                localImagId.style.width = "150px";
   	                localImagId.style.height = "180px";
   	                //图片异常的捕捉，防止用户修改后缀来伪造图片
   	                try {
   	                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
   	                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
   	                }catch(e){
   	                    alert("您上传的图片格式不正确，请重新选择!");
   	                    return false;
   	                }
   	                imgObjPreview.style.display = 'none';
   	                document.selection.empty();
   	            }
   	        } 
   	        return true;
   		});
   	});
	//表单 验证
   	layui.use(['form','layer','laydate'], function(){
        $ = layui.jquery;
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        
        laydate.render({
            elem: '#updateTime' //指定元素
        });

        form.verify({
        	chapterNum:function(value){
        		if(!/^\d+$/.test(value)){
        			return '只能输入数字';
        		}
        	}
        	,chapterName:function(value){
        		if(!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(value)){
        			return '只能输入字母、数字和汉字';
        		}
        	}
          });
        //表单提交添加广告
        form.on('submit(edit)',function(data){
        	var formData = new FormData(document.getElementById("chapterEditForm"));
        	var path="${pageContext.request.contextPath}";
   			$.ajax({
   				type:"POST",
   				dataType:"text",
   				data:formData,
   				url:path+"/updateComicsChapterById.action",
       			contentType:false,
           		processData: false, 
   				success:function(data){
   					if(data=="OK"){
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
   				}
   			});
        	return false;
        });
    });
    </script>
  </body>
</html>