package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    private Connection getConnection() throws SQLException {
        // 데이터베이스 연결 코드 (URL, 사용자 이름, 비밀번호 등)
        String url = "jdbc:mysql://localhost:3306/your_database"; // 데이터베이스 URL
        String user = "your_username"; // 사용자 이름
        String password = "your_password"; // 비밀번호
        return DriverManager.getConnection(url, user, password);
    }

    // 메뉴 목록 조회
    public List<MenuVO> getMenuList() {
        List<MenuVO> menuList = new ArrayList<>();
        String query = "SELECT id, name, imageUrl, price FROM menu";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                MenuVO menu = new MenuVO();
                menu.setId(rs.getInt("id"));
                menu.setName(rs.getString("name"));
                menu.setImageUrl(rs.getString("imageUrl"));
                menu.setPrice(rs.getDouble("price"));
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    // 메뉴 추가
    public void addMenu(MenuVO menu) {
        String query = "INSERT INTO menu (name, imageUrl, price) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, menu.getName());
            pstmt.setString(2, menu.getImageUrl());
            pstmt.setDouble(3, menu.getPrice());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 메뉴 삭제
    public void deleteMenu(int id) {
        String query = "DELETE FROM menu WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
