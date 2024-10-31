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
	href="http://localhost/paik_prj/common/css/paik_kl.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost/paik_prj/common/css/paik_normal.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost/paik_prj/common/css/paik_extend.css">
<link rel='stylesheet'
	href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4'
	type='text/css' media='all' />

<title>빽다방 | 주문내역</title>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f5f5f5;
	color: #333;
}

.list_container {
    max-width: 800px; /* 컨테이너의 최대 너비 */
    height: 400px;
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px;
    background-color: #fff; /* 배경색 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    position: relative; /* 위치 지정 */
    margin-bottom: 20px;
	margin-top: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.order-item {
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 15px;
	margin-bottom: 10px;
}

.order-item img {
	width: 50px; /* 이미지 크기 조정 */
	height: auto;
	margin-right: 10px;
	vertical-align: middle; /* 수직 정렬 */
}

.total {
    position: absolute; /* 절대 위치 지정 */
    bottom: 20px; /* 아래쪽 여백 */
    right: 20px; /* 오른쪽 여백 */
    font-size: 20px;
    margin: 0; /* 기본 여백 제거 */
}
</style>

<script>
const orders = JSON.parse(localStorage.getItem('orders')) || [];
let totalAmount = 0;

function displayOrders() {
	const orderList = document.getElementById("order-list");
	orderList.innerHTML = "";
	totalAmount = 0; // 총 합계 초기화

	if (orders.length === 0) {
		orderList.innerHTML = "<p>주문 내역이 없습니다.</p>";
	} else {
		orders.forEach((order, index) => {
			const orderItem = document.createElement("div");
			orderItem.className = "order-item";
			const orderDetails = order.items.map(item => `
				<div>
					<img src="${item.image}" alt="${item.name} 이미지" onerror="this.src='fallback-image.png';">
					${item.name} - ${item.price.toLocaleString()} 원
				</div>
			`).join('');
			orderItem.innerHTML = `
				<h3>주문 번호: ${index + 1}</h3> <!-- 순차적으로 주문 번호 표시 -->
				<p>주문 날짜: ${order.orderDate}</p>
				<div>${orderDetails}</div>
			`;
			orderList.appendChild(orderItem);
			totalAmount += order.items.reduce((sum, item) => sum + item.price * (item.quantity || 1), 0);
		});
	}

	document.getElementById("total-amount").innerText = totalAmount.toLocaleString() + " 원";
}

window.onload = displayOrders;    
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
					<h1>주문내역</h1>
				</div>
			</div>
			<div class="list_container">
				<h1>주문 내역</h1>
				<div id="order-list"></div>
				<h2 class="total">
					총 합계: <span id="total-amount">0 원</span>
				</h2>
			</div>

		</div>

	</div>

	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
