package com.semi.service;

/*<<<<<<< HEAD*/
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
/*=======*/
/*import java.io.IOException;*/
/*import java.util.ArrayList;*/
import java.util.HashMap;

/*import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/

import com.google.gson.Gson;
/*>>>>>>> 2d4a6e1d3006e566172be96894695f41d14f9c9f*/
import com.semi.dao.PlaceDAO;
import com.semi.dto.DTO;

public class PlaceService {

/*<<<<<<< HEAD*/
	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		DTO dto = new DTO();
		
		request.setCharacterEncoding("UTF-8");
		
		PlaceDAO dao = new PlaceDAO();
		
		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginid");
		
		String placename = request.getParameter("place_name");
		String categoly = request.getParameter("categoly");
		String placephone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		int cash = Integer.parseInt(request.getParameter("cash"));
		String address ="("+request.getParameter("postnumber")+")"+request.getParameter("addr")+request.getParameter("detailAddr");
		String detailinfo = request.getParameter("fac_info");
		String info = request.getParameter("info");
		String homepage= request.getParameter("homepage");
		String subcontent= request.getParameter("sub_content");
		
		System.out.println(placename+"/"+categoly+"/"+placephone+"/"+start+"/"
		+end+"/"+cash+"/"+address+"/"+detailinfo+"/"+info+"/"+homepage+"/"+subcontent);
		
		dto.setInfo_id(loginid);
		dto.setPlace_name(placename);
		dto.setPlace_category(categoly);
		dto.setPlace_phone(placephone);
		dto.setPlace_start(start);
		dto.setPlace_end(end);
		dto.setPlace_price(cash);
		dto.setPlace_loc(address);
		dto.setPlace_guide(detailinfo);
		dto.setPlace_info(info);
		dto.setPlace_home(homepage);
		dto.setPlace_attention(subcontent);
		long success = dao.write(dto);
		
		String page = "placeWrite.jsp";
		if(success>0) {
			page = "placeDetail?place_no="+success;
		}
		response.sendRedirect(page);
		/*String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root+"upload";
		System.out.println(savePath);
		
		//upload 폴더 없으면 만들어 준다
		File dir = new File(savePath);
		if(!dir.exists()) {//파일이 없으면 생성
			dir.mkdir();
		}
		//MultipartRequest(request,저장경로,용량,인코딩,중복정책(생략)) 로 반환
		MultipartRequest multi = new MultipartRequest(request, savePath,1024*1024*10,"UTF-8");
		
		
		ArrayList<String> photo*/
	}

/*=======*/
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
/*>>>>>>> 2d4a6e1d3006e566172be96894695f41d14f9c9f*/
}
