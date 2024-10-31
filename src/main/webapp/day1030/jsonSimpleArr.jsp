<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%
//1. JSONArray에 들어갈 JSONObject 생성
JSONObject jsonObj=new JSONObject();
JSONObject jsonObj2=new JSONObject();
JSONObject jsonObj3=new JSONObject();

jsonObj.put("name", "김지훈");
jsonObj.put("group", "3");

jsonObj.put("name", "이인혁");
jsonObj.put("group", "3");

jsonObj.put("name", "김현우");
jsonObj.put("group", "2");

//2.JSONArray생성 (java.util.List기반)
JSONArray jsonArr=new JSONArray();
//3.JSONArry에 JSONObject 할당
jsonArr.add( jsonObj );
jsonArr.add( jsonObj2 );
jsonArr.add( jsonObj3 );

//4.JSONArray를 문자열로 얻기
String jsonStr=jsonArr.toJSONString();

%>
<%= jsonStr %>
