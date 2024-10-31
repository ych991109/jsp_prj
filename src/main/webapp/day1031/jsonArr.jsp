<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day1031.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="day1031.DeptDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>

<%

	//1.JSONArray생성
	JSONArray jsonArr=new JSONArray();
	
	DeptDAO dDAO=DeptDAO.getInstance();
	
	try{
	List<DeptVO> list=dDAO.selectAllDept();
	
	JSONObject jsonTemp=null;
	for( DeptVO dVO : list){
	//2.JSONObject 생성
	jsonTemp=new JSONObject();	
	//3.값 할당
	jsonTemp.put("deptno", dVO.getDeptno() );
	jsonTemp.put("dname", dVO.getDname() );
	jsonTemp.put("loc", dVO.getLoc() );
	jsonTemp.put("status", dVO.getStatus() );
	
	//4.JSONObject을 JSONArray에 할당
	jsonArr.add(jsonTemp);
	}//end for
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
	//5.출력
	out.println( jsonArr.toJSONString() );	
	
%>