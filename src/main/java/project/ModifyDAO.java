package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import kr.co.sist.dao.DbConnection;

public class ModifyDAO {
    private static ModifyDAO mDAO;

    private ModifyDAO() {}

    public static ModifyDAO getInstance() {
        if (mDAO == null) {
            mDAO = new ModifyDAO();
        }
        return mDAO;
    }

    private static final String INSERT_INQUIRY_SQL = 
        "INSERT INTO inquiries (type, usagePath, visitDate, notification, name, phone, email, title, content, input_date, status) VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, SYSDATE, ?)";

    private static final String UPDATE_USER_SQL = 
        "UPDATE users SET password = ?, name = ?, zipcode = ?, address = ?, address2 = ? WHERE email = ?";

    // 문의 등록 메소드
    public void insertInquiry(InquiryVO inquiry) throws SQLException {
        try (Connection con = DbConnection.getInstance().getConn();
             PreparedStatement pstmt = con.prepareStatement(INSERT_INQUIRY_SQL)) {

            pstmt.setString(1, inquiry.getType());
            pstmt.setString(2, inquiry.getUsagePath());
            pstmt.setString(3, inquiry.getVisitDate());
            pstmt.setString(4, inquiry.getNotification());
            pstmt.setString(5, inquiry.getName());
            pstmt.setString(6, inquiry.getPhone());
            pstmt.setString(7, inquiry.getEmail());
            pstmt.setString(8, inquiry.getTitle());
            pstmt.setString(9, inquiry.getContent());
            pstmt.setDate(10, new java.sql.Date(inquiry.getInput_date().getTime())); // Date 변환
            pstmt.setString(11, inquiry.getStatus());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 사용자 정보 수정 메소드
    public void updateUser(ModifyVO modifyVO) throws SQLException {
        try (Connection con = DbConnection.getInstance().getConn();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_USER_SQL)) {

            pstmt.setString(1, modifyVO.getPassword());
            pstmt.setString(2, modifyVO.getName());
            pstmt.setString(3, modifyVO.getZipcode());
            pstmt.setString(4, modifyVO.getAddress());
            pstmt.setString(5, modifyVO.getAddress2());
            pstmt.setString(6, modifyVO.getEmail());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 모든 문의 가져오기 메소드
    public List<InquiryVO> getAllInquiries() throws SQLException {
        List<InquiryVO> inquiries = new ArrayList<>();
        String query = "SELECT * FROM inquiries";

        try (Connection con = DbConnection.getInstance().getConn();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                InquiryVO inquiry = new InquiryVO();
                inquiry.setId(rs.getInt("id"));
                inquiry.setType(rs.getString("type"));
                inquiry.setUsagePath(rs.getString("usagePath"));
                inquiry.setVisitDate(rs.getString("visitDate"));
                inquiry.setNotification(rs.getString("notification"));
                inquiry.setName(rs.getString("name"));
                inquiry.setPhone(rs.getString("phone"));
                inquiry.setEmail(rs.getString("email"));
                inquiry.setTitle(rs.getString("title"));
                inquiry.setContent(rs.getString("content"));
                inquiry.setInput_date(rs.getDate("input_date"));
                inquiry.setStatus(rs.getString("status"));
                inquiries.add(inquiry);
            }
        }

        return inquiries;
    }
}
