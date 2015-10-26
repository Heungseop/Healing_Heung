package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Place;

@Repository
public class PlaceDaoImpl implements PlaceDao {
	String namespace = "mybatis.dao.PlaceMapper.";
	private static Logger logger = LoggerFactory.getLogger(PlaceDaoImpl.class);

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int insertPlace(Place place) { // 관광지 추가
		logger.trace("(dao) insertPlace Run");
		String stmt = namespace + "insertPlace";
		int result = session.insert(stmt, place);
		return result;
	}

	@Override
	public int deletePlace(String name) {
		logger.trace("delete place");
		String stmt = namespace + "deletePlace";

		return 0;
	}

	@Override
	public int updatePlace(Place place) {
		String stmt = namespace + "updatePlace";

		logger.trace("dao updatePlace place : {}", place );
		int re = session.update(stmt, place);
		return re;
	}

	@Override
	public List<Place> allPlaceList() { // 모든 관광지
		logger.trace("(dao) selectAllPlace");
		String stmt = namespace + "selectPlaceAll";
		List<Place> list = session.selectList(stmt);
		return list;
	}

	@Override
	public List<Place> selectGroupPlaceList(String group) {
		logger.trace("PlaceDao selectGroupPlaceList ");
		String stmt = namespace + "selectPlace";
		List<Place> list = session.selectList(stmt, group);
		return list;
	}

	@Override
	public int applyLike(int placeNo, String memberId, boolean likeBool) {
		String stmt = namespace + "applyLike";
		Map<String, Object> map = new HashMap<>();
		map.put("likeBool", likeBool);
		map.put("placeNo", placeNo);
		map.put("memberId", memberId);
		int result = session.update(stmt, map);

		return result;
	}

	@Override
	public int getPlaceLikeCount(int placeNo, boolean likeBool, String memberId) {
		String stmt = namespace + "selectLike";
		Map<String, Object> map = new HashMap<>();
		map.put("likeBool", likeBool);
		map.put("placeNo", placeNo);
		map.put("memberId", null);
		int result = session.selectOne(stmt, map);
		return result;
	}

	@Override
	public Place selectPlace(int placeNo) {

		String stmt = namespace + "selectPlaceByNo";
		Place result = session.selectOne(stmt, placeNo);
		//logger.trace("place : {}", result);
		return result;
	}

	@Override
	public List<String> selectImageUrl(int placeNo) { // imageurl
		logger.trace("imageurl 들어옴");
		String stmt = namespace + "selectImageUrl";
		List<String> list = session.selectList(stmt, placeNo);
		return list;
	}
	@Override
	public List<String> selectImageFileUrl(int placeNo) {
		logger.trace("imagefileurl 들어옴");
		String stmt = namespace + "selectImageFileUrl";
		List<String> list = session.selectList(stmt, placeNo);
		return list;
	}
	
	

	@Override
	public boolean didYouRecommend(int placeNo, String memberId) {
		logger.trace("didYouRecommend");
		boolean result = false;
		String stmt = namespace + "selectLike";
		Map<String, Object> map = new HashMap<>();
		map.put("placeNo", placeNo);
		map.put("memberId", memberId);
		int test = session.selectOne(stmt, map);
		logger.trace("test : " + test);
		if (test == 0){
			result = false;
		} else {
			result = true;
		}
		return result;
	}

	@Override
	public int insertGrouping(int placeNo, int groupDetailNo) {
		String stmt = namespace + "insertGroupPlace";
		Map<String, Object> map = new HashMap<>();
		map.put("placeNo", placeNo);
		map.put("groupDetailNo", groupDetailNo);
		int result = session.insert(stmt, map);
		logger.trace("insertGrouping rows : {}", result);
		return result;
	}

	@Override
	public int selectNoByPlaceName(String placeName) {
		String stmt = namespace + "selectNoByPlaceName";
		int result = session.selectOne(stmt, placeName);
		return result;
	}

	@Override
	public int selectDetailNoByName(String groupDetailName) {
		String stmt = namespace + "selectDetailNo";
		Map<String, String> map = new HashMap<>();
		map.put("groupDetailName", groupDetailName);
		int result = session.selectOne(stmt, map);
		return result;
	}

	@Override
	public int selectDetailNoFromGruoping(int placeNo, int detailNo) {
		String stmt = namespace +"selectDetailNoFromGrouping";

		Map<String, Object> map = new HashMap<>();
		map.put("detailNo", detailNo);
		map.put("placeNo", placeNo);
		int result = session.selectOne(stmt, map);
		return result;
	}

	@Override
	public List<Place> selectCertfalsePlace() {
		String stmt = namespace + "selectCertFalsePlace";
		List<Place> list = session.selectList(stmt);
		return list;
	}

	@Override
	public List<Place> selectPlaceByName(String name) {
		String stmt = namespace + "selectPlaceByName";
		List<Place> list = session.selectList(stmt,name);
		return list;
	}

	@Override
	public List<Place> selectCertFalsePlaceByMemberId(String name) {
		String stmt = namespace + "selectCertFalsePlaceByMemberId";
		List<Place> list = session.selectList(stmt,name);
		return list;
	}

	@Override
	public int updatePlaceCertByPlaceNo(int placeNo) {
		String stmt = namespace + "updatePlaceCertTrue";
		return session.update(stmt,placeNo);
	}
	@Override
	public int updatePlaceCertFalseByPlaceNo(int placeNo) {
		String stmt = namespace + "updatePlaceCertFalse";
		return session.update(stmt,placeNo);
	}


	@Override
	public int updatePlaceByPlaceNo(Place place) {
		// TODO Auto-generated method stub
		String stmt = namespace + "updatePlaceByPlace";
		return session.update(stmt,place);
	}

	@Override
	public int deleteGroupDetailByPlaceNo(int placeNo) {
		// TODO Auto-generated method stub
		String stmt = namespace + "deleteGroupDetailByPlaceNo";
		return session.delete(stmt,placeNo);
	}
	@Override
	public List<Place> selectSearchPlaceByPlaceName(String placeName) {
		logger.trace("select place search 옴");
		String stmt = namespace + "selectPlaceSearchByPlaceName";
		List<Place> SearchPlaceList =session.selectList(stmt,placeName);
		return SearchPlaceList;
	}

	@Override
	public int selectPlaceLikeCountByPlaceNo(int placeNo) {
		String stmt = namespace + "selectPlaceLikeCountByPlaceNo";
		int result =session.selectOne(stmt,placeNo);
		return result;
	}
	
	

}
