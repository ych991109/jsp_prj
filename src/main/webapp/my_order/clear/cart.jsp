<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="장바구니 화면"%>
<%@ page import="java.util.List" %>
<%@ page import="project.CartItemVO" %>
<%@ page import="project.OrderVO" %>
<%@ page import="project.OrderDAO" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">
    <link rel='stylesheet' href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

    <title>빽다방 | 장바구니</title>

    <style type="text/css">
        body {
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
        }

        .cart_container {
            max-width: 800px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .cart-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            padding: 15px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }

        .item-image {
            width: 100px;
            height: auto;
            margin-right: 10px;
        }

        .total {
            text-align: center;
            font-size: 20px;
            margin-top: 20px;
            color: #000000;
        }

        button {
            background-color: yellow;
            color: black;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #ffcc00;
        }

        #empty-message {
            text-align: center;
            font-size: 16px;
            color: #999;
        }

        #modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
        }

        #modal div {
            background: white;
            margin: auto;
            padding: 20px;
            width: 300px;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        .button-container {
            position: absolute;
            bottom: 20px; 
            right: 20px; 
        }
    </style>

    <script>
        const cart = JSON.parse(localStorage.getItem("cart")) || [];
        let currentProductId = null;

        function updateCartDisplay() {
            const cartList = document.getElementById("cart-list");
            const emptyMessage = document.getElementById("empty-message");
            cartList.innerHTML = "";
            let total = 0;

            if (cart.length === 0) {
                emptyMessage.style.display = "block";
            } else {
                emptyMessage.style.display = "none";
                cart.forEach(item => {
                    const itemTotal = (item.price * (item.quantity || 1)).toLocaleString();
                    let optionsDisplay = '';

                    if (item.options) {
                        if (item.options.choco) optionsDisplay += `<div>초코: 추가</div>`;
                        if (item.options.strawberry) optionsDisplay += `<div>딸기: 추가</div>`;
                    }

                    const listItem = document.createElement("div");
                    listItem.className = "cart-item";
                    listItem.innerHTML = `
                        <img src="${item.image}" alt="${item.name} 이미지" class="item-image">
                        <div class="item-details">
                            <span>${item.name} - ${item.price.toLocaleString()} 원</span>
                            ${optionsDisplay ? optionsDisplay : ''}
                            <div class="quantity-controls">
                                <button class="quantity-btn" data-action="decrease" data-id="${item.id}">-</button>
                                <span>${item.quantity != null ? item.quantity : 1}</span>
                                <button class="quantity-btn" data-action="increase" data-id="${item.id}">+</button>
                            </div>
                            <span>${itemTotal} 원</span>
                            <button class="detail-btn" data-id="${item.id}">상세보기</button>
                            <button class="remove-btn" data-id="${item.id}">삭제</button>
                        </div>
                    `;
                    cartList.appendChild(listItem);
                    total += item.price * (item.quantity || 1);
                });
            }

            document.getElementById("total-amount").innerText = total.toLocaleString() + " 원";
        }

        function changeQuantity(productId, change) {
            const product = cart.find(item => item.id === productId);
            if (product) {
                product.quantity = Math.max(1, (product.quantity || 1) + change);
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartDisplay();
            }
        }

        function showOptions(productId) {
            currentProductId = productId;
            const product = cart.find(item => item.id === productId);
            if (product) {
                document.getElementById("selectedProduct").innerText = product.name;
                document.getElementById("modalImage").src = product.image;
                document.getElementById("modal").style.display = "block";
                const selectedOptions = product.options || {};
                const modalOptions = document.getElementById("modalOptions");
                modalOptions.innerHTML = '';
                if (selectedOptions.size) {
                    modalOptions.innerHTML += `<div>사이즈: ${selectedOptions.size}</div>`;
                }
                if (selectedOptions.cup) {
                    modalOptions.innerHTML += `<div>컵: ${selectedOptions.cup}</div>`;
                }
            }
        }

        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }

        function removeFromCart(productId) {
            const index = cart.findIndex(item => item.id === productId);
            if (index !== -1) {
                cart.splice(index, 1);
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartDisplay();
            }
        }

        function completePayment() {
            if (cart.length === 0) {
                alert("장바구니가 비어있습니다. 상품을 담아주세요.");
                return;
            }

            const orderId = new Date().getTime();
            const orderDate = new Date().toLocaleDateString();

            const confirmation = confirm("결제가 완료되었습니다! 확인을 누르면 주문 내역으로 이동합니다.");

            if (confirmation) {
                const orderDetails = {
                    orderId: orderId,
                    orderDate: orderDate,
                    items: cart
                };

                // OrderDAO 객체를 사용하여 주문 저장
                const orderDAO = <%= OrderDAO.getInstance() %>;
                orderDAO.addOrder(new OrderVO(orderId, orderDate, cart));  // OrderVO를 생성하여 주문 추가

                localStorage.setItem("cart", JSON.stringify([]));  // 장바구니 비우기
                window.location.href = "order_list.jsp";  // 주문 내역 페이지로 이동
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            updateCartDisplay();

            // 이벤트 리스너 추가
            document.getElementById("cart-list").addEventListener("click", function(e) {
                if (e.target.classList.contains("quantity-btn")) {
                    const action = e.target.dataset.action;
                    const id = parseInt(e.target.dataset.id);
                    if (action === "increase") {
                        changeQuantity(id, 1);
                    } else if (action === "decrease") {
                        changeQuantity(id, -1);
                    }
                } else if (e.target.classList.contains("remove-btn")) {
                    const id = parseInt(e.target.dataset.id);
                    removeFromCart(id);
                } else if (e.target.classList.contains("detail-btn")) {
                    const id = parseInt(e.target.dataset.id);
                    showOptions(id);
                }
            });
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div id="wrap">
        <div id="header">
            <jsp:include page="header.jsp" />
        </div>

        <div id="content-wrap">
            <div class="sub_visual bg-paik">
                <div class="txt">
                    <h1>장바구니</h1>
                </div>
            </div>
            <div class="cart_container">
                <h1>장바구니</h1>
                <div id="cart-list"></div>
                <div id="empty-message" style="display: none;">담긴 상품이 없습니다.</div>
                <h2 class="total">
                    총 합계: <span id="total-amount">0 원</span>
                </h2>
                <button onclick="completePayment()">결제하기</button>
            </div>
        </div>

        <div id="modal">
            <div>
                <span id="selectedProduct"></span>
                <img id="modalImage" src="" alt="상품 이미지" style="max-width: 100%;">
                <div id="modalOptions"></div>
                <button onclick="closeModal()">닫기</button>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp" />
        </div>
    </div>
</body>
</html>
