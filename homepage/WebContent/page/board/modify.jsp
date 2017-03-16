<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="homepage.board.BoardDTO" %>

<%@ include file="/page/layout/header.jsp" %>
<link rel="stylesheet" href="../../css/board.css">

<style>
	input[type=text]{
		border: none;
	}
	textarea{
		padding: 8px;
	}
	input:focus, textarea:focus, select:focus{
		outline: none;
	}
</style>
<script>
	function cancel(){
		var can = window.confirm("작성한 내용이 삭제됩니다. 계속하시겠습니까?");
		if(can){
			location.href="list.jsp";
		}
	}
</script>

<% int no = Integer.parseInt(request.getParameter("no")); %>
<jsp:useBean id="bdto" class="homepage.board.BoardDTO"></jsp:useBean>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	bdto = bdao.detail(no);
%>

<header class="intro-header" style="background-image: url('../../img/board.png')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Modify</h1>
                    <hr class="small">
                    <span class="subheading">Only member can write.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<form name="f" action="modify_pro.jsp" method="post">
			<input type="hidden" name="no" value="<%=bdto.getNo()%>">
			<table class="list" width="100%">
			    <thead>
			    <tr>
			        <th scope="col" style="text-align: left;">
			        	<select name="head"> <%=bdto.getHead()%>
			        		<option value="">[말머리없음]</option>
			        		<option>[가입인사]</option>
			        		<option>[잡담]</option>
			        		<option>[정보]</option>
			        	</select>&nbsp;&nbsp;
			        	<input type="text" name="title" maxlength="100" size="60" value="<%=bdto.getTitle()%>" required>
			        </th>
			    </tr>
			    </thead>
			    <tbody>
			    <tr>
			        <th>
			        	<textarea name="detail" required style="width: 92.5%; height: 200px; resize: none;"><%=bdto.getDetail(BoardDTO.textarea)%></textarea>
			        </th>
			    </tr>
			    <tr>
			        <td style="text-align: right; padding-right: 63px;">
			        	<input type="submit" value="register">
			        	<input type="button" value="cancel" onclick="cancel();">
			        </td>
			    </tr>
			    </tbody>
			</table>
			</form>
		</div>
	</div>
</div>

<script>
	//말머리 selected 메소드
	var head = document.f.head; //<select>를 head 변수에 넣은 것
	for(var i=0; i<head.options.length; i++){ //option을 배열로 받아서 길이만큼 반복
		if(head.options[i].value == "<%=bdto.getHead()%>"){ //if(옵션이름==내가 알던 head값){옵션 selected; break;}
			head.options[i].selected = true;
			break;
		}
	}
</script>

<%@ include file="/page/layout/footer.jsp" %>