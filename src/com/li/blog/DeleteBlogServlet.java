package com.li.blog;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

/**
 * Servlet implementation class DeleteBlogServlet
 */
public class DeleteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("/SpringBlog/admin/login.jsp");
		}else {
		
		String id = request.getParameter("id");
		DataSource ds = null;

		try {
			// 通过在context.xml文件，设定的数据源对象的名字，获取数据源对象
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("获取数据源时出错");
		}
		

		try {

			String sql = "delete from blog where id="+id;
			QueryRunner qr = new QueryRunner(ds);

			qr.update(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/AdminBlogListServlet").forward(request, response);
	}

	}
	

}
