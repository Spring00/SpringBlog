<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@include file="header.jsp" %>
<%@page import="java.util.List"%>
<%@page import="com.li.blog.Category"%>
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

<h2>分类管理</h2>
<display:table name="list" pagesize="3" class="its" requestURI="/SpringBlog/CategoryServlet" id="c">
	<display:column property="id" title="编号" sortable="true"/>
	<display:column property="name" sortable="true" title="分类"/>
	<display:column property="level" title="显示顺序" sortable="true"/>
	<display:column title="操作">
		<a href="/SpringBlog/CategoryServlet?method=edit&id=${c.id}"><img src="/SpringBlog/admin/images/edit.gif " border="0"/></a>
		<a href="/SpringBlog/CategoryServlet?method=delete&id=${c.id}" onclick="javascript:return del()"><img src="/SpringBlog/admin/images/delete.gif" border="0"/></a>
	</display:column>
</display:table>

<%@include file="footer.jsp" %>