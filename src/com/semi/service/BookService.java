package com.semi.service;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.BookDAO;
import com.semi.dto.DTO;

public class BookService {

	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//받아온 값 받음
		String[] delList = request.getParameterValues("delList[]");
		System.out.println(delList.length);
		//doa로 넘겨줌
		BookDAO dao = new  BookDAO();
		int delCnt = dao.delete(delList);
		boolean success = false;
		
		//지운갯수와 넘어온 갯수가 같으면
		if(delCnt == delList.length) {
			success = true;
		}
		
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);
	}

	//예약하기
	public void bookWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String placeNo = request.getParameter("place_no");
		String loginId = (String) request.getSession().getAttribute("loginId");
		System.out.println("장소번호 : "+placeNo+"로그인 아이디 : "+loginId);
		BookDAO dao = new BookDAO();
		DTO dto = new DTO();
		String date = request.getParameter("date");
		System.out.println(date);
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String custom = request.getParameter("custom");
		String price = request.getParameter("price");
		
		Date date2 = Date.valueOf(date);
		
		System.out.println(date2+", "+startTime+", "+endTime+", "+custom+", "+price);
		
		dto.setPlace_no(Integer.parseInt(placeNo));
		dto.setBook_date(date2);
		dto.setBook_start(startTime);
		dto.setBook_end(endTime);
		dto.setBook_custom(Integer.parseInt(custom));
		dto.setBook_price(Integer.parseInt(price));;

		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		
		int success = 0;
		if(loginId != null) {
			success = dao.bookWrite(dto, loginId);
			map.put("login", true);
		}else {
			map.put("login", false);
		}
		
		map.put("success", success);
		String obj = json.toJson(map);
		System.out.println(obj);
		response.getWriter().println(obj);
	}
	
}
