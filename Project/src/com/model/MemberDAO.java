package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa5_SpringB_hacksim_5";
			String db_pw = "aishcool5";
			

			con = DriverManager.getConnection(db_url, db_id, db_pw);
			
			System.out.println("db 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("동적 오류");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db 오류");
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("자원 반납 오류");
		}
	}
	
	

	public int join(MemberDTO dto) {
		int cnt = 0;
				
		getConnection();
		try {
			String sql = "INSERT INTO USERS VALUES(?,?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getName());
			psmt.setString(6, dto.getBirth());
			psmt.setString(7, dto.getMarry());
			psmt.setString(8, dto.getGender());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("db오류");
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return cnt;
	}
	
	
	

}
