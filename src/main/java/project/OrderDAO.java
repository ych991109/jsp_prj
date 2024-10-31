package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderDAO {
    private static OrderDAO instance;

    // Singleton 패턴
    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/your_database_name"; // 데이터베이스 URL
        String user = "your_username"; // 사용자명
        String password = "your_password"; // 비밀번호
        return DriverManager.getConnection(url, user, password);
    }

    public void addOrder(OrderVO order) {
        String sql = "INSERT INTO orders (order_id, order_date) VALUES (?, ?)";

        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setLong(1, order.getOrderId());
            pstmt.setString(2, order.getOrderDate());
            pstmt.executeUpdate();

            // 주문 항목 추가
            for (CartItemVO item : order.getItems()) {
                addCartItem(order.getOrderId(), item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void addCartItem(long orderId, CartItemVO item) {
        String sql = "INSERT INTO order_items (order_id, product_id, name, image, price, quantity) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setLong(1, orderId);
            pstmt.setInt(2, item.getId());
            pstmt.setString(3, item.getName());
            pstmt.setString(4, item.getImage());
            pstmt.setInt(5, item.getPrice());
            pstmt.setInt(6, item.getQuantity());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
