package dto;

import java.util.Date;
import java.util.List;

public class Course {
	private int courseNo;
	private String courseName;
	private String courseDistance;
	private int courseCost;
	private int courseLike;
	private int courseUnLike;
	private String memberId;
	private String courseComment;

	private Date courseRegDate;
	private List<Place> placeList;

	public Course(int courseNo, String courseName, String courseDistance, int courseCost, int courseLike,
			int courseUnLike, String memberId, String courseComment, Date courseRegDate, List<Place> placeList) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.courseDistance = courseDistance;
		this.courseCost = courseCost;
		this.courseLike = courseLike;
		this.courseUnLike = courseUnLike;
		this.memberId = memberId;
		this.courseComment = courseComment;
		this.courseRegDate = courseRegDate;
		this.placeList = placeList;
	}
	public Course(String courseName,String courseDistance, int courseCost,String courseComment,int courseNo){
		
		this.courseName = courseName;
		this.courseDistance = courseDistance;
		this.courseCost = courseCost;
		this.courseComment = courseComment;
		this.courseNo = courseNo;
	}

	public Course() {
		super();
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDistance() {
		return courseDistance;
	}

	public void setCourseDistance(String courseDistance) {
		this.courseDistance = courseDistance;
	}

	public int getCourseCost() {
		return courseCost;
	}

	public void setCourseCost(int courseCost) {
		this.courseCost = courseCost;
	}

	public int getCourseLike() {
		return courseLike;
	}

	public void setCourseLike(int courseLike) {
		this.courseLike = courseLike;
	}

	public int getCourseUnLike() {
		return courseUnLike;
	}

	public void setCourseUnLike(int courseUnLike) {
		this.courseUnLike = courseUnLike;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCourseComment() {
		return courseComment;
	}

	public void setCourseComment(String courseComment) {
		this.courseComment = courseComment;
	}

	public Date getCourseRegDate() {
		return courseRegDate;
	}

	public void setCourseRegDate(Date courseRegDate) {
		this.courseRegDate = courseRegDate;
	}

	public List<Place> getPlaceList() {
		return placeList;
	}

	public void setPlaceList(List<Place> placeList) {
		this.placeList = placeList;
	}

	@Override
	public String toString() {
		return "Course [courseNo=" + courseNo + ", courseName=" + courseName + ", courseDistance=" + courseDistance
				+ ", courseCost=" + courseCost + ", courseLike=" + courseLike + ", courseUnLike=" + courseUnLike
				+ ", memberId=" + memberId + ", courseComment=" + courseComment + ", courseRegDate=" + courseRegDate
				+ ", placeList=" + placeList + "]";
	}

}
