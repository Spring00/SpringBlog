package com.li.blog;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;

public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BlogServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryId = request.getParameter("category");

		DataSource ds = null;

		try {
			// 通过在context.xml文件，设定的数据源对象的名字，获取数据源对象
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("获取数据源时出错");
		}
		int result = 0;

		try {

			String sql = "insert into blog (title,content,category_id,createdtime) values (?,?,?,now())";
			String params[] = { title, content, categoryId };

			QueryRunner qr = new QueryRunner(ds);

			result = qr.update(sql, params);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String message = "";
		if (result == 1) {
			message = "添加博文成功";
		} else {
			message = "添加失败";
		}

		request.setAttribute("message", message);
		request.getRequestDispatcher("/admin/result.jsp").forward(request, response);

	}

}
