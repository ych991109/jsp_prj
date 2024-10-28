<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="메뉴 - 아이스크림/디저트 페이지"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>빽다방 | 아이스크림/디저트</title>

<style type="text/css">

</style>

<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_menu.css">
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

<%-- Swiper CDN --%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">
$(function(){
	const swiper = new Swiper('.swiper-container', {
		loop: true,
		centeredSlides: true,
		slidesPerView: 2,
		spaceBetween: 0,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		on: {
			init: function () {
				$('.swiper-button-next').css('color', 'yellow');
				$('.swiper-button-prev').css('color', 'yellow');
			}
		}
	});
	
	const menuItems = $(".menuItem");
	const menuInfo = $(".menuInfo");
	const itemName = menuInfo.find(".itemName");
	const itemContent = menuInfo.find(".itemContent");
	const ingredientsTable = menuInfo.find(".ingredientsTable");
	const closeInfo = $(".closeInfo");
    
	const defaultName = "정보 없음";
	const defaultContent = "상세 정보가 없습니다.";
    
	//menuItem에 클릭 이벤트 설정
	menuItems.on("click", function() {
		const title = $(this).data("title") || defaultName;
		const content = $(this).data("content") || defaultContent;
		
		itemName.text(title);
		itemContent.text(content);
		
		const ingredients = $(this).data("ingredients")?JSON.parse($(this).data("ingredients")):{};
		ingredientsTable.html(
			"<tr>" + 
				"<td>카페인(mg)</td><td>" + (ingredients.caffeine || "N/A") + "</td>" +
				"<td>칼로리</td><td>" + (ingredients.calories || "N/A") + "</td>" +
			"</tr>" +
			"<tr>" +
				"<td>나트륨</td><td>" + (ingredients.sodium || "N/A") + "</td>" +
	    		"<td>당류</td><td>" + (ingredients.sugar || "N/A") + "</td>" +
	    	"</tr>" +
			"<tr>" +
				"<td>포화지방</td><td>" + (ingredients.saturatedFat || "N/A") + "</td>" +
				"<td>단백질</td><td>" + (ingredients.protein || "N/A") + "</td>" +
	    	"</tr>"
		);
		
		//이미지 중앙값 계산
		const rect = this.getBoundingClientRect();
		const containerRect = $(".mainContainer").get(0).getBoundingClientRect();
		
		const centerX = rect.left + rect.width / 2 - menuInfo.outerWidth() / 2 - containerRect.left;
		const centerY = rect.top + rect.height / 2 - menuInfo.outerHeight() / 2 - containerRect.top;
		
		menuInfo.css({
			left: centerX + "px",
			top: centerY + "px",
			display: "block"
		});
	});
	
	//닫기(X) 클릭
	closeInfo.on("click", function() {
		menuInfo.hide();
	});
	
	//menuInfo 클릭
	menuInfo.on("click", function(evt) {
		if(evt.target !== closeInfo[0]){
			menuInfo.hide();			
		}
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
<div class="sub_visual bg-menu4">
	<div class="txt">
		<h1>아이스크림/디저트</h1>
		<p>달콤한 아이스크림부터 든든한 브레드까지 다양하게 즐길 수 있습니다.</p>
		<div class="tabMenu">
			<ul class="pageTab">
				<li><a href="http://localhost/paik_prj/paik/newMenuPage.jsp">신메뉴</a></li>
				<li><a href="http://localhost/paik_prj/paik/coffeMenuPage.jsp">커피</a></li>
				<li><a href="http://localhost/paik_prj/paik/drinkMenuPage.jsp">음료</a></li>
				<li class="on"><a href="http://localhost/paik_prj/paik/icecreamDessertMenuPage.jsp">아이스크림/디저트</a></li>
				<li><a href="http://localhost/paik_prj/paik/paikccinoPage.jsp">빽스치노</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="sub_section menu_wrap">
	<div class="mainContainer">
		<h2 class="main_tit3 color-1">추천메뉴</h2>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="http://localhost/paik_prj/common/images/%ED%81%AC%EB%A6%AC%EB%AF%B8%EC%8A%88-450x588.png" class="menuItem"/>
					<p><strong>크리미슈</strong></p>
				</div>
				<div class="swiper-slide">
					<img src="http://localhost/paik_prj/common/images/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png" class="menuItem"/>
					<p><strong>소프트 아이스크림</strong></p>
				</div>
				<div class="swiper-slide">
					<img src="http://localhost/paik_prj/common/images/%EC%82%AC%EB%9D%BC%EB%8B%A4%EB%B9%B5-450x588.png" class="menuItem"/>
					<p><strong>사라다빵</strong></p>
				</div>
				<div class="swiper-slide">
					<img src="http://localhost/paik_prj/common/images/%EC%95%84%EC%83%B7%EC%B6%94-450x588.png" class="menuItem"/>
					<p><strong>이름</strong></p>
				</div>
			</div>
			<div class="swiper-button-next" style="position: absolute; top: 30%;"></div>
			<div class="swiper-button-prev" style="position: absolute; top: 30%;"></div>
		</div>
		
		<!-- 정보 표시 영역 -->
		<div class="menuInfo" style="display: none;">
			<button class="closeInfo">X</button>
			<h2 class="itemName">음료이름</h2>
			<h4 class="itemEngName">음료영어이름</h4>
			<p class="itemContent">음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명음료설명</p>
			<div class="ingredientsContainer">
				<span>※1회 제공량 기준: 16oz</span>
				<table class="ingredientsTable">
					<tr>
						<td>카페인(mg)</td>
						<td>숫자</td>
						<td>칼로리</td>
						<td>숫자</td>
					</tr>
					<tr>
						<td>나트륨</td>
						<td>숫자</td>
						<td>당류</td>
						<td>숫자</td>
					</tr>
					<tr>
						<td>포화지방</td>
						<td>숫자</td>
						<td>단백질</td>
						<td>숫자</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="menuList">
			<ul class="menuItems">
				<!-- 아이템 추가 -->
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<li>
					<img src="http://localhost/paik_prj/common/images/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-2-450x588.png" class="menuItem"/>
					<p><strong>더블에스프레소</strong></p>
				</li>
				<!-- 필요에 따라 계속 추가 -->
			</ul>
		</div>
	</div>
</div>
</div>

<div id="footer">
<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>