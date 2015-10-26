package service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;
import dao.ReplyDao;
import dto.Board;
import dto.Reply;
import exception.AlreadyExistLikeException;
import exception.NotWriterException;

@Service
public class BoardServiceImpl implements BoardService {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	BoardDao bdao;
	@Autowired
	ReplyDao rdao;

	@Transactional
	@Override
	public List<Board> selectBoardList(int page) {
		List<Board> list = bdao.selectBoardByPage(page);

		for (Board bd : list) {
			int boardLike = bdao.getBoardLikeCount(bd.getBoardNo());
			bd.setBoardLike(boardLike);

			List<Reply> reList = rdao.selectReplyByBoardNo(bd.getBoardNo());
			bd.setReply(reList);

		}
		return list;
	}

	@Transactional
	@Override
	public Board readBoard(int boardNo) {
		Board board = bdao.selectBoardByNo(boardNo);// board조회

		int boardLike = bdao.selectBoardLikeByBoardNo(board.getBoardNo());
		board.setBoardLike(boardLike);
		
		int courseNo = bdao.selectCourseNoByBoardNo(board.getBoardNo());
	
		List<Reply> list = rdao.selectReplyByBoardNo(boardNo);
		board.setReply(list);
		board.setCourseNo(courseNo);
		bdao.readCountIncrease(board);// 조회수 증가
		return board;
	}

	@Transactional
	@Override
	public int postBoard(Board board) {

		return bdao.insertBoard(board);
	}

	@Transactional
	@Override
	public int modifyBoard(Board board) {
		return bdao.updateBoard(board);
	}

	@Transactional
	@Override
	public int deleteBoard(String memberId, int boardNo) throws NotWriterException {

		int result = -1;

		if (bdao.selectBoardByNo(boardNo).getMemberId().equals(memberId)) {
			result = rdao.deleteReplyAll(boardNo);
			
			if (result >= 0){
				result =bdao.deleteBoardlikeByBoardNo(boardNo);
				if(result >=0){
					result = bdao.deleteBoard(boardNo);
				}
			}
		} else
			throw new NotWriterException("작성자만 삭제할 수 있습니다.");
		return result;
	}

	@Transactional
	@Override
	public int boardLike(int boardNo, String memberId) throws AlreadyExistLikeException {
		int result=-1;
		if (!bdao.didYouRecommend(boardNo, memberId)) {
			result = bdao.applyLike(boardNo, memberId);
		}else{
			throw new AlreadyExistLikeException();
		}
		return result;
	}

	@Override
	public int selectBoardcnt() {

		return bdao.selectBoardcnt();
	}

	@Override
	public Board selectBoard(int boardNo) {
		Board board = bdao.selectBoardByNo(boardNo);// board조회

		int boardLike = bdao.getBoardLikeCount(board.getBoardNo());
		board.setBoardLike(boardLike);

		List<Reply> list = rdao.selectReplyByBoardNo(boardNo);
		board.setReply(list);

		return board;
	}

	@Transactional
	@Override
	public int insertBoard(Board board) {
		int bresult = bdao.insertBoard(board);
		logger.trace("(service)insertBoard 들어옴 : {}", bresult);
		return bresult;
	}

	@Transactional
	@Override
	public int updateBoard(Board board) {
		int bresult = bdao.updateBoard(board);
		logger.trace("(service)updateBoard 들어옴 : {}", bresult);
		return bresult;
	}

}
