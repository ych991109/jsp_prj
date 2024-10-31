<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문하기</title>
</head>
<body>
    <header>
        <h1>상품 주문하기</h1>
    </header>
    <form action="orderProcess.jsp" method="post">
        <label for="product">상품 선택:</label>
        <select id="product" name="product">
            <option value="상품1">상품1</option>
            <option value="상품2">상품2</option>
            <option value="상품3">상품3</option>
        </select>
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" min="1" value="1">
        <button type="submit">주문하기</button>
    </form>
    <footer>
        <p>© 2024 쇼핑몰</p>
    </footer>
</body>
</html>
