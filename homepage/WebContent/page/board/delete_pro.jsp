<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	bdao.delete(no);
	response.sendRedirect("list.jsp");
%>