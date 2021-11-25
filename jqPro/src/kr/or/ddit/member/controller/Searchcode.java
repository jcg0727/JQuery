package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.zip.vo.ZipVO;

@WebServlet("/SearchCode")
public class Searchcode extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String dong = request.getParameter("dong");
      MemberServiceImpl service = (MemberServiceImpl) MemberServiceImpl.getInstance();
      List<ZipVO> list = service.searchCode(dong);
      request.setAttribute("zipCode", list);
      request.getRequestDispatcher("0709/codeResult.jsp").forward(request, response);;
         
      
      
   }
}