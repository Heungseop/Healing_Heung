package service;

import java.util.List;
import java.util.Map;

import dto.Reply;
import exception.AlreadyExistLikeException;
import exception.NotWriterException;

public interface ReplyService {
	public int writeReply(Reply reply);

	public int deleteReplyAll(int boardNo) throws NotWriterException;
	
	public int deleteReply(int replyNo);

	public List<Reply> selectReplyByBoardNo(int boardNo);
	
	public int updateReply(Reply reply);

	

	public int applyLike(int ReplyNo, String memberId);
	
	public int getReplyLikeConunt(int ReplyNo);
	
	public int selectBoardNo(int replyNo);

}
