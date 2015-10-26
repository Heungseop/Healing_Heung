package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Course;
import dto.Place;

@Repository
public class CourseDaoImpl implements CourseDao{

	private String namespace = "mybatis.dao.CourseMapper.";
	private static Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);
	@Autowired
	SqlSessionTemplate session;
	@Override
	public int insertCourse(Course course) {
		logger.trace("Dao insertCourse method run");
		String stmt = namespace + "insertcourse";
		int result = session.update(stmt, course);
		return result;
	}
	@Override
	public int insertMNcourse(int courseNo, int placeNo) {
		logger.trace("Dao insertMNcourse method run");
		String stmt = namespace + "insertMNcourse";
		Map<String, Object> map = new HashMap<>();
		map.put("courseNo", courseNo);
		map.put("placeNo", placeNo);
		int result = session.update(stmt, map);
		return result;
	}
	@Override
	public int deleteCourse(int courseNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteMNCourseByCourseNo(int courseNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateCourse(Course course) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Course selectCourseByCourseNo(int course) {
		logger.trace("Dao selectCourseByCourseNo method run");
		String stmt = namespace + "selectCoursebyNo";
		
		return session.selectOne(stmt, course);
	}
	@Override
	public List<String> selectPlaceNoInCourse(int courseNo) {
		logger.trace("Dao selectCourseByCourseNo method run");
		String stmt = namespace + "selectPlaceNoInCourse";
		List<String> list = session.selectList(stmt, courseNo);
		return list;
	}
	@Override
	public boolean didYouRecommend(String memberId, int courseNo, boolean judge) {
		String stmt = namespace +"didYouRecommend";
		
		Map<String, Object> map = new HashMap<>();
		map.put("courseNo", courseNo);
		map.put("memberId", memberId);
		map.put("judge", judge);
		int result = session.selectOne(stmt, map);
		if(0<result)
			return true;
		else
			return false;
	}
	@Override
	public List<Course> selectCourseOfAll() {
		logger.trace("Dao selectCourseOfAll method run");
		String stmt = namespace + "selectCourseOfAll";
		List<Course> list = session.selectList(stmt);
		return list;
	}
	@Override
	public int selectCourseNoByCourseName(String courseName) {
		// TODO Auto-generated method stub
		String stmt = namespace + "selectCourseNoByCourseName";
		int result = session.selectOne(stmt,courseName);
		return result;
	}

	public Course selectCourseByCourseName(String courseName) {
		logger.trace("Dao selectCourseByCourseName method run");
		String stmt = namespace + "selectCourseByName";
		Course c = session.selectOne(stmt, courseName);
		return c;
	}
	@Override
	public int applyLike(int courseNo, String memberId, boolean judge) {
		String stmt = namespace+"applyLike";
		Map<String, Object> map = new HashMap<>();
		map.put("courseNo", courseNo);
		map.put("memberId", memberId);
		map.put("judge", judge);
		int result = session.insert(stmt, map);
		return result;
}
	@Override
	public List<Place> selectPlaceListOfCourse(int courseNo) {

		String stmt = namespace+"selectPlaceListOfCourse";
		
		return session.selectList(stmt, courseNo);
	}
	@Override
	public int selectCourseLikeCountByCourseNo(int courseNo) {
		String stmt = namespace + "selectCourseLikeCountByCourseNo";

		int result = session.selectOne(stmt, courseNo);
		return result;
	}
	public List<Course> selectRankList(int period) {
		//logger.trace("period : {}", period);
		String stmt = namespace + "selectRankingListDuringPeriod";
		Map<String, Object> map = new HashMap<>();
		map.put("period", period);
		
		return session.selectList(stmt, map);
	}
	@Override
	public int selectCourseLike(int courseNo, boolean judge) {
		String stmt = namespace+"selectCourseLike";
		Map<String, Object> map = new HashMap<>();
		map.put("courseNo", courseNo);
		map.put("judge", judge);
		
		return session.selectOne(stmt, map);

	}
	@Override
	public int updateCourseByCourse(Course course) {
		String stmt = namespace+"updateCourseByCourse";
	
		Map<String, Object> courseUpdateMap =new HashMap<>();
		
		courseUpdateMap.put("courseName", course.getCourseName());
		courseUpdateMap.put("courseDistance", course.getCourseDistance());
		courseUpdateMap.put("courseCost", course.getCourseCost());
		courseUpdateMap.put("courseComment", course.getCourseComment());
		courseUpdateMap.put("courseNo", course.getCourseNo());
		
		
		return session.update(stmt,courseUpdateMap);
	}
	@Override
	public int deleteMncourseByCourseNo(int courseNo) {
		String stmt = namespace+"deleteCoursePlaceByCourseNo";
		
		return session.delete(stmt,courseNo);
	}
	

}
