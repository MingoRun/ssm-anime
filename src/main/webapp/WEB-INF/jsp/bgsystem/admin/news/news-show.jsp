<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告详情页</title>
<style>
	.comicsDiv{width:100%;}
	.comicsPage{width:1000px;}
	.comicsBox{margin:0px auto;width:50%;}
	.comicsBox header{text-align: center;}
	.comicsBox section {text-align:center;}
</style>
</head>
<body>
     <div class="comicsDiv">
     	<div class="comicsPage">
     		<div class="comicsBox">
     			<header>
	     			<div><h2>${news.newsTitle }</h2></div>
	     			<div>
	     			  <span>创建时间：${news.newsCreateDate }</span>|
	     			  <span>新闻作者：${news.newsAuthor }</span>|
	     			  <span>新闻类型:${news.getNewsCategory().getName() }</span>
	     			  <span>新闻来源:${news.newsSource }</span>
	     			</div>
	     		</header>
	     		<section style="margin-top:20px;">
	     			<div class="advertCover">
	     				<img src="http://localhost:8081${news.newsCoverUrl }" />
	     			</div>
	     		</section>
	     		<div style="">
	     			<p>&nbsp;&nbsp;${news.newsContent }</p>
	     		</div>
     		</div>
     	</div>
     </div>
</body>
</html>