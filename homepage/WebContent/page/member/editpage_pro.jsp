<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/page/error/errorPage.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mdto" class="homepage.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("success");

	if(id == null){
		throw new Exception("비로그인 상태로 회원정보 수정 페이지 접근");
	}else{
	mdao.edit(mdto, id);
	response.sendRedirect("mypage.jsp");
	}
%>