<%@ page import="com.li.blog.Blog"%>
<%@ page import="com.li.blog.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>


<script type="text/javascript" src="/SpringBlog/admin/fckeditor/fckeditor.js"></script>
<script type="text/javascript">
window.onload =function()
{
	var oFCKeditor =new FCKeditor('content');
	oFCKeditor.BasePath="/SpringBlog/admin/fckeditor/";
	oFCKeditor.ReplaceTextarea();
	}</script>
<% Blog blog=(Blog)request.getAttribute("blog"); %>

<body>

<h2>
		修改博文</h2>

    
<form id="form1" name="form1" method="post" action="/SpringBlog/PostEditBlogServlet">
<input type="hidden" name="id" value="<%=blog.getId() %>" />
<table id="tab">
<tr>
    <td>主题: </td>
    <td>
	<input name="title" type="text" id="title" size="100"   value="<%=blog.getTitle()%>"/>
	</td>
</tr>

<tr>
    <td>分类: </td>
    <td>  	
	  <select name="category" id="select">
	  <%List categorys=(List)request.getAttribute("categorys"); 
	  	int oldcid=blog.getCategoryId();
	  	for(int i=0;i<categorys.size();i++){
	  		Category c=(Category)categorys.get(i);
	  		if(c.getId().equals(oldcid)){
	  		%>
         	<option value="<%=c.getId() %>" selected><%=c.getName()%></option>
       <%}else{%>
	  		<option value="<%=c.getId() %>" ><%=c.getName()%></option>
	  	<%}
	  	}%>                     
        </select>
</td>
</tr>


<tr>
    <td colspan="2">内容: <br/>
    <textarea name="content" cols="60" rows="8" id="content"> <%=blog.getContent() %>  </textarea>
    </td>
</tr>

<tr>
    <td colspan="2">
					<input type="submit" name="submit" value="修改"/>
		    </td>
</tr>
</table>
</form>

<%@ include file="footer.jsp"%>





