package service;

import java.util.List;
import java.util.Map;

import dto.Course;
import dto.Place;
import exception.AlreadyExistLikeException;

public interface CourseService {
	public int insertCourse(Course course);
	
	public Course selectCourseByNo(int courseNo);
	
	public List<Course> selectCourseOfAll();
	
	public Course selectCourseByCourseName(String courseName);
	
	public int applyLike(int courseNo, String memberId, boolean judge) throws AlreadyExistLikeException;
	
	public int CourseLikeCountCountByCourseNo(int courseNo);

	public List<Course> selectRankList(String period);
	
	public Map<String, List<Course>> selectRankListOfAll();
	
	public int updateCourse(Course course,List<Place> place);

}
