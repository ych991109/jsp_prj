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

    <title>빽다방 | 고객의 소리</title>

    <style>
        body {
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
        }
        #wrap {
            padding-top: 30px;
        }
        .sub_visual {
            background-image: url('http://localhost/paik_prj/common/images/your-background-image.jpg');
            background-size: cover;
            background-position: center;
            padding: 60px 0;
            text-align: center;
            color: white;
        }
        .form-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .section-divider {
            border-top: 1px solid #e0e0e0;
            margin: 20px 0;
        }
        .form-control {
            width: 100%;
            margin-bottom: 15px;
        }
        .submit-button {
            display: flex;
            justify-content: center; /* 가운데 정렬 */
            margin-top: 20px;
        }
        .btn {
            width: 150px; /* 동일한 크기 유지 */
            margin: 0 10px; /* 버튼 간격 */
        }
        .agreement {
            max-height: 150px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .additional-info {
            font-size: 14px;
            margin-top: 10px;
        }
        label {
            font-weight: bold;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

    <script>
        $(function() {
            $("#visitDate").datepicker({
                dateFormat: "yy-mm-dd"
            });

            $("#visitDate").on("click", function() {
                $(this).datepicker("show");
            });

            $('#emailDomain').change(function() {
                var selectedDomain = $(this).val();
                $('#customDomain').val(selectedDomain ? selectedDomain : '');
            });
        });

        function submitForm(e) {
            e.preventDefault();

            const inquiry = {
                type: $('#inquiryType').val(),
                usagePath: $('input[name="usagePath"]:checked').val(),
                visitDate: $('#visitDate').val(),
                notification: $('input[name="notification"]:checked').val(),
                name: $('#name').val(),
                phone: $('#phone').val(),
                email: $('#emailInput').val() + '@' + ($('#emailDomain').val() || $('#customDomain').val()),
                title: $('#title').val(),
                content: $('#content').val(),
                date: new Date().toLocaleDateString(),
                status: "처리 중"
            };

            let inquiries = JSON.parse(localStorage.getItem('inquiries')) || [];
            inquiries.push(inquiry);
            localStorage.setItem('inquiries', JSON.stringify(inquiries));

            // 문의 내역 페이지로 리다이렉트
            window.location.href = 'inquiry_list.jsp'; // 여기서 문의 내역 페이지의 경로를 설정
        }

    </script>

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
                    <h1>고객의 소리</h1>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="form-container">
                <h2 class="text-center mb-4">고객의 소리</h2>
                <form id="inquiryForm" onsubmit="submitForm(event);">
                    <div class="form-group">
                        <label for="inquiryType">문의 유형</label>
                        <select class="form-control" id="inquiryType" name="inquiryType" required>
                            <option value="">--분류--</option>
                            <option value="칭찬">칭찬</option>
                            <option value="불만">불만</option>
                            <option value="문의">문의</option>
                            <option value="제안">제안</option>
                        </select>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label>이용 경로</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="usagePath" id="storeVisit" value="매장 방문" required>
                            <label class="form-check-label" for="storeVisit">매장 방문</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="usagePath" id="otherVisit" value="매장 방문 외" required>
                            <label class="form-check-label" for="otherVisit">매장 방문 외</label>
                        </div>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="visitDate">방문일</label>
                        <input type="text" class="form-control" id="visitDate" name="visitDate" required placeholder="방문일 선택" readonly>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label>답변 알림 서비스</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="notification" id="notifyYes" value="받음" required>
                            <label class="form-check-label" for="notifyYes">받음</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="notification" id="notifyNo" value="받지 않음" required>
                            <label class="form-check-label" for="notifyNo">받지 않음</label>
                        </div>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="name">성함</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="phone">휴대폰</label>
                        <input type="tel" class="form-control" id="phone" name="phone" maxlength="11" placeholder="-제외하고 입력" required>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="email">이메일</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="emailInput" name="emailInput" placeholder="이메일" required>
                            <span class="input-group-addon">@</span>
                            <input type="text" class="form-control" id="customDomain" name="customDomain"/>
                            <select class="form-control" id="emailDomain" name="emailDomain" required>
                                <option value="">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="google.com">google.com</option>
                            </select>
                        </div>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="section-divider"></div>

                    <div class="form-group">
                        <label for="content">문의 내용</label>
                        <textarea id="content" name="content" rows="5" class="form-control" maxlength="1000"></textarea>
                        <small class="form-text text-muted">최대 1000자까지 입력할 수 있습니다.</small>
                    </div>

                    <div class="agreement">
                        <h5>개인정보 수집 및 이용 동의</h5>
                        <p>본인은 개인정보 수집 및 이용에 대해 아래 내용을 충분히 읽고 이해하였으며, 동의합니다.</p>
                        <p>1. 수집하는 개인정보의 항목: 성함, 휴대폰, 이메일 등</p>
                        <p>2. 개인정보의 수집 및 이용 목적: 고객 문의에 대한 응답 및 서비스 제공</p>
                        <p>3. 개인정보의 보유 및 이용 기간: 문의 접수 후 1년</p>
                        <p>위 내용을 모두 읽었으며, 개인정보 수집 및 이용에 동의합니다.</p>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agree" name="agree" required>
                        <label class="form-check-label" for="agree" style="font-weight: bold;">개인정보 수집·이용 동의(필수)</label>
                    </div>

                    <div class="additional-info">
                        귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 고객의 소리 서비스를 이용할 수 없습니다.<br>
                        - 개인정보처리자 : (주)더본코리아<br>
                        - 개인정보항목 : 이름, 휴대폰번호, 이메일, 고객 상담을 위해 제공한 정보<br>
                        - 목적 : 고객 고충 및 불만에 대한 처리<br>
                        <strong>- 보유 및 이용기간 : 전자상거래 등에서의 소비자 보호에 관한 법률</strong><br>
                        <strong>◎ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</strong><br>
                    </div>

                    <div class="submit-button">
                        <button type="submit" class="btn btn-primary">제출</button>
                        <a href="https://paikdabang.com/" class="btn btn-secondary">홈으로</a>
                    </div>
                </form>
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
