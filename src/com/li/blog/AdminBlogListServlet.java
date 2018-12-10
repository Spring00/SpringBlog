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


public class AdminBlogListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("/SpringBlog/admin/login.jsp");
		}else {		
			QueryRunner qr=DbHelper.getQueryRunner();
			String sql = "select b.id as id ,title,content,createdtime, c.name as category from blog b,category c where b.category_id=c.id order by b.id desc";
			List list=null;
		try {			
			list=(List) qr.query(sql,new BeanListHandler(Blog.class));			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminBlogList.jsp").forward(request, response);

	}

	}	
	
}
