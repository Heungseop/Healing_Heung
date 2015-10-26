package dao;

import java.util.Date;
import java.util.List;

import dto.Rank;

public interface RankDao {
	
	public int LikeDayRank();
	
	public int LikeWeekRank();

	/*
import java.util.Date;


public interface RankDao {
	public int LikeCount(int courseNo);
	
	public int LikeDayRank();
	
	public int LikeWeekRank(Date courseLikeRegDate);
	
	public int LikeMonthRank(Date courseLikeRegDate);*/
}
