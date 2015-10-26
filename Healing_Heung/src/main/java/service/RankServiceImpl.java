package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.RankDao;
import dto.Rank;

@Service
public class RankServiceImpl implements RankService {
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	RankDao rdao;

	@Override
	@Transactional
	public int LikeDayRank() {
		logger.trace("service LikeDayRank 들어옴");
		
		int list = -1;
		
		list = rdao.LikeDayRank();
		return list;
	}

	@Override
	@Transactional
	public int LikeWeekRank() {
		logger.trace("service LikeWeekRank 들어옴");
		
		int list = -1;
		
		list = rdao.LikeWeekRank();
		return list;
	}

	/*
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RankDao;

@Service
public class RankServiceImpl implements RankService {
	private static Logger logger = LoggerFactory.getLogger(PlaceServiceImpl.class);
	
	@Autowired
	RankDao rdao;

	@Override
	public int LikeDayRank() {
		logger.trace("service LikeDayRank 들어옴");
		
		int rst = -1;
		
		rst = rdao.LikeDayRank();
		return rst;
	}
	
	
*/

}
