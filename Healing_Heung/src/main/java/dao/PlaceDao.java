package dao;

import java.util.List;

import dto.Place;

public interface PlaceDao {

	public int insertPlace(Place place);
	
	public int insertGrouping(int placeNo, int groupDetailNo);
	
	public int selectNoByPlaceName(String placeName);
	
	public int updatePlaceCertByPlaceNo(int placeNo);
	
	public int updatePlaceCertFalseByPlaceNo(int placeNo);
	
	public int updatePlaceByPlaceNo(Place place);
	
	public int selectPlaceLikeCountByPlaceNo(int placeNo);
	
	public int deleteGroupDetailByPlaceNo(int placeNo);
	
	public int selectDetailNoByName(String groupDetailName);
	
	public List<Place >selectSearchPlaceByPlaceName(String placeName);

	public int deletePlace(String name);

	public int updatePlace(Place place);

	public Place selectPlace(int placeNo);
	
	public List<Place> selectPlaceByName(String name);

	public List<Place> selectCertFalsePlaceByMemberId(String name);
	
	public List<Place> allPlaceList();
	
	public List<String> selectImageUrl(int placeNo);
	
	public List<String> selectImageFileUrl(int placeNo);
	
	public List<Place> selectGroupPlaceList(String group);

	public int applyLike(int placeNo, String memberId, boolean likeBool);

	public int getPlaceLikeCount(int placeNo, boolean likeBool, String memberId);
	
	public boolean didYouRecommend(int placeNo, String memberId);

	public int selectDetailNoFromGruoping(int placeNo, int detailNo);

	public List<Place> selectCertfalsePlace();


}
