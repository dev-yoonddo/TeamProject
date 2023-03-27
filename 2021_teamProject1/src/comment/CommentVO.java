package comment;

public class CommentVO {
	private int boardID;
	private int cmtID;
	private String cmtContent;
	private String userID;
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
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCmtAvailable() {
		return cmtAvailable;
	}
	public void setCmtAvailable(int cmtAvailable) {
		this.cmtAvailable = cmtAvailable;
	}
	
}
