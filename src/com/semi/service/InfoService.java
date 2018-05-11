package com.semi.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.BooleanLiteral;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
		
		String birth = year+"-"+month+"-"+day;
		
		Date date = Date.valueOf(birth);
		System.out.println(id+", "+pw+", "+name+", "+gender+", "+email+", "+date);
		
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
		
		String birth = year+"-"+month+"-"+day;

		Date date = Date.valueOf(birth);
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
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		response.sendRedirect("index.jsp");
	}

	//아이디 중복 체크
	public void overlay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		
		InfoDAO dao = new InfoDAO();
		boolean result = dao.overlay(id);
		
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<>();
		map.put("result", result);
		String obj = json.toJson(map);
		System.out.println(obj);
		response.getWriter().println(obj);
	}

	//회원 리스트 출력
	public void userList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InfoDAO dao = new InfoDAO();
		ArrayList<DTO> userList = dao.userList();
		
		String loginId = (String) request.getSession().getAttribute("loginId");
		String loginDiv = (String) request.getSession().getAttribute("loginDiv");
		
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		
		if(loginId != null && loginDiv.equals("관리자")) {
			map.put("login", true);
		}else{
			map.put("login", false);
		}
		
		map.put("userList", userList);
		
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
		
		
	}
	
	//사용자 회원정보 수정
	public void userUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException   {
		request.setCharacterEncoding("UTF-8");

		String loginId = (String) request.getSession().getAttribute("loginId");
		String loginDiv = (String) request.getSession().getAttribute("loginDiv");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String newPw = request.getParameter("newPw");
		String newPwChk = request.getParameter("newPwChk");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String email = request.getParameter("email");
		
		String birth = year+"-"+month+"-"+day;
		Date date = Date.valueOf(birth);
		
		System.out.println(id+", "+pw+", "+newPw+", "+newPwChk+", "+name+", "+
				gender+", "+date+", "+email);

		InfoDAO dao = new InfoDAO();
		DTO dto = new DTO();
		
		String chk = dao.pwChk(id);
		
		
		int success = 0;
		if(pw.equals(chk)) {
			System.out.println("현재 비밀번호 맞음");
			dto.setInfo_id(id);
			dto.setInfo_pw(newPw);
			dto.setInfo_name(name);
			dto.setInfo_gender(gender);
			dto.setInfo_birth(date);
			dto.setInfo_email(email);

			success = dao.userUpdate(dto);
		}else {
			System.out.println("현재 비밀번호 틀림");
			
		}
		
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
			
		if(loginId != null && loginDiv.equals("사용자") || loginDiv.equals("등록자")) {
			map.put("login",true);
			System.out.println(loginId+", "+loginDiv);
		}else {
			map.put("login",false);
		}
		
		/*if(loginId != null && loginDiv.equals("등록자")) {
			map.put("login",true);
			System.out.println(loginId+", "+loginDiv);
		}else {
			map.put("login",false);
		}*/
		
		map.put("success", success);
		
		String obj = json.toJson(map);
		System.out.println(obj);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
		
		
	}
	
		//예약내역확인
		public void bookList(HttpServletRequest request, HttpServletResponse response) 
				throws IOException {
			String id = (String) request.getSession().getAttribute("loginId"); //세션의 loginId라는 속성 추출
			System.out.println(id);
			if(id == null) {//loginId의 값이 null 이라면(비로그인 상태라면)
				Gson json = new Gson(); //json을 준비
				HashMap<String, String> map = new HashMap<String, String>(); //key와 value 둘다 String 타입의 HashMap 준비
				map.put("msg", "권한이 없는 서비스입니다."); // map에 보낼 값 넣기
				
				String obj = json.toJson(map); // map 변환
				
				response.setContentType("test/html; charset=UTF-8"); //한글도 같이 보내니까 한글 깨짐 방지
				response.getWriter().println(obj); //response로 보냄
			}else { //로그인 상태라면
				int start = Integer.parseInt(request.getParameter("sNum")); //paging할 시작 번호 추출
				int end = Integer.parseInt(request.getParameter("eNum")); // paging할 마지막 번호 추출
				System.out.println(start+"/"+end); // 들어온 값 맞는 지 확인
				InfoDAO dao = new InfoDAO();  //InfoDAO 호출
				
				ArrayList<DTO> list = dao.bookList(id, start, end); //bookList 실행
				Gson json = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); //json객체 생성과 Date 타입 형태 정의
				HashMap<String, Object> map = new HashMap<String, Object>(); //담을 맵 객체화
				map.put("list", list); // map에 값 넣기
				String obj = json.toJson(map); // map의 값을 json으로 변환
				response.setContentType("text/html; charset=UTF-8");  //한글깨짐방지
				response.getWriter().println(obj); //response로 값 보냄
			}
		}

		//회원탈퇴
		public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
			InfoDAO dao = new InfoDAO();
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			String chk = dao.pwChk(id);
			int success = 0;
			
			if(chk.equals(pw)) {
				success = dao.del(id);
				request.getSession().removeAttribute("loginId");
				System.out.println(request.getSession().getAttribute("loginId"));
			}
			
			Gson json = new Gson();
			HashMap<String, Object> map = new HashMap<>();
			map.put("success", success);
			String obj = json.toJson(map);
			System.out.println(obj);
			response.getWriter().println(obj);
		}

		//등록자 회원정보 수정
		public void regUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			
			String loginId = (String) request.getSession().getAttribute("loginId");
			String loginDiv = (String) request.getSession().getAttribute("loginDiv");
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String newPw = request.getParameter("newPw");
			String newPwChk = request.getParameter("newPwChk");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String email = request.getParameter("email");
			String num = request.getParameter("num");
			String phone = request.getParameter("phone");
			
			String birth = year+"-"+month+"-"+day;
			Date date = Date.valueOf(birth);
			
			System.out.println(id+", "+pw+", "+newPw+", "+newPwChk+", "+name+", "+
					gender+", "+date+", "+email+", "+num+", "+phone);

			InfoDAO dao = new InfoDAO();
			DTO dto = new DTO();
			
			String chk = dao.pwChk(id);
			
			int success = 0;
			if(pw.equals(chk)) {
				System.out.println("현재 비밀번호 맞음");
				dto.setInfo_id(id);
				dto.setInfo_pw(newPw);
				dto.setInfo_name(name);
				dto.setInfo_gender(gender);
				dto.setInfo_birth(date);
				dto.setInfo_email(email);
				dto.setInfo_num(num);
				dto.setInfo_phone(phone);
				success = dao.regUpdate(dto);
			}else {
				System.out.println("현재 비밀번호 틀림");
			}
			
			
			Gson json = new Gson();
			HashMap<String, Object> map = new HashMap<>();
				
			if(loginId != null && loginDiv.equals("사용자") || loginDiv.equals("등록자")) {
				map.put("login",true);
				System.out.println(loginId+", "+loginDiv);
			}else {
				map.put("login",false);
			}

			map.put("success", success);
			
			String obj = json.toJson(map);
			System.out.println(obj);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println(obj);
			
		}
		
		//찜내역 확인
		public void likeList(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String id = (String) request.getSession().getAttribute("loginId"); //세션의 loginId라는 속성 추출
			System.out.println(id);
			if(id == null) {//loginId의 값이 null 이라면(비로그인 상태라면)
				Gson json = new Gson(); //json을 준비
				HashMap<String, String> map = new HashMap<String, String>(); //key와 value 둘다 String 타입의 HashMap 준비
				map.put("msg", "권한이 없는 서비스입니다."); // map에 보낼 값 넣기
				
				String obj = json.toJson(map); // map 변환
				
				response.setContentType("test/html; charset=UTF-8"); //한글도 같이 보내니까 한글 깨짐 방지
				response.getWriter().println(obj); //response로 보냄
			}else {
				int start = Integer.parseInt(request.getParameter("sNum")); //paging할 시작 번호 추출
				int end = Integer.parseInt(request.getParameter("eNum")); // paging할 마지막 번호 추출
				//System.out.println(start+"/"+end); // 들어온 값 맞는 지 확인
				InfoDAO dao = new InfoDAO(); 
				
				ArrayList<DTO> list = dao.likeList(id, start, end);
				Gson json = new Gson();
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				String obj = json.toJson(map);
				response.setContentType("text/html; charset=UTF-8"); 
				response.getWriter().println(obj);
			}
		}
}
