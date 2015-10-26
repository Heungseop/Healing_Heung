package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dto.Course;
import dto.Member;
import dto.Place;
import exception.AlreadyExistLikeException;
import service.CourseService;
import service.PlaceService;

@Controller
public class CourseController {
	private static Logger logger = LoggerFactory.getLogger(CourseController.class);

	@Autowired
	CourseService cservice;

	@Autowired
	PlaceService pservice;

	@ModelAttribute
	public Course setDefaultCourse() {
		Course course = new Course();
		course.setCourseComment("");
		return course;
	}

	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String Get_404(Model model) {

		return "/error/404";
	}

	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String Get_500(Model model) {

		return "/error/500";
	}

	@RequestMapping(value = "/course_main", method = RequestMethod.GET)
	public String course_mainGet(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/course/course_main.jsp");
		List<Course> list = cservice.selectCourseOfAll();
		for (Course c : list) {
			c.setCourseLike(cservice.CourseLikeCountCountByCourseNo(c.getCourseNo()));
		}
		model.addAttribute("allCourseList", list);

		return "templet";
	}

	@RequestMapping(value = "/course_create_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String course_create_ajaxGet(Model model, HttpSession session) {
		logger.trace("course_placeDetailGet get ajax ");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (session.getAttribute("login") != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");

		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/course_create", method = RequestMethod.GET)
	public String course_createGet(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/course/course_create.jsp");
	
		return "templet";
	}

	@RequestMapping(value = "/course_place_search", method = RequestMethod.GET)
	public String course_place_searchGet(Model model) {
		// model.addAttribute("contentpage",
		// "/WEB-INF/view/course/course_create.jsp");
		logger.trace("course_place_search get 왓다감");
		return "course/course_place_search";
	}

	@RequestMapping(value = "/course_place_search_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String course_place_search_ajaxGet(Model model, @RequestParam String placeName) {
		logger.trace("course_place_search_ajax get 왓다감");
		logger.trace("placeName {}", placeName);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Place> place = pservice.SelectSearchPlace(placeName);
		if (place.size() != 0) {
			resultMap.put("result", "success");
			resultMap.put("placeList", place);
		} else {
			resultMap.put("fail", "입력한 관광지 정보가 존재하지 않습니다. ");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/course_place_search_ajax2", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String course_place_search_ajax2Get(Model model, @RequestParam int placeNo) {
		logger.trace("course_place_search_ajax2 get 왓다감");
		logger.trace("placeNo {}", placeNo);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Place place = pservice.selectPlace(placeNo);
		if (place != null) {
			resultMap.put("result", "success");
			resultMap.put("selectedplace", place);
		} else {
			resultMap.put("fail", "잘못된 처리입니다.. ");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/course_create", method = RequestMethod.POST)
	public String course_createPost(Model model, Course course, @RequestParam List<String> placeNoList,
			HttpSession session) {
		logger.trace("course_create post 컨트롤러 왓다감");

		List<Place> placeList = new ArrayList<>();
		int result = -1;

		if (session.getAttribute("login") != null) {

			Member mem = (Member) session.getAttribute("login");
			for (String s : placeNoList) {
				logger.trace("for : {}", s);
				if (!s.equals("")) {
					placeList.add(pservice.selectPlace(Integer.parseInt(s)));
				}
			}
			course.setPlaceList(placeList);
			course.setMemberId(mem.getMemberId());
			result = cservice.insertCourse(course);
			if (result >= 1) {
				logger.trace("코스 인서트 완료 {}", course);
			}
		} else {
			return "redirect:404";
		}

		return "redirect:place_ok";
	}

	@RequestMapping(value = "/course_name_check_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String course_name_check_ajaxGet(Model model, @RequestParam String courseName) {
		logger.trace("course_place_search_ajax2 get 왓다감");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Course course = cservice.selectCourseByCourseName(courseName);

		if (course == null) {
			resultMap.put("result", "success");
			resultMap.put("success", "해당 코스 이름은 사용이 가능합니다.(체크 완료)");
		} else {

			resultMap.put("fail", "해당 코스 이름은 이미 사용 중입니다.");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/course_update_name_check_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String course_update_name_check_ajaxGet(Model model, @RequestParam String courseName,
			@RequestParam int courseNo) {
		logger.trace("course_update_place_search_ajax2 get 왓다감");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Course course = cservice.selectCourseByCourseName(courseName);

		if (course == null) {
			resultMap.put("result", "success");
			resultMap.put("success", "해당 코스 이름은 사용이 가능합니다.(체크 완료)");
		} else {
			if (course.getCourseNo() == courseNo) {
				resultMap.put("result", "success");
				resultMap.put("success", "기존 코스 이름입니다.(체크 완료)");
			} else {
				resultMap.put("fail", "해당 코스 이름은 이미 사용 중입니다.");
			}
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/course_detail", method = RequestMethod.GET)
	public String course_detail(Model model, @RequestParam int courseNo) {

		logger.trace("courseNo : {}", courseNo);

		Course c = cservice.selectCourseByNo(courseNo);
		c.setCourseLike(cservice.CourseLikeCountCountByCourseNo(courseNo));
		model.addAttribute("course", c);

		model.addAttribute("contentpage", "/WEB-INF/view/course/course_detail.jsp");
		return "templet";
	}

	@RequestMapping(value = "/course_like", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String courselike(Model model, @RequestParam int courseNo, HttpSession session) {
		logger.trace("courselike get ");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (session.getAttribute("login") != null) {
			logger.trace("login = not null");
			Member member = (Member) session.getAttribute("login");
			try {
				cservice.applyLike(courseNo, member.getMemberId(), true);
				resultMap.put("result", "success");
			} catch (AlreadyExistLikeException e) {
				resultMap.put("result", "fail");
				resultMap.put("msg", e.getMessage());
			}
		} else {
			resultMap.put("result", "fail");
			resultMap.put("msg", "로그인이 필요한 서비스 입니다.");

			logger.trace("login = null");
		}
		resultMap.put("like", cservice.CourseLikeCountCountByCourseNo(courseNo));

		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/courseAjax", method = RequestMethod.GET)
	public @ResponseBody String rankajax(Model model) {
		Map<String, List<Course>> map = cservice.selectRankListOfAll();

		// logger.trace("map : {}" , map);
		Gson gson = new Gson();
		return gson.toJson(map);
	}

	@RequestMapping(value = "/rank_daily", method = RequestMethod.GET)
	public String rank_daily(Model model) {
		List<Course> list = cservice.selectRankList("day");
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_daily.jsp");
		model.addAttribute("daily", list);
		return "templet";
	}

	@RequestMapping(value = "/rank_weekly", method = RequestMethod.GET)
	public String rank_weekly(Model model) {
		List<Course> list = cservice.selectRankList("week");
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_weekly.jsp");
		model.addAttribute("weekly", list);
		return "templet";
	}

	@RequestMapping(value = "/rank_monthly", method = RequestMethod.GET)
	public String rank_monthly(Model model) {
		List<Course> list = cservice.selectRankList("month");
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_monthly.jsp");
		model.addAttribute("monthly", list);
		return "templet";
	}

	@RequestMapping(value = "/course_change", method = RequestMethod.GET)
	public String course_changeGet(Model model, @RequestParam int courseNo) {
		model.addAttribute("contentpage", "/WEB-INF/view/course/course_change.jsp");
		logger.trace("course_change get 컨트롤러 왓다감");
		Course c = cservice.selectCourseByNo(courseNo);

		c.setCourseNo(courseNo);
		model.addAttribute("course_change", c);
		return "templet";
	}

	@RequestMapping(value = "/course_change", method = RequestMethod.POST)
	public String course_changePost(Model model, Course course, @RequestParam List<String> placeNoList,
			HttpSession session) {
		logger.trace("course_change post 컨트롤러 왓다감");

		List<Place> placeList = new ArrayList<>();
		int result = -1;
		Course ucourse = new Course(course.getCourseName(), course.getCourseDistance(), course.getCourseCost(),
				course.getCourseComment(), course.getCourseNo());

		logger.trace("ucourse {}", ucourse);
		logger.trace("placeNoList {}", placeNoList);

		if (session.getAttribute("login") != null) {

			for (int i = placeNoList.size() - 1; i >= 0; i--) {
				// logger.trace("for : {}", s);
				if (!placeNoList.get(i).equals("")) {
					placeList.add(pservice.selectPlace(Integer.parseInt(placeNoList.get(i))));
				}
			}

			result = cservice.updateCourse(ucourse, placeList);
			if (result >= 1) {
				logger.trace("코스 업데이트 완료 {}", course);
			} else {
				logger.trace("코스 업데이트 실패 {}", course);
			}
		} else {
			return "redirect:404";
		}

		return "redirect:place_ok";
	}

	@RequestMapping(value = "/placePsitionUpdate", method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
	public @ResponseBody String placePsitionUpdate(Model model, @RequestParam int placeNo,
			@RequestParam String placePositionY, @RequestParam String placePositionX) {
		Place p = pservice.selectPlace(placeNo);
		logger.trace("placePositionX : {}", placePositionX);
		p.setPlacePositionX(placePositionX);
		p.setPlacePositionY(placePositionY);
		logger.trace("placePsitionUpdate place : {} " , p);
		int result = pservice.updatePlace(p);
		Gson gson = new Gson();
		return gson.toJson(result);
	}

}
