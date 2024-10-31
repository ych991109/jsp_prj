<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.225/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.210/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
#output{ min-height: 60px }
</style>
<script type="text/javascript">
$(function(){
	$("#simpleJSON").click(function(){
		jsonSimpleParsing();
	});//click
	$("#simpleJSONArr").click(function(){
		jsonArrParsing();
	});//click
	$("#complexJSON").click(function(){
		complexJsonParsing();
	});//click
	setDeptno();
});//ready

function setDeptno(){
	$.ajax({
		url:"jsonArr.jsp",
		type:"get",
		dataType:"json",
		error:function( xhr ){
			console.log(xhr.status);
		},
		success:function( jsonArr ){
			if(jsonArr.length != 0){
				var sel=$("#deptno")[0];
				sel.lenght=1;
				
				for(var i=0; i< jsonArr.length ; i++){
					sel.options[i+1]=new Option(jsonArr[i].dname,jsonArr[i].deptno);
				}//end for
				
			}//end if
		}
	});//ajax
}//setDeptno

function complexJsonParsing(){
	var deptno= $("#deptno").val();
	if(deptno != "N/A"){
	var param={ deptno : deptno };
	
	$.ajax({
		url:"complexJson.jsp",
		type:"post",
		data : param,
		dataType:"json",
		error : function(xhr){
			console.log( xhr.status );
		},
		success : function( jsonObj ){
			var outTable="<div>["+deptno+"]번 부서정보 조회결과</div>";
			outTable +=
			`<table class="table">
			<thead>
			<tr>
			<th style="width:80px" >번호</th>
			<th style="width:80px" >사원번호</th>
			<th style="width:120px" >사원명</th>
			<th style="width:120px" >연봉</th>
			<th style="width:80px" >매니저번호</th>
			<th style="width:120px" >직무</th>
			<th style="width:180px" >입사일</th>
			</tr>
			</thead>
			<tbody>
		 	`;
		 	if(jsonObj.dataLength == 0){
		 		outTable+="<tr><td colspan='7'>사원이 존재하지 않습니다.</td></tr>";
		 	}//end if
		 	
		 	
		 	if( jsonObj.searchFlag && jsonObj.dataLength != 0 ){
		 		$.each( jsonObj.data, function(ind, jsonTemp){
		 		outTable+="<tr>";
		 		outTable+="<td>"+(ind+1)+"</td>";
		 		outTable+="<td>"+jsonTemp.empno+"</td>";
		 		outTable+="<td>"+jsonTemp.ename+"</td>";
		 		outTable+="<td>"+jsonTemp.sal+"</td>";
		 		outTable+="<td>"+jsonTemp.mgr+"</td>";
		 		outTable+="<td>"+jsonTemp.job+"</td>";
		 		outTable+="<td>"+jsonTemp.hiredate+"</td>";
		 		outTable+="</tr>";
		 		});//each
		 	}//end if
		 	
		 	outTable+="<</tbody></table>";
			
		 	$("#output").html( outTable );
		}
	});//ajax
	}//end if
}//complexJsonParsing

