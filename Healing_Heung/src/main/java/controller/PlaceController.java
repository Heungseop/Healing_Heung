package controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import dto.Categori;
import dto.Member;
import dto.Place;
import exception.AlreadyExistLikeException;
import exception.AlreadyExistRelationException;
import service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	PlaceService pservice;
	
	private static Logger logger = LoggerFactory.getLogger(PlaceController.class);

	@RequestMapping(value = "/place_main", method = RequestMethod.GET)
	public String place_mainGet(Model model) {
		// logger.trace("(placeController) /place_main RUN");

		List<Place> allPlaceList = pservice.selectAllList();// 전체 관광지를 반환한다고 가정
		for(Place p : allPlaceList){
			p.setLike( pservice.selectPlaceLikeCount(p.getPlaceNo()));
		}
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_main.jsp");
		model.addAttribute("allPlace", allPlaceList);

		return "templet";
	}

	@ModelAttribute
	public void initMenu(Model model) {

		List<Categori> Categori_theme_Options = new ArrayList<>();
		Categori_theme_Options.add(new Categori("선택", 0));
		Categori_theme_Options.add(new Categori("가족여행", 8));
		Categori_theme_Options.add(new Categori("우정여행", 9));
		Categori_theme_Options.add(new Categori("커플여행", 10));
		Categori_theme_Options.add(new Categori("단체여행", 11));
		Categori_theme_Options.add(new Categori("유명한 맛집", 15));
		model.addAttribute("Categori_theme_Options", Categori_theme_Options);

		List<Categori> Categori_term_Options = new ArrayList<>();
		Categori_term_Options.add(new Categori("선택", 0));
		Categori_term_Options.add(new Categori("당일", 12));
		Categori_term_Options.add(new Categori("1박2일", 13));
		Categori_term_Options.add(new Categori("2박3일", 14));
		model.addAttribute("Categori_term_Options", Categori_term_Options);

	}

	@ModelAttribute
	public Place setDefaultPlace() {
		Place place = new Place();

		return place;
	}

	@RequestMapping(value = "/place_groupping", method = RequestMethod.GET)
	public String place_grouppingGet(Model model, @RequestParam String groupDetail) {
		logger.trace("place_groupping get 컨트롤러 왓다감");
		logger.trace("groupDetail = {}",groupDetail);

		model.addAttribute("contentpage", "/WEB-INF/view/place/place_groupping.jsp");
		List<Place> groupPlace = pservice.selectGroupPlaceList(groupDetail);
		model.addAttribute("groupPlace", groupPlace);
		model.addAttribute("group", groupDetail);
		logger.trace("groupPlace = {}",groupPlace);
		logger.trace("groupDetail = {}",groupDetail);
		return "templet";
	}

	@RequestMapping(value = "/place_detail", method = RequestMethod.GET)
	public String place_placeDetailGet(Model model, @RequestParam int placeNo) {
		logger.trace("place_placeDetailGet get ");

		model.addAttribute("contentpage", "/WEB-INF/view/place/place_detail.jsp");
		Place place = pservice.selectPlace(placeNo);
		place.setLike(pservice.selectPlaceLikeCount(placeNo));
		model.addAttribute("place", place);
		return "templet";
	}

	@RequestMapping(value = "/place_like", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String placelike(Model model, @RequestParam int placeNo, HttpSession session) {
		logger.trace("placelike get ");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (session.getAttribute("login") != null) {
			logger.trace("login = not null");
			Member member = (Member) session.getAttribute("login");
			try {
				pservice.likeApply(placeNo, member.getMemberId());
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
		Place place = pservice.selectPlace(placeNo);
		place.setLike(pservice.selectPlaceLikeCount(placeNo));
		resultMap.put("like", pservice.selectPlaceLikeCount(placeNo));
		model.addAttribute("place", place);
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/place_create", method = RequestMethod.GET)
	public String place_createGet(Model model) {
		logger.trace("place_placeDetailGet get ");

		model.addAttribute("contentpage", "/WEB-INF/view/place/place_create.jsp");

		return "templet";
	}

	@RequestMapping(value = "/place_create_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String place_create_ajaxGet(Model model, HttpSession session) {
		logger.trace("place_placeDetailGet get ");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (session.getAttribute("login") != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");

		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/place_create", method = RequestMethod.POST)
	public String place_createPost(Model model, Place place, HttpSession session, RedirectAttributes redir
			//@RequestParam List<String> imageUrlUrl, 
			//@RequestParam List<MultipartFile> imageFile
			)
					throws IllegalStateException, IOException {
		int result=0;
		logger.trace("place_createPost  ");
		logger.trace("place imageUrlUrl {},", place.getImageUrlUrl());
		
		//logger.trace("imageUrlUrl {},", imageUrlUrl);
		
		logger.trace("place imageFile {},", place.getImageFile());
		//logger.trace(" imageFile {},", imageFile);
		
		
		logger.trace("place_file size() : {}", place.getImageFile().size());

		for (int i = 0; i < place.getImageFile().size(); i++) {
			if (place.getImageFile().get(i).getOriginalFilename() != "") {

				File file = new File("c:/Temp/upload/" + place.getImageFile().get(i).getOriginalFilename());
				logger.trace("DB에 저장할 값:" + place.getImageFile().get(i).getOriginalFilename());
				place.getImageFile().get(i).transferTo(file);

			} else {
				logger.trace(i + "번째 인덱스 널임");
			}
		}
		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");

			place.setPlaceCert(false);

			place.setMemberId(mem.getMemberId());
			logger.trace("place {}", place);


			pservice.CreatePlace(place);
			result =pservice.selectPlaceNoByPlaceName(place.getPlaceName());
				
		}
		
		return "redirect:place_detail?placeNo="+result;
	}
	@RequestMapping(value = "/place_NameCheck", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String placeNameCheck(Model model, @RequestParam String name
			) {
		Map<String, String> resultMap = new HashMap<String, String>();
		logger.trace("place_NameCheck get 왓다감");
		if (name.equals("")) {
			resultMap.put("result", "fail");
			resultMap.put("msg", "관광지 이름을 입력해주세요.");
		}  else {
			
			List<Place> place = pservice.JungBokselectPlaceByName(name);
			
			if (place.size() == 0) {		
				resultMap.put("result", "success");

			} else {
				
				resultMap.put("result", "fail");
				resultMap.put("msg", "이미 등록된 관광지 입니다.");
			}
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	@RequestMapping(value = "/createGrouping", method = RequestMethod.GET)
	public String createGrouping(Model model) throws AlreadyExistRelationException {
		logger.trace("createGrouping get ");

		List<Place> all = pservice.selectAllList();

		for (Place p : all) {
			String region = pservice.getRegionName(p.getPlaceAddress());
			pservice.createGrouping(p.getPlaceNo(), pservice.selectDetailNoByName(region));

			 logger.trace(region);
		}
		model.addAttribute("allList", all);
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_main.jsp");

		return "templet";
	}
	
	@RequestMapping(value = "/place_mypage", method = RequestMethod.GET)
	public String place_mypageGet(Model model,HttpSession session) {
		logger.trace("place_mypageGet  ");

		List<Place> placeList;
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_mypage.jsp");
		if(session.getAttribute("login") !=null){
			Member member =(Member)session.getAttribute("login");
			if(member.getMemberId().equals("admin")){
				placeList =pservice.selectCertFalsePlaceAll();
				
				
			}else{
				placeList =pservice.selectCertFalsePlaceByMemberId(member.getMemberId());
			}
			logger.trace("place {} ",placeList);
			model.addAttribute("certFalsePlace",placeList);
		}
		
		return "templet";
	}
	@RequestMapping(value = "/place_ok", method = RequestMethod.GET)
	public String place_okGet(Model model) {
		// logger.trace("(placeController) /place_main RUN");

		model.addAttribute("contentpage", "/WEB-INF/view/place/place_ok.jsp");
		
		return "templet";
	}
	
	
	@RequestMapping(value = "/place_certUpdate", method = RequestMethod.GET)
	public String place_certUpdateGet(Model model , @RequestParam int placeNo) {
		logger.trace("place_certUpdate Get  ");
		
		pservice.updatePlaceCert(placeNo);
		
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_ok.jsp");
		return "templet";
	}
	@RequestMapping(value = "/place_certFalse", method = RequestMethod.GET)
	public String place_certFalseGet(Model model , @RequestParam int placeNo) {
		logger.trace("place_certFalseUpdate Get  ");
		
		pservice.updatePlaceCertFalse(placeNo);
		
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_ok.jsp");
		return "templet";
	}
	@RequestMapping(value = "/place_change", method = RequestMethod.GET)
	public String place_modifyGet(Model model , @RequestParam int placeNo) {
		logger.trace("place_modify Get  ");
		Place place =pservice.selectPlace(placeNo);
		
		List<String> placeFileList =new ArrayList<String>();
		for(int i=0; i<place.getImageUrlUrl().size(); i++){
			if(place.getImageUrlUrl().get(i) !=null){
				placeFileList.add(place.getImageUrlUrl().get(i));
			}
		}
		place.setImageUrlUrl(placeFileList);	
		model.addAttribute("changeplace",place);
		model.addAttribute("contentpage", "/WEB-INF/view/place/place_change.jsp");
		return "templet";
	}
	

	@RequestMapping(value = "/place_change", method = RequestMethod.POST)
	public String place_modifyPost(Model model, Place place, HttpSession session, RedirectAttributes redir,
			@RequestParam List<String> imageUrlUrl, 
			@RequestParam List<MultipartFile> imageFile)
					throws IllegalStateException, IOException {
		int result=0;
		logger.trace("place_modifyPost  ");
		logger.trace("place imageUrlUrl {},", place.getImageUrlUrl());
		
		logger.trace("imageUrlUrl {},", imageUrlUrl);
		
		logger.trace("place imageFile {},", place.getImageFile());
		logger.trace(" imageFile {},", imageFile);
		
		
		logger.trace("place_file size() : {}", place.getImageFile().size());

		for (int i = 0; i < place.getImageFile().size(); i++) {
			if (place.getImageFile().get(i).getOriginalFilename() != "") {

				File file = new File("c:/Temp/upload/" + place.getImageFile().get(i).getOriginalFilename());
				logger.trace("DB에 저장할 값:" + place.getImageFile().get(i).getOriginalFilename());
				place.getImageFile().get(i).transferTo(file);

			} else {
				logger.trace(i + "번째 인덱스 널임");
			}
		}
		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");

			place.setPlaceCert(false);

			place.setMemberId(mem.getMemberId());
			logger.trace("place {}", place);
			
			result =pservice.modifyPlace(place);
			if( result == 1){
				logger.trace("place update success {}", result);
			}
		}
		
		return "redirect:place_ok";
	}


}
