package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {

	private Connection conn;
	private ResultSet rs;
	
	
	public CommentDAO() {
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
	
	public ArrayList<CommentVO> getList(int boardID, int pageNumber){
		String SQL="SELECT * FROM comment WHERE cmtID<? AND cmtAvailable=1 AND boardID=? ORDER BY cmtID DESC LIMIT 10";
		ArrayList<CommentVO> list=new ArrayList<CommentVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			pstmt.setInt(2, boardID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CommentVO cmt=new CommentVO();
				cmt.setBoardID(boardID);
				cmt.setCmtID(rs.getInt(2));
				cmt.setCmtContent(rs.getString(3));
				cmt.setUserID(rs.getString(1));
				cmt.setCmtAvailable(1); // rs.getInt(5) => out of index 오류
				list.add(cmt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getNext() {
		String SQL="select cmtID FROM comment ORDER BY cmtID DESC";
		try {
		
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(int boardID,String cmtContent,String userID) {
		String SQL="INSERT INTO comment VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, cmtContent);
			pstmt.setInt(4,boardID);
			pstmt.setInt(5,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
	
	
