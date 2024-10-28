<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="project.InquiryDAO" %>
<%@ page import="project.InquiryVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 내역 보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            max-width: 800px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .table-sm { font-size: 14px; cursor: pointer; }
    </style>
</head>
<body>
<div id="wrap">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>

    <div id="content-wrap">
        <div class="sub_visual bg-paik">
            <div class="txt">
                <h1>고객의 소리</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="search-container">
            <select id="categoryFilter" class="form-control" style="width: auto; margin-right: 10px;">
                <option value="">--분류--</option>
                <option value="칭찬">칭찬</option>
                <option value="불만">불만</option>
                <option value="문의">문의</option>
                <option value="제안">제안</option>
            </select>
            <input type="text" id="searchInput" class="form-control" placeholder="제목 검색" style="width: auto; display: inline-block;">
            <button id="searchButton" class="btn btn-primary">검색</button>
        </div>

        <table class="table table-sm">
            <thead>
                <tr>
                    <th>분류</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody id="inquiryTableBody">
                <%
                    InquiryDAO inquiryDAO = InquiryDAO.getInstance();
                    List<InquiryVO> inquiryList = null;

                    try {
                        inquiryList = inquiryDAO.getAllInquiries();
                        if (inquiryList == null) {
                            inquiryList = new ArrayList<>();
                        }
                    } catch (SQLException se) {
                        se.printStackTrace(); // 콘솔에 오류 출력
                        inquiryList = new ArrayList<>(); // 빈 리스트로 초기화
                    } catch (Exception e) {
                        e.printStackTrace(); // 콘솔에 오류 출력
                        inquiryList = new ArrayList<>(); // 빈 리스트로 초기화
                    }

                    if (inquiryList.isEmpty()) {
                        out.println("<tr><td colspan='4'>문의 내역이 없습니다.</td></tr>");
                    } else {
                        for (InquiryVO inquiry : inquiryList) {
                %>
                <tr>
                    <td><%= inquiry.getType() %></td>
                    <td><%= inquiry.getTitle() %></td>
                    <td><%= inquiry.getInput_date() %></td>
                    <td><%= inquiry.getStatus() %></td>
                </tr>
                <%
                        } // end for
                    }
                %>
            </tbody>
        </table>
    </div>

    <div id="footer">
        <jsp:include page="footer.jsp"/>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#searchButton').click(function() {
            const searchText = $('#searchInput').val().toLowerCase();
            const selectedCategory = $('#categoryFilter').val();
            
            $('#inquiryTableBody tr').filter(function() {
                const title = $(this).find('td:eq(1)').text().toLowerCase();
                const type = $(this).find('td:eq(0)').text();
                const matchesTitle = title.indexOf(searchText) > -1;
                const matchesCategory = selectedCategory ? type === selectedCategory : true;
                $(this).toggle(matchesTitle && matchesCategory);
            });
        });
    });
</script>
</body>
</html>
