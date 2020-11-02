$(function(){
/*点击我的信息*/
$("#userInfo").click(function(){
	/*样式*/
	$("#userInfo").css({
		"background-color":"#FF3366",
		"color":"white"
	});
	$("#editInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#upload").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#myWorks").css({
		"background-color":"white",
		"color":"#444"
	});
	/*展示&隐藏*/
	$("#user-info").show();
	$("#user-edit").hide();
	$("#user-upload").hide();
	$("#user-comics-upload").hide();
	$("#user-music-upload").hide();
	$("#user-comics").hide();
	$("#user-music").hide();
	/*滑入滑出*/
	$("#upload-sub-menu").slideUp("slow");
	$("#myWorks-sub-menu").slideUp("slow");
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
/*点击修改信息*/
$("#editInfo").click(function(){
	/*样式*/
	$("#editInfo").css({
		"background-color":"#FF3366",
		"color":"white"
	});
	$("#userInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#upload").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#myWorks").css({
		"background-color":"white",
		"color":"#444"
	});
	/*展示&隐藏*/
	$("#user-info").hide();
	$("#user-edit").show();
	$("#user-upload").hide();
	$("#user-comics-upload").hide();
	$("#user-music-upload").hide();
	$("#user-comics").hide();
	$("#user-music").hide();
	/*滑入滑出*/
	$("#upload-sub-menu").slideUp("slow");
	$("#myWorks-sub-menu").slideUp("slow");
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
/*点击上传管理*/
$("#upload").click(function(){
	/*样式*/
	$("#upload").css({
		"background-color":"#FF3366",
		"color":"white"
	});
	$("#userInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#editInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#myWorks").css({
		"background-color":"white",
		"color":"#444"
	});
	/*滑入滑出*/
	$("#upload-sub-menu").slideToggle("slow");
	$("#myWorks-sub-menu").slideUp("slow");
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
/*点击漫画上传*/
$("#comics-upload").click(function(event) {
	/* Act on the event */
	/*展示&隐藏*/
	$("#user-comics-upload").show();
	$("#user-info").hide();
	$("#user-edit").hide();
	$("#user-upload").hide();
	$("#user-music-upload").hide();
	$("#user-comics").hide();
	$("#user-music").hide();
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
/*点击音乐上传*/
$("#music-upload").click(function(){
	/*展示&隐藏*/
	$("#user-comics-upload").hide();
	$("#user-info").hide();
	$("#user-edit").hide();
	$("#user-upload").hide();
	$("#user-music-upload").show();
	$("#user-comics").hide();
	$("#user-music").hide();
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
});
//点击我的作品
$("#myWorks").click(function(){
	/*样式*/
	$("#myWorks").css({
		"background-color":"#FF3366",
		"color":"white"
	});
	$("#userInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#editInfo").css({
		"background-color":"white",
		"color":"#444"
	});
	$("#upload").css({
		"background-color":"white",
		"color":"#444"
	});
	/*滑入滑出*/
	$("#myWorks-sub-menu").slideToggle("slow");
	/*清空输入框*/
	/*修改信息input清空*/
	$("#newPassword").val("");
	$("#rePassword").val("");
	$("#userPortrait").val("");
	$("#name-error").html("");
	$("#phone-error").html("");
	$("#mail-error").html("");
	$("#newPassword-error").html("");
	$("#rePassword-error").html("");
	/*上传音乐input清空*/
	$("#musicName").val("");
	$("#musicSinger").val("");
	$("#musicFile").val("");
	$("#coverUrl").val("");
	$("#show-music").attr("src","");
	$("#show-music-img").removeAttr("src");
	$("#musicName-error").html("");
	$("#musicSinger-error").html("");
});
//头像图片上传预览   
$(document).ready(function(){
	$("#upload-img").click(function(){
		$("#userPortrait").trigger("click");
	});
	
	$("#userPortrait").change(function(){
		var url = getObjectURL(this.files[0]);
		console.log("objUrl = "+url);
		if(url){
			$("#show-img").attr("src",url);
		}
	});
});
//音乐封面上传预览   
$(document).ready(function(){
	$("#upload-music-img").click(function(){
		$("#coverUrl").trigger("click");
	});
	
	$("#coverUrl").change(function(){
		var url = getObjectURL(this.files[0]);
		console.log("objUrl = "+url);
		if(url){
			$("#show-music-img").attr("src",url);
		}
	});
});
//音乐文件上传预览   
$(document).ready(function(){
	$("#upload-music").click(function(){
		$("#musicFile").trigger("click");
	});
	
	$("#musicFile").change(function(){
		var url = getObjectURL(this.files[0]);
		console.log("objUrl = "+url);
		if(url){
			$("#show-music").attr("src",url);
		}
	});
});//comicsUrlImg
//漫画封面上传预览   
$(document).ready(function(){
	$("#upload-comics-img").click(function(){
		$("#comicsUrlImg").trigger("click");
	});
	
	$("#comicsUrlImg").change(function(){
		var url = getObjectURL(this.files[0]);
		console.log("objUrl = "+url);
		if(url){
			$("#show-comics-img").attr("src",url);
		}
	});
});
//章节图片上传预览   
$(document).ready(function(){
	$("#upload-chapter-img").click(function(){
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