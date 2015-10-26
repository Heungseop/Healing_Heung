package service;

import java.util.List;

import dto.Board;
import exception.AlreadyExistLikeException;
import exception.NotWriterException;

public interface BoardService {
	public List<Board> selectBoardList(int page);
	
	public Board readBoard(int boardNo);
	
	public int postBoard(Board board);

	public int modifyBoard(Board board);

	public int deleteBoard(String memberId, int boardNo) throws NotWriterException;

	public int boardLike(int boardNo, String memberId) throws AlreadyExistLikeException;	

	public int selectBoardcnt();
	
	public Board selectBoard(int boardNo);
	
	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
}
