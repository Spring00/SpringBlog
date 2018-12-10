<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.li.blog.Blog" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示博客列表</title>
</head>

<%
	List list=(List)request.getAttribute("list");

	Blog blog=null;
	

%>

<body>
<%
	for(int i=0;i<list.size();i++){
		blog =(Blog)list.get(i);	
	
%>

<table width="561" height="209" border="0">
  <tr>
    <td width="753"><%=blog.getCreatedTime() %></td>
  </tr>
  <tr>
    <td><a href="http://<%=request.getContextPath() %> /GetBlogServlet?id=
    <%=blog.getId() %>"><%=blog.getTitle() %></a></td>
  </tr>
  <tr>
    <td height="129"><%
    
         String source=blog.getContent() ;
    
        int length=200;
    	if(source.length()<200){
    		length=source.length();
    		
    	}
		String newString=source.substring(0,length);
		out.print(newString+"...");
    %></td>
  </tr>
  <tr>
    <td height="28">&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>

<%} %>

</body>
</html>
