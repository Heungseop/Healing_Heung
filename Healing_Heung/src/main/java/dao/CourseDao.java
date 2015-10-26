package dao;

import java.util.List;

import dto.Course;
import dto.Place;

public interface CourseDao {

	public int insertCourse(Course course);
	
	public int selectCourseNoByCourseName(String courseName);
	
	public int insertMNcourse(int courseNo, int placeNo);

	public int deleteCourse(int courseNo);
	
	public int deleteMNCourseByCourseNo(int courseNo);
	
	public int updateCourse(Course course);
	
	public Course selectCourseByCourseNo(int course);
	
	public Course selectCourseByCourseName(String courseName);
	
	public List<String> selectPlaceNoInCourse(int courseNo);
	
	public boolean didYouRecommend(String memberId, int courseNo, boolean judge);
	
	public int selectCourseLikeCountByCourseNo(int courseNo);
	
	public int updateCourseByCourse(Course course);
	
	public int deleteMncourseByCourseNo(int courseNo);
	
	
	public List<Course> selectCourseOfAll();
	
	public int applyLike(int courseNo, String memberId, boolean judge);
	
	public List<Place> selectPlaceListOfCourse(int courseNo);
	
	public List<Course> selectRankList(int period);
	
	public int selectCourseLike(int courseNo, boolean judge);
	
}
