package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.PreferenceDAO;
import com.model.PreferenceDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String q1 = request.getParameter("q1");
		String q2 = request.getParameter("q2");
		String q3 = request.getParameter("q3");
		String q4 = request.getParameter("q4");
		String q5 = request.getParameter("q5");
		
		System.out.println("q1: " + q1);  // 수정
		System.out.println("q2: " + q2);  // 수정
		System.out.println("q3: " + q3);  // 수정
		System.out.println("q4: " + q4);  // 수정
		System.out.println("q5: " + q5);  // 수정

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String kf = request.getParameter("kf");
		String marry = request.getParameter("marry");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw, name, birth, phone, gender, kf, marry);
		
		

		int cnt = dao.join(dto);
		System.out.println(q1+q2+q3+q4+q5);
		if (cnt > 0) {
			System.out.println("회원 추가 성공");
			
		} else {
			System.out.println("회원 추가 실패");
		}
		
		PreferenceDTO prdto = new PreferenceDTO(q1, q2, q3, q4, q5, id);
		
		PreferenceDAO prdao = new PreferenceDAO();
		
		int prcnt = prdao.preferenceAdd(prdto);

		if (prcnt > 0) {
			System.out.println("설문 추가 성공");
		} else {
			System.out.println("설문 추가 실패");
		}

		

		//response.sendRedirect("main.jsp");

	}

}
