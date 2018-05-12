package com.semi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.service.BoardService;
import com.semi.service.BookService;
import com.semi.service.InfoService;
import com.semi.service.PlaceService;
import com.semi.service.QaService;
import com.semi.service.ReviewService;


@WebServlet({"/del","/overlay", "/login", "/logout", "/userJoin", "/regJoin", "/userUpdate", "/regUpdate", "/regChange", "/userDel",
	"/userList", "/likeList", "/infoPlaceList", "/bookList", "/total", "/totalDetail", "/userSearch",
	"/placeWrite", "/placeList", "/placeUpdate", "/placeDel","/placephotoDetail", "/placeDetail", "/like", "/likeDel",
	"/placeSearch", "/boardWrite", "/boardUpdate", "/boardDel", "/boardDetail", "/boardList", "/boardSearch",
	"/boardReplyWrite", "/boardReplyUdate", "/boardReplyDel", "/boardReplyList", "/bookWrite", "/bookDel",
	"/qaWrite", "/qaDel", "/qaUpate", "/qaList", "/qaReplyWrite", "/qaReplyUpdate", "/qaReplyList", "/qaReplyDel", "/qaSearch",
	"/reviewWrite", "/reviewDel", "/reviewUpdate", "/reviewList"
})

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dual(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dual(request, response);
	}
	private void dual(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String subAddr = uri.substring(context.length());
		System.out.println(subAddr);
		
		InfoService infoService = null;
		PlaceService placeService = null;
		BoardService boardService = null;
		BookService bookService = null;
		QaService qaService = null;
		ReviewService reviewService = null;
		
		switch (subAddr) {
			case "/overlay":
				System.out.println("중복체크 요청");
				infoService = new InfoService();
				infoService.overlay(request, response);
				break;
			case "/login":
				System.out.println("로그인 요청");
				infoService = new InfoService();
				infoService.login(request, response);
				break;
			case "/logout":
				System.out.println("로그아웃 요청");
				infoService = new InfoService();
				infoService.logout(request, response);
				break;	
			case "/userJoin":
				System.out.println("사용자 회원가입 요청");
				infoService = new InfoService();
				infoService.userJoin(request, response);
				break;
			case "/placeWrite":
				System.out.println("장소 등록 요청");
				placeService = new PlaceService();
				placeService.Write(request,response);
				break;
			case "/regJoin":
				System.out.println("등록자 회원가입 요청");
				infoService = new InfoService();
				infoService.regJoin(request, response);
				break;	
			case "/userUpdate":
				System.out.println("사용자 정보수정 요청");
				infoService = new InfoService();
				infoService.userUpdate(request, response);
				break;
			case "/regUpdate":
				System.out.println("등록자 정보수정 요청");
				infoService = new InfoService();
				infoService.regUpdate(request, response);
				break;
			case "/regChange":
				System.out.println("등록자 전환 요청");
				infoService = new InfoService();
				infoService.regChange(request, response);
				break;
			case "/userList":
				System.out.println("회원 리스트 요청");
				infoService = new InfoService();
				infoService.userList(request, response);
				break;
			case "/del":
				System.out.println("회원탈퇴 요청");
				infoService = new InfoService();
				infoService.del(request, response);
				break;
			case"/placeSearch":
				System.out.println("장소 검색");
				placeService=new PlaceService();
				placeService.search(request, response);
				break;
			case "/bookList":
				System.out.println("예약 리스트 요청");
				infoService = new InfoService();
				infoService.bookList(request, response);
				break;
			case "/bookDel":
				System.out.println("예약 삭제 요청");
				bookService = new BookService();
				bookService.delete(request, response);
				break;
			case "/placephotoDetail":
				System.out.println("포토상세보기 요청");
				System.out.println(request.getParameter("place_no"));
				placeService=new PlaceService();
				placeService.detailphoto(request,response);
				break;

			case "/boardWrite":
				System.out.println("boardWrite");
				boardService = new BoardService();
				boardService.write(request, response);
				break;
			case "/boardUpdate":
				System.out.println("boardUpdate");
				boardService = new BoardService();
				boardService.update(request,response);
				break;
			case "/boardDel":
				System.out.println("boardDel");
				boardService = new BoardService();
				boardService.delete(request,response);
				break;
			case "/boardDetail":
				System.out.println("boardDetail");
				boardService = new BoardService();
				boardService.detail(request, response);
				break;
			case "/boardList":
				System.out.println("boardList");
				boardService = new BoardService();
				boardService.search(request, response);
				break;
			case "/likeList":
				System.out.println("찜 목록 요청");
				infoService = new InfoService();
				infoService.likeList(request, response);
				break;
			case "/likeDel":
				System.out.println("찜 삭제 요청");
				placeService = new PlaceService();
				placeService.likeDel(request, response);
				break;	
			case "/placeList":
				System.out.println("등록내역확인 요청");
				infoService = new InfoService();
				infoService.placeList(request, response);
				break;

		}
		
	}

}
