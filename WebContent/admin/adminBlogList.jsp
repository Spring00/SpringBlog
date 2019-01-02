<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.li.blog.Blog" %>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>


<style type="text/css" media="all">
        @import url("/SpringBlog/admin/css/screen.css");
</style>
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
<display:table name="list" pagesize="3" class="its" requestURI="/SpringBlog/BlogServlet" id="b">
	<display:column property="id" title="编号" sortable="true"/>
	<display:column property="title" sortable="true" title="主题"/>
	<display:column property="category" title="分类" sortable="true"/>
	<display:column title="操作">
		<a href="http://120.76.56.202:80/SpringBlog/PreEditBlogServlet?id=${b.id}"><img src="/SpringBlog/admin/images/edit.gif " border="0"/></a>
		<a href="http://120.76.56.202:80/SpringBlog/DeleteBlogServlet?id=${b.id}" onclick="javascript:return del()"><img src="/SpringBlog/admin/images/delete.gif" border="0"/></a>
	</display:column>
</display:table>
			
<%@ include file="footer.jsp"%>