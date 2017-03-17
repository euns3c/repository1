<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>ID중복검사</title>

<style>
table{
	border: 1px solid #0085A1;
	border-radius: 5px;
	text-align: center;
	padding: 5px;
}
button{
	padding: 4px;
}
#id{
	color: #0085A1;
	font-size: 30px;
	font-weight: bold;
	background-color: #EAEAEA;
}
</style>

</head>
<body>

<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	boolean result = mdao.idOverCheck(id);
%>
	<table width="100%" height="140px">
		<tr>
			<td id="id"><%=id %></td>
		</tr>
		<tr>
			<td>
				<%if(result){ %>
				이미 사용중인 아이디입니다.
				<%}else{ %>
					사용 가능한 아이디입니다.
				<%} %>
			</td>
		</tr>
		<tr>
			<td>
				<%if(result){ %>
					<button onclick="window.close(); opener.f.id.select();">Confirm</button>
				<%}else{ %>
					<button onclick="window.close(); opener.f.name.focus();">Confirm</button>
				<%} %>
			</td>
		</tr>
	</table>
</body>
</html>

