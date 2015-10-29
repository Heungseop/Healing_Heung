package service;

import java.util.List;

import dto.Place;
import exception.AlreadyExistLikeException;
import exception.AlreadyExistRelationException;

public interface PlaceService {

	public List<Place> SelectSearchPlace(String placeName);

	public int CreatePlace(Place place);

	public int deletePlace(String name);

	public int likeApply(int place, String memberId) throws AlreadyExistLikeException;

	public Place selectPlace(int PlaceNo);

	public List<Place> JungBokselectPlaceByName(String name);

	public List<Place> selectGroupPlaceList(String region);

	public int selectPlaceLikeCount(int placeNo);

	public int updatePlace(Place place);

	public int updatePlaceCert(int placeNo);

	public int updatePlaceCertFalse(int placeNo);

	public int modifyPlace(Place place);

	public List<Place> selectAllList();

	public int createGrouping(int placeNo, int detailNo, List<String> category) throws AlreadyExistRelationException;

	public String getRegionName(String region);

	public List<Place> selectCertFalsePlaceAll();

	public List<Place> selectCertFalsePlaceByMemberId(String name);

	public int selectPlaceNoByPlaceName(String name);

	public int selectDetailNoByName(String region);

	public void createGrouping(int placeNo, int selectDetailNoByName);
	
	public List<Place> selectPlaceNine(int rnum);
}
