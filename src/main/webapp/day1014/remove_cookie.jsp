<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키 삭제"%>

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
<%
//1. 삭제하려는 이름의 쿠키를 생성( 값은 "")
Cookie rm1=new Cookie("name","");
Cookie cookieAge=new Cookie("age","");

//2. 파기시간을 즉시(0)으로 설정
rm1.setMaxAge(0);
cookieAge.setMaxAge(0);

//3. 접속자에게 생성된 쿠키 심기
response.addCookie(rm1);
response.addCookie(cookieAge);

%>
<h2>쿠키가 삭제 되었습니다.</h2>
쿠키<a href="read_cookie.jsp">읽기</a>

</div>
</body>
</html>


