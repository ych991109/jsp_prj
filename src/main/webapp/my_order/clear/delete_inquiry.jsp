<%@ page import="project.InquiryDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%
    String inquiryId = request.getParameter("id");
    InquiryDAO inquiryDAO = InquiryDAO.getInstance();
    boolean isDeleted = false;

    try {
        isDeleted = inquiryDAO.deleteInquiry(inquiryId); // boolean 값을 반환
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.setContentType("application/json");
    response.getWriter().write("{\"success\":" + isDeleted + "}");
%>
