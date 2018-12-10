
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>



<h3>修改密码</h3>
<form id="form1" name="form1" method="post" action="/SpringBlog/UserServlet">
<input type="hidden" name="method" value="change" />
  <table id="tab">
    <tr>
      <td width="124" height="53">原密码：</td>
      <td width="414"><label for="oldPassword"></label>
      <input type="password" name="oldPassword" id="oldPassword" />        <label for="textarea"></label></td>
    </tr>
    <tr>
      <td>新密码：</td>
      <td><label for="newPassword"></label>
      <input type="password" name="newPassword" id="newPassword" /></td>
    </tr>
    <tr>
      <td>确认新密码：</td>
      <td><label for="reNewPassword"></label>
      <input type="password" name="reNewPassword" id="reNewPassword" /></td>
    </tr>
    <tr>
      <td height="47"><input type="submit" name="button" id="button" value="提交" /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

<%@ include file="footer.jsp"%>