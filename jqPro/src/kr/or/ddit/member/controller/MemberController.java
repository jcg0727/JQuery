package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;


@WebServlet("/Member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//요청데이터 받기
		String mId = request.getParameter("mId");
		//service객체 얻어오기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service 메소드 호출 - 값 얻기
		String idCheck = service.idCheck(mId);
		
		
		//jsp로 값 전달하기 - forward
		request.setAttribute("idCheck", idCheck);
		RequestDispatcher disp = request.getRequestDispatcher("0709/idCheck.jsp");
		disp.forward(request, response);
	
	
	
	}

}
