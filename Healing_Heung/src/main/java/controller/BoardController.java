package controller;

import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import dao.BoardDaoImpl;
import dto.Board;
import dto.Course;
import dto.Member;
import dto.Reply;
import exception.AlreadyExistLikeException;
import exception.NotWriterException;
import service.BoardService;
import service.CourseService;
import service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	BoardService bservice;
	@Autowired
	ReplyService rservice;
	
	@Autowired
	CourseService cservice;

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);

	@ModelAttribute
	public Board setDefaultPlace() {
		Board board = new Board();
		return board;
	}

	@RequestMapping(value = "/board_main", method = RequestMethod.GET)
	public String board_mainGet(Model model, @RequestParam int page) {
		int lastpage = 1;
		if (bservice.selectBoardcnt() != 0) {
			lastpage = (bservice.selectBoardcnt() / BoardDaoImpl.BOARD_PER_PAGE);
			float f = (float) bservice.selectBoardcnt() / (float) BoardDaoImpl.BOARD_PER_PAGE - (float) lastpage;
			if (0 < f) {
				lastpage += 1;
			}
		} else {
			lastpage = 1;
		}

		List<Board> pageboard = bservice.selectBoardList(page);
		model.addAttribute("contentpage", "/WEB-INF/view/board/board_main.jsp");
		model.addAttribute("pageboard", pageboard);
		model.addAttribute("lastpage", lastpage);
		return "templet";
	}

	@RequestMapping(value = "/board_view", method = RequestMethod.GET)
	public String board_viewGet(Model model, @RequestParam int boardNo) {

		Board b = bservice.readBoard(boardNo);
		Reply reply = new Reply();
		model.addAttribute("board", b);
		model.addAttribute("reply", reply);
		model.addAttribute("contentpage", "/WEB-INF/view/board/board_view.jsp");

		return "templet";
	}

	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String board_writeGet(Model model) {
		logger.trace("board_write get 컨트롤러 왓다감");
		Board board = new Board();

		model.addAttribute("contentpage", "/WEB-INF/view/board/board_write.jsp");
		model.addAttribute("board", board);

		logger.trace("board {}", new Date());

		return "templet";
	}

	@RequestMapping(value = "/write_reply", method = RequestMethod.POST)

	public String board_writeGet(Model model, Reply reply, HttpSession session, RedirectAttributes redir) {
		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");
			reply.setBoardNo(reply.getBoardNo());
			reply.setMemberId(mem.getMemberId());
			rservice.writeReply(reply);
		}
		return "redirect:board_view?boardNo=" + reply.getBoardNo();
	}

	@RequestMapping(value = "/board_like", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String boardlike(Model model, @RequestParam int boardNo, HttpSession session) {
		logger.trace("boardlike get ");

		Map<String, Object> resultMap = new HashMap<String, Object>();

		if (session.getAttribute("login") != null) {
			logger.trace("login = not null");
			Member member = (Member) session.getAttribute("login");
			try {
				bservice.boardLike(boardNo, member.getMemberId());
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
		Board board = bservice.selectBoard(boardNo);
		resultMap.put("bdlike", board.getBoardLike());
		model.addAttribute("board", board);

		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	


	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String board_writePost(Model model, Board board, HttpSession session, RedirectAttributes redir) {
		logger.trace("board_write post 컨트롤러 왓다감");

		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");
			Board b = new Board();
			b.setBoardTitle(board.getBoardTitle());
			b.setBoardNo(board.getBoardNo());
			b.setMemberId(mem.getMemberId());
			
			b.setCourseNo(board.getCourseNo());
			b.setBoardComment(board.getBoardComment());
			bservice.insertBoard(b);
		}
		return "redirect:templet?contentpage=/WEB-INF/view/board/boardwriteresult.jsp";
	}

	@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
	public String board_deleteGet(Model model, @RequestParam int boardNo, HttpSession session)
			throws NotWriterException {
		logger.trace("board_delete get 컨트롤러 왓다감");

		Member mem = (Member) session.getAttribute("login");

		bservice.deleteBoard(mem.getMemberId(), boardNo);
		
		model.addAttribute("contentpage", "/WEB-INF/view/board/boarddeleteresult.jsp");

		return "templet";
	}

	@RequestMapping(value = "/reply_delete", method = RequestMethod.GET)
	public String reply_deleteGet(Model model, Reply reply, @RequestParam int replyNo, HttpSession session, RedirectAttributes redir) throws NotWriterException {

		logger.trace("reply_delete get 컨트롤러 왓다감");

		
			Member mem = (Member) session.getAttribute("login");
			int result = rservice.selectBoardNo(replyNo);
			rservice.deleteReply(replyNo);

	
		return "redirect:board_view?boardNo=" + result;
	}

	@RequestMapping(value = "/board_update", method = RequestMethod.GET)
	public String board_updateGet(Model model, @RequestParam int boardNo) {
		logger.trace("board_update get 컨트롤러 왓다감");

		model.addAttribute("contentpage", "/WEB-INF/view/board/boardupdate.jsp");
		
		Board board=bservice.selectBoard(boardNo);
		
		model.addAttribute("updateboard", board);
		Board b = new Board();
		b.setBoardTitle(board.getBoardTitle());
		b.setCourseNo(board.getCourseNo());
		b.setBoardComment(board.getBoardComment());

		model.addAttribute("board", b);

		return "templet";
	}

	@RequestMapping(value = "/board_update", method = RequestMethod.POST)
	public String board_updatePost(Model model, Board updateboard, HttpSession session, RedirectAttributes redir) {
		logger.trace("board_update post 컨트롤러 왓다감");

		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");

			
			logger.trace("board : {}", updateboard);
			
			bservice.updateBoard(new Board( 
					updateboard.getBoardTitle(), 
					updateboard.getBoardComment(),
					updateboard.getCourseNo(),
					updateboard.getBoardNo()
					));
		}
		return "redirect:templet?contentpage=/WEB-INF/view/board/boardupdateresult.jsp";
	}
	
	@RequestMapping(value = "/reply_update", method = RequestMethod.GET)
	public String reply_updateGet(Model model, Reply reply, @RequestParam int replyNo, HttpSession session, RedirectAttributes redir) {
		logger.trace("reply_update get 컨트롤러 왓다감");
		
		int result = rservice.selectBoardNo(replyNo);
		
		model.addAttribute("reply", reply);
	
		return "redirect:board_view?boardNo=" + result;
	}
	
	@RequestMapping(value = "/reply_update", method = RequestMethod.POST)
	public String reply_updatePost(Model model, Reply reply, HttpSession session, RedirectAttributes redir) {
		logger.trace("board_update post 컨트롤러 왓다감");
		
		if (session.getAttribute("login") != null) {
			Member mem = (Member) session.getAttribute("login");
			
			logger.trace("reply : {}", reply);
			
			rservice.updateReply(new Reply(reply.getReplyComment(), reply.getReplyNo()));
			
		}
		return "redirect:board_view?boardNo=" + reply.getBoardNo();
	}
	
	@RequestMapping(value = "/board_course_no_check_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String board_course_no_check_ajaxGet(Model model, @RequestParam int courseNo) {
		logger.trace("board_course_no_check_ajax get 왓다감");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Course course = cservice.selectCourseByNo(courseNo);

		if (course != null) {
			resultMap.put("result", "success");
			resultMap.put("success", "해당 코스는 사용이 가능합니다.");
		} else {
			resultMap.put("fail", "해당 코스 번호는 존재 하지 않습니다.");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
}
