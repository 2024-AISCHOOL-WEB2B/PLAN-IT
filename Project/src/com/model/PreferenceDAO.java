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

    public int preferenceAdd(PreferenceDTO dto) {
        int cnt = 0;
        getConnection();
        try {
            String sql = "INSERT INTO PREFERENCE (QUESTION_NUM, QUESTION_AW, PR_FK) VALUES (?, ?, ?)";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, dto.getQuestionNum());
            psmt.setString(2, dto.getQuestionAw());
            psmt.setString(3, dto.getPrFk());

            cnt = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("db오류");
        } finally {
            close();
        }
        
        return cnt;
    }
	
	
}
