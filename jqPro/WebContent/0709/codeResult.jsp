<%@page import="kr.or.ddit.zip.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ZipVO> list = (List<ZipVO>) request.getAttribute("zipCode");
%>

<table border="1">
  <tr>
    <th>우편번호</th>
    <th>주소</th>
    <th>번지</th>
  </tr>
<% 
for(ZipVO vo : list){
%>
  <tr>
    <td><%=vo.getZipcode()%></td>
    <td><%=vo.getSido()+" "%><%=vo.getGugun()+" "%><%=vo.getDong()%></td>
    <td><%=vo.getBunji()%></td>
  </tr>
<%
}
%>
</table>