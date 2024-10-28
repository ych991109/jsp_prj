<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 로그인화면"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>빽다방 | 로그인</title>

<style type="text/css">
	.headHTxt{
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	table{
		border-spacing: 0 15px;
	}
	.txt{
		color: #C9C9C9;
	}
	#loginContainer{
		margin-bottom: 30px;
	}
	.inputBox {
	    width: calc(100% - 20px);
	    padding: 10px;
	    border: 1px solid #ccc;
	    font-size: 16px;
	    margin-top: 15px;
	    padding: 10px;
	}
	#loginBtn{
		cursor: pointer;
		background-color: #FFE800;
		color: #FFFFFF;
		border: 0px;
		height: 50px;
		width: 97.5%;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	#memberContainer{
		border: 1px solid #E6E7E8;
		padding: 30px;
	}
	#joinMemberBtn{
		margin-top: 40px;
		padding: 10px 20px 10px 20px;
		cursor: pointer;
		background-color: #FFFFFF;
		border: 1px solid #C9C9C9;
	}
</style>

<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">

<link rel='stylesheet' id='theme-css-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

<link rel="icon" href="http://localhost/paik_prj/common/images/favicon32x32.png" sizes="32x32" />
<link rel="icon" href="http://localhost/paik_prj/common/images/favicon192x192.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="http://localhost/paik_prj/common/images/favicon180x180.png" />
<meta name="msapplication-TileImage" content="http://localhost/paik_prj/common/images/favicon270x270.png" />

<%-- bootstrap CDN --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%-- jQuery CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		var id = $("#id").val().trim();
		var pass = $("#pass").val().trim();
		
		if(id === ""){
			alert("아이디를 입력해주세요.")
			$("#id").focus();
			return;
		}//if
		
		if(pass === ""){
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return;
		}
		
		$("#loginFrm").submit();
	});
	
	$("#joinMemberBtn").click(function() {
		window.location.href = "membershipPage.jsp";
	});
});//ready()
</script>

</head>

<body>
<div id="wrap">
<div id="header">
<jsp:include page="header.jsp"/>
</div>

<div id="content-wrap">
<div class="sub_visual bg-paik">
    <div class="txt">
        <h1>로그인</h1>
    </div>
</div>

<div class="sub_section cmnt_wrap">
    <div class="container" style="max-width: 600px; margin: 0 auto; text-align: center;">
        <h2 class="headHTxt">로그인</h2>
        <form action="login_process.jsp" id="loginFrm" method="post">
            <div id="loginContainer">
            <table>
            	<tr>
            		<td><input type="text" id="id" name="id" class="inputBox" placeholder="아이디"/></td>
            	</tr>
            	<tr>
            		<td><input type="password" id="pass" name="pass" class="inputBox" placeholder="비밀번호"/></td>
            	</tr>
            	<tr>
            		<td><input type="button" id="loginBtn" class="loginBtn" value="로그인"/></td>
            	</tr>
                <tr>
                	<td><a href="http://localhost/paik_prj/paik/findIdPage.jsp">아이디찾기</a> <span class="txt">|</span> <a href="http://localhost/paik_prj/paik/findPassPage.jsp">비밀번호 찾기</a></td>
                </tr>
            </table>
            </div>
            <div id="memberContainer">
            	<h4>아직 회원이 아니신가요?</h4>
            	<input type="button" id="joinMemberBtn" class="joinMemberBtn" value="회원가입"/>
            </div>
        </form>
    </div>
</div>
</div>

<div id="footer">
<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>