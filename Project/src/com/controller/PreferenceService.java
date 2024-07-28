package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.PreferenceDAO;
import com.model.PreferenceDTO;

@WebServlet("/PreferenceService")
public class PreferenceService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
        
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId"); 
        
        String pr1 = request.getParameter("pr1");
        String pr2 = request.getParameter("pr2");
        String pr3 = request.getParameter("pr3");
        String pr4 = request.getParameter("pr4");
        String pr5 = request.getParameter("pr5");

        String[] questionNums = { "1", "2", "3", "4", "5" };
        String[] questionAnswers = { pr1, pr2, pr3, pr4, pr5 };
        
        PreferenceDAO dao = new PreferenceDAO();

        for (int i = 0; i < questionNums.length; i++) {
            PreferenceDTO dto = new PreferenceDTO(questionNums[i], questionAnswers[i], userId);
            int cnt = dao.preferenceAdd(dto);
            if (cnt > 0) {
                System.out.println("추가 성공");
            } else {
                System.out.println("추가 실패");
            }
        }
		
	}

}
