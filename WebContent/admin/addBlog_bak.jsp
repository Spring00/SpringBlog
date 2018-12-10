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
	

<h2>
		发博文</h2>

    
<form id="form1" name="form1" method="post" action="/SpringBlog/BlogServlet">
<table id="tab">
<tr>
    <td>主题: </td>
    <td>
	<input name="title" type="text" id="title" size="100" />
	</td>
</tr>

<tr>
    <td>分类: </td>
    <td>  	
	 <select name="category" id="select">         
         <%List list=(List)request.getAttribute("list"); 
         	for(int i=0;i<list.size();i++){
         		Category c=(Category)list.get(i);
         %>          
          	<option value="<%=c.getId()%>"><%=c.getName()%></option>          
         <%} %>
          
        </select>
</td>
</tr>


<tr>
    <td colspan="2">内容: <br/>
        <textarea name="content" cols="100" rows="18" id="content"></textarea>
    </td>
</tr>

<tr>
    <td colspan="2">
					<input type="submit" name="submit" value="创建"/>
		    </td>
</tr>
</table>
</form>

<%@ include file="footer.jsp"%>