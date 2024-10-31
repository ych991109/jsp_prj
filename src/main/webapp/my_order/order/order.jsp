<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자 수정화면"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost/webapp/common/css/paik_kl.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost/webapp/common/css/paik_extend.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost/webapp/common/css/paik_normal.css">
<link rel='stylesheet'
	href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4'
	type='text/css' media='all' />

<title>빽다방 | 주문</title>

<style type="text/css">
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    background-color: #f9f9f9;
    display: flex;
    flex-direction: column; /* 세로 방향으로 쌓이도록 설정 */
    min-height: 100vh; /* 최소 높이를 100%로 설정 */
}

#wrap {
    flex: 1; /* 나머지 공간을 차지하도록 설정 */
}

.order_container {
    max-width: 800px; /* 최대 너비 설정 */
    width: 100%;
    margin: 20px auto; /* 중앙 정렬 */
    padding: 30px; /* 내부 여백 증가 */
    background: #fff;
    border-radius: 10px; /* 테두리 둥글게 */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

.menu-item {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 15px;
    margin: 10px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

img {
    width: 80px; /* 이미지 크기 조정 */
    height: auto;
    margin-right: 15px;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 8px 12px; /* 버튼 크기 조정 */
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

/* 푸터 스타일 */
#footer {
    text-align: center;
    padding: 20px; /* 푸터 내부 여백 */
    background-color: #f1f1f1; /* 푸터 배경색 */
    border-top: 1px solid #ddd; /* 위쪽 테두리 */
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function confirmAndAddToCart(code, product) {
    addToCart(code, product); // 아이템을 장바구니에 추가
    // 제품 이름이 포함된 메시지를 표시합니다.
    if (confirm(`${product.name}가 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?`)) {
        window.location.href = "cart.html"; // 장바구니 페이지로 이동
    }
}

function addToCart(code, product) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingProduct = cart.find(item => item.id === product.id);
    if (existingProduct) {
        existingProduct.quantity++;
    } else {
        product.quantity = 1;
        product.code = code;  // 임시 코드 추가
        cart.push(product);
    }
    localStorage.setItem('cart', JSON.stringify(cart));
} 
</script>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>

		<div id="content-wrap">
			<div class="sub_visual bg-paik">
				<div class="txt">
					<h1>주문</h1>
				</div>
			</div>
			<div class="order_container">
        <h1>메뉴</h1>

        <div class="menu-item">
            <h3>아메리카노 - 5,000 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/americano.jpg" alt="아메리카노 이미지">
                <button onclick="confirmAndAddToCart('AM123', { id: 1, name: '아메리카노', price: 5000, image: 'http://localhost/jsp_prj/paik/images/americano.jpg' })">주문하기</button>
            </div>
        </div>

        <div class="menu-item">
            <h3>카페라떼 - 6,000 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/cafelatte.jpg" alt="카페라떼 이미지">
                <button onclick="confirmAndAddToCart('CL456', { id: 2, name: '카페라떼', price: 6000, image: 'http://localhost/jsp_prj/paik/images/cafelatte.jpg' })">주문하기</button>
            </div>
        </div>

        <div class="menu-item">
            <h3>소프트 아이스크림 - 4,500 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/icecream.jpg" alt="아이스크림 이미지">
                <button onclick="confirmAndAddToCart('de456', { id: 3, name: '아이스크림', price: 4500, image: 'http://localhost/jsp_prj/paik/images/icecream.jpg' })">주문하기</button>
            </div>
        </div>
    </div>
		</div>

	</div>

	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
