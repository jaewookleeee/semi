package com.semi.service;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.dao.InfoDAO;
import com.semi.dto.DTO;

public class InfoService {

	//로그인
		public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
			InfoDAO dao = new InfoDAO();
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println(id+", "+pw);
		
			
			String div = dao.login(id, pw);
			boolean result = false;
			if(div != null) {
				request.getSession().setAttribute("loginId", id);
				request.getSession().setAttribute("loginDiv", div);
				result = true;
				System.out.println(request.getSession().getAttribute("loginId")+"/"+request.getSession().getAttribute("loginDiv")+"/"+result);
			}
			
			Gson json = new Gson();
			HashMap<String, Boolean> map = new HashMap<>();
			map.put("result", result);
			String obj = json.toJson(map);
			System.out.println("로그인 체크 : "+obj);
			response.getWriter().println(obj);
		}

	//사용자 회원가입
	public void userJoin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InfoDAO dao = new InfoDAO();
		DTO dto = new DTO();
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String email = request.getParameter("email");
		
		String birth = year+"/"+month+"/"+day;
		Date date = null;
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/DD");

		try {
			System.out.println(format.parse(birth).getTime());
			date = new Date(format.parse(birth).getTime());
			System.out.println(date);
			//date = (Date)format.parse(birth);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//Date date = Date.valueOf(birth);
		System.out.println(id+pw+name+gender+email+date);
		
		dto.setInfo_id(id);
		dto.setInfo_pw(pw);
		dto.setInfo_name(name);
		dto.setInfo_gender(gender);
		dto.setInfo_birth(date);
		dto.setInfo_email(email);
		dto.setInfo_div("사용자");
		int success = dao.userJoin(dto);
		
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", success);
		
		String obj = json.toJson(map);
		System.out.println(obj);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	//등록자 회원가입
	public void regJoin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		InfoDAO dao = new InfoDAO();
		DTO dto = new DTO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String email = request.getParameter("email");
		String num = request.getParameter("num");
		String phone = request.getParameter("phone");
		
		String birth = year+"/"+month+"/"+day;
		Date date = null;
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/DD");

		try {
			System.out.println(format.parse(birth).getTime());
			date = new Date(format.parse(birth).getTime());
			System.out.println(date);
			//date = (Date)format.parse(birth);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//Date date = Date.valueOf(birth);
		System.out.println(id+", "+pw+", "+name+", "+gender+", "+email+", "+date+", "+num+", "+phone);
		
		dto.setInfo_id(id);
		dto.setInfo_pw(pw);
		dto.setInfo_name(name);
		dto.setInfo_gender(gender);
		dto.setInfo_birth(date);
		dto.setInfo_email(email);
		dto.setInfo_div("등록자");
		dto.setInfo_num(num);
		dto.setInfo_phone(phone);
		
		int success = dao.regJoin(dto);
		
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", success);
		
		String obj = json.toJson(map);
		System.out.println(obj);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	//로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//세션 추출
		HttpSession session = request.getSession();
		//loginId 속성값 삭제
		session.removeAttribute("loginId");
		//main.jsp 페이지 요청(index 인데 세션 검사 작동 확인을 위해 main으로감)
		response.sendRedirect("index.jsp");
	}

	
	
}
