package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.semi.dto.DTO;

public class PlaceDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//DB 접속
	public PlaceDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//자원반납
	public void resClose() {
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<DTO> search(int start, int end, String keyword, String category, String loc) {
		ArrayList<DTO> list=new ArrayList<DTO>();
		int addSQL=3;
		
		/*SELECT place_no, place_name, place_intro, place_category, place_loc 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY place_no DESC) AS rnum, place_no, place_name, place_intro, place_category, place_loc  FROM place)
		WHERE (rnum BETWEEN 1 AND 2) AND place_category = '카테고리' AND place_loc = '지역' AND (place_name || place_intro) LIKE '%검색_키워드%';*/
		
		String sql="SELECT place_no, place_name, place_intro, place_category, place_loc" + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY place_no DESC) AS rnum, place_no, place_name, place_intro, place_category, place_loc  FROM place)\r\n" + 
				" WHERE (rnum BETWEEN ? AND ?)";
		if(!category.equals("none")) {
			sql+=" AND place_category = ?";
		}
		if(!loc.equals("none")) {
			sql+=" AND place_loc = ?";
		}
		if(!keyword.equals("none")) {
			sql+=" AND (place_name || place_intro) LIKE ?";
			//set string 시 %% 추가해야한다.
		}
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			if(!category.equals("none")) {
				ps.setString(addSQL,category);
				addSQL++;
			}
			if(!loc.equals("none")) {
				ps.setString(addSQL, loc);
				addSQL++;
			}
			if(!keyword.equals("none")) {
				ps.setString(addSQL, "%"+keyword+"%");
				addSQL++;
			}
			
			rs=ps.executeQuery();
			
			while (rs.next()) {
				//ResultSet placeRs = null;
				//String infoSql="";
				//ps=conn.
				DTO dto=new DTO();
				dto.setPlace_no(rs.getInt("place_no"));
				dto.setPlace_name(rs.getString("place_name"));
				dto.setPlace_info(rs.getString("place_intro"));
				dto.setPlace_category(rs.getString("place_category"));
				dto.setPlace_loc(rs.getString("place_loc"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
	return list;
}
}
