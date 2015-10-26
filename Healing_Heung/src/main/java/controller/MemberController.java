package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;


import dto.Member;
import service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService mservice;

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@InitBinder
	public void bindData(WebDataBinder binder) {
		logger.trace("bindData 호출됨");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, "memberBirth", new CustomDateEditor(format, true));
	}
	@ModelAttribute
	public Member setDefaultMember() {
		Member member = new Member();
		
		return member;
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeGet(Model model) {
		logger.trace("home get 컨트롤러 왓다감");
		
		model.addAttribute("contentpage", "/WEB-INF/view/main.jsp");
		
		return "templet";
	}
	
	

	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String joinGet(Model model) {
		logger.trace("member_join get 컨트롤러 왓다감");
		Member member = new Member();

		model.addAttribute("contentpage", "/WEB-INF/view/member/join.jsp");
		model.addAttribute("member", member);

		logger.trace("Date {}", new Date());

		return "templet";
	}

	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String joinPost(Model model, Member member, RedirectAttributes redir) {
		logger.trace("member_join post 컨트롤러 왓다감");

		logger.trace("member {}", member);
		mservice.join(new Member(member.getMemberId(), member.getMemberPassword(), member.getMemberName(),
				member.getMemberBirth(), member.getMemberEmail(), member.getMemberPhone()));
		logger.trace("member {}", member);

		return "redirect:templet?contentpage=/WEB-INF/view/member/joinresult.jsp";
	}

	@RequestMapping(value = "templet", method = RequestMethod.GET)
	public String templetGet(Model model, RedirectAttributes redir) {

		return "templet";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(Model model) {

		logger.trace("login controller get 왓다감 ");

		return "login";
	}

	@RequestMapping(value = "/member_login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loginPost(Model model, 
			@RequestParam String id, 
			@RequestParam String pass,
			HttpSession session) {
		Map<String, String> resultMap = new HashMap<String, String>();
		String result = "";
		Member member = null;
		logger.trace("login controller post 왓다감");
		
		logger.trace("id pass",id,pass);
		if (id.equals("")) {
			resultMap.put("result", "fail");
			resultMap.put("msg", "아이디 를 입력해주세요.");
		} else if (pass.equals("")) {
			resultMap.put("result", "fail");
			resultMap.put("msg", "패스워드 를 입력해주세요.");
		} else {

			Map<String, Object> loginMap = mservice.newlogin(id, pass);
			Object TempObject = loginMap.get("login");
			if (TempObject != null && TempObject instanceof String) {
				result = (String) TempObject;
			}

			if (result.equals("success")) {
				logger.trace("로그인 성공");
				TempObject = loginMap.get("member");
				if (TempObject != null && TempObject instanceof Member) {
					member = (Member) TempObject;
				}
				resultMap.put("result", "success");
				resultMap.put("name", member.getMemberName());
				session.setAttribute("login", member);
			} else {
				logger.trace("로그인 실패");
				resultMap.put("result", "fail");
				resultMap.put("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			}
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	@RequestMapping(value = "/member_joinIdCheck", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String joinIdCheckget(Model model, @RequestParam String id
			) {
		Map<String, String> resultMap = new HashMap<String, String>();
		logger.trace("joinIdCheck get 왓다감");
		if (id.equals("")) {
			resultMap.put("result", "fail");
			resultMap.put("msg", "아이디 를 입력해주세요.");
		}  else {
			
			boolean result = mservice.JoinIdCheck(id);
			
			if (result) {		
				resultMap.put("result", "success");

			} else {
				
				resultMap.put("result", "fail");
				resultMap.put("msg", "이미 사용 중인 아이디 입니다.");
			}
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	@RequestMapping(value = "/member_change", method = RequestMethod.GET)
	public String member_changeGet(Model model ,HttpSession session) {

		model.addAttribute("contentpage", "/WEB-INF/view/member/loginchange.jsp");
		Member member=(Member)session.getAttribute("login");
		member.setMemberPassword("");
		member.setMemberPasswordidentify("");
		model.addAttribute("member", member);

		return "templet";
	}
	
	@RequestMapping(value = "/member_change", method = RequestMethod.POST)
	public String member_changePost(Model model ,Member member ,HttpSession session) {


		session.setAttribute("login", member);
		
		logger.trace("member {}",member);
		mservice.modify(new Member(member.getMemberId(),
								   member.getMemberPassword(),
								   member.getMemberEmail(),
								   member.getMemberPhone()  ));
		
		
		return "redirect:templet?contentpage=/WEB-INF/view/member/loginchangeresult.jsp";
	}
	
	@RequestMapping(value = "/member_logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session, Model model) {
		logger.trace("logout controller get 왓다감");
		session.invalidate();

		return "redirect:home";
	}
	
	@RequestMapping(value = "/member_searchId", method = RequestMethod.GET)
	public String member_searchIdGet(Model model) {
		logger.trace("member_searchPass controller get 왓다감");
		Member member = new Member();
		model.addAttribute("contentpage", "/WEB-INF/view/member/searchId.jsp");
		model.addAttribute("member", member);
		return "templet";
	}
	
	@RequestMapping(value = "/member_searchId", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	public @ResponseBody String member_searchIdPost(Model model, 
			@RequestParam String name,
			@RequestParam String phone,
			@RequestParam String email ) {
		logger.trace("member_searchIdPost controller post 왓다감");
		Map<String, String> resultMap = new HashMap<String, String>();
		
		String memberId =mservice.SearchId(new Member(name,email,phone));
		
		if(memberId !=null){
			resultMap.put("result", "success");
			resultMap.put("memberId", memberId);
		}else{
			resultMap.put("result", "fail");
			resultMap.put("msg", "해당 정보의 아이디는 존재하지 않습니다.");
			
		}

		Gson gson = new Gson();
		return gson.toJson(resultMap);
		
		
	}
	
	@RequestMapping(value = "/member_searchPass", method = RequestMethod.GET)
	public String member_searchPassGet(Model model) {
		logger.trace("member_searchPass controller get 왓다감");
		Member member = new Member();
		model.addAttribute("contentpage", "/WEB-INF/view/member/searchPass.jsp");
		model.addAttribute("member", member);
		return "templet";
	}
	@RequestMapping(value = "/member_searchPass", method = RequestMethod.POST)
	public String member_searchPassPost(Model model,Member member,RedirectAttributes redir,HttpSession session) {
		logger.trace("member_searchPass controller get 왓다감");
		
		Map <String,String> map =new HashMap<String,String>();
		map.put("memberName", member.getMemberName());
		map.put("memberEmail", member.getMemberEmail());
		map.put("memberPhone", member.getMemberPhone());
		map.put("memberId", member.getMemberId());
	
		if(mservice.SearchPass(map)){
			logger.trace("정보확인 완료");
			session.setAttribute("TempId",member.getMemberId());
			return "redirect:templet?contentpage=/WEB-INF/view/member/newPass.jsp";
		}else{
			logger.trace("정보확인 실패");
			return "redirect:templet?contentpage=/WEB-INF/view/member/failPass.jsp";

		}
	}
	@RequestMapping(value = "/member_newPass", method = RequestMethod.POST)
	public String member_newPassPost(Model model,Member member,HttpSession session) {
		logger.trace("member_newPass controller post 왓다감");
		
		Map <String,String> map =new HashMap<String,String>();
		
		String memberId = (String)session.getAttribute("TempId");
		map.put("memberPassword", member.getMemberPassword());
		map.put("memberId", memberId);
	
		mservice.modifyPassword(map);
		logger.trace("패스워드 변경 완료");
		
		session.invalidate();
		
		
		return "redirect:templet?contentpage=/WEB-INF/view/member/passresult.jsp";
	}
	
	
}
