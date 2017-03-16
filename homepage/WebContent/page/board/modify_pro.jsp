<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
%>

<jsp:useBean id="bdto" class="homepage.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	bdao.modify(bdto, no);
	response.sendRedirect("detail.jsp?no="+no);
%>

