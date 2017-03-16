<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/page/layout/header.jsp" %>

<header class="intro-header" style="background-image: url('../../img/survey.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Survey</h1>
                    <hr class="small">
                    <span class="subheading">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1" align="center">
        	<h2>How do you think about my page?</h2>
        	<form action="result.jsp" method="get">
        	<div align="left" style="width: 150px; height: 150px; padding-top: 30px; padding-left: 15px;">
	        	<input type="radio" name="s" value="nice" checked="checked">&nbsp;&nbsp;Nice<br>
	        	<input type="radio" name="s" value="soso">&nbsp;&nbsp;Soso<br>
	        	<input type="radio" name="s" value="ng">&nbsp;&nbsp;Not good<br>
        	</div>
	            <button type="submit" class="btn btn-default">Send</button>
	        </form>
        </div>
    </div>
</div>

<%@ include file="/page/layout/footer.jsp" %>