package com.semi.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.PlaceDAO;
import com.semi.dto.DTO;

public class PlaceService {

	public void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String keyword=request.getParameter("keyword");
		String category=request.getParameter("category");
		String loc=request.getParameter("area");
		int start=Integer.parseInt(request.getParameter("start"));
		int end=Integer.parseInt(request.getParameter("end"));
		System.out.println(keyword+"/"+category+"/"+loc+"/"+start+"/"+end);
		
		PlaceDAO dao=new PlaceDAO();
		ArrayList<DTO> list;
		list=dao.search(start,end,keyword,category,loc);
		
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}
}
