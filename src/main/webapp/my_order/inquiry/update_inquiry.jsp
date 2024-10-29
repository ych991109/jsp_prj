<%@ page import="project.InquiryDAO" %>
<%@ page import="project.InquiryVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="문의 수정 처리" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <title>문의 수정 결과</title>
</head>
<body>
    <%
        String inquiryId = request.getParameter("id");
        String inquiryType = request.getParameter("inquiryType");
        String inquiryTitle = request.getParameter("inquiryTitle");
        String inquiryContent = request.getParameter("inquiryContent");

        InquiryDAO inquiryDAO = InquiryDAO.getInstance();
        InquiryVO inquiry = new InquiryVO();
        inquiry.setId(Integer.parseInt(inquiryId));
        inquiry.setType(inquiryType);
        inquiry.setTitle(inquiryTitle);
        inquiry.setContent(inquiryContent);
        
        try {
            inquiryDAO.updateInquiry(inquiry);
            response.sendRedirect("inquiry_detail.jsp?id=" + inquiryId);
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>수정 실패: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
