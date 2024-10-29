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
        }
        #wrap {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        #content-wrap {
            flex: 1;
            padding: 20px;
        }
        .sub_visual {
            background-image: url('path/to/your/image.jpg'); /* 배경 이미지 경로 */
            background-size: cover;
            background-position: center;
            padding: 60px 0;
            text-align: center;
            color: black;
        }
        .cart-container {
            width: 600px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 0 auto;
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
        .total {
            text-align: center;
            font-size: 20px;
            margin-top: 20px;
            color: #000;
        }
        .cart-button {
            background-color: #45a049;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .cart-button:hover {
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
                                <button class="cart-button" onclick="changeQuantity(${item.id}, -1)">-</button>
                                <span>${item.quantity != null ? item.quantity : 1}</span>
                                <button class="cart-button" onclick="changeQuantity(${item.id}, 1)">+</button>
                            </div>
                            <span>${itemTotal} 원</span>
                            <button class="cart-button" onclick="showOptions(${item.id})">상세보기</button>
                            <button class="cart-button" onclick="removeFromCart(${item.id})">삭제</button>
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
                alert("장바구니가 비어 있습니다.");
                return;
            }
            const orderId = Date.now();
            const orderDate = new Date().toLocaleString();
            const confirmation = confirm("주문을 완료하시겠습니까? 확인을 누르면 주문 내역으로 이동합니다.");

            if (confirmation) {
                const orderDetails = {
                    orderId: orderId,
                    orderDate: orderDate,
                    items: cart
                };
                // 결제 처리 로직...
                alert(`주문이 완료되었습니다! 주문 ID: ${orderId}, 주문 날짜: ${orderDate}`);
            }
        }

        window.onload = updateCartDisplay;
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
                    <h1>장바구니</h1>
                </div>
            </div>

            <div class="cart-container">
                <div id="cart-list"></div>
                <div id="empty-message" style="display: none;">담긴 상품이 없습니다.</div>
                <h2 class="total">총 합계: <span id="total-amount">0 원</span></h2>
                <button class="cart-button" onclick="completePayment()">결제하기</button>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>

    <div id="modal" class="modal">
        <div class="modal-content">
            <span onclick="closeModal()" style="float:right;cursor:pointer;">&times;</span>
            <h2 id="selectedProduct"></h2>
            <img id="modalImage" src="" alt="" style="width: 100%; border-radius: 5px;">
            <form name="optionsForm">
                <div id="icecream-options" style="display: none;">
                    <label><input type="checkbox" name="choco"> 초코 추가</label><br>
                    <label><input type="checkbox" name="strawberry"> 딸기 추가</label><br>
                </div>
                <div id="coffee-options" style="display: none;">
                    <label>사이즈:
                        <select name="size">
                            <option value="S">S</option>
                            <option value="M" selected>M</option>
                            <option value="L">L</option>
                        </select>
                    </label><br>
                    <label>컵:
                        <select name="cup">
                            <option value="일회용컵">일회용컵</option>
                            <option value="머그컵">머그컵</option>
                        </select>
                    </label><br>
                    <label><input type="checkbox" name="shot"> 샷 추가</label><br>
                    <label><input type="checkbox" name="syrup"> 시럽 추가</label><br>
                </div>
                <button type="button" class="cart-button" onclick="submitOptions()">확인</button>
            </form>
        </div>
    </div>
</body>
</html>
