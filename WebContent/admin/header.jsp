<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.li.blog.User" %>
    
<% User user=(User)session.getAttribute("user");
	if(user==null){
		request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		//response.sendRedirect("/SpringBlog/admin/login.jsp");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/SpringBlog/admin/style.css" type="text/css" rel="stylesheet"> 	
</head>
<body>
<div id="container">	
<div id="banner">
		<h1>SpringBlog</h1>
</div>
<div id="menu">
	欢迎, <%=user.getUsername() %>用户
	 | <a href="/SpringBlog/PreAddBlogServlet">发博文</a>
	 | <a href="/SpringBlog/AdminBlogListServlet">博文管理</a>
	 | <a href="/SpringBlog/CategoryServlet?method=list">分类管理</a>
 	 | <a href="/SpringBlog/CommentServlet">评论管理</a>
	 | <a href="/SpringBlog/admin/changePassword.jsp">修改密码</a>
	 | <a href="/SpringBlog/UserServlet?method=logout">退出</a>
</div>
<br/>
<div id="main">



