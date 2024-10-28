<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.216/html_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.216/html_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝-->

<!-- jQuary -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){

});//ready

</script>
</head>
<body>
<div id="wrap">
<h2>scope 객체의 사용</h2>
<%
	String msg="오늘은 목요일 입니다.";
%>
<h3>EL에서는 변수를 직접 접근할 수 없다.</h3>
EL : ${ msg }<br>
Expression : <%= msg %><br>
<%
//EL 에서 변수를 사용하면 변수를 scope객체에 저장하고, scope 객체에 저장된 이름을 사용하여 ㅂㄴ수를 사용한다.

//1. scope객체에 저장
pageContext.setAttribute("m", msg);

%>
2.EL에서 scope객체를 사용한 접근 : <strong>${ pageScope.m }</strong>
	${ m }
	
<%
pageContext.setAttribute("pMsg", "페이지 메시지");
request.setAttribute("rMsg", "request 메시지");
session.setAttribute("sMsg", "session 메시지");
application.setAttribute("aMsg", "application 메시지");
%>
scope객체를 사용한 접근<br>
pageScope : ${ pageScope.pMsg } ( ${ pmsg } )<br>
requestScope : ${ requestScope.rMsg } ( ${ rMsg } )<br>
sessionScope : ${ sessionScope.sMsg } ( ${ sMsg } )<br>
applicationScope : ${ applicationScope.aMsg } ( ${ aMsg } )<br>
<%
pageContext.setAttribute("test2", "page메시지");
request.setAttribute("test", "page메시지");
session.setAttribute("test", "page메시지");
application.setAttribute("test", "page메시지");
%>

scope객체에 같은 이름이 존재<br>
<!-- scope객체를 생략하고 이름만 사용하면 가장 생명이 짧은 객체 부터 사용한다. -->
pageScope : ${ pageScope.test } ( ${ test } )<br>
requestScope : ${ requestScope.test } ( ${ test } )<br>
sessionScope : ${ sessionScope.test } ( ${ test } )<br>
applicationScope : ${ applicationScope.test } ( ${ test } )<br>

</div>
</body>
</html>


