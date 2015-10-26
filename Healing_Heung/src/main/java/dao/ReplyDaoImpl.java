package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Board;
import dto.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {


	private String namespace = "mybatis.dao.ReplyMapper.";

	@Autowired
	SqlSessionTemplate session;

	private static Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	@Override
	public int insertReply(Reply reply) {
		String stmt = namespace + "insertReply";
		logger.trace("Dao insertBoard method run");
		return session.update(stmt, reply);
	}

	@Override
	public List<Reply> selectReplyByBoardNo(int boardNo) {
		String stmt = namespace + "selectReplyByReplyNo";
		List<Reply> list = session.selectList(stmt, boardNo);
		return list;
	}

	@Override
	public int deleteReplyAll(int boardNo) {
		String stmt = namespace + "deleteReplyboardNo";
		logger.trace("Dao deleteReply method run");
		return session.update(stmt, boardNo);
	}

	@Override
	public int updateReply(Reply reply) {
		String stmt = namespace + "updateReply";
		logger.trace("Dao updateReply method run");
		return session.update(stmt, reply);
	}


	@Override
	public int selectReplycnt(int boardNo) {
		logger.trace("(replyDao) selectReplycnt method");
		String stmt = namespace + "selectReplycnt";
		int result = session.selectOne(stmt, boardNo);
		return result;
	}

	@Override
	public int deleteReply(int replyNo) {
		String stmt = namespace + "deleteReply";
		logger.trace("Dao deleteReply method run");
		return session.update(stmt, replyNo);
	}
	
	@Override
	public int selectBoardNo(int replyNo) {
		logger.trace("(ReplyDao) selecBoardNo method run");
		String stmt = namespace + "selectBoardNo";
		int result = session.selectOne(stmt, replyNo);
		return result;
	}

}
