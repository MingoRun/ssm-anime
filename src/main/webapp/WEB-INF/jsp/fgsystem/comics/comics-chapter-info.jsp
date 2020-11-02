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
    <title>Mingo动漫网-漫画章节内容页</title>
    <link rel="shortcut icon" href="<%=basePath%>resources/images/mingo/favicon.ico">
    <link rel="stylesheet" href="<%=basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/mingo/style.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/jquery.emoji.css">
    <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
</head>
<body>
<div class="page">
	<!-- 头部  -->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/header.jsp"></jsp:include>
	<!-- /头部 -->
	<nav class="breadcrumb"><!--当前页面所在位置-->
		现在位置<i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/toFrontIndex.action">首页</a><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/toFrontComicsList.action">漫画</a><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId=${chapter.getComics().getComicsId()}&clickNum=${chapter.comics.clickNum+1}">${chapter.comics.comicsName}</a><i class="fa fa-chevron-right" aria-hidden="true"></i>第${chapter.chapterNum }话<i class="fa fa-chevron-right" aria-hidden="true"></i>${chapter.chapterName }			
	</nav><!--/当前页面所在位置-->
	<div class="content"><!--内容-->
		<div id="primary"><!--正文内容-->
			<div class="info">
				<div class="info-title">
					<h1>${chapter.chapterName }</h1>
				</div>
				<div class="info-news">
					<span class="news-time"><i class="fa fa-clock-o" aria-hidden="true"></i> ${chapter.updateTime }</span>
				</div>
				<div class="info-line"></div>
				<div class="info-content">
					<c:forEach items="${pageInfo.list }" var="page">
						<div class="comics-img">
							<img src="http://localhost:8081${page.pageUrl }" alt="">
						</div>
					</c:forEach>
				</div>
				<div style="text-align:center;">
			      	<div id="laypage"></div>
			    </div><!--分页-->
				<div class="info-line"></div>
			</div>
			<div class="comment">
				<div class="comment-title"><h4>发表评论</h4></div>
				<div class="comment-textarea">
					<textarea id="comment-content" onfocus="message()" onblur="otherMessage()" cols="97" rows="5"></textarea>
				</div>
				<div class="comment-btn">
					<button id="comment-btn">提交评论</button>
				</div>
				<div class="comment-line"></div>
				<div class="comment-show" id="comment-cont">
					
				</div>
				<div class="comment-line"></div>
				<div style="float:right">
			      	<div id="page"></div>
			    </div><!--分页-->
				<div class="comment-line"></div>
				<div class="comment-line"></div>
				<div class="comment-line"></div>
			</div>
			<div class="clear"></div>
		</div><!--/正文内容-->
		<div id="sidebar"><!--侧边栏-->
			<jsp:include page="/WEB-INF/jsp/fgsystem/common/sidebar.jsp"></jsp:include>
		</div><!--/侧边栏-->
		<div class="clear"></div>
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
<script src="<%=basePath%>resources/js/jquery.emoji.min.js"></script>
<script src="<%=basePath%>resources/js/emoji.list.js"></script>
<script src="<%=basePath%>resources/js/anime.min.js"></script>
<script src="<%=basePath%>resources/js/fireworks.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/layui/layui.js" charset="utf-8"></script>
<script>
	$(function(){
		$("#comment-content").emoji({
		    showTab: true,
		    animation: 'fade',
		    basePath: 'images/emoji',
		    icons: emojiLists   // 注：详见 js/emoji.list.js
		});
	});

	function message(){
		var dd = document.getElementById("comment-content");
		dd.style.border="2px solid #FF3366";
	}

	function otherMessage(){
		var dd = document.getElementById("comment-content");
		dd.style.border="";
	}
	
	layui.use(['laypage','layer'],function(){
		var laypage = layui.laypage;
		var layer = layui.layer;
		
		laypage.render({            
		    elem: 'laypage', //注意，这里的 test1 是 ID，不用加 # 号
		    count: ${pageInfo.total},//数据总数，从服务端得到
		    curr: ${pageInfo.pageNum},
		    limit: ${pageInfo.pageSize},
		    layout:['prev', 'page','next'],//显示哪些分页组件
		    prev: '<b>&lt;</b>',  //自定义“上一页”的内容
		    next: '<b>&gt;</b>',  //自定义“下一页”的内容
		    jump:function(obj,first){  //jump - 切换分页的回调
		    	//obj包含了当前分页的所有参数，比如：
		        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
		        //console.log(obj.limit); //得到每页显示的条数
		    	//首次不执行
		        if(!first){
		          //do something
		          //var conf ={"pageNum":obj.curr,"pageSize":obj.limit};
		        	window.location="${pageContext.request.contextPath }/toFrontComicsChapterInfo.action?pageNum="+obj.curr+"&chapterId="+${chapterId};
		        }
		    }
		  });
	});
	
	/*用户注册失败提示*/
	var msg = '${msg}';
	if(msg!=''){
		layui.use('layer',function(){
			var layer = layui.layer;
			layer.msg(msg);
		});
	}
	
	/*登录框显示与隐藏*/
	var pic;
	$(function(){
		$("#login-link").click(function(){
			$("#u-modal").show();
			pic = drawImg();
		});
		$("#login-close").click(function(){
			$("#u-modal").hide();
			$("#loginname").val("");
			$("#password").val("");
			$("#login_captcha").val("");
			$("#errorMsg").html("");
		});
		$("#u-r-link").click(function(){
			$("#u-modal").hide();
			$(".u-register").show();
		});
	});
		
	/*登录框随机生成验证码*/
	//生成随机数
	function loginRandomNum(min,max){
	    return Math.floor(Math.random()*(max-min)+min);
	}
	    //生成随机颜色RGB分量
	function loginRandomColor(min,max){
	    var _r = loginRandomNum(min,max);
	    var _g = loginRandomNum(min,max);
	    var _b = loginRandomNum(min,max);
	    return "rgb("+_r+","+_g+","+_b+")";
	}
	//先阻止画布默认点击发生的行为再执行drawPic()方法
	document.getElementById("login_canvas").onclick = function(e){
	    e.preventDefault();
	    pic = drawImg();
	};
	function drawImg(){
	    //获取到元素canvas
	    var $canvas = document.getElementById("login_canvas");
	    var _str = "0123456789abcdefghijklmnopqrstuvwxyz";//设置随机数库
	    var _pic = "";//随机数
	    var _num = 4;//4个随机数字
	    var _width = $canvas.width;
	    var _height = $canvas.height;
	    var ctx = $canvas.getContext("2d");//获取 context 对象
	    ctx.textBaseline = "bottom";//文字上下对齐方式--底部对齐
	    ctx.fillStyle = loginRandomColor(180,240);//填充画布颜色
	    ctx.fillRect(0,0,_width,_height);//填充矩形--画画
	    for(var i=0; i<_num; i++){
	        var x = (_width-10)/_num*i+10;
	        var y = loginRandomNum(_height/2,_height);
	        var deg = loginRandomNum(-45,45);
	        var txt = _str[loginRandomNum(0,_str.length)];
	        _pic += txt;//获取一个随机数
	        ctx.fillStyle = loginRandomColor(10,100);//填充随机颜色
	        ctx.font = loginRandomNum(15,25)+"px SimHei";//设置随机数大小，字体为SimHei
	        ctx.translate(x,y);//将当前xy坐标作为原始坐标
	        ctx.rotate(deg*Math.PI/180);//旋转随机角度
	        ctx.fillText(txt, 0,0);//绘制填色的文本
	        ctx.rotate(-deg*Math.PI/180);
	        ctx.translate(-x,-y);
	    }
	    for(var i=0; i<_num; i++){
	        //定义笔触颜色
	        ctx.strokeStyle = loginRandomColor(90,180);
	        ctx.beginPath();
	        //随机划线--4条路径
	        ctx.moveTo(loginRandomNum(0,_width), loginRandomNum(0,_height));
	        ctx.lineTo(loginRandomNum(0,_width), loginRandomNum(0,_height));
	        ctx.stroke();
	    }
	    for(var i=0; i<_num*10; i++){
	        ctx.fillStyle = loginRandomColor(0,255);
	        ctx.beginPath();
	        //随机画原，填充颜色
	        ctx.arc(loginRandomNum(0,_width),loginRandomNum(0,_height), 1, 0, 2*Math.PI);
	        ctx.fill();
	    }
	    return _pic;//返回随机数字符串
	}

	//登录表单 验证
	$("#login-btn").click(function(){
		var loginname = $("#loginname").val();
		var password = $("#password").val();
		var captcha = $("#login_captcha").val();
		if(loginname==""||loginname==null){
			$("#loginname").focus();
			$("#errorMsg").html("请输入登录名");
			return false;
		}else if(password==""||password==null){
			$("#password").focus();
			$("#errorMsg").html("请输入密码");
			return false;
		}else if(captcha==""||captcha==null){
			$("#login_captcha").focus();
			$("#errorMsg").html("请输入验证码");
			return false;
		}else if(captcha!=pic){
			$("#login_captcha").focus();
			$("#errorMsg").html("验证码不一致");
			return false;
		}else{
			var path ="${pageContext.request.contextPath}";
			$.ajax({
				type:"POST",
				url:path+"/userLogin.action",
				data:{"loginname":loginname,"password":password},
				dataType:"json",
				success:function(data){
					if(data.FLAG==1){
						$("#errorMsg").html("当前用户不存在，请先注册");
						return false;
					}else if(data.FLAG==2){
						$("#errorMsg").html("密码错误，请重新输入");
					}else if(data.FLAG==0){
						window.location.reload();
						return true;
					}
				}
			});
		}
	});
	
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
	
	/*评论列表展示*/
	function showComment(){
		var chapterId = ${chapter.chapterId};
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/showFrontChapterCommentAll.action",
			data:{"pageNum":1,"pageSize":5,"chapterId":chapterId},
			dataType:"json",
			success:function(data){ 
				console.log(data.comments);
				var html = "";
				var comment = document.getElementById("comment-cont");
				for(i in data.comments.list){
					html += '<div class="comment-list">'+
			           '<span class="comment-flag"></span>'+
			           '<div class="user-portrait">'+
				           '<img src="http://localhost:8081'+data.comments.list[i].user.userPortraitUrl+'" alt="">'+
					   '</div>'+
					   '<span class="user-nickname">'+data.comments.list[i].user.loginName+'</span>'+
					   '<div class="comment-info">'+data.comments.list[i].content+'</div>'+
					   '<span class="comment-time"><i class="fa fa-clock-o" aria-hidden="true"></i>'+ data.comments.list[i].time+'</span>'+
					'</div>';
				};
				comment.innerHTML = html;
				paging(data.comments.total,data.comments.pageNum,data.comments.pageSize);//分页
			}
		});
	}
	showComment();
	
	/*评论分页*/
	function paging(total,pageNum,pageSize){
		layui.use(['laypage','layer'],function(){
			var laypage = layui.laypage;
			var layer = layui.layer;
			
			laypage.render({            
			    elem: 'page', //注意，这里的 test1 是 ID，不用加 # 号
			    count: total,//数据总数，从服务端得到
			    curr: pageNum,
			    limit: pageSize,
			    layout:['prev', 'page','next'],//显示哪些分页组件
			    prev: '<b>&lt;</b>',  //自定义“上一页”的内容
			    next: '<b>&gt;</b>',  //自定义“下一页”的内容
			    jump:function(obj,first){  //jump - 切换分页的回调
			    	//obj包含了当前分页的所有参数，比如：
			        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			        //console.log(obj.limit); //得到每页显示的条数
			    	//首次不执行
			        if(!first){
			        	var chapterId = ${chapter.chapterId};
			    		$.ajax({
			    			type:"GET",
			    			url:"${pageContext.request.contextPath}/showFrontChapterCommentAll.action",
			    			data:{"pageNum":obj.curr,"pageSize":obj.limit,"chapterId":chapterId},
			    			dataType:"json",
			    			success:function(data){ 
			    				console.log(data.comments);
			    				var html = "";
			    				var comment = document.getElementById("comment-cont");
			    				for(i in data.comments.list){
			    					html += '<div class="comment-list">'+
			    			           '<span class="comment-flag"></span>'+
			    			           '<div class="user-portrait">'+
			    				           '<img src="http://localhost:8081'+data.comments.list[i].user.userPortraitUrl+'" alt="">'+
			    					   '</div>'+
			    					   '<span class="user-nickname">'+data.comments.list[i].user.loginName+'</span>'+
			    					   '<div class="comment-info">'+data.comments.list[i].content+'</div>'+
			    					   '<span class="comment-time"><i class="fa fa-clock-o" aria-hidden="true"></i>'+ data.comments.list[i].time+'</span>'+
			    					'</div>';
			    				};
			    				comment.innerHTML = html;
			    			}
			    		});
			        }
			    }
			  });
		});
	}
	
	/*当用户为空，提交评论*/
	$("#comment-btn").click(function(){
		if(bool==false){
			layui.use('layer',function(){
				var layer = layui.layer;
				layer.msg("您当前还没登录，请先登录");
			});
		}else{
			var content = $("#comment-content").val();
			var chapterId = ${chapter.chapterId};
			var userId = '${user.userId}';
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/addChapterComment.action",
				data:{"content":content,"chapterId":chapterId,"userId":userId},
				dataType:"text",
				success:function(data){
					if(data=="OK"){
						$("#comment-content").val("");
	       				 layui.use("layer",function(){
	       					 var layer = layui.layer;
	       					 layer.msg("评论成功！",{icon:1},function(){
	       						 showComment();
	       					 });
	       				 });
	       			 }else{
	       				 layui.use("layer",function(){
	       					 var layer = layui.layer;
	       					 layer.msg("评论失败！",{icon:2});
	       				 });
	       			 }
				}
			});
		}
	});
</script>
</body>
</html>