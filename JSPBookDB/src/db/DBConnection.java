package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {

	public static Connection  getConnection() throws ClassNotFoundException, SQLException {
		/** JSTL의 태그 라이브러리를 이용하면
		 *	<sql:setDataSource var="dataSource"
		 *	url="jdbc:mysql://localhost:3306/jsp?useSSL=false"
		 *	driver="com.mysql.jdbc.Driver"
		 *	user="root"
		 *	password="1234"/>	*/
		Connection conn = null;
		
		String url= "jdbc:mysql://localhost:3306/jsp?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		String user = "root";
		String password = "1234";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,password);
		
		return conn;
	}
}
