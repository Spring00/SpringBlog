package com.li.blog;



import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

public class DbHelper {
		
	public static QueryRunner getQueryRunner() {
		

		DataSource ds = null;

		try {
			// 通过在context.xml文件，设定的数据源对象的名字，获取数据源对象
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("获取数据源时出错");
		}
		

			QueryRunner qr = new QueryRunner(ds);
			return qr;

	}
}
