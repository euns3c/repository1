<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String abs = request.getContextPath(); %>
<% String curURL = request.getRequestURL().toString(); %>
<% //파라미터가 있을 경우 해당 부분을 주소에 추가 예) ?no=53
	if(request.getQueryString() != null){
		curURL += "?";
		curURL += request.getQueryString();
	} %>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Portfolio by KES</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Theme CSS -->
<!-- ${pageContext.request.contextPath} : 동적인 방법으로 절대주소 /homepage를 뽑기 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clean-blog.min.css">
<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

<style>
.dropdown .dropdown-toggle{
	color: black;
	background: none;
}
.dropdown .dropdown-menu li a{
	color: black;
	background: none;
}
</style>

<script>
function signup(){
	window.open("<%=abs%>/page/member/signup.jsp", "signup", "width=600px, height=750px");
}
function mypage(){
	window.open("<%=abs%>/page/member/mypage.jsp", "mypage", "width=500px, height=600px");
}
</script>
	
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="<%=abs%>/index.jsp">Portfolio by KES</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="<%=abs%>/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="<%=abs%>/page/about.jsp">About</a>
                    </li>
                    <li>
                        <a href="<%=abs%>/page/board/list.jsp">Board</a>
                    </li>
                    <li>
                    	<a href="<%=abs%>/page/survey/survey.jsp">Survey</a>
                    </li>
                    <%if(session.getAttribute("success") != null){%> <!-- 로그인 상태 -->
                    <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=session.getAttribute("success")%><span class="caret"></span></a>
		                <ul class="dropdown-menu" role="menu">
		                  <li><a href="#" onclick="mypage();">My Page</a></li>
		                  <li><a href="<%=abs%>/page/login/logout.jsp?returnURL=<%=curURL%>">Logout</a></li>
		                </ul>
		            </li>
                    <%}else{%> <!-- 로그아웃 상태 -->
                    <li>
                        <a href="<%=abs%>/page/login/login.jsp?returnURL=<%=curURL%>">Login</a>
                    </li>
                    <li>
                        <a href="#" onclick="signup();">Sign Up</a>
                    </li>
                    <%}%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
