<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="메뉴 - 커피 페이지"
    %>
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
        <div id="inquiryDetail"></div>
        <div class="button-container">
            <div>
                <button id="updateButton" class="btn btn-primary">수정하기</button>
                <button id="deleteButton" class="btn btn-danger" style="margin-left: 10px;">삭제하기</button>
            </div>
            <a href="inquiry_list.html" class="btn btn-secondary">목록으로</a>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        const index = new URLSearchParams(window.location.search).get('index');
        const inquiries = JSON.parse(localStorage.getItem('inquiries')) || [];
        const inquiry = inquiries[index];

        if (inquiry) {
            $('#inquiryDetail').html(`
                <div class="content-text">
                    <h3 class="title">${inquiry.title}</h3>
                    <div class="meta">분류: ${inquiry.type} | 날짜: ${inquiry.date}</div>
                    <div class="meta">상태: ${inquiry.status}</div>
                    <p>${inquiry.content}</p>
                </div>
            `);
        } else {
            $('#inquiryDetail').html('<p class="text-danger">해당 문의를 찾을 수 없습니다.</p>');
        }

        $('#updateButton').click(function() {
            window.location.href = `inquiry_edit.html?index=${index}`;
        });

        $('#deleteButton').click(function() {
            if (confirm('정말로 이 문의를 삭제하시겠습니까?')) {
                inquiries.splice(index, 1);
                localStorage.setItem('inquiries', JSON.stringify(inquiries));
                alert('문의가 삭제되었습니다.');
                window.location.href = 'inquiry_list.html';/* ------------------ */
            }
        });
    });
</script>
</body>
</html>
