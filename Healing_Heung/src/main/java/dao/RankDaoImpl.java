package dao;

import java.util.List;
import java.util.Date;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Rank;

@Repository
public class RankDaoImpl implements RankDao{
	private String namespace = "mybatis.dao.RankMapper.";
	private static Logger logger = LoggerFactory.getLogger(PlaceDaoImpl.class);

	@Autowired
	SqlSessionTemplate session;

	
	@Override
	public int LikeDayRank() {
		logger.trace("Dao LikeDayRank 들어옴");
		String stmt = namespace + "LikeDayRank";
		int list = session.selectOne(stmt);
		return list;
		}


	@Override
	public int LikeWeekRank() {
		logger.trace("Dao LikeWeekRank 들어옴");
		String stmt = namespace + "LikeWeekRank";
		int list = session.selectOne(stmt);
		return list;
	}
		
/*
	public int LikeCount(int courseNo) {
		logger.trace("Dao LikeCount 들어옴");
		
		String stmt = namespace + "LikeCount";
		int result = session.selectOne(stmt, courseNo);
		
		return result;
	}

	@Override
	public int LikeDayRank() {
		logger.trace("Dao LikeDayRank 들어옴");
		
		String stmt = namespace + "LikeDayRank";
		int result = session.selectOne(stmt);
		
		return result;
	}

	@Override
	public int LikeWeekRank(Date courseLikeRegDate) {
		logger.trace("Dao LikeWeekRank 들어옴");
		
		String stmt = namespace + "LikeWeekRank";
		int result = session.selectOne(stmt, courseLikeRegDate);
		
		return result;
	}

	@Override
	public int LikeMonthRank(Date courseLikeRegDate) {
		logger.trace("Dao LikeMonthRank 들어옴");
		
		String stmt = namespace + "LikeMonthRank";
		int result = session.selectOne(stmt, courseLikeRegDate);
		
		return result;
	}
	*/

}
