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


public class PreEditBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("/SpringBlog/admin/login.jsp");
		}else {
		String id=request.getParameter("id");
		QueryRunner qr = DbHelper.getQueryRunner();
		String sql = "select id,title,content,category_id as categoryid from blog where id="+id;
		Blog blog=null;
		List categorys=null;
		try {		
			List list=(List) qr.query(sql,new BeanListHandler(Blog.class));
			 blog=(Blog)list.get(0);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		sql= "select id,name from category order by level desc,id desc";
		try {
			categorys=(List) qr.query(sql, new BeanListHandler(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("blog", blog);
		request.setAttribute("categorys", categorys);
		request.getRequestDispatcher("/admin/editBlog.jsp").forward(request, response);
	}

	
	}

}
