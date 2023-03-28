package comment;

public class CommentVO {
	private int cmtID;
	private int boardID;
	private String userID;
	private String cmtDate;
	private String cmtContent;
	private int cmtAvailable;
	
	public int getCmtID() {
		return cmtID;
	}
	public void setCmtID(int cmtID) {
		this.cmtID = cmtID;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(String cmtDate) {
		this.cmtDate = cmtDate;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public int getCmtAvailable() {
		return cmtAvailable;
	}
	public void setCmtAvailable(int cmtAvailable) {
		this.cmtAvailable = cmtAvailable;
	}
	
	
	
}
