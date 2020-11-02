<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Mingo动漫网-动漫音乐内容页</title>
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
		现在位置<i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/toFrontIndex.action">首页</a><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/toFrontMusicList.action">动漫音乐</a><i class="fa fa-chevron-right" aria-hidden="true"></i>${music.musicName }	
	</nav><!--/当前页面所在位置-->
	<div class="content"><!--内容-->
		<div id="primary"><!--正文内容-->
			<div class="info">
				<div class="info-title">
					<h1>${music.musicName }</h1>
				</div>
				<div class="info-music">
					<span class="music-time"><i class="fa fa-clock-o" aria-hidden="true"></i> ${music.musicUploadTime }</span>
					<span class="music-singer"><i class="fa fa-user-o" aria-hidden="true"></i> ${music.musicSinger }</span>
					<span class="music-play"><i class="fa fa-play-circle-o" aria-hidden="true"></i> 播放量：<span id="playCount">${music.musicPlayCount }</span></span>
					<span class="music-download"><i class="fa fa-download" aria-hidden="true"></i> 下载量：<span id="downloadCount">${music.musicDownloadCount }</span></span>
				</div>
				<div class="info-line"></div>
				<div class="music-file">
					<audio id="paly-music" controls onplay="playMusic()">
						<source src="http://localhost:8081${music.musicUrl }" type="audio/mp3">
   						 您的浏览器不支持 HTML5 audio。
					</audio>
					<a id="download-music" title="下载" href="javascript:void(0);" onclick="downloadMusic(${music.musicId },'${music.musicUrl }',${music.musicDownloadCount })"><i class="fa fa-download" aria-hidden="true"></i></a>
					<div class="clear"></div>
				</div>
				<div class="info-line"></div>
				<div class="info-content">
					<div class="music-img">
						<img src="http://localhost:8081${music.coverUrl }" alt="">
					</div>
				</div>
				<div class="paging"></div><!--分页-->
				<div class="info-line"></div>
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
<script src="<%=basePath%>resources/js/anime.min.js"></script>
<script src="<%=basePath%>resources/js/fireworks.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/layui/layui.js" charset="utf-8"></script>
<script>
    /*播放音乐-更新播放次数*/
	function playMusic(){
		var id = ${music.musicId};
		var playCount = ${music.musicPlayCount+1};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/updatePlayCount.action",
			data:{"musicId":id,"musicPlayCount":playCount},
			dataType:"json",
			success:function(data){
				if(data.FLAG==1){
					$("#playCount").html(data.musicPlayCount);
				}else{
					console.log("updatePlayCountError");
				}
			}
		});
	}
	
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
	
	/*下载音乐-更新下载次数*/
	function downloadMusic(id,url,downloadNum){
		if(bool==false){
			layui.use('layer',function(){
				var layer = layui.layer;
				layer.msg("您当前还没登录，请先登录");
			});
		}else{
			/* $.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/downloadMusic.action",
				data:{"fileurl":url,"num":downloadNum+1,"id":id},
				dataType:"json",
				success:function(data){
					if(data.FLAG==1){
						$("#downloadCount").html(data.num);
					}else{
						console.log("updatePlayCountError");
					}
				}
			}); */
			var num = downloadNum+1;
			$("#download-music").attr("href","${pageContext.request.contextPath }/downloadMusic.action?id="+id+"&fileurl="+url+"&num="+num);
		}
	}
	
</script>
</body>
</html>