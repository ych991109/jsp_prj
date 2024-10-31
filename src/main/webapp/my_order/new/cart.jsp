<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>장바구니</title>
</head>
<body>
    <header>
        <h1>장바구니</h1>
    </header>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>상품1</td>
                <td>2</td>
                <td>10000원</td>
                <td><form action="removeFromCart.jsp" method="post">
                    <input type="hidden" name="product" value="상품1">
                    <button type="submit">삭제</button>
                </form></td>
            </tr>
            <tr>
                <td>상품2</td>
                <td>1</td>
                <td>20000원</td>
                <td><form action="removeFromCart.jsp" method="post">
                    <input type="hidden" name="product" value="상품2">
                    <button type="submit">삭제</button>
                </form></td>
            </tr>
        </tbody>
    </table>
    <p>총합계: 30000원</p>
    <button onclick="location.href='order.jsp'">주문하기</button>
    <footer>
        <p>© 2024 쇼핑몰</p>
    </footer>
</body>
</html>
