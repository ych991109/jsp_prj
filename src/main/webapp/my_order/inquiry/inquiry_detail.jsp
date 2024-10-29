<%@ page import="project.InquiryDAO" %>
<%@ page import="project.InquiryVO" %>
<%@ page import="java.sql.SQLException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="고객의 소리" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">
    <link rel="stylesheet" href="https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4" media="all" />

    <title>빽다방 | 문의 상세</title>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .list_container {
            margin-top: 30px;
            margin-bottom: 30px;
            width: 900px; /* 너비를 고정 설정 */
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-left: auto; /* 가운데 정렬 */
            margin-right: auto; /* 가운데 정렬 */
        }
        .form-group { margin-bottom: 15px; }
        /* 내용 입력 칸 높이 조정 */
        #inquiryContent {
            height: 300px; /* 높이를 300px로 조정 */
        }
        .button-container {
            display: flex;
            justify-content: flex-end; /* 오른쪽 정렬 */
            margin-top: 20px;
        }
        .button-container a {
            margin-left: 10px; /* 버튼 간격 조정 */
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
    <div id="wrap">
        <div id="header">
            <jsp:include page="header.jsp"/>
        </div>

        <div id="content-wrap">
            <div class="sub_visual bg-paik">
                <div class="txt">
                    <h1>문의 상세</h1>
                </div>
            </div>
            <div class="list_container">
                <div class="form-container">
                    <h2 class="text-center mb-4">문의 상세</h2>
                    <%
                        String inquiryId = request.getParameter("id"); // URL에서 ID 가져오기
                        InquiryDAO inquiryDAO = InquiryDAO.getInstance();
                        InquiryVO inquiry = null;

                        try {
                            inquiry = inquiryDAO.getInquiryById(inquiryId); // ID로 문의 정보 조회
                        } catch (SQLException se) {
                            se.printStackTrace();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        if (inquiry != null) {
                    %>
                    <div class="form-group">
                        <label for="inquiryType">분류</label>
                        <input type="text" id="inquiryType" class="form-control" name="inquiryType" value="<%= inquiry.getType() %>" disabled>
                    </div>
                    <div class="form-group">
                        <label for="inquiryTitle">제목</label>
                        <input type="text" id="inquiryTitle" class="form-control" name="inquiryTitle" value="<%= inquiry.getTitle() %>" disabled>
                    </div>
                    <div class="form-group">
                        <label for="inquiryContent">내용</label>
                        <textarea id="inquiryContent" class="form-control" name="inquiryContent" rows="6" disabled><%= inquiry.getContent() %></textarea>
                    </div>
                    <div class="button-container">
                        <button id="deleteButton" class="btn btn-danger">문의 삭제</button>
                        <a href="edit_inquiry.jsp?id=<%= inquiryId %>" class="btn btn-warning">수정</a>
                    </div>
                    <%
                        } else {
                    %>
                    <p>해당 문의를 찾을 수 없습니다.</p>
                    <%
                        }
                    %>
                    <div class="button-container">
                        <a href="inquiry_list.jsp" class="btn btn-secondary">목록으로</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#deleteButton').click(function() {
                if (confirm("정말로 삭제하시겠습니까?")) {
                    $.ajax({
                        type: "POST",
                        url: "delete_inquiry.jsp?id=<%= inquiryId %>",
                        success: function(response) {
                            if (response.success) {
                                alert("문의가 삭제되었습니다.");
                                window.location.href = "inquiry_list.jsp"; // 목록 페이지로 이동
                            } else {
                                alert("삭제에 실패했습니다.");
                            }
                        },
                        error: function() {
                            alert("오류가 발생했습니다.");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
