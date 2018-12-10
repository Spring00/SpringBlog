package com.li.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;


public class PostEditBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("/SpringBlog/admin/login.jsp");
		}else {	
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		String categoryId=request.getParameter("category");
		
		String sql = "update blog set title=?,content=?,category_id=? where id=?";
		String params[] = {title,content,categoryId,id};
		 int result=0;
		String message="";
		DataSource ds = null;

		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("获取数据源时出错");
		}

		try {

			QueryRunner qr = new QueryRunner(ds);
			result = qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result == 1) {
			message = "您修改成功了！";
		} else {
			message = "您修改失败了！";
		}
		request.setAttribute("message", message);
		request.getRequestDispatcher("/admin/result.jsp").forward(request, response);;
		
		
	}
	}
}
