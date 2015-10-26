package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PlaceDao;
import dto.Place;

@Service
public class InsertDBServiceImpl {

	String namespace = "mybatis.dao.PlaceMapper.";
	
	@Autowired
	SqlSessionTemplate session;

	@Autowired
	PlaceDao pdao;
	
	private static Logger logger = LoggerFactory.getLogger(InsertDBServiceImpl.class);

	public int insertImageUrl(Place place) { 
		List<Place> allList = pdao.allPlaceList();
		
		
		return 0;
	}
}
