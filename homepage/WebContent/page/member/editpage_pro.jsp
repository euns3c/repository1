<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mdto" class="homepage.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("success");
	mdao.edit(mdto, id);
	response.sendRedirect("mypage.jsp");
%>