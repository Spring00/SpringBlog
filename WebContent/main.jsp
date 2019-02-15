<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.li.blog.*"%>
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
<div>
<div id="center">
<div class="content">


    <!-- list blog begin  -->
    
    <% List list=(List)request.getAttribute("blogs");
    	for(int i=0;i<list.size();i++){
    		Blog blog=(Blog)list.get(i);
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    		String date=sdf.format(blog.getCreatedTime());
    		
    		sdf=new SimpleDateFormat("HH:mm:ss");
    		String time=sdf.format(blog.getCreatedTime());
    %>
   	<h2><%=date %></h2>
    <div class="entry">
	    <a id="6"></a>	
		<h3><a href="/SpringBlog/HomeServlet?method=get&id=<%=blog.getId()%>" target="_blank"><%=blog.getTitle() %></a></h3>
			<% 
	         String source=blog.getContent() ;
	    
	        int length=200;
	    	if(source.length()<200){
	    		length=source.length();
	    		
	    	}
			String newString=source.substring(0,length);
			out.print(newString+"...");
	    %>
			
			
			
		<p class="posted"><%=time %> <a href="/SpringBlog/HomeServlet?cid=<%=blog.getCategoryId() %>"><%=blog.getCategory() %></a> | <a href="#">评论</a></p>
    </div>
  <% } %>

	
   	&nbsp; 1/2 &nbsp;<a href="tm?method=h&p=2">&gt;&gt;</a>
 <!-- end list -->	

<br clear="all" />
</div><!-- end content -->
</div><!-- end center -->
</div>
</div>

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
    		Blog blog=(Blog)recent.get(i);
    %>
	    <li><a href="/SpringBlog/HomeServlet?method=get&id=<%=blog.getId()%>"  target="_blank"><%=blog.getTitle() %></a></li>
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
<!--div问题还没解决 -->
</body>
</html>