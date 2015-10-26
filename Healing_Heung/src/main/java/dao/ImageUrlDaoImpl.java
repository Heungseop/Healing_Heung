package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dto.ImageUrl;
@Repository
public class ImageUrlDaoImpl implements ImageUrlDao{

	private String namespace = "mybatis.dao.ImageUrlMapper.";
	private static Logger logger = LoggerFactory.getLogger(ImageUrlDaoImpl.class);
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public int insertImageUrl(ImageUrl imageurl) {
		logger.trace("insertImageUrl :{}",imageurl);
		String stmt = namespace + "insertimageurl";
		
		return session.update(stmt, imageurl);
	}


	@Override
	public int insertImageFileUrl(ImageUrl imageurl) {
		logger.trace("insertImageFileUrl :{}",imageurl);
		String stmt = namespace + "insertimagefileurl";
		return session.update(stmt, imageurl);
	}


	@Override
	public int deleteImageByPlaceNo(int placeNo) {
		// TODO Auto-generated method stub
		String stmt = namespace + "deleteimageurlByPlaceNo";
		return session.delete(stmt, placeNo);

	}

}
