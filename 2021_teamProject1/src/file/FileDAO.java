package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
	private Connection conn;
	
	public FileDAO() {
		try {
		 	String dbURL = "jdbc:mysql://localhost:3306/2021_teamproject1?useUnicode=true&characterEncoding=UTF-8";
		 	String dbID = "root";
		 	String dbPassword = "9228";
		 	Class.forName("com.mysql.jdbc.Driver");
		 	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}
	
	
	
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO file VALUES (?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			
		}
		return -1;
		
	}
}
