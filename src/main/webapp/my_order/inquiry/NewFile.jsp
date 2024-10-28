<%@ page import="project.InquiryDAO" %>
<%@ page import="project.InquiryVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

    <title>빽다방 | 문의 내역</title>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            width: 900px; /* 너비를 고정 설정 */
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-left: auto; /* 가운데 정렬 */
            margin-right: auto; /* 가운데 정렬 */
        }
        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .table-sm { font-size: 14px; cursor: pointer; }
    </style>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
    <div id="wrap">
        <div id="header">
            <jsp:include page="header.jsp"/>
        </div>

        <div id="content-wrap">
            <div class="sub_visual bg-paik">
                <div class="txt">
                    <h1>문의 내역</h1>
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
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
