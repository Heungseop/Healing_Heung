package dto;

import java.util.Date;

public class Reply {
	private int replyNo;
	private Date replyRegDate;
	private String replyComment;
	private int boardNo;
	private String memberId;
	
	public Reply(int replyNo, Date replyRegDate, String replyComment, int boardNo, String memberId) {
		super();
		this.replyNo = replyNo;
		this.replyRegDate = replyRegDate;
		this.replyComment = replyComment;
		this.boardNo = boardNo;
		this.memberId = memberId;
	}
	
	public Reply(String replyComment, int replyNo) {
		super();
		this.replyComment = replyComment;
		this.replyNo = replyNo;
	}

	public Reply() {
		super();
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public String getReplyComment() {
		return replyComment;
	}
	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyRegDate=" + replyRegDate + ", replyComment=" + replyComment
				+ ", boardNo=" + boardNo + ", memberId=" + memberId + "]";
	}


}
