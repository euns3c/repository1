<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.board.BoardDTO" %>
<%@ page import="homepage.board.reply.ReplyDTO" %>

<%@ include file="/page/layout/header.jsp" %>
<link rel="stylesheet" href="../../css/board.css">

<style>
table.reply {
	background-color: #F3F3F3;
}

.reply tr td {
	padding: 10px;
	padding-left: 30px;
}

.reply tr {
	border-bottom: 1px dashed #ccc;
}

.reply textarea {
	width: 80%;
	height: 60px;
	padding: 6px;
	resize: none;
}

#rep_reg {
	height: 60px;
	vertical-align: top;
}

.rep_date {
	padding-right: 30px;
}
</style>


<header class="intro-header" style="background-image: url('../../img/board.png')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Content</h1>
                    <hr class="small">
                    <span class="subheading">Only member can write.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<jsp:useBean id="bdto" class="homepage.board.BoardDTO"></jsp:useBean>
<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	bdto = bdao.detail(no);
	
	//로그인 한 회원과 글의 작성자가 일치하는지 보기 위함
	String login = (String)session.getAttribute("success");
	String writer = bdto.getId();
	
	//작성자 본인이 아닐 경우에만 조회수가 올라감
	if(!writer.equals(login)){
		bdao.upHit(no);
		bdto = bdao.detail(no);
	}
%>

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<table class="list" width="100%">
			    <thead>
			    <tr>
			        <th scope="col" style="text-align: left;"><%=bdto.getHead()%> <%=bdto.getTitle()%></th>
			        <th scope="col"><%=bdto.getId()%></th>
			        <th scope="col"><%=bdto.getReg()%></th>
			    </tr>
			    </thead>
			    <tbody>
			    <tr>
			        <th colspan="3" height="150px">
			        	<%=bdto.getDetail(BoardDTO.web)%>
			        </th>
			    </tr>
			    <tr>
			        <th scope="row" colspan="2">조회수 <%=bdto.getHit()%>&nbsp;&nbsp;댓글수 <%=bdto.getReply()%></th>
			        <td>
			        	<%if(writer.equals(login)){%>
			        		<input type="button" value="modify" onclick="location.href='modify.jsp?no=<%=bdto.getNo()%>&writer=<%=bdto.getId()%>';"> 
				        	<input type="button" value="delete" onclick="mdelete();"> 
			        	<%}%>
			        		<input type="button" value="list" onclick="location.href='list.jsp';">
			        </td>
			    </tr>
			    </tbody>
			</table>

<jsp:useBean id="rdao" class="homepage.board.reply.ReplyDAO"></jsp:useBean>
<% ArrayList<ReplyDTO> list = rdao.list(no); %>

		<form action="reply_pro.jsp" method="post">
			<input type="hidden" name="id" value="<%=login%>">
			<input type="hidden" name="belong" value="<%=no%>">
			<table class="reply" width="100%">
				<% for(ReplyDTO rdto:list){ %>
				<tr>
					<td>
						<%=rdto.getId()%> <div class="rep_date" align="right"><%=rdto.getReg()%></div>&nbsp;&nbsp;
						<%=rdto.getDetail()%>
					</td>
				</tr>
				<%} %>
				
				<tr>
					<td>
					<textarea name="detail" placeholder="댓글을 입력하세요. 로그인 상태에서만 입력이 가능합니다." required
					<%if(login==null){%>
					disabled="disabled"
					<%}%>></textarea> 
					<input type="submit" value="Register" id="rep_reg"
					<%if(login==null){%>
					disabled="disabled"
					<%}%>>
					</td>
				</tr>
			</table>
		</form>
			
		</div>
	</div>
</div>

<script>
	function mdelete(){
		var d = window.confirm("정말로 글을 삭제하시겠습니까?");
		if(d){
			location.href="delete_pro.jsp?no=<%=bdto.getNo()%>&writer=<%=bdto.getId()%>";
		}
	}
</script>

<%@ include file="/page/layout/footer.jsp" %>