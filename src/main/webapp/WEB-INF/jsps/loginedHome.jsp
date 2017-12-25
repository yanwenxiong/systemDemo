<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String appContext = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + appContext;
Map<String,Object> map = (Map<String,Object>)request.getSession().getAttribute("user");
String username = "";
if(map != null){
	username = (String)map.get("username");
	System.out.println(username);
}else{
	System.out.println("NO");
}
//TODO 将报错信息纳入到loginErrorMsg
//TODO 用户登录后回到首页将不需要看到登录等信息，只有注销。

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>

<link rel="stylesheet" type="text/css" href="<%= appContext %>/resources/bootstrap/css/bootstrap.min.css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	background-color: #C7EDCC;
	font-family: "microsoft yahei";
	/*min-width: 800px;*/
}

img {
	width: 100%;
	/*height: 462px;*/
}

.navbar {
	/*margin-bottom: -10px;*/
	
}

#myppt {
	margin-top: -20px;
}
</style>
</head>
<body>
<ul class="nav navbar-nav navbar-left">
    <li><a href="<%= appContext%>/logined/curveGraph"><span class="glyphicon glyphicon-log-in"></span>点线图</a></li>
    <li><a href="<%= appContext%>/logined/histogram"><span class="glyphicon glyphicon-log-in"></span>柱形图</a></li>
    <li><a href="<%= appContext%>/logined/bootstrap"><span class="glyphicon glyphicon-log-in"></span>bootstrap</a></li>
</ul>

</body>
</html>