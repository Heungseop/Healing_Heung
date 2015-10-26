package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	public static final int BOARD_PER_PAGE = 10;

	private String namespace = "mybatis.dao.BoardMapper.";

	@Autowired
	SqlSessionTemplate session;

	private static Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	@Transactional
	@Override
	public int insertBoard(Board board) {
		String stmt = namespace + "insertBoard";
		logger.trace("Dao insertBoard method run");
		return session.update(stmt, board);
	}

	@Override
	public Board selectBoardByNo(int no) {
		String stmt = namespace + "selectBoardByNo";
		Board result = session.selectOne(stmt, no);
		logger.trace("Dao selectBoardByNo method run");
		return result;
	}

	@Override
	public int deleteBoard(int boardNo) {
		String stmt = namespace + "deleteBoard";
		logger.trace("Dao deleteBoard method run");
		return session.update(stmt, boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		String stmt = namespace + "updateBoard";
		logger.trace("Dao updateBoard method run");
		return session.update(stmt, board);
	}

	@Override
	public List<Board> selectBoardByPage(int page) {
		logger.trace("Dao selectBoardByPage method run");
		String stmt = namespace + "selectBoardByPage";
		int from = (page - 1) * BOARD_PER_PAGE + 1;
		int to = page * BOARD_PER_PAGE;
		Map<String, Object> map = new HashMap<>();
		map.put("FROM", from);
		map.put("TO", to);
		List<Board> list = session.selectList(stmt, map);
		logger.trace("dao pageselect list result : {} ", list);
		return list;
	}

	@Override
	public int applyLike(int boardNo, String memberId) {
		// 중복 추천 익셉션 추가 필요
		logger.trace("(dao) applyLike method run");
		String stmt = namespace + "applyLike";
		Map<String, Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		int result = session.update(stmt, map);

		return result;
	}

	@Override
	public int getBoardLikeCount(int boardNo) {

		logger.trace("(dao) boardLikeCount method run");
		String stmt = namespace + "selectLike";
		Map<String, Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
		int result = session.selectOne(stmt, map);

		return result;
	}
	
	@Override
	public boolean didYouRecommend(int boardNo, String memberId) {
		logger.trace("(dao) didYouRecommend method run");
		String stmt = namespace + "selectLike";
		Map<String, Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		int row = session.selectOne(stmt, map);
		boolean result = false;
		if(row == 0){
			result = false;
		}else{
			result = true;
		}
		return result;
	}

	@Override
	public int readCountIncrease(Board board) {
		logger.trace("(dao) readCountIncrease method run");
		String stmt = namespace + "readCount";

		int read = board.getBoardRead() + 1;
		board.setBoardRead(read);
		int result = session.update(stmt, board);

		return result;
	}

	@Override
	public int selectBoardcnt() {
		logger.trace("(boardDao) selectBoardcnt method run");
		String stmt = namespace + "selectBoardCnt";
		int result = session.selectOne(stmt);

		return result;
	}

	@Override
	public int deleteBoardlikeByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		logger.trace("(boardDao) selectBoardcnt method run");
		String stmt = namespace + "deleteBoardlikeByBoardNo";
		int result = session.delete(stmt,boardNo);

		return result;

	}

	@Override
	public int selectBoardLikeByBoardNo(int boardNo) {
		String stmt = namespace + "selectBoardLikeByBoardNo";
		int result = session.selectOne(stmt, boardNo);
		return result;
	}

	@Override
	public int selectCourseNoByBoardNo(int boardNo) {
		String stmt = namespace + "selectCourseNoByBoardNo";
		String result = session.selectOne(stmt, boardNo);
		if(result !=null){
			int resultInt= Integer.parseInt(result);
			return resultInt;
		}else{
			return 0;
		}
		
	}


}
