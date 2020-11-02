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
    <title>Mingo动漫网-查询页</title>
    <link rel="shortcut icon" href="<%=basePath%>resources/images/mingo/favicon.ico">
    <link rel="stylesheet" href="<%=basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/mingo/style.css">
    <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
</head>
<body>
<div class="page">
	<!-- 头部 -->
	<jsp:include page="/WEB-INF/jsp/fgsystem/common/header.jsp"></jsp:include>
	<!-- /头部 -->
	<nav class="breadcrumb"><!--当前页面所在位置-->
		现在位置<i class="fa fa-chevron-right" aria-hidden="true"></i>搜索			
	</nav><!--/当前页面所在位置-->
	<div class="content"><!--内容-->
		<div class="entry-main">
			<!--新闻搜索结果-->
			<c:forEach items="${newsList }" var="news">
				<div class="entry-home">
					<span class="entry-flag"></span>
					<span class="entry-img">
						<a href="${pageContext.request.contextPath }/toFrontNewsInfo.action?newsId=${news.newsId}">
							<img src="http://localhost:8081${news.newsCoverUrl }" alt="">
						</a>
					</span>
					<span class="entry-category"><a href="${pageContext.request.contextPath }/toFrontNewsList.action">动漫新闻</a></span>
					<header class="entry-header">
						<h3 class="entry-title"><a href="${pageContext.request.contextPath }/toFrontNewsInfo.action?newsId=${news.newsId}">${news.newsTitle }</a></h3>
					</header>
					<div class="entry-content">
						${news.newsIntro }
					</div>
					<span class="entry-meta">
						<span class="entry-date"><i class="fa fa-clock-o" aria-hidden="true"></i> ${news.newsReleaseTime }</span>
						<span class="entry-source"><i class="fa fa-tachometer" aria-hidden="true"></i> 来源：${news.newsSource }</span>
						<span class="entry-author"><i class="fa fa-user-o" aria-hidden="true"></i> 作者：${news.newsAuthor }</span>
						<span class="entry-author"><i class="fa fa-bars" aria-hidden="true"></i> 类型：${news.getNewsCategory().getName() }</span>
					</span>
					<span class="read-more"><a href="${pageContext.request.contextPath }/toFrontNewsInfo.action?newsId=${news.newsId}">阅读全文</a></span>
				</div>
			</c:forEach>
			<!--/新闻搜索结果-->
			<!--漫画搜索结果-->
			<c:forEach items="${comicsList }" var="comics">
				<div class="entry-home">
					<span class="entry-flag"></span>
					<span class="entry-img">
						<a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId=${comics.comicsId}&clickNum=${comics.clickNum+1}">
							<img src="http://localhost:8081${comics.comicsImgUrl }" alt="">
						</a>
					</span>
					<span class="entry-category"><a href="${pageContext.request.contextPath }/toFrontComicsList.action"">漫画</a></span>
					<header class="entry-header">
						<h3 class="entry-title"><a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId=${comics.comicsId}&clickNum=${comics.clickNum+1}">${comics.comicsName }</a></h3>
					</header>
					<span class="entry-meta">
						<span class="entry-author"><i class="fa fa-user-o" aria-hidden="true"></i> ${comics.comicsAuthor }</span>
						<span class="entry-click"><i class="fa fa-eye" aria-hidden="true"></i> 点击量：${comics.clickNum }</span>
						<span class="entry-state"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> 状态：<c:if test="${comics.comicsState==1 }">连载</c:if><c:if test="${comics.comicsState==0 }">完结</c:if></span>
						<span class="entry-type"><i class="fa fa-bars" aria-hidden="true"></i> 类型：${comics.getComicsCategory().getComicsCategoryName() }</span>
					</span>
					<span class="read-more"><a href="${pageContext.request.contextPath }/toFrontComicsChapter.action?comicsId=${comics.comicsId}&clickNum=${comics.clickNum+1}">浏览漫画</a></span>
				</div>
			</c:forEach>
			<!--/漫画搜索结果-->
			<!--动漫音乐搜索结果-->
			<c:forEach items="${musicsList }" var="music">
				<div class="entry-home">
					<span class="entry-flag"></span>
					<span class="entry-img">
						<a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId=${music.musicId}">
							<img src="http://localhost:8081${music.coverUrl }" alt="">
						</a>
					</span>
					<span class="entry-category"><a href="${pageContext.request.contextPath }/toFrontMusicList.action">动漫音乐</a></span>
					<header class="entry-header">
						<h3 class="entry-title"><a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId=${music.musicId}">${music.musicName }</a></h3>
					</header>
					<span class="entry-meta">
						<span class="entry-date"><i class="fa fa-clock-o" aria-hidden="true"></i> ${music.musicUploadTime }</span>
						<span class="entry-author"><i class="fa fa-user-o" aria-hidden="true"></i> ${music.musicSinger }</span>
						<span class="entry-play"><i class="fa fa-play-circle-o" aria-hidden="true"></i> 播放量：${music.musicPlayCount }</span>
						<span class="entry-download"><i class="fa fa-download" aria-hidden="true"></i> 下载量：${music.musicDownloadCount }</span>
					</span>
					<span class="read-more"><a href="${pageContext.request.contextPath }/toMusicInfo.action?musicId=${music.musicId}">播放歌曲</a></span>
				</div>
			</c:forEach>
			<!--/动漫音乐搜索结果-->
			<!--广告搜索结果-->
			<c:forEach items="${advertList }" var="advert">
				<div class="entry-home">
					<span class="entry-flag"></span>
					<span class="entry-img">
						<a href="${pageContext.request.contextPath }/user_toAdvertInfo.action?id=${advert.id }">
							<img src="http://localhost:8081${advert.imgUrl }" alt="">
						</a>
					</span>
					<span class="entry-category"><a href="${pageContext.request.contextPath }/user_toAdvertList.action">商务广告</a></span>
					<header class="entry-header">
						<h3 class="entry-title"><a href="${pageContext.request.contextPath }/user_toAdvertInfo.action?id=${advert.id }">${advert.name }</a></h3>
					</header>
					<span class="entry-meta">
						<span class="entry-date"><i class="fa fa-clock-o" aria-hidden="true"></i> ${advert.releaseTime }</span>
					</span>
					<span class="read-more"><a href="${pageContext.request.contextPath }/user_toAdvertInfo.action?id=${advert.id }">浏览广告</a></span>
				</div>
			</c:forEach>
			<!--/广告搜索结果-->
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
<script src="<%=basePath%>resources/js/anime.min.js"></script>
<script src="<%=basePath%>resources/js/fireworks.js"></script>
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
</script>
</body>
</html>