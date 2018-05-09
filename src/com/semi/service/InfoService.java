package com.semi.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(id+pw+name+gender+email);
		
		dto.setInfo_id(id);
		dto.setInfo_pw(pw);
		dto.setInfo_name(name);
		dto.setInfo_gender(gender);
		//dto.setInfo_birth(year+month+day);
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

	
	
}
