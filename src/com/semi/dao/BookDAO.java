package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.semi.dto.DTO;

public class BookDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//DB 접속
	public BookDAO() {
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

	public int delete(String[] delList) {
		int delCnt=0;
		String sql = "DELETE FROM book WHERE book_no=?";
		try {
			for(int i=0; i<delList.length;i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(delList[i]));
				delCnt += ps.executeUpdate();
				ps.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			resClose();
		}
		return delCnt;
	}

	//예약하기
	public int bookWrite(DTO dto, String loginId) {
		int success = 0;
		String sql = "INSERT INTO book(book_no, place_no, info_id, book_date, book_start, book_end, book_price, book_custom) "+
		"VALUES(book_seq.NEXTVAL, ?, ?, TO_DATE(?,'YYYY-MM-DD'), TO_DATE(?,'hh24:mi'), TO_DATE(?,'hh24:mi'), ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getPlace_no());
			ps.setString(2, loginId);
			ps.setDate(3, dto.getBook_date());
			ps.setString(4, dto.getBook_start());
			ps.setString(5, dto.getBook_end());
			ps.setLong(6, dto.getBook_price());
			ps.setInt(7, dto.getBook_custom());
			
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
