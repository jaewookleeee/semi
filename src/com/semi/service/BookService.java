package com.semi.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.BookDAO;

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
	
}
