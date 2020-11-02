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
    <title>新闻分类</title>
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">动漫新闻管理</a>
        <a>
          <cite>新闻分类</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:35px">&#xe9aa;</i></a>
    </div>
    <div class="x-body">
      <xblock>
        <!--批量删除-->
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <!--//批量删除-->
        <!--添加-->
        <button class="layui-btn" onclick="x_admin_show('添加新闻分类','<%=basePath%>jsp/bgsystem/admin/news/news-category-add.jsp')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <div>
	      <table class="layui-table">
	        <thead>
	          <tr>
	            <th>
	              <input type="checkbox" id="upcheck" name="upcheck" class="header layui-form-checkbox" lay-skin="primary" onclick="checkAll()" />
	            </th>
	            <th>ID</th>
	            <th>新闻分类名称</th>
	            <th>操作</th>
	        </thead>
	        <tbody id="tbody">
	        <c:choose>
	        	<c:when test="${empty newsCategoryPageInfo.list}">
	        		<tr>
	        			<td colspan="4" style="text-align:center;">暂无新闻分类信息数据</td>
	        		</tr>
	        	</c:when>
	        	<c:otherwise>
	        		<c:forEach items="${newsCategoryPageInfo.list }" var="category">
			        	<tr>
				            <td>
				                <input class="layui-unselect layui-form-checkbox" type="checkbox" id="subcheck" name="subcheck" lay-skin="primary" value="${category.id}" />
				            </td>
			          		<td>${category.id}</td>
			            	<td>${category.name}</td>
			            	<td class="td-manage">
			              		<!--删除-->
			            		<a title="删除" onclick="news_del(this,${category.id})" href="javascript:;">
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
      </div>
      <!--分页-->
      <div style="text-align:center">
      	<div id="laypage"></div>
      </div>
      <!-- //分页 -->
    </div>
   
    <script> 	
    	//layui实现前台分页
   		layui.use(['laypage','layer'],function(){
    		var laypage = layui.laypage;
    		var layer = layui.layer;
    		var index = layer.load(0,{time:500});
    		document.onreadystatechange=completeLoading(index);
    		//执行一个laypage实例
    		laypage.render({
    		    elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
    		    ,count: ${newsCategoryPageInfo.total} //数据总数，从服务端得到
    		    ,curr: ${newsCategoryPageInfo.pageNum}
    		    ,limit: ${newsCategoryPageInfo.pageSize}
    		    ,layout:['first','prev', 'page', 'next','last','skip','count']//显示哪些分页组件
    		    ,first: '首页' //自定义“首页”的内容
    		    ,last: '尾页'  //自定义“尾页”的内容
    		    ,prev: '<em>上一页</em>'  //自定义“上一页”的内容
    		    ,next: '<em>下一页</em>'  //自定义“下一页”的内容
    		    ,jump:function(obj,first){  //jump - 切换分页的回调
    		    	//obj包含了当前分页的所有参数，比如：
    		        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    		        //console.log(obj.limit); //得到每页显示的条数
    		    	//首次不执行
    		        if(!first){
    		          //do something
    		          //var conf ={"pageNum":obj.curr,"pageSize":obj.limit};
    		          window.location="${pageContext.request.contextPath}/showNewsCategory.action?pageNum="+obj.curr+"&pageSize="+obj.limit;
    		        }
    		    }
    		  });
    	});
    	
    	function completeLoading(index){
    		if(document.readyState=='complete'){
    			layui.use('layer',function(){
	    			var layer = layui.layer;
	    			layer.close(index);
	    		});
    		}
    	}
    </script>
    <!-- 全选复选框（包括取消） -->
    <script>
    	function checkAll(){
    		if($("#upcheck").is(":checked")){
    			$("input[name='subcheck']").each(function(){
            		$(this).prop("checked",true);
            	});
    		}else{
    			$("input[name='subcheck']").each(function(){
            		$(this).prop("checked",false);
            	});
    		}
    	}
    </script> 
    <script>
      /*新闻分类-删除*/
      function news_del(obj,id){
    	  layui.use('layer',function(){
    		  var layer = layui.layer;
    		  layer.confirm('确认要删除吗？',function(index){
                  //发异步删除数据
    			  $.post("${pageContext.request.contextPath}/deleteNewsCategory.action",{"id":id},function(data){
    				  if(data == "OK"){
    					  layer.msg('删除成功!',{icon:1,time:1000},function(){
    						  window.location="${pageContext.request.contextPath}/showNewsCategory.action?pageNum="+1;
    					  });
    				  }else{
    					  layer.msg('删除失败!',{icon:2,time:1000});
    				  }
    			  });
              });
    	  });
      }

      /*新闻分类-批量删除*/
      function delAll(argument){
    	  layui.use('layer',function(){
    		  var layer = layui.layer;
    		  //判断选中复选框的个数
    		  var checkNum = $("input[name='subcheck']:checked").length;
    		  if(checkNum == 0){
    			  layer.msg("至少选择一项！",{icon:2,time:1000});
    			  return false;
    		  }
        	  
              //捕捉到所有选中的复选框内容值进行ajax异步删除
              var checkedList = new Array();
              $("input[name='subcheck']:checked").each(function(){
            	  checkedList.push($(this).val());
              });
      
             layer.confirm('确认要删除'+checkNum+'条数据吗？',function(index){
                 //捉到所有被选中的，发异步进行删除
                 $.post("${pageContext.request.contextPath}/deleteNewsCategoryAll.action",{"newsCategoryList":checkedList.toString()},function(data){
                	 if(data == "OK"){
    					  layer.msg('删除成功!',{icon:1,time:1000},function(){
    						  window.location="${pageContext.request.contextPath}/showNewsCategory.action?pageNum="+1;
    					  });
    				  }else{
    					  layer.msg('删除失败!',{icon:2,time:1000});
    				  }
                 });
             });
    	  });
      }
    </script>
  </body>
</html>