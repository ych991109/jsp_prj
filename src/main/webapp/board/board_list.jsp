<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.user.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.board.SearchVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.225/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.216/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
a{ color: #000000; text-decoration: none; font-size: 16px;}
a:hover{color: #858585; text-decoration: underline; font-size: 16px;}

</style>
<script type="text/javascript">
$(function(){
	$("#keyword").keyup(function( evt ) {
		if( evt.which == 13){
			chkNull();
		}
	});//keyup
	$("#btn").click(function(  ) {
		chkNull();
	});//click
	
	//검색으로 선택한 컬럼명과 키워드를 설정(JSP코드로 작성 가능) 
	if(${ not empty param.keyword }){
		$("#field").val(${ param.field });
		$("#keyword").val("${ param.keyword }");
	}//end if
	
	
});//ready

function chkNull() {
	var keyword = $("#keyword").val();
	if( keyword.length < 2){
		alert("검색 키워드는 한글자 이상 입력하셔야합니다.");
		return;
	}//end if
	
	$( "#searchFrm").submit();
}//chkNull

function loginMove() {
	if(confirm("로그인한 사용자만 글작성이 가능합니다.\n로그인하시겠습니까")){
		location.href="../login/login_frm.jsp";
	}
}

</script>
</head>
<body>
<div id="wrap">
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>

<div style="width: 1010px">
	<h2>사용자 자유 게시판</h2>
	<jsp:useBean id="sVO" class="kr.co.sist.user.board.SearchVO" scope="page"/>
	<jsp:setProperty property="*" name="sVO"/>
	<%
	
	//게시판 리스트 구현
	
	
	//1.총 레코드 수 구하기
	int totalCount=0;//총 레코드 수	
	
	BoardDAO bDAO=BoardDAO.getInstance();
	try{
		totalCount=bDAO.selectTotalCount(sVO);
	}catch(SQLException se){
		se.printStackTrace();
	}
	//2.한 화면에 보여줄 레코드의 수
	int pageScale=10;
	
	//3.총 페이지 수
	int totalPage=(int)Math.ceil((double)totalCount/pageScale);
	
	//4.검색의 시작번호를 구하기 ( pagination의 번호) [1][2][3]
	String paramPage=request.getParameter("currentPage");

	int currentPage=1;	
	if(paramPage != null){
		try{
			currentPage=Integer.parseInt(paramPage);
		}catch(NumberFormatException nfe){
		}//end catch
	}//end if
			
	int startNum=currentPage*pageScale-pageScale+1;//시작번호
	//5. 끝번호 
	int endNum=startNum+pageScale-1; //끝 번호
	
	sVO.setCurrentPage(currentPage);
	sVO.setStartNum(startNum);
	sVO.setEndNum(endNum);
	sVO.setTotalPage(totalPage);
	sVO.setTotalCount(totalCount);
	
	out.print( sVO );
	
	
	List<BoardVO> listBoard=null;
	
	try{
	listBoard=bDAO.selectBoard(sVO);//시작번호, 끝 번호를 사용한 게시글 조회
	
	String tempSubject="";
	for(BoardVO tempVO : listBoard){
		tempSubject=tempVO.getSubject();
		if(tempSubject.length() > 30){
		tempVO.setSubject(tempSubject.substring(0, 29)+"...");
		}//end if
	}//end for
	
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
	pageContext.setAttribute("totalCount", totalCount);
	pageContext.setAttribute("pageScale", pageScale);
	pageContext.setAttribute("totalPage", totalPage);
	pageContext.setAttribute("currentPage", currentPage);
	//pageContext.setAttribute("startNum", startNum);
	//pageContext.setAttribute("endNum", endNum);
	pageContext.setAttribute("listBoard", listBoard);
	
	
	
	
	
	%>
	<%-- 총 게시물의 수 :  <c:out value="${ totalCount }"/><br>
	한 화면에 보여줄 게시물의 수 :  <c:out value="${ pageScale }"/><br>
	총 페이지 수 :  <c:out value="${ totalPage }"/><br>
	현재페이지 번호 :  <c:out value="${ currentPage }"/><br>
	게시글의 시작 번호 :  <c:out value="${ startNum }"/><br>
	게시글의 끝 번호 :  <c:out value="${ endNum }"/><br> --%>
	<div id="boardList" style="height: 500px ">
	<c:set var="loginFlag" value="javascript:loginMove()"/>
	<c:if test="${ not empty userData }">
	<c:set var="loginFlag" value="board_write_frm.jsp"/>
	</c:if>
	<a href="${ loginFlag }" >글쓰기</a>
	
	<table class=" table rable-hover">
	<thead>
		<tr>
			<th style="width: 60px">번호</th>
			<th style="width: 550px">제목</th>
			<th style="width: 200px">작성자/ip</th>
			<th style="width: 200px">작성일</th>
		</tr>	
	</thead>
	<tbody>
	<c:if test="${ empty listBoard }">
	<tr>
		<td style="text-align: center" colspan="4">
		작성된 게시글이 없습니다.<br>
		<a href="board_write_frm.jsp">글쓰기</a>
		</td>
	</tr>
	</c:if>
	<c:if test="${ not empty param.keyword }">
	<c:set var="searchParam" value="&field=${ param.field }&keyword=${ param.keyword }"/>
	</c:if>
	
	<c:forEach var="bVO" items="${ listBoard }" varStatus="i">
	<tr>
		<td><c:out value="${ totalCount-(currentPage-1)*pageScale-i.index }"/></td>
		<td><a href="board_detail.jsp?num=${ bVO.num }&currentPage=${ currentPage }${ searchParam }"><c:out value="${ bVO.subject}"/></a></td>
		<td><c:out value="${ bVO.writer }/${ bVO.ip }"/></td>
		<td><fmt:formatDate value="${ bVO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/> </td>
	</tr>
	
	
	</c:forEach>
	</tbody>
	</table>
	</div>
	<div id="search" style="height: 60px; text-align: center;">
	<form action="board_list.jsp" method="get" name="searchFrm" id="searchFrm">
		<select name="field" id="field">
		<option value="0">제목</option>
		<option value="1">내용</option>
		<option value="2">작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" style="width: 200px"/>
		<input type="button" value="검색" id="btn" class="btn btn-sm btn-primary"/>
		<input type="text" style="display: none;">
	</form>
	</div>
	<div id="pagination" style="text-align: center;">
	<%-- <c:forEach var="i" begin="1" end="${ totalPage }" step="1">
	[ <a href="board_list.jsp?currentPage=${ i }"><c:out value="${ i }"/></a> ]
	</c:forEach> --%>

	<% sVO.setUrl("board_list.jsp"); %>
	<c:if test="${ totalCount ne 0 }">
	<%= new BoardUtil().pagination(sVO) %>
	</c:if>
	</div>
	</div>
</div>
</body>
</html>