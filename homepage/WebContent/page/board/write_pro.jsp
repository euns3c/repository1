<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bdto" class="homepage.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<% String id = session.getAttribute("success").toString(); %>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	int no = bdao.write(bdto, id);
	response.sendRedirect("detail.jsp?no="+no);
%>
