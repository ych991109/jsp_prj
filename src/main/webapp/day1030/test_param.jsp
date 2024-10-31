<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%>
<%
String name=request.getParameter("na");
String age=request.getParameter("age");
int tempAge=Integer.parseInt(age);


String interests="";
int ageRange=0;
if(tempAge > 9 && tempAge < 20){
	interests="학업";
	ageRange=10;
}else if(tempAge > 19 && tempAge < 30){
	interests="취업";
	ageRange=20;
}else if(tempAge > 29 && tempAge < 40){
	interests="결혼";
	ageRange=30;
}else if(tempAge > 39 && tempAge < 50){
	interests="자녀교육, 내집마련";
	ageRange=40;
}else if(tempAge > 50){
	interests="건강";
	ageRange=50;
}//end if

JSONObject jsonObject=new JSONObject();
jsonObject.put("interests", interests);
jsonObject.put("msg", name+"님은"+ageRange+"대 입니다.");
out.print(jsonObject);

%>