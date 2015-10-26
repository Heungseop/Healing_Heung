package service;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import dao.ImageUrlDao;
import dao.PlaceDao;
import dto.ImageUrl;
import dto.Place;
import exception.AlreadyExistLikeException;
import exception.AlreadyExistRelationException;

@Service
public class PlaceServiceImpl implements PlaceService {
	private static Logger logger = LoggerFactory.getLogger(PlaceServiceImpl.class);

	@Autowired
	PlaceDao pdao;

	@Autowired
	ImageUrlDao idao;

	@Override
	public int deletePlace(String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int likeApply(int placeNo, String memberId) throws AlreadyExistLikeException {
		// TODO Auto-generated method stub
		boolean likeBool = true;
		int result = -1;
		if (pdao.didYouRecommend(placeNo,  memberId)) {
			logger.trace("service impl ->if(pdao.didYouRecommend -> true");
			throw new AlreadyExistLikeException();
		} else {
			result = pdao.applyLike(placeNo, memberId, likeBool);
		}
		return result;
	}

	@Override
	@Transactional
	public List<Place> selectGroupPlaceList(String groupDetail) {
		List<Place> list = pdao.selectGroupPlaceList(groupDetail);

		for (Place p : list) {
			p.setImageUrlUrl(pdao.selectImageUrl(p.getPlaceNo()));
			p.setImageFileUrl(pdao.selectImageFileUrl(p.getPlaceNo()));
			p.setLike(pdao.getPlaceLikeCount(p.getPlaceNo(), true, null));
			logger.trace(" urlList : {}", p.getImageUrlUrl());

		}
		logger.trace("selectGroupPlaceList list : {}", list);
		return list;
	}

	@Override
	public List<Place> selectAllList() {
		List<Place> list = pdao.allPlaceList();

		for (Place p : list) {

			List<String> imgurl = pdao.selectImageUrl(p.getPlaceNo());
			List<String> imgfileurl = pdao.selectImageFileUrl(p.getPlaceNo());

			p.setImageUrlUrl(imgurl);
			p.setImageFileUrl(imgfileurl);
			p.setLike(pdao.getPlaceLikeCount(p.getPlaceNo(), true, null));
		}
		return list;
	}

	@Override
	public Place selectPlace(int placeNo) {
		Place result = pdao.selectPlace(placeNo);

		List<String> imgurl = pdao.selectImageUrl(result.getPlaceNo());
		List<String> imgfileurl = pdao.selectImageFileUrl(result.getPlaceNo());

		result.setImageUrlUrl(imgurl);
		result.setImageFileUrl(imgfileurl);
		int like = pdao.getPlaceLikeCount(placeNo, true, null);
		result.setLike(like);
		return result;
	}

	@Override
	@Transactional
	public int CreatePlace(Place place) {
		int result = pdao.insertPlace(place);
		if (result == 1) {

			int placeNo = pdao.selectNoByPlaceName(place.getPlaceName());
			logger.trace("place no {}", placeNo);

			List<String> imgString = place.getImageUrlUrl();
			List<MultipartFile> MultipartFile = place.getImageFile();
			logger.trace("유알엘 파일 사이즈 {}", imgString.size());
			logger.trace("이미지  파일 사이즈 {}", MultipartFile.size());

			for (int i = 0; i < imgString.size(); i++) {
				String s = imgString.get(i);
				if (!s.equals("")) {
					if (s != "null") {
						logger.trace("imgString 4 {}", s);
						ImageUrl imageurl = new ImageUrl(s, placeNo);
						idao.insertImageUrl(imageurl);
					}

				}

			}
			for (int i = 0; i < MultipartFile.size(); i++) {
				String s = MultipartFile.get(i).getOriginalFilename();
				if (!s.equals("")) {
					if (s != "null") {
						logger.trace("MultipartFile  {}", s);
						ImageUrl imageurl = new ImageUrl(placeNo, s);
						idao.insertImageFileUrl(imageurl);
					}
				}
			}

			int detailNo = pdao.selectDetailNoByName(getRegionName(place.getPlaceAddress()));
			logger.trace("detailNo no {}", detailNo);
			try {
				createGrouping(placeNo, detailNo, place.getPlaceCategory());

			} catch (AlreadyExistRelationException e) {
				logger.trace(e.getMessage());
			}
		}
		return result;
	}

	@Override
	@Transactional
	public int createGrouping(int placeNo, int detailNo, List<String> category) throws AlreadyExistRelationException {
		int result = -1;
		if (pdao.selectDetailNoFromGruoping(placeNo, detailNo) == 0) {
			result = pdao.insertGrouping(placeNo, detailNo);
			if (category != null && category.size() != 0) {
				for (int i = 0; i < category.size(); i++) {
					if (!category.get(i).equals("0")) {
						pdao.insertGrouping(placeNo, Integer.parseInt(category.get(i)));
					}
				}

			}

		} else {
			throw new AlreadyExistRelationException();
		}
		return result;
	}

	public String getRegionName(String region) {
		region = region.substring(0, 2);
		switch (region) {
		case "전남":
		case "전북":
		case "광주":
			region = "전라";
			break;

		case "충남":
		case "충북":
		case "세종":
		case "대전":
			region = "충청";
			break;

		case "경남":
		case "경북":
		case "부산":
		case "대구":
		case "울산":
			region = "경상";
			break;

		case "인천":
			region = "경기";
			break;

		default:
			break;

		}
		return region;

	}

	@Override
	public List<Place> JungBokselectPlaceByName(String name) {

		List<Place> place = pdao.selectPlaceByName(name);
		return place;
	}

	@Override
	public List<Place> selectCertFalsePlaceAll() {
		List<Place> place = pdao.selectCertfalsePlace();
		for (Place p : place) {

			List<String> imgurl = pdao.selectImageUrl(p.getPlaceNo());
			List<String> imgfileurl = pdao.selectImageFileUrl(p.getPlaceNo());

			p.setImageUrlUrl(imgurl);
			p.setImageFileUrl(imgfileurl);

		}

		return place;
	}

	@Override
	public List<Place> selectCertFalsePlaceByMemberId(String name) {
		List<Place> place = pdao.selectCertFalsePlaceByMemberId(name);
		for (Place p : place) {

			List<String> imgurl = pdao.selectImageUrl(p.getPlaceNo());
			List<String> imgfileurl = pdao.selectImageFileUrl(p.getPlaceNo());

			p.setImageUrlUrl(imgurl);
			p.setImageFileUrl(imgfileurl);

		}
		return place;
	}

	@Override
	public int selectPlaceNoByPlaceName(String name) {
		int result = pdao.selectNoByPlaceName(name);
		return result;
	}

	@Transactional
	@Override
	public int updatePlaceCert(int placeNo) {
		int result = pdao.updatePlaceCertByPlaceNo(placeNo);
		return result;
	}

	@Transactional
	@Override
	public int updatePlaceCertFalse(int placeNo) {
		int result = pdao.updatePlaceCertFalseByPlaceNo(placeNo);
		return result;
	}

	@Override
	public int modifyPlace(Place place) {
		logger.trace("플레이스 수정 들어옴 ");
		int result = -1;

		int placeNo = selectPlaceNoByPlaceName(place.getPlaceName());
		result = pdao.deleteGroupDetailByPlaceNo(placeNo);

		if (result >= 0) {

			result = idao.deleteImageByPlaceNo(placeNo);

			if (result == 1) {
				logger.trace("이미지 삭제 완료 {} ", result);
			} else {
				logger.trace("이미지 삭제 실패 {} ", result);
			}

			Place ModifyPlace = new Place(place.getPlacePhone(), place.getPlaceComment(), placeNo);
			result = pdao.updatePlaceByPlaceNo(ModifyPlace);

			if (result == 1) {
				logger.trace("플레이스 수정 완료 {} ", result);
			} else {
				logger.trace("플레이스 수정 실패 {} ", result);
			}

			List<String> imgString = place.getImageUrlUrl();
			List<MultipartFile> MultipartFile = place.getImageFile();
			logger.trace("유알엘 파일 사이즈 {}", imgString.size());
			logger.trace("이미지  파일 사이즈 {}", MultipartFile.size());

			for (int i = 0; i < imgString.size(); i++) {
				String s = imgString.get(i);
				if (!s.equals("")) {
					if (s != "null") {
						logger.trace("imgString 4 {}", s);
						ImageUrl imageurl = new ImageUrl(s, placeNo);
						idao.insertImageUrl(imageurl);
					}

				}

			}
			for (int i = 0; i < MultipartFile.size(); i++) {
				String s = MultipartFile.get(i).getOriginalFilename();
				if (!s.equals("")) {
					if (s != "null") {
						logger.trace("MultipartFile  {}", s);
						ImageUrl imageurl = new ImageUrl(placeNo, s);
						idao.insertImageFileUrl(imageurl);
					}
				}
			}

			int detailNo = pdao.selectDetailNoByName(getRegionName(place.getPlaceAddress()));
			logger.trace("detailNo no {}", detailNo);
			try {
				createGrouping(placeNo, detailNo, place.getPlaceCategory());

			} catch (AlreadyExistRelationException e) {
				logger.trace(e.getMessage());
			}
		}
		return result;
	}

	@Override
	public int selectDetailNoByName(String region) {

		return pdao.selectDetailNoByName(region);
	}

	@Override
	public void createGrouping(int placeNo, int detailNo) {
		int result = -1;
		if (pdao.selectDetailNoFromGruoping(placeNo, detailNo) == 0) {
			result = pdao.insertGrouping(placeNo, detailNo);

			return ;
		} else {
			try {
				throw new AlreadyExistRelationException();
			} catch (AlreadyExistRelationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
	@Override
	public List<Place> SelectSearchPlace(String placeName) {
		List<Place> place =pdao.selectSearchPlaceByPlaceName(placeName);
		return place;
	}

	@Override
	public int selectPlaceLikeCount(int placeNo) {
		int result = pdao.selectPlaceLikeCountByPlaceNo(placeNo);
		return result;
	}

	@Override
	public int updatePlace(Place place) {
		logger.trace("service updatePlace place : {}", place );
		int result = pdao.updatePlace(place);
		return result;
	}

}
