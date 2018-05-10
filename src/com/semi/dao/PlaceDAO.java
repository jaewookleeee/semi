package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public long write(DTO dto) {
		String sql="INSERT INTO place(place_no,info_id,place_name,place_intro,place_home"+
	"place_loc,place_guid,place_attention,place_date,place_category)"+"VALUES(place_seq.NEXTVAL,?,?,?,?,?,?,?,SYSDATE,?,?)";
		long success=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo_id());
			ps.setString(2, dto.getPlace_name());
			ps.setString(3, dto.getPlace_info());
			ps.setString(4, dto.getPlace_home());
			ps.setString(5, dto.getPlace_loc());
			ps.setString(6, dto.getPlace_guide());
			ps.setString(7, dto.getPlace_attention());
			ps.setString(8, dto.getPlace_category());
			ps.setString(9, dto.getPlace_phone());
			int a=ps.executeUpdate();
			System.out.println(a+"place 성공여부");
			rs = ps.getGeneratedKeys();
			if(rs.next()) {
				success = rs.getLong(1);
				sql="INSERT INTO placeinfo(place_no,place_start,place_end,place_price) VALUES(?,to_date(?,'hh24:mi'),to_date(?,'hh24:mi'),?)";
				ps=conn.prepareStatement(sql);
				ps.setLong(1, success);
				ps.setString(2, dto.getPlace_start());
				ps.setString(3, dto.getPlace_end());
				ps.setLong(4, dto.getPlace_price());
				int b=ps.executeUpdate();
				System.out.println(b+"place_info 성공여부");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			resClose();
		}
		
		return success;
	}
}
