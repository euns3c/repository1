<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String returnURL = request.getParameter("returnURL"); %>

<jsp:useBean id="ldao" class="homepage.member.MemberDAO"></jsp:useBean>
<% boolean result = ldao.login(id, pw); %>

<% if(result){ %>
<% session.setAttribute("success", id); %>
<% response.sendRedirect(returnURL); %>
<% }else{ %>
	<script>
	window.alert("입력하신 정보가 일치하지 않습니다.");
	history.back();
	</script>
<% } %>