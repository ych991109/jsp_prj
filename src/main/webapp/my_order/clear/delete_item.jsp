<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String productId = request.getParameter("productId");
    
    // 데이터베이스나 세션에서 해당 상품을 삭제하는 로직 구현
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
    if (cart != null && productId != null) {
        cart.remove(productId);
        session.setAttribute("cart", cart); // 세션 업데이트
    }

    out.print("success"); // 성공 응답 전송
%>
