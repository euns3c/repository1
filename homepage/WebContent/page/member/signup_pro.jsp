<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<% try{ %>
<jsp:useBean id="mdto" class="homepage.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>

<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<% mdao.signUp(mdto); %>

<script>
	window.alert("가입을 환영합니다.");
	window.opener.location.href="../login/login.jsp";
	window.close();
</script>

<% }catch(Exception e){ %>
<%	e.printStackTrace(); %>
<script>
	window.alert("중복된 아이디입니다.");
	history.back();
</script>
<% } %>