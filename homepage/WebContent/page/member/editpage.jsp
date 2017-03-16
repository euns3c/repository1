<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Edit</title>

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
input{
	padding: 5px;
	border-radius: 5px;
}
.post{
	padding: 3px;
}
input:FOCUS {
	outline: none;
}
span{
	color: red;
	font-size: 14px;
}
</style>

<script>
	function cancel(){
		var cancel = window.confirm("변경한 정보가 저장되지 않습니다. 취소하시겠습니까?");
		if(cancel){
			window.close();
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
        	
        <form name="f" action="editpage_pro.jsp" method="post" onsubmit="return formCh();">
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
	        			<th>*Password</th>
	        			<td>
	        				<input type="password" name="pw" required><br>
	        				<span id="pw_res"></span>
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>*Password Check</th>
	        			<td>
	        				<input type="password" name="pw2" required onkeyup="pwCh();"><br>
	        				<span id="pw2_res"></span>
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>Birth</th>
	        			<td><input type="date" name="birth" value="<%=mdto.getBirth()%>"></td>
	        		</tr>
	        		<tr>
	        			<th>*Phone (-제외)</th>
	        			<td>
	        				<input type="text" name="tel" value="<%=mdto.getTel()%>" maxlength="11" required onblur="telCh();"><br>
	        				<span id="tel_res"></span>
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>E-mail</th>
	        			<td><input type="email" name="email" value="<%=mdto.getEmail()%>"></td>
	        		</tr>
	        		<tr>
	        			<th>Post</th>
	        			<td>
	        				<input type="text" name="post" id="post" value="<%=mdto.getPost()%>" maxlength="6"><br><br>
                        	<button type="button" onclick="findAddress();" class="post">우편번호 검색</button>
                        </td>
	        		</tr>
	        		<tr>
	        			<th>Basic Address</th>
	        			<td><input type="text" name="addr1" id="addr1" value="<%=mdto.getAddr1()%>"></td>
	        		</tr>
	        		<tr>
	        			<th>Detailed Address</th>
	        			<td><input type="text" name="addr2" id="addr2" value="<%=mdto.getAddr2()%>"></td>
	        		</tr>
	        	</table>
        	</div>
            <br>
            <div class="row">
                <div class="form-group col-xs-12" align="center">
                    <button type="submit" class="btn btn-default">Save</button>
                    &nbsp;
                    <button onclick="cancel();" class="btn btn-default">Cancel</button>
                </div>
            </div>
        </form>
        
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
<script src="${pageContext.request.contextPath}/js/contact_me.js"></script>
<script src="${pageContext.request.contextPath}/js/clean-blog.min.js"></script>
<script src="../../js/res.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../js/post.js"></script>

</body>
</html>