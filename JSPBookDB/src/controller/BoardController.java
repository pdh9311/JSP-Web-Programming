package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	static final int LISTCOUNT = 5;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length() + 1);	// substring(시작위치) => 문자열의 index 시작위치를 매개값으로하면, 시작위치부터 끝위치까지의 문자열을 반환한다.
		
		resp.setContentType("text/html; charset=utf-8");	// 웹 브라우저에 응답할 MIME유형을 설정.
		req.setCharacterEncoding("utf-8");					// form에서 한글 입력을 정상적으로 처리하기 위해 필요함.
		
		String nextPage = null;
		
		// 등록된 게시물 페이지 가져오기
		if(command.equals("boardListPage.do")) {		
			requestBoardList(req);
			nextPage = "/board/list.jsp";
		} 
		
		// 게시글 작성하러 가기
		if(command.equals("boardWritePage.do")) {	
			requestLoginName(req);
			nextPage="/board/writeForm.jsp";
		}
		
		// 새 게시글 등록
		if(command.equals("boardWriteAction.do")) {
			requestBoardWrite(req);
			nextPage="/boardListPage.do";
		}
		
		// 선택한 게시글 상세 페이지 가져오기
		if(command.equals("boardViewPage.do")) {
			requestBoardDetail(req);
			nextPage="/board/view.jsp";
		}
		
		// 게시글 수정
		if(command.equals("boardUpdateAction.do")) {
			requestBoardUpdate(req);
			nextPage="/boardListPage.do";
		}
		
		// 게시글 삭제
		if(command.equals("/boardDeleteAction.do")) {
			requestBoardDelete(req);
			nextPage="/boardListPage.do";
		}
		
		if(nextPage != null) { 
			RequestDispatcher rd = req.getRequestDispatcher(nextPage);
			rd.forward(req, resp);
		} else { 
			req.getRequestDispatcher("fail.jsp").forward(req, resp);
		}
	}
	
	// 등록된 글 목록 가져오기
	public void requestBoardList(HttpServletRequest req) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(req.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		
		String items = req.getParameter("items");
		String text = req.getParameter("text");
		
		int totalCount = dao.getListCount(items, text);
		boardList = dao.getBoardList(pageNum, limit, items, text);
		
		int totalPage;
		
		if(totalCount % limit == 0) {
			totalPage = totalCount /limit;
		} else {
			totalPage = totalCount /limit;
			totalPage = totalPage + 1;
		}
		
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("boardList", boardList);
	}

	// 인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest req) {
		String id = req.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNameById(id);
		req.setAttribute("name", name);
	}

	// 새 게시글 등록
	public void requestBoardWrite(HttpServletRequest req) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		String registDay = sdf.format(new Date());
		dto.setRegist_day(registDay);
		dto.setHit(0);
		dto.setIp(req.getRemoteAddr());

		dao.insertBoard(dto);
	}

	// 선택한 게시글 상세 페이지 가져오기
	public void requestBoardDetail(HttpServletRequest req) {
		BoardDAO dao = BoardDAO.getInstance();
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num);
		
		req.setAttribute("board", board);
		req.setAttribute("nowPage", pageNum);
		
	}

	// 게시글 수정
	public void requestBoardUpdate(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setSubject(req.getParameter("subject"));
		board.setContent(req.getParameter("content"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		String registDay = sdf.format(new Date());
		board.setRegist_day(registDay);
		board.setHit(0);
		board.setIp(req.getRemoteAddr());
		
		dao.updateBoard(board);
	}
	
	// 게시글 삭제
	public void requestBoardDelete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
	}
	
}
