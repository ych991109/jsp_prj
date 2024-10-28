<%@page import="day1001.DataProcess"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="day1001.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="표현식과 scriptlet의 연습"%>
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
	$("#btn").click(function(){
		printDate();
	})//btn

});//ready

function printDate() {
	let year=$("#year").val();
	let month=$("#month").val();
	let day=$("#day").val();
	
	$("#output").html(`${year}년 ${month}월 ${day}일 `);
}//PrinteDate


</script>
</head>
<body>
<div id="wrap">
<%
	int nowYear=LocalDate.now().getYear();
	int nowYear2=Calendar.getInstance().get(Calendar.YEAR);
	
	int nowMonth=LocalDate.now().getMonthValue();
	
	int nowDay=LocalDate.now().getDayOfMonth();
%>
<select name="year" id="year">
<% for(int year=nowYear; year>1949; year--){ %>
<option value="<%= year %>"><%= year %></option>
<%}//end for %>
</select>년

<select name="month" id="month" >
<% for(int month=1; month < 13; month++){ %>
<option value="<%= month %>"<%= month==nowMonth?" selected='selected'":"" %>><%= month %></option>
<%}//end for %>
</select>월

<select name="day" id="day" >
<% for(int day=1; day < 32; day++){ %>
<option value="<%= day %>"<%= day==nowDay?" selected='selected'":"" %>><%= day %></option>
<%}//end for %>
</select>일
<input type="button" value="날짜얻기" class="btn btn-primary btn-sm" id="btn" >
<div id="output" style="height: 40px"></div>


<div>
<% for(int i=1; i<7; i++){ %>
<img src="http://localhost/jsp_prj/day1001/images/dice_<%=i %>.png"/>
<% }//end for%>
</div>

<%
String[] names={"김지훈","김현우","이일환","이인혁","황찬욱"};
%>
<div style="width: 80px"></div>
<table class="table table_hover">
<thead>
<tr>
	<th style="width: 90px">이름</th>
	<th style="width: 610px">점수</th>
</tr>
</thead>

<tbody>
<%for(int i=0; i<names.length; i++){%>
<tr>
	<td><strong><%= names[i] %></strong></td>
	<td>
	<%for(int j=0; j<11; j++){ %>
	<input type="radio" name="name_<%= i %>" value="<%= j %>"<%= j==0?" checked='checked'":"" %>/><%=j %>점
	<%}//end for %>
	</td>	
</tr>
<%}//end for %>
</tbody>
</table>
</div>
<%
	//List에 저장된 이미지와 설명을 Card로 출력.
	DataProcess dp=new DataProcess();
		List<ImgVO> list=dp.searchData();
		
		if(list.isEmpty()){
%>
<marquee>로딩된 이미지가 없습니다.</marquee>
<%
		}//end if
		
		String info="";
		for( ImgVO iVO : list){
			info=iVO.getInfo();
%>
<div class="card" style="width: 18rem;" float="left">
<img src="http://192.168.10.216/jsp_prj/day1001/images/<%= iVO.getImg() %>" 
style="width: 260px; height: 200px" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text"><%= info.length() > 50? info.substring(0,49)+"...":"" %></p>
  </div>
</div>

<%
		}//end for
%>
<%
	//scriptlet에서는 method를 작성할 수 없다.(자바문법에는 mothod를 중복정의 할 수 없다.)
/* 	public  test(){
	
} */

%>
</body>
</html>

    