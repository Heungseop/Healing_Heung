package dto;

import java.util.Date;
import java.util.List;

public class Board {
	private int boardNo;
	private String boardTitle;
	private Date boardRegDate;
	private String boardComment;
	private int boardLike;
	private int boardRead;
	private int courseNo;
	private String memberId;
	List<Reply> reply;
	
	
	public Board(String boardTitle, String boardComment, int courseNo, int boardNo) {
		super();
		this.boardTitle = boardTitle;
		this.boardComment = boardComment;
		this.courseNo = courseNo;
		this.boardNo = boardNo;
	}
	public Board(int boardNo, String boardTitle, Date boardRegDate, String boardComment, int boardLike, int boardRead,
			int courseNo, String memberId, List<Reply> reply) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardRegDate = boardRegDate;
		this.boardComment = boardComment;
		this.boardLike = boardLike;
		this.boardRead = boardRead;
		this.courseNo = courseNo;
		this.memberId = memberId;
		this.reply = reply;
	}
	
	public Board(int boardNo, String boardTitle, String memberId, String boardComment, int courseNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memberId = memberId;
		this.boardComment = boardComment;
		this.courseNo = courseNo;
	}
	
	public Board() {
		super();
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardRegDate() {
		return boardRegDate;
	}
	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public int getBoardRead() {
		return boardRead;
	}
	public void setBoardRead(int boardRead) {
		this.boardRead = boardRead;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardRegDate=" + boardRegDate
				+ ", boardComment=" + boardComment + ", boardLike=" + boardLike + ", boardRead=" + boardRead
				+ ", courseNo=" + courseNo + ", memberId=" + memberId + ", reply=" + reply + "]";
	}
	
}
