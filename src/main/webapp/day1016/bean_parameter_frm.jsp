<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="usebean action태그를 사용한"%>

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
	
	$("#btnPost").click(function() {
		$("#frmPost").submit();
		
	})//click
	
});//ready

</script>
</head>
<body>
<div id="wrap">

<h2>Form</h2>
<form name="frmPost" id="frmPost" method="post" action="bean_parameter_frm_process.jsp">
<h2>checked 속성으로 값 얻기</h2>
<label>이름</label>
<input type="text" name="name"/><br>
<label>나이</label>
<input type="password" name="age"/><br>



<input type="radio" name="gender" value="남자">남자 |
<input type="radio" name="gender" value="여자">여자
<br/>
<input type="checkbox" name="hobby" value="영화감상"/>영화
<input type="checkbox" name="hobby" value="음악감상"/>음악
<input type="checkbox" name="hobby" value="게임"/>게임
<input type="checkbox" name="hobby" value="운동"/>운동
<input type="checkbox" name="hobby" value="등산"/>등산
<input type="checkbox" name="hobby" value="낚시"/>낚시

<div>
<input type="button" value="값 전송" class="btn btn-success" id="btnPost"/>
</div>
</form>

</div>
</body>
</html>


