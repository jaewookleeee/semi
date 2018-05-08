package com.semi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({ "/login", "/logout", "/userJoin", "/regJoin", "/userUpdate", "/regUpdate", "/regChange", "/userDel",
	"/userList", "/likeList", "/infoPlaceList", "/bookList", "/total", "/totalDetail", "/userSearch",
	"/placeWrite", "/placeList", "/placeUpdate", "/placeDel", "/placeDetail", "/like", "/likeDel",
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
	private void dual(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String subAddr = uri.substring(context.length());
		System.out.println(subAddr);
		
		switch (subAddr) {
			case "/login":
				
				break;
		}
		
	}

}