function jsonArrParsing(){
	
	$.ajax({
		url:"jsonArr.jsp",
		type:"get",
		dataType:"json",
		error:function( xhr ){
			console.log( xhr.status+ " / " +xhr.statusText );
			alert("문제 발생 잠시 후 다시 시도해주세요.");
		},
		success:function( jsonArr ){
			var dataView=
				`<table class="table">
					<thead>
					<tr>
					<th style="width:80px" >번호</th>
					<th style="width:100px" >부서번호</th>
					<th style="width:300px" >부서명</th>
					<th style="width:150px" >부서위치</th>
					<th style="width:120px" >작업</th>
					</tr>
					</thead>
					<tbody>
				 `;
				 
				 $.each( jsonArr, function( ind, jsonObj){
					 dataView+="<tr>";
					 dataView+="<td>"+ (ind+1) +"</td>" ;
					 dataView+="<td>"+ jsonObj.deptno +"</td>" ;
					 dataView+="<td><input type='text' name='dname' value='"+ jsonObj.dname +"'/></td>" ;
					 dataView+="<td><input type='text' name='loc' value='"+ jsonObj.loc +"'/></td>" ;
					 dataView+="<td><input type='button' value='변경' class='btn btn-primary' onclick=\"updateDept("+jsonObj.deptno+","+ind
							 	+")\"/><input type='button' value='삭제'class='btn btn-danger'/>"+
							 	"<select name='status'><option value='R'>준비중</option>"+
							 	"<option value='D'>배송중</option>"+
							 	"<option value='F'>배송완료</option></select>"+
							 	"</td>" ;
					 dataView+="</tr>";
				 });//each
				 
				 dataView+=`
					 </tbody>
				 	</table>
				 `;
			
			$("#output").html( dataView );
			//i번째의 select에 selected 설정을 한다. 
			$.each(jsonArr, function( ind, jsonObj){
				$("[name='status']").eq(ind).val( jsonObj.status);
			});
				
		}
	});//ajax
	
	
	
}//jsonArrParsing

function updateDept( deptno, ind ){
	
	
	var dname=$("[name='dname']")[ind].value;
	
	if( confirm(dname +"부서를 변경하시겠습니까?") ){
		
		var loc=$("[name='loc']")[ind].value;
		var status=$("[name='status']")[ind].value;
		
		var param={ deptno: deptno, dname : dname, loc: loc,status :status };
		$.ajax({
			url: "update_dept_process.jsp",
			type:"get",
			data : param,
			dataType:"json",
			error: function(xhr){
				console.log( xhr.status+ " / "+ xhr.statusText);
				alert("작업 중 문제가 발생했습니다.");
			},
			success:function( jsonObj ){
				var msg="부서정보가 변경되지 않았습니다.";
				if ( jsonObj.rowCnt == 1){
					msg = dname+"부서의 정보가 변경되었습니다.";
				}
				alert( msg );
			}
		});
		
	}//end if
}//updatDept

function jsonSimpleParsing(){
	var subject=$("#subject").val();
	
	if(subject == "N/A"){
		alert("과목을 선택해주세요");
		return;
	}//end if
	
	//web parameter 생성
	var paramJson={ subject : subject }; 
	
	$.ajax({
		url : "jsonObj.jsp",
		type : "get",
		data  :paramJson,
		dataType : "json",
		error:function( xhr ){
			console.log(xhr.status+" / "+ xhr.statusText );
		},
		success:function( jsonObj ){
			//서버에서 응답된 JSONObject에서 원하는 값을 parsing 하여 사용한다.
			if( jsonObj.searchFlag ){
				
				var output="외부에서 값을 변경하실 수 없습니다.";
				if( jsonObj.value != ""){
					output="<label>"+ subject
					+"</label><input type='text' value='"
					+jsonObj.value+"'/>";
				}//end if
				
				$("#output").html( output );
			}//end if
		}
		
	});//ajax
}//jsonSimpleParsing


</script>
</head>
<body>
<div id="wrap">
	<div id="output"></div>
	<select id="subject">
		<option value="N/A">----과목선택----</option>
		<option value="java">자바</option>
		<option value="oracle">오라클</option>
		<option value="jdbc">jdbc</option>
		<option value="html">html</option>
	</select>
	<input type="button" value="JSONObject parsing" 
	class="btn btn-sm btn-primary" id="simpleJSON"/>
	<br>
	<input type="button" value="JSONArray parsing" 
	class="btn btn-sm btn-info" id="simpleJSONArr"/><br>
	
	<label>부서번호</label>
	<select id="deptno">
		<option value="N/A">--부서선택</option>
	</select>
	<input type="button" value="complex JSONObject parsing" 
	class="btn btn-sm btn-success" id="complexJSON"/><br>
</div>
</body>
</html>