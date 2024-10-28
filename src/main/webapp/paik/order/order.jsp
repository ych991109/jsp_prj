<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴</title>
    <link rel="shortcut icon" href="http://192.168.10.216/html_prj/common/images/favicon.ico"/>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            max-width: 600px;
            width: 100%;
            margin: 20px;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            width: 80px;
            height: auto;
            margin-right: 15px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function confirmAndAddToCart(code, product) {
            if (confirm(`${product.name}가 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?`)) {
                addToCart(code, product);
                window.location.href = "cart.html"; // 장바구니 페이지로 이동
            }
        }

        function addToCart(code, product) {
            // AJAX 요청으로 서버에 장바구니 데이터 추가
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "addToCart.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log("장바구니에 추가되었습니다.");
                }
            };
            xhr.send(JSON.stringify(product));
        }
    </script>
</head>
<body>

    <div class="container">
        <h1>메뉴</h1>

        <div class="menu-item">
            <h3>아메리카노 - 5,000 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/americano.jpg" alt="아메리카노 이미지">
                <button onclick="confirmAndAddToCart('AM123', { id: 1, name: '아메리카노', price: 5000 })">주문하기</button>
            </div>
        </div>

        <div class="menu-item">
            <h3>카페라떼 - 6,000 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/cafelatte.jpg" alt="카페라떼 이미지">
                <button onclick="confirmAndAddToCart('CL456', { id: 2, name: '카페라떼', price: 6000 })">주문하기</button>
            </div>
        </div>

        <div class="menu-item">
            <h3>소프트 아이스크림 - 4,500 원</h3>
            <div>
                <img src="http://localhost/jsp_prj/paik/images/icecream.jpg" alt="아이스크림 이미지">
                <button onclick="confirmAndAddToCart('de456', { id: 3, name: '아이스크림', price: 4500 })">주문하기</button>
            </div>
        </div>
    </div>

</body>
</html>
