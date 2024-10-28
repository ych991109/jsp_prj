<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통디자인 - 사용자 페이지 header"
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역</title>
    <link rel="shortcut icon" href="http://192.168.10.216/html_prj/common/images/favicon.ico"/>

    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            max-width: 800px; /* 컨테이너의 최대 너비 */
            margin: 0 auto; /* 중앙 정렬 */
            padding: 20px;
            background-color: #fff; /* 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
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
            text-align: right;
            font-size: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>주문 내역</h1>
        <div id="order-list"></div>
        <h2 class="total">총 합계: <span id="total-amount">0 원</span></h2>
    </div>

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
</body>
</html>
