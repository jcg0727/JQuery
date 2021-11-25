<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<pre>
<h1>JSP : Java Server Page</h1>
요청시 jsp가 controller 역할을 수행할 수 있다. 
요청시 클라이언트가 보내는 데이터를 받아서 처리한다.
자바문장과 html문장을 혼합하여 사용할 수 있다.
자바문장을 기술하기 위하여 &lt;%%> 기호를 사용한다.
html 문서에서 java변수를 출력하기 위해서 &lt;%=%> 기호를 사용한다.
</pre>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
아이디는 <%=id%><br>
비밀번호는 <%=pw %>
</body>
</html>