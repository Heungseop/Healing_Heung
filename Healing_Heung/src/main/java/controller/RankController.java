package controller;

import java.util.Date;
import java.util.List;

import javax.jws.soap.InitParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Rank;
import service.CourseService;
import service.RankService;

@Controller
public class RankController {
	private static Logger logger = LoggerFactory.getLogger(PlaceController.class);
	
	@Autowired
	RankService rservice;
	
	@Autowired
	CourseService cservice;
	/*
	@ModelAttribute
	public Rank setDefaultRank() {
		Rank rank = new Rank();
		return rank;
	}
	
	@RequestMapping(value = "/rank_main", method = RequestMethod.GET)
	public String LikeDayRank(Model model) {
		int list = rservice.LikeDayRank();
		
		model.addAttribute("list", list);
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_main.jsp");

		return "templet";
	}
	
	@RequestMapping(value = "/rank_main", method = RequestMethod.GET)
	public String LikeWeekRank(Model model) {
		int list = rservice.LikeWeekRank();
		
		model.addAttribute("list", list);
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_main.jsp");

		return "templet";
	}
*/
	
/*import java.util.Date;

/import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Rank;
import service.CourseService;
import service.RankService;

@Controller
public class RankController {
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	RankService rservice;
	
	@Autowired
	CourseService cservice;
	
	@ModelAttribute
	public Rank setDefaultRank() {
		Rank rank = new Rank();
		return rank;
	}
	
	@RequestMapping(value = "/rank_view", method = RequestMethod.GET)
	public String rank_viewGet(Model model) {

		int rank = rservice.LikeDayRank();
		
		model.addAttribute("rank", rank);
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rank_main.jsp");

		return "templet";
	}*/
	
}
