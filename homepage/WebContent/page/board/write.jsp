<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<header class="intro-header" style="background-image: url('../../img/board.png')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Write</h1>
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
			<form action="write_pro.jsp" method="post">
			<table class="list" width="100%">
			    <thead>
			    <tr>
			        <th scope="col" style="text-align: left;">
			        	<select name="head">
			        		<option value="">[말머리없음]</option>
			        		<option>[가입인사]</option>
			        		<option>[잡담]</option>
			        		<option>[정보]</option>
			        	</select>&nbsp;&nbsp;
			        	<input type="text" name="title" maxlength="100" size="60" placeholder="제목을 입력하세요." required>
			        </th>
			    </tr>
			    </thead>
			    <tbody>
			    <tr>
			        <th>
			        	<textarea name="detail" placeholder="내용을 입력하세요." required style="width: 92.5%; height: 200px; resize: none;"></textarea>
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

<%@ include file="/page/layout/footer.jsp" %>