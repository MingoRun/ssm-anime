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
<html>
  <head>
  	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>新闻评论列表</title>
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
    <style>
            input[type=date]::-webkit-inner-spin-button { visibility: hidden; }
	</style>
  </head>
  
  <body class="layui-anim">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="javascript:void(0);">首页</a>
        <a href="javascript:void(0);">评论信息管理</a>
        <a>
          <cite>新闻评论列表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:35px">&#xe9aa;</i></a>
    </div>
   <div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      </xblock>
      <!--评论列表-->
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <input id="allCheck" type="checkbox" class="layui-unselect header layui-form-checkbox" lay-skin="primary" onclick="checkAll()" />
            </th>
            <th><b>编号</b></th>
            <th><b>新闻标题</b></th>
            <th><b>用户登录名</b></th>
            <th><b>评论内容</b></th>
            <th><b>评论日期</b></th>
            <th>操作</th></tr>
        </thead>
        <tbody id="tbody">
        	<c:choose>
        		<c:when test="${empty comments.list }">
        			<tr>
        			<td colspan="6" style="text-align: center;">
        				暂无新闻评论数据
        			</td>
        		</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${comments.list }" var="comment">
        				<tr>
				           <td>
				              <input type="checkbox" name="childCheckbox" class="layui-unselect layui-form-checkbox" lay-skin="primary" value="${comment.id }" />
				            </td> 
				            <td>${comment.id }</td>
				            <td>${comment.getNews().getNewsTitle() }</td>
				            <td>${comment.getUser().getLoginName() }</td>
				            <td>${comment.content }</td>
				            <td>${comment.time }</td>
				            <td class="td-manage">
				              <!--删除-->
				              <a title="删除" onclick="comment_del(this,${comment.id })" href="javascript:;">
				                <i class="layui-icon">&#xe640;</i>
				              </a>
				              <!--//删除-->
				            </td>
				          </tr>
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </tbody>
      </table>
      <!--分页-->
      <div style="text-align:center">
      	<div id="laypage"></div>
      </div>
    </div>
 
    <script>
    /* 分页查询 */
     	 $(function(){ 
     		//监听加载状态改变
     		
     		layui.use(['laypage','layer'],function(){
       			var laypage = layui.laypage;
       			var layer = layui.layer;
       			var index = layer.load(0,{time:500});
       			document.onreadstatechange=completeLoading(index);
    	   		laypage.render({            
    	   		    elem: 'laypage', //注意，这里的 test1 是 ID，不用加 # 号
    	   		    count: ${comments.total},//数据总数，从服务端得到
    	   		    curr: ${comments.pageNum},
    	   		    limit: ${comments.pageSize},
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
    	   		          //do something
    	   		          //var conf ={"pageNum":obj.curr,"pageSize":obj.limit};
    	   		          window.location="${pageContext.request.contextPath }/showNewsCommentAll.action?pageNum="+obj.curr;
    	   		        }
    	   		    }
    	   		  });
       		});
     	 });
    
	    function completeLoading(index){
	    	if(document.readyState=="complete"){
	    		layui.use('layer',function(){
	    			var layer = layui.layer;
	    			layer.close(index);
	    		});
	    	}
	    }
    </script>
    <script>
      /*评论-删除*/
      function comment_del(obj,id){
    	  layui.use('layer',function(){
    		  var layer = layui.layer;
    		  layer.confirm('确认要删除吗？',function(index){
                  //发异步删除数据
    			  $.post("${pageContext.request.contextPath}/delCommentById.action",{"id":id},function(data){
    				  if(data == "OK"){
    					  layer.msg('删除成功!',{icon:1,time:1000},function(){
    						  window.location="${pageContext.request.contextPath}/showNewsCommentAll.action?pageNum="+1;
    					  });
    				  }else{
    					  layer.msg('删除失败!',{icon:2,time:1000});
    				  }
    			  });
              });
    	  });
      }

      /**
       * 全选\取消复选框
       */
       function checkAll(){
    	  if($("#allCheck").is(":checked")){
    		  $("input[name='childCheckbox']").each(function(){
    			 $(this).prop("checked",true); 
    		  });
    	  }else{
    		  $("input[name='childCheckbox']").each(function(){
     			 $(this).prop("checked",false); 
     		  });
    	  }
       }

      /**
       * 批量删除新闻信息
       */
      function delAll(argument) {
    	  layui.use('layer',function(){
    		  var checkNum = $("input[name='childCheckbox']:checked").length;
    	        if(checkNum==0){
    	        	layer.msg('至少选择一项！', {icon: 2,time:1000});
    	        	return false;
    	        }
    	        //捕捉到所有选中的复选框内容值进行ajax异步删除
    	        var checkList = new Array();
    	        $("input[name='childCheckbox']:checked").each(function(){
    	        	checkList.push($(this).val());
    	        });
    	        
    	        layer.confirm('确认要删除'+checkNum+'条数据吗？',function(index){
    	            //捉到所有被选中的，发异步进行删除
    	            $.post("${pageContext.request.contextPath}/deleteCommentAll.action",{"comments":checkList.toString()},function(data){
    	            	if(data == 'OK'){
    	            		layer.msg('删除成功', {icon: 1,time:1000},function(){
    	            			window.location="${pageContext.request.contextPath}/showNewsCommentAll.action?pageNum="+1;
    	            		});
    	            	}else{
    	            		layer.msg('删除失败',{icon:2,time:1000});
    	            	}
    	            });
    	        });
    	  });
      }
    </script>
  </body>
</html>