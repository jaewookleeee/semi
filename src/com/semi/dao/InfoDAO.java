package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.taglibs.standard.lang.jstl.BooleanLiteral;

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
		String sql = "INSERT INTO info VALUES(?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo_id());
			ps.setString(2, dto.getInfo_pw());
			ps.setDate(3, dto.getInfo_birth());
			ps.setString(4, dto.getInfo_email());
			ps.setString(5, dto.getInfo_gender());
			ps.setString(6, dto.getInfo_name());
			ps.setString(7,"사용자");
			
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
	public boolean login(String id, String pw) {
		boolean result = false;
		String sql = "SELECT info_id FROM info WHERE info_id=? AND info_pw=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			result = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			resClose();
		}
		return result;
	}

}
