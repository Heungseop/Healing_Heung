package dao;

import java.util.List;

import dto.Board;

public interface BoardDao {
	public int insertBoard(Board board);

	public Board selectBoardByNo(int boardNo);
	
	public int readCountIncrease(Board board);

	public int deleteBoard(int boardNo);

	public int deleteBoardlikeByBoardNo(int boardNo);
	
	public int updateBoard(Board board);

	public List<Board> selectBoardByPage(int page);

	public int applyLike(int boardNo, String memberId);

	public int selectBoardLikeByBoardNo(int boardNo);
	
	public int selectCourseNoByBoardNo(int boardNo);
	
	public int getBoardLikeCount(int boardNo);
	
	public int selectBoardcnt();	

	public boolean didYouRecommend(int boardNo, String memberId);

	
}
