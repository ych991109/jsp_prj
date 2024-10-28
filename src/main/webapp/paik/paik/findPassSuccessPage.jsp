<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 비밀번호찾기화면"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>빽다방 | 비밀번호찾기</title>

<style type="text/css">
	.headHTxt{
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.contentTxt{
		display: block;
		text-align: left;
		color: #333;
		margin-top: 20px;
		margin-left: 10px;
	}
	.findPassContainer{
		margin-bottom: 30px;
	}
	.txt{
		color: #797979;
	}
	.tempPass{
		font-weight: bold;
	}
	.passFindChkBtn{
		cursor: pointer;
		background-color: #FFE800;
		color: #FFFFFF;
		border: 0px;
		height: 50px;
		width: 97.5%;
		margin-top: 50px;
		margin-bottom: 40px;
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
	$("#passFindChkBtn").click(function() {
		window.location.href = "http://localhost/paik_prj/paik/loginPage.jsp";
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
<div class="sub_visual bg-class">
    <div class="txt">
        <h1>비밀번호 찾기</h1>
    </div>
</div>

<div class="sub_section cmnt_wrap">
    <div class="container" style="max-width: 600px; margin: 0 auto; text-align: center;">
        <h2 class="headHTxt">비밀번호 찾기</h2>
        <form action="" id="" method="post">
            <div id="findPassContainer">
            	<p class="txt">임시 비밀번호를 발급합니다.</p>
            	<p class="txt">@@@회원님의 임시 비밀번호는 <span class="tempPass">testPwd1234</span>입니다.</p>
            	<input type="button" id="passFindChkBtn" class="passFindChkBtn" value="확인"/>
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