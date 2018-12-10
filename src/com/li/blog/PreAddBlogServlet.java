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


public class PreAddBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		list(request, response);
		
	}
	
		public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("/SpringBlog/admin/login.jsp");
		}else {
			
		
		
		String sql="select id,name,level from category order by level desc,id desc";
		QueryRunner qr=DbHelper.getQueryRunner();
		List list=null;
		try {
			list=(List)qr.query(sql, new BeanListHandler(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/addBlog.jsp").forward(request, response);
		
		
	}
		}
}
