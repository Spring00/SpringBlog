<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>login</title>
</head>

<body>
<p>用户登陆
</p>

<% String message=(String)request.getAttribute("message");
	if(message!=null){
		out.print(message);
	}
%>

<form id="form1" name="form1" method="post" action="/SpringBlog/UserServlet">
<input type="hidden" name="method" value="login" />
  <table width="465" border="1">
    <tr>
      <td width="92">用户名：</td>
      <td width="357"><label for="username"></label>
      <input type="text" name="username" id="username" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><label for="password"></label>
      <input type="text" name="password" id="password" /></td>
    </tr>
    <tr>
      <td><input type="submit" name="button" id="button" value="提交" /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
