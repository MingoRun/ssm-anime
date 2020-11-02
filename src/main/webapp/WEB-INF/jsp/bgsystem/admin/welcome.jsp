<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <!-- <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" /> -->
        <link rel="stylesheet" href="<%=basePath%>resources/css/font.css">
        <link rel="stylesheet" href="<%=basePath%>resources/css/xadmin.css">
        <style>
        	.admin{padding:15px;line-height:380px;text-align:center;font-size:30px;} /*border-radius:0 2px 2px 0; background-color:#f2f2f2 */
        </style>
    </head>
    <body onload="clock()">
	    <div class="x-body layui-anim layui-anim-up">
	        <blockquote class="layui-elem-quote">当前系统时间：<span id="date-time"></span></blockquote><!-- 2018-04-25 20:50:53 -->
	        <div class="admin">
	        	欢迎${admin.getIdentity() }：
	            <span class="x-red">${admin.getName() }</span> ！
	        </div>
	    </div>
        <script src="<%=basePath%>resources/layui/layui.js"></script>
    	<script>
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
	    	document.getElementById("date-time").innerHTML=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	   		//设置定时执行函数，间隔1秒
	    	setTimeout("clock()", 1000);
	    }
    	
    </script>
    </body>
</html>