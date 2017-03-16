<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/page/layout/header.jsp" %>
<!-- login_pro에 returnURL을 넘겨주기 위함. form에서 hidden으로 넘어가기 때문에 여기서 설정 -->
<%
	String returnURL = request.getParameter("returnURL");
	if(returnURL == null){
		returnURL = request.getContextPath();
	}
%>
<header class="intro-header" style="background-image: url('../../img/login.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Login</h1>
                    <hr class="small">
                    <span class="subheading">If you did not sign our page up, Sign up through the below button.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <form action="login_pro.jsp" method="post">
            <input type="hidden" name="returnURL" value="<%=returnURL%>">
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>ID</label>
                        <input type="text" class="form-control" placeholder="ID" name="id" required="required">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="Password" name="pw" required="required">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <br>
                <div id="success"></div>
                <div class="row">
                    <div class="form-group col-xs-12" align="right">
                        <button type="submit" class="btn btn-default">Login</button>
                        &nbsp;&nbsp;
                        <button onclick="signup()" class="btn btn-default">Sign up</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<hr>

<%@ include file="/page/layout/footer.jsp" %>