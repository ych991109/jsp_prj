<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day1016.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%
TestVO[] tVOArr={new TestVO("이일환",25), new TestVO("이인혁",26), new TestVO("김현우",27),new TestVO("김지훈",25)};

//1.데이터와 부가적인 정보를 저장할 JSONObject 생성
JSONObject jsonObj=new JSONObject();
//2.부가적인 정보를 저장
jsonObj.put("dataLength", tVOArr.length);
jsonObj.put("searchFlag", tVOArr != null);
jsonObj.put("pubDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

//3.JSONArray생성 - 데이터를 저장할 목적
JSONArray jsonArr=new JSONArray();

JSONObject jsonTemp=null;
for(TestVO tVO : tVOArr){
	//4.데이터를 저장할 JSONObject 생성
	jsonTemp=new JSONObject();
	//5.JSONObject 값 할당
	jsonTemp.put("name",tVO.getName());
	jsonTemp.put("age",tVO.getMyAge());
	//6.JSONArray에 JSONObject 할당
	jsonArr.add(jsonTemp);
}//end for

//8.JSONArray를 JSONObject 추가
jsonObj.put("data", jsonArr);
		
//9.문자열로 받기
out.print(jsonObj.toJSONString());
		

%>