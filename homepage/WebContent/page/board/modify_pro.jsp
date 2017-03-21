<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/page/error/errorPage.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
%>

<jsp:useBean id="bdto" class="homepage.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	String login = (String)session.getAttribute("success");
	String writer = request.getParameter("writer");
	if(!writer.equals(login))
		throw new Exception("비정상적인 방법으로 modify_pro.jsp 접근");

	bdao.modify(bdto, no);
	response.sendRedirect("detail.jsp?no="+no);
%>

