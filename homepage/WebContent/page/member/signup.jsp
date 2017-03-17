<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Sign up</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clean-blog.min.css">
<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

<style>
span{
	color: red;
	font-size: 14px;
}
</style>

<script>
	function idOverCheck(id){
		if(document.f.id.value==""){
			window.alert("ID를 입력하세요.");
			document.f.id.select();
		}else{
			url = "idOverCheck.jsp?id="+id;
			window.open(url, "id", "width=300px, height=150px, left=200px");
		}
	}
	
	function cancel(){
		var cancel = window.confirm("작성한 정보가 삭제됩니다. 취소하시겠습니까?");
		if(cancel){
			window.close();
		}
	}
</script>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        	<p align="center">Sign up</p>
        	
            <form name="f" action="signup_pro.jsp" method="post" onsubmit="return formCh();">
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>ID</label>
                        <input type="text" class="form-control" placeholder="*ID" name="id" required onblur="idCh();">
                        <button type="button" onclick="idOverCheck(document.f.id.value);">ID중복확인</button>&nbsp;&nbsp;
                        <span id="id_res"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Name</label>
                        <input type="text" class="form-control" placeholder="*Name" name="name" required
                        maxlength="20" onblur="nameCh();">
                        <span id="name_res"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="*Password" name="pw" required
                        maxlength="20">
                        <span id="pw_res"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Password Check</label>
                        <input type="password" class="form-control" placeholder="*Password Check" name="pw2" required
                        maxlength="20" onkeyup="pwCh();">
                        <span id="pw2_res"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Birth</label>
                        <input type="date" class="form-control" name="birth">
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Phone</label>
                        <input type="text" class="form-control" placeholder="*Phone (-제외)" name="tel" required
                        maxlength="11" onblur="telCh();">
                        <span id="tel_res"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>E-mail</label>
                        <input type="text" class="form-control" placeholder="E-mail" name="email">
                        <span id="email"></span>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>우편번호</label>
                        <input type="text" class="form-control" placeholder="우편번호" name="post" id="post" maxlength="6">
                        <button type="button" onclick="findAddress();">우편번호 검색</button>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>기본주소</label>
                        <input type="text" class="form-control" placeholder="기본주소" name="addr1" id="addr1">
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>상세주소</label>
                        <input type="text" class="form-control" placeholder="상세주소" name="addr2" id="addr2">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-xs-12" align="center">
                        <button type="submit" class="btn btn-default">Send</button>
                        &nbsp;
                        <button type="button" onclick="cancel();" class="btn btn-default">Cancel</button>
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