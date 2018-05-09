package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.semi.dto.DTO;

public class InfoDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//DB 접속
	public InfoDAO() {
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

	//사용자 회원가입
	public int userJoin(DTO dto) {
		int success = 0;
		String sql = "INSERT INTO info(info_id, info_pw, info_birth, info_email, info_gender, info_name, info_div)"+ 
						"VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo_id());
			ps.setString(2, dto.getInfo_pw());
			ps.setDate(3, dto.getInfo_birth());
			ps.setString(4, dto.getInfo_email());
			ps.setString(5, dto.getInfo_gender());
			ps.setString(6, dto.getInfo_name());
			ps.setString(7,dto.getInfo_div());
			
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return success;
	}

	//로그인
		public String login(String id, String pw) {
			String result = null;
			String sql = "SELECT info_id, info_div FROM info WHERE info_id=? AND info_pw=?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				rs = ps.executeQuery();
				if(rs.next()) {
					result = rs.getString("info_div");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}finally {
				resClose();
			}
			return result;
		}

	//등록자 회원가입
	public int regJoin(DTO dto) {
		int success = 0;
		String sql = "INSERT INTO info(info_id, info_pw, info_birth, info_email, info_gender, info_name, info_div, info_num, info_phone)"+ 
							"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo_id());
			ps.setString(2, dto.getInfo_pw());
			ps.setDate(3, dto.getInfo_birth());
			ps.setString(4, dto.getInfo_email());
			ps.setString(5, dto.getInfo_gender());
			ps.setString(6, dto.getInfo_name());
			ps.setString(7,dto.getInfo_div());
			ps.setString(8, dto.getInfo_num());
			ps.setString(9, dto.getInfo_phone());
			
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return success;
	}

}
