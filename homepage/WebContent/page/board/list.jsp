<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.board.BoardDTO" %>

<%@ include file="/page/layout/header.jsp" %>
<link rel="stylesheet" href="../../css/board.css">

<style>
input:FOCUS{
	outline: none;
}
.box{
	display: inline-block; /* div를 한 줄에 여러개 표시 */
	width: 25px;
	height: 25px;
	text-align: center;
}
.cur{
	display: inline-block; /* div를 한 줄에 여러개 표시 */
	width: 25px;
	height: 25px;
	border-bottom: 2px solid #cccccc;
	color: #0085A1;
	font-weight: bold;
	text-align: center;
}
</style>

<%
	boolean m;
	if(session.getAttribute("success") != null) m = true;
	else m = false;
%>

<script> //write 페이지 회원만 접근 가능
	function mwrite(){
		var m = <%=m%>
		if(!m){
			alert("회원만 글을 쓸 수 있습니다.");
			history.back();
		}else{
			location.href="write.jsp";
		}
	}
</script>

<header class="intro-header" style="background-image: url('../../img/board.png')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Free Board</h1>
                    <hr class="small">
                    <span class="subheading">Only member can write.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<jsp:useBean id="bdao" class="homepage.board.BoardDAO"></jsp:useBean>
<%
	String type = request.getParameter("type");
	String key = request.getParameter("key");
	
	if(type==null) type = "title";
	if(key==null) key = "";
	
	//2. 현재 페이지 번호, 시작 번호, 끝 번호, 게시글 숫자를 구해서 원하는 계산을 수행
	//page란 이름은 이미 사용중인 내장객체라서 사용 불가
	String pageNo = request.getParameter("page");
	int curPage;
	try{
		curPage = Integer.parseInt(pageNo);
		if(curPage <= 0) throw new Exception();
	}catch(Exception e){
		curPage = 1;
	}
	
	//페이지 크기를 정하고 시작 번호, 끝 번호, 게시글 수를 계산
	int pageSize = 10; //한 페이지에 글이 몇 개씩 뜨게 할래?
	int sn = curPage * pageSize-(pageSize-1);
	int en = sn + pageSize -1;
	int count = bdao.count(type, key); //게시글 목록을 부르기 위해
	if(en>count) en = count;
	
	ArrayList<BoardDTO> list = bdao.list(type, key, sn, en);
%>

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
		
			<table class="list" width="100%">
			    <thead>
			    <tr>
			    	<th scope="col">No.</th>
			        <th scope="col">Title</th>
			        <th scope="col">Writer</th>
			        <th scope="col">Reg.</th>
			        <th scope="col">Hit</th>
			    </tr>
			    </thead>
			    <tbody>
			    
			    <%for(BoardDTO bdto:list){ %>
			    	<tr>
			    	<td><%=bdto.getNo()%></td>
			        <th scope="row"><%=bdto.getHead()%> <a href="detail.jsp?no=<%=bdto.getNo()%>"><%=bdto.getTitle()%></a> 
			        <% if(bdto.getReply() > 0){ %>
			        (<%=bdto.getReply()%>)
			        <% } %>
			        </th>
			        <td><%=bdto.getId()%></td>
			        <td><%=bdto.getAuto()%></td>
			        <td><%=bdto.getHit()%></td>
			    	</tr>
			    <%} %>
			    
			    </tbody>
			</table>
			
<!-- 내비게이터(페이지 이동 링크) 공간 -->
<div align="center" style="margin-top: 20px;">
<%
	int pageBlock = 10; //한 페이지당 10개의 링크를 출력하겠다.
	int totalBlock = (count+pageSize-1)/pageSize; //토탈 링크 수
	int sb = (curPage-1)/pageSize*pageSize+1; //시작 링크
	int eb = sb + pageBlock -1; //끝 링크
	if(eb > totalBlock) eb = totalBlock; //eb가 토탈블럭을 넘어가면 안되잖아
%>
	
	<%-- <h3>sb: <%=sb%>, eb: <%=eb%>, totalBlock: <%=totalBlock%></h3> --%>
	
	<%if(sb>1){%>
		<a href="list.jsp?page=<%=sb-1%>&type=<%=type%>&key=<%=key%>">[이전]</a>
	<%}%>
	
	<%for(int i=sb; i<=eb; i++){ %>
		<%if(i==curPage){ %>
			<div class="cur">
				<%=i%>
			</div>
		<%}else{ %>
			<div class="box">
			<a href="list.jsp?page=<%=i%>&type=<%=type%>&key=<%=key%>"><%=i%></a>
			</div>
		<%} %>
	<%} %>
	
	<%if(eb < totalBlock){ %>
		<a href="list.jsp?page=<%=eb+1%>&type=<%=type%>&key=<%=key%>">[다음]</a>
	<%} %>
</div>

<!-- 검색창 -->
			<form action="list.jsp" method="get">
				<table width="100%" style="margin-top: 20px;">
					<tr>
						<td align="center">
						<select name="type">
			        		<option value="title">제목</option>
			        		<option value="id">작성자</option>
					    </select> 
					    <input type="search" name="key"> <input type="submit" value="search">
					    </td> 
						
						<td align="right"><button type="button" onclick="mwrite();">write</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@ include file="/page/layout/footer.jsp" %>