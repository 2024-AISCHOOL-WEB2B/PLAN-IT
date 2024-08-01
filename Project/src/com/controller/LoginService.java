package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setCharacterEncoding("EUC-KR");
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw);
		MemberDTO info = dao.login(dto);
		System.out.println(info);
		
		if(info != null) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("info", info);
			response.sendRedirect("page2.jsp");
		}else {
			System.out.println("로그인 실패");
			response.sendRedirect("main.jsp");
		}
		
		
	}

}
