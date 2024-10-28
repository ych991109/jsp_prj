<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 상세 보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 30px; }
        .content { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        .title { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        .meta { font-size: 12px; color: #777; margin-bottom: 10px; }
        .content-text { font-size: 16px; }
        .button-container { display: flex; justify-content: space-between; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <div id="inquiryDetail">
            <%
                String indexStr = request.getParameter("index");
                if (indexStr != null) {
                    try {
                        int index = Integer.parseInt(indexStr);
                        List<Map<String, Object>> inquiries = (List<Map<String, Object>>) request.getAttribute("inquiries");
                        if (inquiries != null && index >= 0 && index < inquiries.size()) {
                            Map<String, Object> inquiry = inquiries.get(index);
                            String title = (String) inquiry.get("title");
                            String type = (String) inquiry.get("type");
                            String date = (String) inquiry.get("date"); // 적절한 형식으로 변환 필요
                            String status = (String) inquiry.get("status");
                            String content = (String) inquiry.get("content");
            %>
                <div class="content-text">
                    <h3 class="title"><%= title %></h3>
                    <div class="meta">분류: <%= type %> | 날짜: <%= date %></div>
                    <div class="meta">상태: <%= status %></div>
                    <p><%= content %></p>
                </div>
            <%
                        } else {
            %>
                <p class="text-danger">해당 문의를 찾을 수 없습니다.</p>
            <%
                        }
                    } catch (NumberFormatException e) {
            %>
                <p class="text-danger">잘못된 요청입니다.</p>
            <%
                    }
                } else {
            %>
                <p class="text-danger">해당 문의를 찾을 수 없습니다.</p>
            <%
                }
            %>
        </div>
        <div class="button-container">
            <div>
                <button id="updateButton" class="btn btn-primary">수정하기</button>
                <button id="deleteButton" class="btn btn-danger" style="margin-left: 10px;">삭제하기</button>
            </div>
            <a href="inquiry_list.jsp" class="btn btn-secondary">목록으로</a>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        const index = new URLSearchParams(window.location.search).get('index');
        
        $('#updateButton').click(function() {
            window.location.href = `inquiry_edit.jsp?index=${index}`;
        });

        $('#deleteButton').click(function() {
            if (confirm('정말로 이 문의를 삭제하시겠습니까?')) {
                $.ajax({
                    type: 'POST',
                    url: 'delete_inquiry.jsp',
                    data: { index: index },
                    success: function() {
                        alert('문의가 삭제되었습니다.');
                        window.location.href = 'inquiry_list.jsp';
                    }
                });
            }
        });
    });
</script>
</body>
</html>
