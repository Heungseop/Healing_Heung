package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ReplyDao;
import dto.Reply;
import exception.AlreadyExistLikeException;
import exception.NotWriterException;

@Service
public class ReplyServiceImpl implements ReplyService {
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	ReplyDao rdao;

	@Override
	public int writeReply(Reply reply) {
		return rdao.insertReply(reply);
	}

	@Override
	@Transactional
	public int deleteReplyAll(int boardNo) throws NotWriterException {
		int rst = -1;

		rst = rdao.deleteReplyAll(boardNo);

		return rst;
	}

	@Override
	public List<Reply> selectReplyByBoardNo(int boardNo) {
		List<Reply> list = rdao.selectReplyByBoardNo(boardNo);
		return list;
	}

	@Override
	@Transactional
	public int updateReply(Reply reply) {
		int result = rdao.updateReply(reply);
		logger.trace("updatereply : {}", result);
		return result;
	}

	@Override
	@Transactional
	public int deleteReply(int replyNo) {
		int rst = -1;

		rst = rdao.deleteReply(replyNo);

		return rst;
	}


	@Override
	public int selectBoardNo(int replyNo) {
		int rst = rdao.selectBoardNo(replyNo);
		return rst;
	}

	@Override
	public int applyLike(int ReplyNo, String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getReplyLikeConunt(int ReplyNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
