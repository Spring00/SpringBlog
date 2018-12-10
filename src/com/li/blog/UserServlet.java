package com.li.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method=request.getParameter("method");
		if (method==null) {
			method="";
		}
		if (method.equals("login")) {
			login(request,response);
		}else if (method.equals("logout")) {
			logout(request, response);
		}else if (method.equals("change")) {
			changePassword(request, response);
		}

	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sql = "select id,username,password from users where username=? and password=?";
		String params[]= {username,password};
		QueryRunner qr = DbHelper.getQueryRunner();
		User user=null;
		List list=null;
		try {
			list= (List) qr.query(sql, params,new BeanListHandler(User.class));
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(list.size()>0) {
			 user =(User) list.get(0);
			 HttpSession session=request.getSession();
			 session.setAttribute("user", user);
			 request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "用户名或密码不正确");
			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}
	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.invalidate();
		response.sendRedirect("/SpringBlog");
	}
	
	public void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		String reNewPassword=request.getParameter("reNewPassword");
		
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (!user.getPassword().equals(oldPassword)) {
			request.setAttribute("message", "输入的原密码错误");
			request.getRequestDispatcher("/admin/result.jsp").forward(request, response);
			
		} else if (newPassword.equals(reNewPassword)) {
			String sql="update users set password=? where id=?";
			String params[]= {newPassword,user.getId().toString()};
			
			QueryRunner qr=DbHelper.getQueryRunner();
			try {
				qr.update(sql,params);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			response.sendRedirect("/SpringBlog/admin/admin.jsp");
			
		}else {
			request.setAttribute("message", "输入两次新密码不相同");
			request.getRequestDispatcher("/admin/result.jsp").forward(request, response);
		}
	}

}
