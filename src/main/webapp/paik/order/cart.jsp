<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>(); // 장바구니가 비어있으면 초기화
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
    <h1>장바구니</h1>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>아이디</th>
        </tr>
        <%
            for (Map<String, Object> item : cart) {
                String name = (String) item.get("name");
                int price = item.get("price") != null ? ((Number) item.get("price")).intValue() : 0; // null 체크
                int quantity = item.get("quantity") != null ? ((Number) item.get("quantity")).intValue() : 0; // null 체크
                String id = (String) item.get("id");
        %>
        <tr>
            <td><%= name != null ? name : "상품명 없음" %></td>
            <td><%= price %> 원</td>
            <td><%= quantity %></td>
            <td><%= id != null ? id : "아이디 없음" %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
