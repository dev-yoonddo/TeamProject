package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn; //자바와 데이터베이스 연결
	private ResultSet rs; //결과값 받아오기
	
	public BoardDAO() {
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
	
	public String getDate() { //현재 시간을 가져오는 함수
		String SQL = "SELECT NOW()"; //현재 시간을 가져오는 MySQL의 문장
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행준비 단계로 만든다
			rs = pstmt.executeQuery(); //실제로 실행했을 때 결과를 가져온다.
			if(rs.next()) { //결과가 있는경우
				return rs.getString(1); //현재의 날짜를 그대로 반환한다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //빈 문자열을 반환함으로써 데이터베이스 오류를 알려준다.
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 : 게시물 번호로 적절하지 않은 -1 반환
	}
	
	//write 함수 생성
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO board VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			//성공적으로 수행했다면 0이상의 결과 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<BoardVO> getList(int pageNumber){
		String SQL = "SELECT * FROM board WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	//글이 많아졌을 때 다음페이지로 넘기는 함수
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE boardID < ? AND boardAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
		
	}
	//작성된 게시글 보기 함수
	public BoardVO getBoardVO(int boardID) {
		String SQL = "SELECT * FROM board WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));

				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	//업데이트 함수
	public int update(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE board SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			//성공적으로 수행했다면 0이상의 결과 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류

	}
	//삭제하기 함수
	public int delete(int boardID) {
		String SQL = "UPDATE board SET boardAvailable = 0 WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			//성공적으로 수행했다면 0이상의 결과 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}

