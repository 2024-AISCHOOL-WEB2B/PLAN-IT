package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreferenceDAO {
	
	
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


	public int preferenceAdd(PreferenceDTO prdto) {
	    int prcnt = 0;
	    String[] arr2 = {"q1","q2","q3","q4","q5"};
	    String[] arr = {prdto.getQ1(),prdto.getQ2(),prdto.getQ3(),prdto.getQ4(),prdto.getQ5()};
	    getConnection(); // 연결 한 번만 호출
	    try {
	        for(int i = 0 ; i<5; i++) {
	            String sql = "INSERT INTO PREFERENCE (QUESTION_NUM, QUESTION_AW, PR_FK) VALUES (?, ?, ?)";
	            psmt = con.prepareStatement(sql);
	            psmt.setString(1, arr2[i]);
	            psmt.setString(2, arr[i]);
	            psmt.setString(3, prdto.getId());

	            prcnt += psmt.executeUpdate();
	        }
	    } catch (SQLException e) {
	        System.out.println("db오류");
	        e.printStackTrace();
	    } finally {
	        close();
	    }

	    return prcnt;
	}

	}
	
	

