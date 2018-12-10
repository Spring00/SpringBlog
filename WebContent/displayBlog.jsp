<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.li.blog.*"%>
<%@page import="com.li.blog.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SpringBlog</title>
<link rel="stylesheet" type="text/css" href="/SpringBlog/style.css" />
</head>
<body>
<div id="container">	
	<div id="banner">
		<h1><a href="/SpringBlog">SpringBlog</a></h1>
	</div>

<div id="center">
<div class="content">



<% Blog blog=(Blog)request.getAttribute("blog");
	List list=(List)request.getAttribute("commentList");
	
%>
<table id="tab">
  <tr>
    <td ><div align="center"><%=blog.getTitle()%></div></td>
   
  </tr>
  <tr>
    <td ><%=blog.getContent() %></td>
  </tr>
  <tr>
    <td><%=blog.getCreatedTime() %></td>
  </tr>
  
  
  <tr>
    <td>
    <% 
    if(list!=null){
    for(int i=0;i<list.size();i++){
    	Comment comment=(Comment)list.get(i);
    	%>
    
    
    <table id="tab">
      <tr>
        <td>评论人：<%=comment.getUsername() %></td>
        </tr>
      <tr>
        <td><%=comment.getContent() %></td>
        </tr>
      <tr>
        <td><%=comment.getCreateTime() %></td>
        </tr>
    </table>
    <br></br>
    <%} 
    }%>
      
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><form id="form1" name="form1" method="post" action="/SpringBlog/CommentServlet">
    	
    	<input type="hidden" name="method" value="add"  />
    	<input type="hidden" name="blog_id" value="<%=blog.getId() %>"  />
    	
      <table id="tab">
        <tr>
          <td >评论人：</td>
          <td ><label for="name"></label>
            <input name="name" type="text" id="name"  /></td>
        </tr>
        <tr>
          <td>内容：</td>
          <td><label for="textfield2"></label>
            <textarea name="content" ></textarea></td>
        </tr>
        <tr>
          <td><input type="submit" name="button" id="button" value="提交" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </form></td>
  </tr>
 </table>
 
 
 
<br clear="all" />
</div><!-- end content -->
</div><!-- end center -->

<div id="right">
<div class="sidebar">
        <ul>
    	<li>Spring的个人博客</li>
      </ul>
  	     <h2>分类</h2>
   <ul>		
	<li><a href="/SpringBlog">全部</a></li>
	<% List categorys=(List) request.getAttribute("categorys");
		for(int i=0;i<categorys.size();i++){
			Category category=(Category)categorys.get(i);
		
	
	
	%>
	    <li><a href="/SpringBlog/HomeServlet?cid=<%=category.getId() %>"><%=category.getName() %></a></li>
     <%} %>   
       </ul>

  	    <h2>最近的主题</h2>
  <ul>		
  
  
  			<% List recent=(List)request.getAttribute("blogs");
    	for(int i=0;i<recent.size();i++){
    		Blog blog2=(Blog)recent.get(i);
    %>
	    <li><a href="/SpringBlog/HomeServlet?method=get&id=<%=blog2.getId()%>"  target="_blank"><%=blog.getTitle() %></a></li>
       <%} %> 
       
       </ul>
  	    <h2>最近的评论</h2>
	  <ul>	
	  
	  <% List comments=(List)request.getAttribute("comments");
	  	for(int i=0;i<comments.size();i++){
	  		Comment c=(Comment)comments.get(i);
	  		
	  
	  %>	
	    <li><a href="/SpringBlog/HomeServlet?method=get&id=<%=c.getBlogId()%>" target="_blank"><%=c.getContent() %></a></li>
        <%} %>
      </ul>

  	    
  	    
  	   	
</div><!-- end sidebar -->	
</div><!-- end right -->
</div><!-- end container -->
</body>
</html>

