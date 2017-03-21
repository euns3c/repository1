<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/page/error/errorPage.jsp" %>

<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("success");

	if(id == null){
		throw new Exception("비로그인 상태로 회원탈퇴 페이지 접근");
	}else{
	mdao.withdraw(id);
	session.removeAttribute("success");
	}
%>
<script>
	window.alert("정상적으로 탈퇴 처리되었습니다.");
	window.close();
	window.opener.location.href="../../index.jsp";
</script>