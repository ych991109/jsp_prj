<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력된 값을 받아서 세션에 할당"
    %>

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
//파라메터에 입력된 값을 받아와서 세션에 설정
   String name = request.getParameter("name");
    String paramAge = request.getParameter("age");
    int age = 0;

    // 나이 입력값 처리
    if (paramAge != null && !paramAge.isEmpty()) {
        try {
            age = Integer.parseInt(paramAge);
        } catch (NumberFormatException e) {
            // 숫자로 변환할 수 없는 경우 처리
            age = 0; // 기본값 설정
        }
    }

//Tomcat은 세션에 기본 생존 시간 30분 =>
session.setMaxInactiveInterval(60*60*24*30);//하나의 JSP에서만 입력하면 모든 JSP에서 적용된다.

session.setAttribute("name", name);
session.setAttribute("age", age);//auto boxing
%>
세션에 설정 값<a href="get_session.jsp">읽기</a>

</div>
</body>
</html>


