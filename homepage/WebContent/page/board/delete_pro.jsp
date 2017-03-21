<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/page/error/errorPage.jsp" %>

<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	String login = (String)session.getAttribute("success");
	String writer = request.getParameter("writer");
	
	if(!writer.equals(login))
		throw new Exception("비정상적인 방법으로 delete_pro.jsp 접근");
	
	int no = Integer.parseInt(request.getParameter("no"));
	bdao.delete(no);
	response.sendRedirect("list.jsp");
%>