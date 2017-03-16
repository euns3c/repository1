<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>ID 중복 검사</title>

<style>
div{
	width: 280px;
	height: 130px;
	border: 1px solid black;
	border-radius: 5px;
	padding-top: 40px;
	text-align: center;
}
button{
	padding: 4px;
}
</style>

</head>
<body>

<% String id = request.getParameter("id").toString(); %>
	<div>
		<h1><%=id %></h1>
		이미 사용중인 아이디입니다.
		
		<br><br>
		<button onclick="window.close();">Confirm</button>
	</div>
</body>
</html>

