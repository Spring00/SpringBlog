<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.li.blog.Blog" %>
<%@ include file="header.jsp"%>

<%  List list=(List)request.getAttribute("list"); 
	Blog blog=null;
%>

<script type="text/javascript">		
			function del() {
				var msg = "您真的确定要删除吗？\n\n请确认！";
				if (confirm(msg)==true){
						return true;
					}else{
						return false;
					}
				}
</script>

<h2>博文管理</h2>

<table id="tab">
<tr>
	<th>编号</th>
   <th>主题</th>
   <th>分类</th>
   <th>日期</th>
   <th>操作</th>
</tr>
			 <% for(int i=0;i<list.size();i++){
    	blog=(Blog)list.get(i);
    
    %>

		<tr>
			<td><%=blog.getId() %></td>
	       <td><%=blog.getTitle() %></td>
		   <td><%=blog.getCategory() %></td>
		   <td><%=blog.getCreatedTime() %></td>
		   
		   <td><a href="http://120.76.56.202:8080/SpringBlog/PreEditBlogServlet?id=<%=blog.getId()%>"><img alt="" src="/SpringBlog/admin/images/edit.gif"></a> <a href="http://120.76.56.202:8080/SpringBlog/DeleteBlogServlet?id=<%=blog.getId()%>"onclick="javascript:return del()" ><img alt="" src="/SpringBlog/admin/images/delete.gif"></a></td>
		      
		</tr>	

<%} %>

		

	</table>
			
<%@ include file="footer.jsp"%>