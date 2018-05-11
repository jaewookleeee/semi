package com.semi.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import java.util.HashMap;

import com.google.gson.Gson;

import com.semi.dao.PlaceDAO;
import com.semi.dto.DTO;

public class PlaceService {

	public void Write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savePath = null;
	      String root = request.getSession().getServletContext().getRealPath("/");
	      savePath = root + "upload/";
	      System.out.println("사진 저장 경로 : " + savePath);
	      
	      File dir = new File(savePath);
	      // upload 폴더 없으면 만들어 준다.
	      if (!dir.exists()) {
	         dir.mkdir();
	      }
	      
		MultipartRequest multi = new MultipartRequest(request, savePath, 1024 * 1024 * 10, "UTF-8");
		DTO dto = new DTO();
		
		request.setCharacterEncoding("UTF-8");
		
		PlaceDAO dao = new PlaceDAO();
		
		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginId");

		//System.out.println(multi.getParameter("place_name"));
		String placename = multi.getParameter("place_name");
		String categoly = multi.getParameter("categoly");
		String placephone=multi.getParameter("phone1")+multi.getParameter("phone2")+multi.getParameter("phone3");
		String start = multi.getParameter("start");
		String end = multi.getParameter("end");
		//System.out.println(multi.getParameter("cash"));
		long cash = Integer.parseInt(multi.getParameter("cash"));
		String address ="("+multi.getParameter("postnumber")+")"+multi.getParameter("addr")+multi.getParameter("detailAddr");
		String detailinfo = multi.getParameter("fac_info");
		String info = multi.getParameter("info");
		String homepage= multi.getParameter("homepage");
		String subcontent= multi.getParameter("sub_content");
		
		System.out.println(placename+"/"+loginid+"/"+categoly+"/"+placephone+"/"+start+"/"
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
		

	      ArrayList<DTO> list = new ArrayList<>();
	      for (int i = 1; i <= 5; i++) {
			DTO dto2 = new DTO();
		    String oriFileName = multi.getFilesystemName("photo"+i);
		    if (oriFileName != null) {
		       // 확장자 추출
		       String ext = oriFileName.substring(oriFileName.indexOf("."));
		       // 새파일명 만들기(새파일명+확장자)
		       String newFileName = success+"_"+i+ ext;
		       // 파일명 변경
		       File oldFile = new File(savePath + "/" + oriFileName);
		       File newFile = new File(savePath + "/" + newFileName);
		       oldFile.renameTo(newFile);
		       // 변경된 파일명 DTO에 추가
		       dto2.setPlace_photo(newFileName);
		       list.add(dto2);
		    }
		    
		 }
		 dao.photowrite(list,success);

	         String page = "placeWrite.jsp";
	 		if(success>0) {
	 			page = "placeDetail?place_no="+success;
	 		}
	 		response.sendRedirect(page);
	}

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


	public void detailphoto(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String number = request.getParameter("place_no");
		System.out.println(number);
		PlaceDAO dao = new PlaceDAO();
		ArrayList<DTO> list= dao.detailphoto(number);
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}
	public void likeDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//받아온 값 받음
		String[] like_id = request.getParameterValues("delList[]");
		System.out.println(like_id.length);
		//doa로 넘겨줌
		PlaceDAO dao = new  PlaceDAO();
		int delCnt = dao.likeDel(like_id);
		boolean success = false;
		
		//지운갯수와 넘어온 갯수가 같으면
		if(delCnt == like_id.length) {
			success = true;
		}
		
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);	
	}
}
