package com.semi.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.QaDAO;
import com.semi.dto.DTO;

public class QaService {

	// Q&A 쓰기(완)
	public void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			int success = 0;
			
			int place_no = Integer.parseInt(request.getParameter("place_no"));
			String qa_title = request.getParameter("qa_title");
			String qa_content = request.getParameter("qa_content");
			String info_id = (String) request.getSession().getAttribute("loginId");
						
			QaDAO dao = new QaDAO();
			DTO dto = new DTO();
			
			dto.setPlace_no(place_no);
			dto.setQa_title(qa_title);
			dto.setQa_content(qa_content);
			dto.setInfo_id(info_id);
			
			success = dao.write(dto);
			String msg = "Q&A 작성에 성공했습니다.";
			if(success == 0) {
				msg = "Q&A 작성에 실패했습니다.";
			}
			
			request.setAttribute("msg", msg);
			
			System.out.println("qa_no: "+dto.getQa_no());
			RequestDispatcher dis = request.getRequestDispatcher("qaDetail?qa_no="+dto.getQa_no());
			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Q&A 리스트(완)
	public void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int place_no = Integer.parseInt(request.getParameter("place_no"));
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		
		QaDAO dao = new QaDAO();
		ArrayList<DTO> list = dao.list(place_no, start, end);
		
		Gson gson = new Gson();
		HashMap<String, ArrayList<DTO>> map = new HashMap<>();
		map.put("list", list);
		
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(obj);
	}
	
	// Q&A 상세보기(완)
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
		
		DTO dto = new DTO();
		QaDAO dao = new QaDAO();
		dto = dao.detail(qa_no);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("qaDetail.jsp");
		dis.forward(request, response);
	}

	// Q&A 수정 폼(완)
	public void updateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
		
		QaDAO dao = new QaDAO();
		DTO dto = new DTO();
		dto = dao.detail(qa_no);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("./qaUpdateForm.jsp?qa_no="+qa_no);
		dis.forward(request, response);
	}
	
	// Q&A 수정(완)
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
		String qa_title = request.getParameter("qa_title");
		String qa_content = request.getParameter("qa_content");
		
		DTO dto = new DTO();
		dto.setQa_no(qa_no);
		dto.setQa_title(qa_title);
		dto.setQa_content(qa_content);
		
		QaDAO dao = new QaDAO();
		int success = dao.update(dto);
		
		String msg = "Q&A 수정에 성공했습니다.";
		if(success == 0) {
			msg = "Q&A 수정에 실패했습니다.";
		}
		
		request.setAttribute("msg", msg);
		RequestDispatcher dis = request.getRequestDispatcher("qaDetail?qa_no"+qa_no);
		dis.forward(request, response);
	}
	
	// Q&A 삭제(완)
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
	
		QaDAO dao = new QaDAO();
		int place_no = dao.delete(qa_no);
		response.sendRedirect("placeDetailUp?place_no="+place_no+"&page=qa.jsp");
	}

	// Q&A 답변 쓰기(완) -수정 완
	public void qaReplyWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		String qa_reply_content = request.getParameter("qa_reply_content");
		String info_id = request.getParameter("info_id");
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
		
		DTO dto = new DTO();
		dto.setQareply_content(qa_reply_content);
		dto.setInfo_id(info_id);
		dto.setQa_no(qa_no);
		
		QaDAO dao = new QaDAO();
		int success = dao.qaReplyWrite(dto);

		if(success > 0) {
			Gson gson = new Gson();
			HashMap<String, DTO> map = new HashMap<>();
			map.put("dto", dto);
			
			String obj = gson.toJson(map);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(obj);
		} else {
			System.out.println("Q&A 답변 작성에 실패했습니다.");
		}
	}

	// Q&A 답변 수정(완) 
	public void qaReplyUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int qareply_no = Integer.parseInt(request.getParameter("qareply_no"));
		String qareply_content = request.getParameter("qareply_content");
		
		QaDAO dao = new QaDAO();
		int qa_no = dao.qaReplyUpdate(qareply_no, qareply_content);
		
		Gson gson = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("qa_no", qa_no);
		
		String obj = gson.toJson(map);
		response.getWriter().write(obj);
	}

	// Q&A 답변 리스트(완)
	public void qaReplyList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int qa_no = Integer.parseInt(request.getParameter("qa_no"));
		
		QaDAO dao = new QaDAO();
		ArrayList<DTO> list = dao.qaReplyList(qa_no);
	
		if(list != null) {
			Gson gson = new Gson();
			HashMap<String, ArrayList<DTO>> map = new HashMap<>();
			map.put("list", list);
		
			String obj = gson.toJson(map);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(obj);
		} else {
			System.out.println("Q&A 답글 리스트가 없습니다.");
		}
	}

	// Q&A 답변 삭제(완)
	public void qaReplyDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qareply_no = Integer.parseInt(request.getParameter("qareply_no"));
		
		QaDAO dao = new QaDAO();
		int qa_no = dao.qaReplyDelete(qareply_no);
		
		String msg = "Q&A 삭제에 실패했습니다.";
		if(qa_no > 0) {
			msg = "Q&A 삭제에 성공했습니다.";
		}
		
		request.setAttribute("msg", msg);
		RequestDispatcher dis = request.getRequestDispatcher("qaDetail?qa_no="+qa_no);
		dis.forward(request, response);
	}

	public void search(HttpServletRequest request, HttpServletResponse response) {
		
	}

	// Q&A 수정 폼 요청(완)
	public void writeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int place_no = Integer.parseInt(request.getParameter("place_no"));
		
		request.setAttribute("place_no", place_no);
		RequestDispatcher dis = request.getRequestDispatcher("qaWrite.jsp");
		dis.forward(request, response);
	}

	// Q&A 리스트 사이즈 요청
	public void listSize(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int place_no = Integer.parseInt(request.getParameter("place_no"));
		
		QaDAO dao = new QaDAO();
		int max_size = dao.listSize(place_no);
		
		Gson gson = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("max_size", max_size);
		
		String obj = gson.toJson(map);
		response.getWriter().write(obj);
	}
}
