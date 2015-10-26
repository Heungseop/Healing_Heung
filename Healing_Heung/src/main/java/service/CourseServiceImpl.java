package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CourseDao;
import dao.PlaceDao;
import dto.Course;
import dto.Place;
import exception.AlreadyExistLikeException;

@Service
public class CourseServiceImpl implements CourseService {

	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	CourseDao cdao;

	@Autowired
	PlaceDao pdao;

	@Transactional
	@Override
	public int insertCourse(Course course) {
		int result = cdao.insertCourse(course);

		if (result >= 1) {
			for (Place p : course.getPlaceList()) {
				cdao.insertMNcourse(cdao.selectCourseNoByCourseName(course.getCourseName()), p.getPlaceNo());
			}
		} else {
			logger.trace("서비스 실패");
		}
		return result;
	}

	@Override
	public Course selectCourseByNo(int courseNo) {
		logger.trace("courseNo ", courseNo);
		Course c = cdao.selectCourseByCourseNo(courseNo);
		if(c !=null){
		logger.trace("Course", c);
		List<Place> coursePlaceList = cdao.selectPlaceListOfCourse(courseNo);
		if (coursePlaceList != null) {
			for (int i = 0; i < coursePlaceList.size(); i++) {
				List<String> imgurl = pdao.selectImageUrl(coursePlaceList.get(i).getPlaceNo());
				List<String> imgfileurl = pdao.selectImageFileUrl(coursePlaceList.get(i).getPlaceNo());

				coursePlaceList.get(i).setImageUrlUrl(imgurl);
				coursePlaceList.get(i).setImageFileUrl(imgfileurl);
			}
			c.setPlaceList(coursePlaceList);
		} else {
			return null;
		}
	}

		return c;
	}

	@Override
	public List<Course> selectCourseOfAll() {
		List<Course> list = cdao.selectCourseOfAll();
		for (Course c : list) {
			c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
		}
		return list;
	}

	@Override
	public Course selectCourseByCourseName(String courseName) {
		Course c = cdao.selectCourseByCourseName(courseName);
		if (c != null) {
			c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
		}
		return c;
	}

	@Transactional
	@Override
	public int applyLike(int courseNo, String memberId, boolean judge) throws AlreadyExistLikeException {

		if (cdao.didYouRecommend(memberId, courseNo, judge))
			throw new AlreadyExistLikeException();
		else
			return cdao.applyLike(courseNo, memberId, judge);
	}


	@Override
	public int CourseLikeCountCountByCourseNo(int courseNo) {
		
		int result =cdao.selectCourseLikeCountByCourseNo(courseNo);
		
		return result;
	}
	

	@Transactional
	@Override
	public List<Course> selectRankList(String period) {
		List<Course> list =null;
		switch (period) {
		case "1":
		case "day":
			list = cdao.selectRankList(1);
			for (Course c : list) {
				c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
				c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
				c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
			}
			break;

		case "7":
		case "week":
			list = cdao.selectRankList(7);
			for (Course c : list) {
				c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
				c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
				c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
			}
			break;

		case "31":
		case "month":
		case "30":
			list = cdao.selectRankList(30);
			for (Course c : list) {
				c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
				c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
				c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
			}
			break;
		}
		return list;
	}

	@Transactional
	@Override
	public Map<String, List<Course>> selectRankListOfAll() {
		Map<String, List<Course>> map = new HashMap<>();

		List<Course> daylist = cdao.selectRankList(1);
		for (Course c : daylist) {
			c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
			c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
			c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
		}
		List<Course> weeklist = cdao.selectRankList(7);
		for (Course c : weeklist) {
			c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
			c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
			c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
		}
		List<Course> monthlist = cdao.selectRankList(30);
		for (Course c : monthlist) {
			c.setPlaceList(cdao.selectPlaceListOfCourse(c.getCourseNo()));
			c.setCourseLike(cdao.selectCourseLike(c.getCourseNo(), true));
			c.setCourseUnLike(cdao.selectCourseLike(c.getCourseNo(), false));
		}
		map.put("day", daylist);
		map.put("week", weeklist);
		map.put("month", monthlist);
		
		return map;
	}
	@Transactional
	@Override
	public int updateCourse(Course course, List<Place> place) {
		int result =-1;
		
		result = cdao.updateCourseByCourse(course);
		logger.trace("코스 서비스 업데이트 완료 result {}",result );
		
		if(result >= 1){
			
			result = cdao.deleteMncourseByCourseNo(course.getCourseNo());
			logger.trace("코스 서비스 mn 지우기 result {}",result );
			if(result >= 1){
				for (Place p : place) {
					
					result =cdao.insertMNcourse(course.getCourseNo(), p.getPlaceNo());
					logger.trace("코스 서비스 mn 만들기  {}",result );
				}
			}

		}
		return result;
	}

}
