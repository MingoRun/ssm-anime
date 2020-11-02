<%--
  Created by IntelliJ IDEA.
  User: mingo
  Date: 2020/11/1
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>
