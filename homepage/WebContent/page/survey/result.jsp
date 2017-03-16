<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/page/layout/header.jsp" %>

<script>
	function back(){
		history.back();
	}
</script>

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

<%
//application은 서버에 계속 남아있으니까 먼저 getAttribute를 해서 Integer 타입 변수에 어플리케이션 값을 넣어놔
//근데 값이 없을 수가 있지. 그러면 변수에 0값을 넣어
//request.getParameter()한 거랑 nice/soso/ng를 비교해서 해당되는 것의 변수를 ++한다.
//그리고 최종적으로 application.setAttribute를 하는 거지

Integer nice = (Integer)application.getAttribute("nice");
Integer soso = (Integer)application.getAttribute("soso");
Integer ng = (Integer)application.getAttribute("ng");

if(nice==null)nice = 0;
if(soso==null)soso = 0;
if(ng == null)ng = 0;

String s = request.getParameter("s");

if(s.equals("nice"))nice++;
if(s.equals("soso"))soso++;
if(s.equals("ng"))ng++;

application.setAttribute("nice", nice);
application.setAttribute("soso", soso);
application.setAttribute("ng", ng);
%>

        	<p align="center">Result</p>
        	<p align="center">
        	Nice : <%= application.getAttribute("nice") %><br>
        	Soso : <%= application.getAttribute("soso") %><br>
        	Not good : <%= application.getAttribute("ng") %><br></p>
        	<div class="row">
	            <div class="form-group col-xs-12" align="center">
	                <button onclick="back();" class="btn btn-default">Back</button>
	            </div>
	        </div>

<%@ include file="/page/layout/footer.jsp" %>