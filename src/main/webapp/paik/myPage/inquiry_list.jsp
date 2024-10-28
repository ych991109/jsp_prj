<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 내역 보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa; /* 페이지 배경색 */
        }
        .container {
            margin-top: 30px;
            max-width: 800px; /* 최대 너비 조정 */
            padding: 20px; /* 내부 여백 */
            background-color: #ffffff; /* 컨테이너 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        .search-container {
            display: flex;
            justify-content: flex-end; /* 오른쪽 정렬 */
            margin-bottom: 20px;
        }
        .search-container select,
        .search-container input {
            margin-left: 10px; /* 간격 추가 */
            font-size: 14px; /* 글자 크기 조정 */
        }
        #searchButton {
            font-size: 14px; /* 글자 크기 조정 */
            padding: 5px 10px; /* 버튼 패딩 조정 */
        }
        .table-sm { font-size: 14px; cursor: pointer; } /* 테이블 폰트 크기 조정 및 커서 스타일 변경 */
    </style>
</head>
<body>
<div class="container">
    <div class="search-container">
        <select id="categoryFilter" class="form-control" style="width: auto;">
            <option value="">--분류--</option>
            <option value="칭찬">칭찬</option>
            <option value="불만">불만</option>
            <option value="문의">문의</option>
            <option value="제안">제안</option>
        </select>
        <input type="text" id="searchInput" class="form-control" placeholder="검색어 입력" style="width: auto;">
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
                // 실제 데이터베이스에서 가져오는 로직으로 대체 필요
                List<Map<String, Object>> inquiries = (List<Map<String, Object>>) request.getAttribute("inquiries");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                if (inquiries != null) {
                    for (int i = 0; i < inquiries.size(); i++) {
                        Map<String, Object> inquiry = inquiries.get(i);
                        String type = (String) inquiry.get("type");
                        String title = (String) inquiry.get("title");
                        Date date = (Date) inquiry.get("date");
                        String status = (String) inquiry.get("status");
            %>
                        <tr data-index="<%= i %>">
                            <td><%= type %></td>
                            <td><%= title %></td>
                            <td><%= sdf.format(date) %></td>
                            <td><%= status %></td>
                        </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function() {
        // 각 행 클릭 시 상세 페이지로 이동
        $('#inquiryTableBody').on('click', 'tr', function() {
            const index = $(this).data('index');
            window.location.href = `inquiry_detail.jsp?index=${index}`; // 상세 페이지로 이동
        });

        // 검색 기능 구현
        $('#searchButton').click(function() {
            const filter = $('#categoryFilter').val();
            const searchText = $('#searchInput').val().toLowerCase();
            $('#inquiryTableBody').empty(); // 기존 데이터 삭제

            // AJAX 호출로 서버에서 검색 결과를 가져오는 로직 추가 가능
            // 예: $.ajax({ ... });
        });
    });
</script>
</body>
</html>
