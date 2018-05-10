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
						"VALUES(?, ?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?, ?)";
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
							"VALUES(?, ?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?)";
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

	//아이디 중복체크
	public boolean overlay(String id) {
		boolean result = false;
		String sql = "SELECT info_id FROM info WHERE info_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			resClose();
		}
		return result;
	}

	public ArrayList<DTO> userList() {
		ArrayList<DTO> userList = new ArrayList<>();
		String sql = "SELECT info_id, info_name, info_gender, info_email, info_div, info_num, info_phone FROM info ORDER BY info_id ASC";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setInfo_id(rs.getString("info_id"));
				dto.setInfo_name(rs.getString("info_name"));
				dto.setInfo_gender(rs.getString("info_gender"));
				dto.setInfo_email(rs.getString("info_email"));
				dto.setInfo_div(rs.getString("info_div"));
				dto.setInfo_num(rs.getString("info_num"));
				dto.setInfo_phone(rs.getString("info_phone"));
				userList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		return userList;
	}

	//사용자 회원정보 수정
	public int userUpdate(DTO dto) {
		int success = 0;
		String sql = "UPDATE info SET info_pw=?, info_birth=?, info_email=?, info_gender=?, info_name=? WHERE info_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo_pw());
			ps.setDate(2, dto.getInfo_birth());
			ps.setString(3, dto.getInfo_email());
			ps.setString(4, dto.getInfo_gender());
			ps.setString(5, dto.getInfo_name());
			ps.setString(6, dto.getInfo_id());
			
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
