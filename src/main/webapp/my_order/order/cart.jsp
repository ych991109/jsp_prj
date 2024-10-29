<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="shortcut icon" href="http://192.168.10.216/html_prj/common/images/favicon.ico"/>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 600px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 5px;
            width: 300px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .modal-image {
            width: 40%;
            margin-bottom: 15px;
            margin-left: 100px;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        .quantity-controls button {
            font-size: 14px;
            padding: 5px 8px;
            margin: 0 5px;
        }
        .total {
            text-align: center;
            font-size: 20px;
            margin-top: 20px;
            color: #000000;
        }
        button {
            background-color: #45a049;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #388e3c;
        }
        #empty-message {
            text-align: center;
            font-size: 16px;
            color: #999;
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

                    if (item.name.includes('아이스크림')) {
                        if (item.options) {
                            if (item.options.choco) optionsDisplay += `<div>초코: 추가</div>`;
                            if (item.options.strawberry) optionsDisplay += `<div>딸기: 추가</div>`;
                        }
                    } else {
                        optionsDisplay += `<div>사이즈: ${item.options && item.options.size ? item.options.size : 'M'}</div>`;
                        optionsDisplay += `<div>컵: ${item.options && item.options.cup ? item.options.cup : '일회용컵'}</div>`;
                        if (item.options && item.options.shot) optionsDisplay += `<div>샷: 추가</div>`;
                        if (item.options && item.options.syrup) optionsDisplay += `<div>시럽: 추가</div>`;
                    }

                    const listItem = document.createElement("div");
                    listItem.className = "cart-item";
                    listItem.innerHTML = `
                        <img src="${item.image}" alt="${item.name} 이미지" class="item-image">
                        <div class="item-details">
                            <span>${item.name} - ${item.price.toLocaleString()} 원</span>
                            ${optionsDisplay ? optionsDisplay : ''}
                            <div class="quantity-controls">
                                <button onclick="changeQuantity(${item.id}, -1)">-</button>
                                <span>${item.quantity != null ? item.quantity : 1}</span>
                                <button onclick="changeQuantity(${item.id}, 1)">+</button>
                            </div>
                            <span>${itemTotal} 원</span>
                            <button onclick="showOptions(${item.id})">상세보기</button>
                            <button onclick="removeFromCart(${item.id})">삭제</button>
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

                if (product.name.includes('아이스크림')) {
                    document.getElementById("icecream-options").style.display = "block";
                    document.getElementById("coffee-options").style.display = "none";
                } else {
                    document.getElementById("coffee-options").style.display = "block";
                    document.getElementById("icecream-options").style.display = "none";
                }

                // 기본값 설정
                document.querySelector(`input[name="size"][value="${selectedOptions.size || 'M'}"]`).checked = true;
                document.querySelector(`input[name="cup"][value="${selectedOptions.cup || '일회용컵'}"]`).checked = true;
                document.querySelector(`input[name="shot"]`).checked = selectedOptions.shot || false;
                document.querySelector(`input[name="syrup"]`).checked = selectedOptions.syrup || false;
                document.querySelector(`input[name="choco"]`).checked = selectedOptions.choco || false;
                document.querySelector(`input[name="strawberry"]`).checked = selectedOptions.strawberry || false;
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

        function submitOptions() {
            const product = cart.find(item => item.id === currentProductId);
            if (product) {
                const optionsForm = document.forms["optionsForm"];
                product.options = {};

                if (product.name.includes('아이스크림')) {
                    product.options.choco = optionsForm.choco.checked;
                    product.options.strawberry = optionsForm.strawberry.checked;
                } else {
                    product.options.size = optionsForm.size.value;
                    product.options.cup = optionsForm.cup.value;
                    product.options.shot = optionsForm.shot.checked;
                    product.options.syrup = optionsForm.syrup.checked;
                }

                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartDisplay();
                closeModal();
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

                const previousOrders = JSON.parse(localStorage.getItem("orders")) || [];
                previousOrders.push(orderDetails);

                localStorage.setItem("orders", JSON.stringify(previousOrders));
                localStorage.setItem("lastOrderId", orderId);

                localStorage.removeItem("cart");
                window.location.href = "orderList.html";
            }
        }

        window.onload = updateCartDisplay;
    </script>
</head>
<body>
    <div class="container">
        <h1>장바구니</h1>
        <div id="cart-list"></div>
        <div id="empty-message" style="display: none;">담긴 상품이 없습니다.</div>
        <h2 class="total">총 합계: <span id="total-amount">0 원</span></h2>
        <button onclick="completePayment()">결제하기</button>

        <div id="modal" class="modal">
            <div class="modal-content">
                <span onclick="closeModal()" style="cursor:pointer; float:right;">&times;</span>
                <img id="modalImage" class="modal-image" src="" alt="상품 이미지">
                <h2 id="selectedProduct">상품</h2>
                <form id="optionsForm">
                    <div id="coffee-options">
                        <h3>사이즈 선택</h3>
                        <label><input type="radio" name="size" value="S"> S</label><br>
                        <label><input type="radio" name="size" value="M" checked> M</label><br>
                        <label><input type="radio" name="size" value="L"> L</label><br>

                        <h3>컵 선택</h3>
                        <label><input type="radio" name="cup" value="일회용컵" checked> 일회용 컵 사용</label><br>
                        <label><input type="radio" name="cup" value="다회용컵"> 다회용 컵 사용</label><br>

                        <h3>샷 추가</h3>
                        <label><input type="checkbox" name="shot"> 에스프레소 샷 추가</label><br>

                        <h3>시럽 추가</h3>
                        <label><input type="checkbox" name="syrup"> 시럽 추가</label><br>
                    </div>
                    <div id="icecream-options" style="display: none;">
                        <h3>토핑 추가</h3>
                        <label><input type="checkbox" name="choco"> 초코 추가</label><br>
                        <label><input type="checkbox" name="strawberry"> 딸기 추가</label><br>
                    </div>
                </form>
                <div class="modal-footer">
                    <button onclick="closeModal()">취소</button>
                    <button onclick="submitOptions()">적용</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
