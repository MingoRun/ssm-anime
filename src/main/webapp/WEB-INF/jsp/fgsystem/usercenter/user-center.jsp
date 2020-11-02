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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-transform" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>Mingo动漫网-个人中心页</title>
    <link rel="shortcut icon" href="<%=basePath%>resources/images/mingo/favicon.ico">
    <link rel="stylesheet" href="<%=basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/mingo/style.css">
    <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
</head>
<body onload="clock()">
<div class="page">
	<!-- 头部 -->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/header.jsp"></jsp:include>
	<!-- /头部 -->
	<nav class="breadcrumb"><!--当前页面所在位置-->
		现在位置<i class="fa fa-chevron-right" aria-hidden="true"></i>个人中心			
	</nav><!--/当前页面所在位置-->
	<div class="content"><!--内容-->
		<div class="user-content">
			<div class="user-sidebar"><!--个人中心左侧边栏-->
				<ul>
					<li><a id="userInfo" href="##"><i class="fa fa-address-card-o" aria-hidden="true"></i> 我的信息</a></li>
					<li><a id="editInfo" href="##" onclick="editInfo()"><i class="fa fa-user-o" aria-hidden="true"></i> 修改信息</a></li>
					<li><a id="myWorks" href="javascript:void(0);"><i class="fa fa-bars" aria-hidden="true"></i> 我的作品</a></li>
					<ul id="myWorks-sub-menu" style="display:none;">
						<li style="border-bottom:1px solid #D0D0D0"><a href="##" id="myComics"><i></i>我的漫画</a></li>
						<li><a href="##" id="myMusic"><i></i>我的音乐</a></li>
					</ul>
					<li><a id="upload" href="javascript:void(0);"><i class="fa fa-upload" aria-hidden="true"></i> 上传管理</a></li>
					<ul id="upload-sub-menu" style="display:none;">
						<li style="border-bottom:1px solid #D0D0D0"><a href="##" id="comics-upload"><i></i>上传漫画</a></li>
						<li><a href="##" id="music-upload"><i></i>上传音乐</a></li>
					</ul>
				</ul>
			</div><!--/个人中心左侧边栏-->
			<!-- 我的个人信息内容页 -->
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-info.jsp"></jsp:include>
			<!-- /我的个人信息内容页 -->
			<!--修改信息内容页-->
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-edit.jsp"></jsp:include>
			<!--/修改信息内容页-->
			<!--上传管理内容页-->
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-comics-upload.jsp"></jsp:include>
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-music-upload.jsp"></jsp:include>
			<!--/上传管理内容页-->
			<!--我的作品内容页-->
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-comics.jsp"></jsp:include>
			<jsp:include page="/WEB-INF/jsp/fgsystem/usercenter/user-music.jsp"></jsp:include>
			<!--/我的作品内容页-->
			<div class="clear"></div>
		</div>
	</div><!--/内容-->
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/footer.jsp"></jsp:include>
	<!--/页脚-->
	<!--用户登录框-->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/login.jsp"></jsp:include>
	<!--/用户登录框-->
	<!--用户注册框-->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/register.jsp"></jsp:include>
    <!--/用户注册框-->
