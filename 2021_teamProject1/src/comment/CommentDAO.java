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
		 	String dbURL = "jdbc:mysql://localhost:3306/2021_teamproject1?serverTimezone=UTC";
		 	String dbID = "root";
		 	String dbPassword = "9228";
		 	Class.forName("com.mysql.jdbc.Driver");
		 	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT cmtID FROM COMMENT ORDER BY cmtID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //첫번째 댓글인 경우
	}
	public int write(String cmtContent, String userID, int boardID) {
		String SQL = "INSERT INTO COMMENT VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cmtContent);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setInt(4, 1);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, boardID);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	/*
	public String getUpdateComment(int cmtID) {
		String SQL = "SELECT cmtContent FROM comment WHERE cmtID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmtID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //오류
	}
	*/
	//작성된 댓글 목록 출력
	public ArrayList<CommentDTO> getList(int boardID){
		String SQL = "SELECT * FROM comment WHERE boardID= ? AND cmtAvailable = 1 ORDER BY boardID DESC LIMIT 10"; 
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO cmt = new CommentDTO();
				cmt.setCmtContent(rs.getString(1));
				cmt.setCmtID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCmtAvailable(rs.getInt(4));
				cmt.setCmtDate(rs.getString(5));
				cmt.setBoardID(rs.getInt(6));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	//수정하기
	/*public int update(String cmtContent, int boardID, int cmtID) {
		String SQL = "UPDATE comment SET cmtContent = ? WHERE boardID = ? AND cmtID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cmtContent);
			pstmt.setInt(2, boardID);
			pstmt.setInt(3, cmtID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}*/
	
	//작성된 댓글 보기
	public CommentDTO getCommentVO(int cmtID) {
		String SQL = "SELECT * FROM comment WHERE cmtID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  cmtID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				CommentDTO cmt = new CommentDTO();
				cmt.setCmtContent(rs.getString(1));
				cmt.setCmtID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCmtAvailable(rs.getInt(4));
				cmt.setCmtDate(rs.getString(5));
				cmt.setBoardID(rs.getInt(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//삭제하기
	//1.cmtAvailable = 0 으로 변경하는 방법
	public int delete(int cmtID) {
		String SQL = "UPDATE comment SET cmtAvailable = 0 WHERE cmtID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmtID);
			//성공적으로 수행했다면 0이상의 결과 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	/*
	//2. 데이터를 아예 삭제하는 방법
	public int delete(int cmtID) {
		String SQL = "DELETE FROM comment WHERE cmtID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmtID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	*/
	
	
}
	
	
