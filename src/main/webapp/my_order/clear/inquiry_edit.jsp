<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="메뉴 - 커피 페이지"
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 30px;
}

.content {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.submit-button {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="container">
    <div class="content">
        <div id="editForm"></div>
        <div class="submit-button">
            <button id="saveButton" class="btn btn-primary">저장</button>
            <a href="inquiry_list.html" class="btn btn-secondary" style="margin-left: 10px;">목록으로</a>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        const index = new URLSearchParams(window.location.search).get('index');
        const inquiries = JSON.parse(localStorage.getItem('inquiries')) || [];
        const inquiry = inquiries[index];

        if (inquiry) {
            $('#editForm').html(`
                <div class="form-group">
                    <label>분류: ${inquiry.type}</label>
                </div>
                <div class="form-group">
                    <label>제목</label>
                    <input type="text" id="title" class="form-control" value="${inquiry.title}">
                </div>
                <div class="form-group">
                    <label>문의 내용</label>
                    <textarea id="content" class="form-control" rows="5">${inquiry.content}</textarea>
                </div>
                <div class="form-group">
                    <label>상태</label>
                    <input type="text" id="status" class="form-control" value="${inquiry.status}" readonly>
                </div>
            `);
        }

        $('#saveButton').click(function() {
            inquiry.title = $('#title').val();
            inquiry.content = $('#content').val();
            inquiry.status = $('#status').val();
            inquiries[index] = inquiry;
            localStorage.setItem('inquiries', JSON.stringify(inquiries));
            alert('문의가 수정되었습니다.');
            window.location.href = 'inquiry_list.html';
        });
    });
</script>
</body>
</html>
