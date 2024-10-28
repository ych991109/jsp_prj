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
	<% 
	String nameTitle="이름";
	String ageTitle="나이";
	String btnTitle="전송";
	
	if(!"localhost".equals(request.getServerName())){
		nameTitle="name";
		ageTitle="age";
		btnTitle="submit";
	}
	
	%>
	<form action="foward_frm_process.jsp">
	<table>
	<tr>
	<td><%= nameTitle %></td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td><%= ageTitle %></td>
	<td><input type="text" name="age"></td>
	</tr>
	<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="<%= btnTitle %>" class="btn btn-info"/>
	</td>
	</tr>
	</table>
	</form>
	<a href="http://localhost/jsp_prj/day1016/foward_frm.jsp">내부</a>
	<a href="http://192.168.10.216/jsp_prj/day1016/foward_frm.jsp">외부</a>

</div>
</body>
</html>


