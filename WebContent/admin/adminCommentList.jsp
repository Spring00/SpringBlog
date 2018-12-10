<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@include file="header.jsp" %>
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

<h2>评论管理</h2>
<display:table name="list" pagesize="4" class="its" requestURI="/SpringBlog/CommentServlet" id="c">
	<display:column property="id" title="编号" sortable="true"/>
	<display:column property="username" sortable="true" title="作者"/>
	<display:column property="content" title="内容" />
	<display:column property="createTime" title="日期" sortable="true"/>
	<display:column title="操作">
		<a href="/SpringBlog/CommentServlet?method=edit&id=${c.id}"><img src="/SpringBlog/admin/images/edit.gif " border="0"/></a>
		<a href="/SpringBlog/CommentServlet?method=delete&id=${c.id}" onclick="javascript:return del()"><img src="/SpringBlog/admin/images/delete.gif" border="0"/></a>
	</display:column>
</display:table>

<%@include file="footer.jsp" %>