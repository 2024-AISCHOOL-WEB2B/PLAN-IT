package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;





@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String kf = request.getParameter("kf");
		String marry = request.getParameter("marry");
		
		
		
		
		
		
		MemberDTO dto = new MemberDTO(id, pw, name, birth, phone, gender, kf, marry);
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.join(dto);
		
		if(cnt>0) {
			System.out.println("회원 추가 성공");
		}else {
			System.out.println("회원 추가 실패");
		}
		
		
		response.sendRedirect("main.jsp");
		
	}

}
