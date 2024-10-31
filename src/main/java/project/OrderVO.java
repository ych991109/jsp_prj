package project;

import java.util.List;

public class OrderVO {
    private long orderId; // 주문 ID
    private String orderDate; // 주문 날짜
    private List<CartItemVO> items; // 주문한 아이템 리스트

    // 생성자
    public OrderVO(long orderId, String orderDate, List<CartItemVO> items) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.items = items;
    }

    // Getter 및 Setter
    public long getOrderId() { return orderId; }
    public void setOrderId(long orderId) { this.orderId = orderId; }
    public String getOrderDate() { return orderDate; }
    public void setOrderDate(String orderDate) { this.orderDate = orderDate; }
    public List<CartItemVO> getItems() { return items; }
    public void setItems(List<CartItemVO> items) { this.items = items; }
}
