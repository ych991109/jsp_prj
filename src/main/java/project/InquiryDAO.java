package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import kr.co.sist.dao.DbConnection;

public class InquiryDAO {
    private static InquiryDAO iDAO;

    private InquiryDAO() {
    }

    public static InquiryDAO getInstance() {
        if (iDAO == null) {
            iDAO = new InquiryDAO();
        }
        return iDAO;
    }

    private static final String INSERT_INQUIRY_SQL = 
        "INSERT INTO inquiries (type, usagePath, visitDate, notification, name, phone, email, title, content, input_date, status) VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, SYSDATE, ?)";

    public void insertInquiry(InquiryVO inquiry) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            DbConnection dbCon = DbConnection.getInstance();
            con = dbCon.getConn();
            pstmt = con.prepareStatement(INSERT_INQUIRY_SQL);

            pstmt.setString(1, inquiry.getType());
            pstmt.setString(2, inquiry.getUsagePath());
            pstmt.setString(3, inquiry.getVisitDate());
            pstmt.setString(4, inquiry.getNotification());
            pstmt.setString(5, inquiry.getName());
            pstmt.setString(6, inquiry.getPhone());
            pstmt.setString(7, inquiry.getEmail());
            pstmt.setString(8, inquiry.getTitle());
            pstmt.setString(9, inquiry.getContent());
            pstmt.setDate(10, new java.sql.Date(inquiry.getInput_date().getTime())); // input_date를 설정
            pstmt.setString(11, inquiry.getStatus());

            pstmt.executeUpdate();
        } finally {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    }

    public List<InquiryVO> getAllInquiries() throws SQLException {
        List<InquiryVO> inquiries = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            DbConnection dbCon = DbConnection.getInstance();
            con = dbCon.getConn();
            String query = "SELECT * FROM inquiries";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                InquiryVO inquiry = new InquiryVO();
                inquiry.setId(rs.getInt("id")); // id 추가
                inquiry.setType(rs.getString("type"));
                inquiry.setUsagePath(rs.getString("usagePath"));
                inquiry.setVisitDate(rs.getString("visitDate"));
                inquiry.setNotification(rs.getString("notification"));
                inquiry.setName(rs.getString("name"));
                inquiry.setPhone(rs.getString("phone"));
                inquiry.setEmail(rs.getString("email"));
                inquiry.setTitle(rs.getString("title"));
                inquiry.setContent(rs.getString("content"));
                inquiry.setInput_date(rs.getDate("input_date")); // input_date 설정
                inquiry.setStatus(rs.getString("status"));
                inquiries.add(inquiry);
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }

        return inquiries;
    }

    public boolean deleteInquiry(String inquiryId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String DELETE_INQUIRY_SQL = "DELETE FROM inquiries WHERE id = ?";

        try {
            DbConnection dbCon = DbConnection.getInstance();
            con = dbCon.getConn();
            pstmt = con.prepareStatement(DELETE_INQUIRY_SQL);
            pstmt.setInt(1, Integer.parseInt(inquiryId)); // inquiryId를 정수로 변환하여 설정
            pstmt.executeUpdate();
        } finally {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
		return true;
    }

    public InquiryVO getInquiryById(String id) throws SQLException {
        InquiryVO inquiry = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            DbConnection dbCon = DbConnection.getInstance();
            con = dbCon.getConn();
            String query = "SELECT * FROM inquiries WHERE id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id)); // id를 Integer로 변환하여 설정
            rs = pstmt.executeQuery();

            if (rs.next()) {
                inquiry = new InquiryVO();
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
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }

        return inquiry;
    }

    public void updateInquiry(InquiryVO inquiry) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String UPDATE_INQUIRY_SQL = "UPDATE inquiries SET type = ?, title = ?, content = ? WHERE id = ?";

        try {
            DbConnection dbCon = DbConnection.getInstance();
            con = dbCon.getConn();
            pstmt = con.prepareStatement(UPDATE_INQUIRY_SQL);
            pstmt.setString(1, inquiry.getType());
            pstmt.setString(2, inquiry.getTitle());
            pstmt.setString(3, inquiry.getContent());
            pstmt.setInt(4, inquiry.getId());

            pstmt.executeUpdate();
        } finally {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    }
}
