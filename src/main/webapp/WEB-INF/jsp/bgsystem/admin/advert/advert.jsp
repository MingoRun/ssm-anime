<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告详情页</title>
<style>
	.advertDiv{width:100%;}
	.advertPage{width:1000px;}
	.advertBox{margin:0px auto;width:50%;}
	.advertBox header{text-align: center;}
	.advertBox section {text-align:center;}
</style>
</head>
<body>
     <div class="advertDiv">
     	<div class="advertPage">
     		<div class="advertBox">
     			<header>
	     			<div><h2>${advert.name }</h2></div>
	     			<div><span>创建时间：${advert.createTime }</span></div>
	     		</header>
	     		<section style="margin-top:20px;">
	     			<div class="advertCover">
	     				<img src="http://localhost:8081${advert.imgUrl }" />
	     			</div>
	     		</section>
	     		<div style="">
	     			<p>&nbsp;&nbsp;${advert.content }</p>
	     		</div>
	     		<div style="width:200px;height:30px;">
	     			<span>商家：${advert.business}</span><br/>
	     			<span>联系电话：${advert.businessPhone }</span>
	     		</div>
     		</div>
     	</div>
     </div>
</body>
</html>