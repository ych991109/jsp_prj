package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private static CartDAO instance;
    private Connection connection;

    // Singleton 패턴을 위한 생성자
    private CartDAO() {
        try {
            // DB 연결 설정 (여기서는 MySQL을 예시로 사용)
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_username", "your_password");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Singleton 인스턴스 반환
    public static synchronized CartDAO getInstance() {
        if (instance == null) {
            instance = new CartDAO();
        }
        return instance;
    }

    // 장바구니에 아이템 추가
    public void addOrder(CartItemVO item) {
        String sql = "INSERT INTO cart_items (id, name, image, price, quantity) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, item.getId());
            pstmt.setString(2, item.getName());
            pstmt.setString(3, item.getImage());
            pstmt.setInt(4, item.getPrice());
            pstmt.setInt(5, item.getQuantity());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 장바구니 아이템 목록 조회
    public List<CartItemVO> getAllItems() {
        List<CartItemVO> items = new ArrayList<>();
        String sql = "SELECT * FROM cart_items";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                CartItemVO item = new CartItemVO(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("image"),
                    rs.getInt("price"),
                    rs.getInt("quantity"),
                    new OptionVO("defaultSize", "defaultCup", false, false) // 기본 옵션
                );
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // 장바구니 아이템 수정
    public void updateOrder(CartItemVO item) {
        String sql = "UPDATE cart_items SET name = ?, image = ?, price = ?, quantity = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, item.getName());
            pstmt.setString(2, item.getImage());
            pstmt.setInt(3, item.getPrice());
            pstmt.setInt(4, item.getQuantity());
            pstmt.setInt(5, item.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 장바구니 아이템 삭제 (선택사항)
    public void deleteOrder(int id) {
        String sql = "DELETE FROM cart_items WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
