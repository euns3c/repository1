<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("success");
	mdao.withdraw(id);
	session.removeAttribute("success");
%>
<script>
	window.alert("정상적으로 탈퇴 처리되었습니다.");
	window.close();
	window.opener.location.href="../../index.jsp";
</script>