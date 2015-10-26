package dao;

import java.util.List;
import java.util.Map;

import dto.Board;
import dto.Reply;

public interface ReplyDao {
	public int insertReply(Reply reply);

	public List<Reply> selectReplyByBoardNo(int boardNo);
	
	public int deleteReplyAll(int boardNo);
	
	public int deleteReply(int replyNo);



	public int updateReply(Reply reply);


	public int selectReplycnt(int boardNo);

	
	public int selectBoardNo(int replyNo);

}
