<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="rdto" class="homepage.board.reply.ReplyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="homepage.board.reply.ReplyDAO"></jsp:useBean>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>

<%
	rdao.reply(rdto);
	
	int belong = Integer.parseInt(request.getParameter("belong"));
	bdao.upReply(belong); //댓글수 올려주는 메소드 호출
	
	response.sendRedirect("detail.jsp?no=" + belong);
%>