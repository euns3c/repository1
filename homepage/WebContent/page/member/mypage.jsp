<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>My Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clean-blog.min.css">
<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

<style>
table{
	color: #999999;
}
th, td{
	padding: 14px;
	border-bottom: 1px solid #EEEEEE;
}
tr{
	margin-top: 20px;
}
</style>

<script>
	function withdraw(){
		var w = window.confirm("정말 탈퇴하시겠습니까?");
		if(w){
			location.href="withdraw_pro.jsp";
		}
	}
</script>

</head>
<body>

<jsp:useBean id="mdto" class="homepage.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="homepage.member.MemberDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("success");
	mdto = mdao.mypage(id);
%>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        	<p align="center">My Page</p>
        	
        	<div align="center">
	        	<table width="100%">
	        		<tr>
	        			<th width="45%">ID</th>
	        			<td width="55%"><%=mdto.getId()%></td>
	        		</tr>
	        		<tr>
	        			<th>Name</th>
	        			<td><%=mdto.getName()%></td>
	        		</tr>
	        		<tr>
	        			<th>Birth</th>
	        			<td><%=mdto.getBirth()%></td>
	        		</tr>
	        		<tr>
	        			<th>Phone</th>
	        			<td><%=mdto.getTel()%></td>
	        		</tr>
	        		<tr>
	        			<th>E-mail</th>
	        			<td><%=mdto.getEmail()%></td>
	        		</tr>
	        		<tr>
	        			<th>Post</th>
	        			<td><%=mdto.getPost()%></td>
	        		</tr>
	        		<tr>
	        			<th>Basic Address</th>
	        			<td><%=mdto.getAddr1()%></td>
	        		</tr>
	        		<tr>
	        			<th>Detailed Address</th>
	        			<td><%=mdto.getAddr2()%></td>
	        		</tr>
	        	</table>
        	</div>
            <br>
            <div class="row">
                <div class="form-group col-xs-12" align="center">
                    <button onclick="location.href='editpage.jsp';" class="btn btn-default">Edit</button>
                    &nbsp;
                    <button onclick="withdraw();" class="btn btn-default">Withdraw</button>
                    &nbsp;
                    <button onclick="window.close();" class="btn btn-default">Exit</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
<script src="${pageContext.request.contextPath}/js/contact_me.js"></script>
<script src="${pageContext.request.contextPath}/js/clean-blog.min.js"></script>

</body>
</html>