</div>
<script src="<%=basePath%>resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>resources/js/search.js"></script>
<script src="<%=basePath%>resources/js/login.js"></script>
<script src="<%=basePath%>resources/js/register.js"></script>
<script src="<%=basePath%>resources/js/carousel.min.js"></script>
<script src="<%=basePath%>resources/js/lunbo.js"></script>
<script src="<%=basePath%>resources/js/anime.min.js"></script>
<script src="<%=basePath%>resources/js/fireworks.js"></script>
<script src="<%=basePath%>resources/js/user-center.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/layui/layui.js" charset="utf-8"></script>
<script>
	/*用户注册失败提示*/
	var msg = '${msg}';
	if(msg!=''){
		layui.use('layer',function(){
			var layer = layui.layer;
			layer.msg(msg);
		});
	}
	
	//定义一个时钟函数
    function clock(){
		//创建一个Date对象，并获取年月日时分秒
    	var dateTime = new Date();
    	var year = dateTime.getFullYear();
    	var month = dateTime.getMonth()+1;
    	var day = dateTime.getDate();
    	var hour = dateTime.getHours();
    	var minute = dateTime.getMinutes();
    	var second = dateTime.getSeconds();
    	//为date-time赋值
    	document.getElementById("sys-time").innerHTML=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
   		//设置定时执行函数，间隔1秒
    	setTimeout("clock()", 1000);
    }
	
	/*修改信息表单验证*/
	/*注册框表单验证*/
	function edit_check(){
		if($("#login-name").val()==""){
			$("#login-error").html("登录名不能为空");
			return false;
		}else if(!/[\u4e00-\u9fa5a-zA-Z]{3}/.test($("#login-name").val())){
			$("#login-error").html("至少3个中文或英文");
			return false;
		}else if($("#user-name").val()==""){
			$("#name-error").html("姓名不能为空");
			return false;
		}else if(!/[\u4e00-\u9fa5a]{2}/.test($("#user-name").val())){
			$("#name-error").html("只能中文，至少2个字符");
			return false;
		}else if($("#user-phone").val()==""){
			$("phone-error").html("手机号不能为空");
			return false;
		}else if(!/^1[0-9]{10}$/.test($("#user-phone").val())){
			$("#phone-error").html("手机号必须11位");
			return false;
		}else if($("#user-mail").val()==""){
			$("#mail-error").html("邮箱不能为空");
			return false;
		}else if(!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test($("#user-mail").val())){
			$("#mail-error").html("邮箱不正确");
			return false;
		}else if($("#newPassword").val()!=$("#rePassword").val()){
			$("#rePassword-error").html("密码不一致");
			return false;
		}
		var formData = new FormData(document.getElementById("userEditForm"));
	   	 $.ajax({
	   		 type:"POST", // 请求方式
	   		 dataType:"json", //预期服务器返回的类型
	   		 url: "${pageContext.request.contextPath}/updateUser.action", //访问路径
	   		 contentType:false,
	   		 processData: false, 
	   		 data: formData, //需要传输的表单数据
	   		 success:function(data){ //响应成功时的回调函数
	   			 if(data.FLAG==1){
	   				 layui.use("layer",function(){
	   					 var layer = layui.layer;
	   					 layer.msg("修改成功！",{time:1000},function(){
	   						window.location.href="${pageContext.request.contextPath}/toGetUser.action?userId="+$("#user-id").val();
	   					 });
	   				 });
	   			 }else if(data.FLAG==2){
	   				layui.use("layer",function(){
	   					 var layer = layui.layer;
	   					 layer.msg("修改成功！",{time:1000},function(){
	   						 window.location.href="${pageContext.request.contextPath}/userLogout.action";
	   					 });
	   				 });
	   			 }else{
	   				 layui.use("layer",function(){
	   					 var layer = layui.layer;
	   					 layer.msg("修改失败！",{time:1000});
	   				 });
	   			 }
	   			 
	   		 },
	   		
	   	 });
		return true;
	}
	$("#newPassword").blur(function(){
		if(!/^[0-9a-zA-Z]{6,16}$/.test($("#newPassword").val())){
			$("#newPassword-error").html("6-16个字符，不包括空格");
		}
	});

	/*上传音乐*/
	function addMusic(){
		if($("#musicName").val()==""){
			$("#musicName-error").html("歌曲名不能为空");
			return false;
		}else if($("#musicSinger").val()==""){
			$("#musicSinger-error").html("歌手名不能为空");
			return false;
		}else if($("#musicFile").val()==""){
			$("#musicFile-error").html("请选择要上传的音乐文件");
			return false;
		}
     	var formData = new FormData(document.getElementById("uploadMusicForm"));
     	console.log(formData);
     	 $.ajax({
     		 type:"POST", // 请求方式
     		 dataType:"text", //预期服务器返回的类型
     		 url: "${pageContext.request.contextPath}/addMusic.action", //访问路径
     		 contentType:false,
     		 processData: false, 
     		 data: formData, //需要传输的表单数据
     		 success:function(data){ //响应成功时的回调函数
     			 if(data=="OK"){
     				 layui.use("layer",function(){
     					 var layer = layui.layer;
     					layer.msg("上传成功！",{time:1000},function(){
	   						window.location.href="${pageContext.request.contextPath}/user_toCenter.action?userId="+${user.userId};
	   					 });
     				 });
     			 }else{
     				 layui.use("layer",function(){
     					 var layer = layui.layer;
     				     layer.msg("上传失败！",{time:1000});
     				 });
     			 }
     			 
     		 },
     		
     	 });
     	 return true;
      }
	
	/*上传漫画*/
	function addComics(){
		var val=$('input:radio[name="state"]:checked').val();
		if($("#comicsName").val()==""){
			$("#comicsName-error").html("漫画名称不能为空");
			return false;
		}else if($("#comicsAuthor").val()==""){
			$("#comicsAuthor-error").html("漫画作者不能为空");
			return false;
		}else if(val==null){
			$("#comicsState-error").html("请选择漫画状态");
			return false;
		}else if($("#comicsUrlImg").val()==""){
			$("#comicsUrlImg-error").html("请上传漫画封面");
			return false;
		}/* else if($("#comicsCategoryId").attr('checked')==undefined){
			$("#comicsType-error").html("请选择漫画类型");
			return false;
		} */
		var formData = new FormData(document.getElementById("uploadComicsForm"));
	   	 $.ajax({
	   		 type:"POST", // 请求方式
	   		 dataType:"text", //预期服务器返回的类型
	   		 url: "${pageContext.request.contextPath}/addComics.action", //访问路径
	   		 contentType:false,
	   		 processData: false, 
	   		 data: formData, //需要传输的表单数据
	   		 success:function(data){ //响应成功时的回调函数
	   			 if(data=="OK"){
	   				 layui.use("layer",function(){
	   					 var layer = layui.layer;
	   					layer.msg("上传成功！",{time:1000},function(){
	   						window.location.href="${pageContext.request.contextPath}/user_toCenter.action?userId="+${user.userId};
	   					 });
	   				 });
	   			 }else{
	   				 layui.use("layer",function(){
	   					 var layer = layui.layer;
	   					 layer.msg("上传失败！",{time:1000});
	   				 });
	   			 }
	   			 
	   		 },
	   		
	   	 });
	}
	
	/*上传漫画章节*/
	function addComicsChapter(){
		if($("#chapterNum").val()==""){
			$("#chapterNum-error").html("章节序号不能为空");
			return false;
		}else if($("#chapterName").val()==""){
			$("#chapterName-error").html("章节名称不能为空");
			return false;
		}else if($("#updateTime").val()==""){
			$("#updateTime-error").html("请选择更新时间");
			return false;
		}else if($("#uploadChapterPage").val()==""){
			$("#chapterPage-error").html("请上传漫画章节图片");
			return false;
		}else if($("#comicsId").attr('checked')==undefined){
			$("#comicsType-error").html("请选择漫画类型");
			return false;
		}
		var formData = new FormData(document.getElementById("uploadChapterForm"));
    	var path="${pageContext.request.contextPath}";
		$.ajax({
			type:"POST",
			dataType:"text",
			data:formData,
			url:path+"/addComicsChapter.action",
  			contentType:false,
      		processData: false, 
			success:function(data){
				if(data=="OK"){
     				 layui.use("layer",function(){
     					 var layer = layui.layer;
     					layer.msg("上传成功！",{time:1000},function(){
	   						window.location.href="${pageContext.request.contextPath}/user_toCenter.action?userId="+${user.userId};
	   					 });
     				 });
     			 }
				if(data=="FAIL"){
     				 layui.use("layer",function(){
     					 var layer = layui.layer;
     					 layer.msg("添加失败！",{time:1000});
     				 });
     			 }
				if(data=="ERROR"){
    				 layui.use("layer",function(){
    					 var layer = layui.layer;
    					 layer.msg("漫画章节序号已存在，请重新输入！",{time:1000});
    				 });
    			 } 
			}
		});
	}
	
	/*点击我的漫画*/
	$("#myComics").click(function(event) {
		/* Act on the event */
		/*展示&隐藏*/
		$("#user-comics-upload").hide();
		$("#user-info").hide();
		$("#user-edit").hide();
		$("#user-upload").hide();
		$("#user-music-upload").hide();
		$("#user-comics").show();
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
		/*ajax异步展示我的漫画作品*/
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/showUserComicsAll.action",
			data:{"pageNum":1,"pageSize":5,"userId":${user.userId}},
			dataType:"json",
			success:function(data){ 
				console.log(data.comics);
				var html = "";
				var comicsTbody = document.getElementById("comicsTbody");
				for(i in data.comics.list){
					html += '<tr>'+
					          '<td>'+data.comics.list[i].comicsName+'</td>'+
					           '<td>'+
						         '<a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId='+data.comics.list[i].comicsId+'&clickNum='+data.comics.list[i].clickNum+1+'">查看</a>'+
					           '</td>'+
					           '<td>'+
						         '<a href="##" onclick="del_comics(this,'+data.comics.list[i].comicsId+')">删除</a>'+
					        '</td>'+
				            '</tr>';
				};
				comicsTbody.innerHTML = html;
				comicsPaging(data.comics.total,data.comics.pageNum,data.comics.pageSize); //分页
			}
		});
	});
	/*我的漫画分页*/
	function comicsPaging(total,pageNum,pageSize){
		layui.use(['laypage','layer'],function(){
			var laypage = layui.laypage;
			var layer = layui.layer;
			
			laypage.render({            
			    elem: 'comics_page', //注意，这里的 test1 是 ID，不用加 # 号
			    count: total,//数据总数，从服务端得到
			    curr: pageNum,
			    limit: pageSize,
			    layout:['first','prev', 'page', 'next','last','skip','count'],//显示哪些分页组件
			    first: '首页', //自定义“首页”的内容
	   		    last: '尾页',  //自定义“尾页”的内容
	   		    prev: '<em>上一页</em>',  //自定义“上一页”的内容
	   		    next: '<em>下一页</em>',  //自定义“下一页”的内容
			    jump:function(obj,first){  //jump - 切换分页的回调
			    	//obj包含了当前分页的所有参数，比如：
			        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			        //console.log(obj.limit); //得到每页显示的条数
			    	//首次不执行
			        if(!first){
			        	$.ajax({
			    			type:"GET",
			    			url:"${pageContext.request.contextPath}/showUserComicsAll.action",
			    			data:{"pageNum":obj.curr,"pageSize":obj.limit,"userId":${user.userId}},
			    			dataType:"json",
			    			success:function(data){ 
			    				console.log(data.comics);
			    				var html = "";
			    				var comicsTbody = document.getElementById("comicsTbody");
			    				for(i in data.comics.list){
			    					html += '<tr>'+
							          '<td>'+data.comics.list[i].comicsName+'</td>'+
							           '<td>'+
								         '<a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId='+data.comics.list[i].comicsId+'&clickNum='+data.comics.list[i].clickNum+1+'">查看</a>'+
							           '</td>'+
							           '<td>'+
								         '<a href="##" onclick="del_comics(this,'+data.comics.list[i].comicsId+')">删除</a>'+
							        '</td>'+
						            '</tr>';
			    				};
			    				comicsTbody.innerHTML = html;
			    			}
			    		});
			        }
			    }
			  });
		});
	}
	/*删除我的漫画*/
	function del_comics(obj,id){
		layui.use('layer',function(){
  		  var layer = layui.layer;
  		  layer.confirm('确认要删除吗？',function(index){
                //发异步删除数据
  			  $.post("${pageContext.request.contextPath}/deleteComicsById.action",{"comicsId":id},function(data){
  				  if(data == "OK"){
  					  layer.msg('删除成功!',{time:1000},function(){
  						$("#user-comics").show(function(){
  							$.ajax({
  								type:"GET",
  								url:"${pageContext.request.contextPath}/showUserComicsAll.action",
  								data:{"pageNum":1,"pageSize":5,"userId":${user.userId}},
  								dataType:"json",
  								success:function(data){ 
  									console.log(data.comics);
  									var html = "";
  									var comicsTbody = document.getElementById("comicsTbody");
  									for(i in data.comics.list){
  										html += '<tr>'+
  										          '<td>'+data.comics.list[i].comicsName+'</td>'+
  										           '<td>'+
  											         '<a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId='+data.comics.list[i].comicsId+'&clickNum='+data.comics.list[i].clickNum+1+'">查看</a>'+
  										           '</td>'+
  										           '<td>'+
  											         '<a href="##" onclick="del_comics(obj,'+data.comics.list[i].comicsId+')">删除</a>'+
  										        '</td>'+
  									            '</tr>';
  									};
  									comicsTbody.innerHTML = html;
  									comicsPaging(data.comics.total,data.comics.pageNum,data.comics.pageSize); //分页
  								}
  							});
  						});
  					  });
  				  }else{
  					  layer.msg('删除失败!',{time:1000});
  				  }
  			  });
            });
  	  });
	}
	/*点击我的音乐*/
	$("#myMusic").click(function(event) {
		/* Act on the event */
		/*展示&隐藏*/
		$("#user-comics-upload").hide();
		$("#user-info").hide();
		$("#user-edit").hide();
		$("#user-upload").hide();
		$("#user-music-upload").hide();
		$("#user-comics").hide();
		$("#user-music").show();
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
		/*ajax异步展示我的音乐作品*/
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/showUserMusicAll.action",
			data:{"pageNum":1,"pageSize":5,"userId":${user.userId}},
			dataType:"json",
			success:function(data){ 
				var html = "";
				var musicTbody = document.getElementById("musicTbody");
				for(i in data.musics.list){
					html += '<tr>'+
					          '<td>'+data.musics.list[i].musicName+'</td>'+
					           '<td>'+
						         '<a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId='+data.musics.list[i].musicId+'">查看</a>'+
					           '</td>'+
					           '<td>'+
						         '<a href="##" onclick="del_music(this,'+data.musics.list[i].musicId+')">删除</a>'+
					        '</td>'+
				            '</tr>';
				};
				musicTbody.innerHTML = html; 
				musicPaging(data.musics.total,data.musics.pageNum,data.musics.pageSize); //分页 
			}
		});
	});
	/*我的音乐分页*/
	function musicPaging(total,pageNum,pageSize){
		layui.use(['laypage','layer'],function(){
			var laypage = layui.laypage;
			var layer = layui.layer;
			
			laypage.render({            
			    elem: 'music_page', //注意，这里的 test1 是 ID，不用加 # 号
			    count: total,//数据总数，从服务端得到
			    curr: pageNum,
			    limit: pageSize,
			    layout:['first','prev', 'page', 'next','last','skip','count'],//显示哪些分页组件
			    first: '首页', //自定义“首页”的内容
	   		    last: '尾页',  //自定义“尾页”的内容
	   		    prev: '<em>上一页</em>',  //自定义“上一页”的内容
	   		    next: '<em>下一页</em>',  //自定义“下一页”的内容
			    jump:function(obj,first){  //jump - 切换分页的回调
			    	//obj包含了当前分页的所有参数，比如：
			        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			        //console.log(obj.limit); //得到每页显示的条数
			    	//首次不执行
			        if(!first){
			        	$.ajax({
			    			type:"GET",
			    			url:"${pageContext.request.contextPath}/showUserMusicAll.action",
			    			data:{"pageNum":obj.curr,"pageSize":obj.limit,"userId":${user.userId}},
			    			dataType:"json",
			    			success:function(data){ 
			    				var html = "";
			    				var musicTbody = document.getElementById("musicTbody");
			    				for(i in data.musics.list){
			    					html += '<tr>'+
			    					          '<td>'+data.musics.list[i].musicName+'</td>'+
			    					           '<td>'+
			    						         '<a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId='+data.musics.list[i].musicId+'">查看</a>'+
			    					           '</td>'+
			    					           '<td>'+
			    						         '<a href="##" onclick="del_music(this,'+data.musics.list[i].musicId+')">删除</a>'+
			    					        '</td>'+
			    				            '</tr>';
			    				};
			    				musicTbody.innerHTML = html;
			    			}
			    		});
			        }
			    }
			  });
		});
	}
	/*删除我的音乐*/
	function del_music(obj,id){
		layui.use('layer',function(){
  		  var layer = layui.layer;
  		  layer.confirm('确认要删除吗？',function(index){
                //发异步删除数据
  			  $.post("${pageContext.request.contextPath}/deleteMusicById.action",{"musicId":id},function(data){
  				  if(data == "OK"){
  					  layer.msg('删除成功!',{time:1000},function(){
  						$("#user-music").show(function(){
  							$.ajax({
  								type:"GET",
  								url:"${pageContext.request.contextPath}/showUserMusicAll.action",
  								data:{"pageNum":1,"pageSize":5,"userId":${user.userId}},
  								dataType:"json",
  								success:function(data){ 
  									var html = "";
  									var musicTbody = document.getElementById("musicTbody");
  									for(i in data.musics.list){
  										html += '<tr>'+
  										          '<td>'+data.musics.list[i].musicName+'</td>'+
  										           '<td>'+
  											         '<a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId='+data.musics.list[i].musicId+'">查看</a>'+
  										           '</td>'+
  										           '<td>'+
  											         '<a href="##" onclick="del_music(this,'+data.musics.list[i].musicId+')">删除</a>'+
  										        '</td>'+
  									            '</tr>';
  									};
  									musicTbody.innerHTML = html;
  									musicPaging(data.musics.total,data.musics.pageNum,data.musics.pageSize); //分页
  								}
  							});
  						});
  					  });
  				  }else{
  					  layer.msg('删除失败!',{time:1000});
  				  }
  			  });
            });
  	  });
	}
	/*当用户不为空时，点击商务广告*/
	var bool = ${not empty user && !(user eq null)};
	$("#advert-menu").click(function(){
		if(bool==false){
			layui.use('layer',function(){
				var layer = layui.layer;
				layer.msg("您当前还没登录，请先登录");
			});
		}else{
			$("#advert-menu").attr("href","${pageContext.request.contextPath }/user_toAdvertList.action");
		}
	});
</script>
</body>
</html>