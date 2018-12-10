package com.li.blog;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;


public class GetBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String sql = "select id,title,content,createdtime as createdTime from blog where id="
				+id;
		QueryRunner qr = DbHelper.getQueryRunner();
		Blog blog=null;
		try {			
			List<Blog> list=(List<Blog>) qr.query(sql,new BeanListHandler(Blog.class));
			blog=(Blog)list.get(0);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		sql="select id,username,content,createtime from comment where blog_id="+id+" order by id desc";
		
		
		List commentList=null;
		try {
			commentList=(List)qr.query(sql, new BeanListHandler(Comment.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("blog", blog);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("/displayBlog.jsp").forward(request, response);
		
		
		
	}

	
	
}
