package dto;

import java.util.Date;

public class Rank {

	private int RankCourseNo;
	private String RankCourseName;
	private int LikeCount;
	
	/*

	private Date LikeDayDate;
	private Date LikeWeekDate;
	private Date LikeMonthDate;
	private int RankcourseNo;
	private String RankcourseName;
	
	*/
	
	
	public Rank() {
		super();
	}


	public Rank(int rankCourseNo, String rankCourseName, int likeCount) {
		super();
		RankCourseNo = rankCourseNo;
		RankCourseName = rankCourseName;
		LikeCount = likeCount;
	}

/*	public Rank(Date likeDayDate, Date likeWeekDate, Date likeMonthDate, int rankcourseNo, String rankcourseName,
			int likeCount) {
		super();
		LikeDayDate = likeDayDate;
		LikeWeekDate = likeWeekDate;
		LikeMonthDate = likeMonthDate;
		RankcourseNo = rankcourseNo;
		RankcourseName = rankcourseName;
		LikeCount = likeCount;
	}
	*/

	public int getRankCourseNo() {
		return RankCourseNo;
	}
	
/*
	public Date getLikeDayDate() {
		return LikeDayDate;
		}
		
		*/


	public void setRankCourseNo(int rankCourseNo) {
		RankCourseNo = rankCourseNo;
		}
	
	/*
		
	public void setLikeDayDate(Date likeDayDate) {
		LikeDayDate = likeDayDate;
	}*/

	public String getRankCourseName() {
		return RankCourseName;
	}
	
	/*
	public Date getLikeWeekDate() {
		return LikeWeekDate;
	}
	
	*/

	public void setRankCourseName(String rankCourseName) {
		RankCourseName = rankCourseName;
	}
	
	/*
	public void setLikeWeekDate(Date likeWeekDate) {
		LikeWeekDate = likeWeekDate;
	}

	public Date getLikeMonthDate() {
		return LikeMonthDate;
	}

	public void setLikeMonthDate(Date likeMonthDate) {
		LikeMonthDate = likeMonthDate;
	}

	public int getRankcourseNo() {
		return RankcourseNo;
	}

	public void setRankcourseNo(int rankcourseNo) {
		RankcourseNo = rankcourseNo;
	}

	public String getRankcourseName() {
		return RankcourseName;
	}

	public void setRankcourseName(String rankcourseName) {
		RankcourseName = rankcourseName;
	}
*/
	
	
	public int getLikeCount() {
		return LikeCount;
	}

	public void setLikeCount(int likeCount) {
		LikeCount = likeCount;
	}
	
	

	@Override
	public String toString() {
		return "Rank [RankCourseNo=" + RankCourseNo + ", RankCourseName=" + RankCourseName + ", LikeCount=" + LikeCount
				+ "]";
		/*
		return "Rank [LikeDayDate=" + LikeDayDate + ", LikeWeekDate=" + LikeWeekDate + ", LikeMonthDate="
				+ LikeMonthDate + ", RankcourseNo=" + RankcourseNo + ", RankcourseName=" + RankcourseName
				+ ", LikeCount=" + LikeCount + ", toString()=" + super.toString() + "]";
				*/
	}

}
