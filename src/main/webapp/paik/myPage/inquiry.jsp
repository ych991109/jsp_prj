<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객의 소리</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
    <script>
        $(function() {
            $("#visitDate").datepicker({
                dateFormat: "yy-mm-dd"
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
                email: $('#emailInput').val() + "@" + ($('#emailDomain').val() || $('#customDomain').val()),
                title: $('#title').val(),
                content: $('#content').val(),
                date: new Date().toLocaleDateString(),
                status: "처리 중"
            };

            let inquiries = JSON.parse(localStorage.getItem('inquiries')) || [];
            inquiries.push(inquiry);
            localStorage.setItem('inquiries', JSON.stringify(inquiries));

            window.location.href = 'inquiry_list.jsp'; // 문의 목록 페이지로 리다이렉트
        }

        function goHome() {
            window.location.href = 'https://paikdabang.com/'; // 홈으로 이동할 URL
        }
    </script>
    <style>
        body {
            background-color: #f0f0f0; /* 외부 배경색: 연한 회색 */
        }
        .form-container { 
            max-width: 1000px; 
            margin: auto; 
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 20px; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            background-color: #ffffff; /* 내부 배경색: 흰색 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
        }
        .section-divider { border-top: 1px solid #ccc; margin: 20px 0; }
        .form-control { width: 300px; max-width: 100%; }
        #content { width: 1000px; height: 200px; max-width: 100%; }
        .submit-button { display: flex; justify-content: center; margin-top: 20px; }
        .agreement { max-height: 150px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; margin-bottom: 20px; background-color: #f9f9f9; }
        .agreement-label { margin-top: 10px; }
        .additional-info { font-size: 14px; margin-top: 10px; }
    </style>
</head>
<body>
<div id="wrap">
<div class="container">
    <div class="form-container">
        <form id="inquiryForm" onsubmit="submitForm(event)">
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
                <input type="text" class="form-control" id="visitDate" name="visitDate" required>
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
                    <span>@</span>
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

            <div class="agreement-label">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="agree" name="agree" required>
                    <label class="form-check-label" for="agree" style="font-weight: bold;">개인정보 수집·이용 동의(필수)</label>
                </div>
            </div>
            
            <div class="additional-info">
                귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 고객의 소리 서비스를 이용할 수 없습니다.<br>
                - 개인정보처리자 : (주)더본코리아<br>
                - 개인정보항목 : 이름, 휴대폰번호, 이메일, 고객 상담을 위해 제공한 정보<br>
                - 목적 : 고객 고충 및 불만에 대한 처리<br>
                <a style="font-weight: bold;">- 보유 및 이용기간 : 전자상거래 등에서의 소비자 보호에 관한 법률</a><br>
                <a style="font-weight: bold;">◎ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</a><br>
                <br>
                - 고객이 동의한 개인정보처리 방침에 따라 고객의소리 민원 처리를 위해 작성자의 개인정보를 활용할 수 있습니다.<br>
                - 기재오류 및 계정문제가 발생한 경우에는 답변이 불가능 할 수 있음으로 연락처 및 메일 주소를 정확하게 기입해 주시길 바랍니다.<br>
                - 답변은 직접 선택해주신 방법으로 진행되며, 추가적인 확인이 필요한 경우에는 선택해주신 답변 외 별도의 방법으로 연락드릴 수 있는 점 양해 바랍니다.<br>
                - 관련 법령에 저촉되거나 사회통념 등에 어긋나는 내용 (예: 욕설 및 비속어, 비방어 등 부적절한 단어가 포함되는 경우, 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무방해 등) 또는 광고성 게시물은 별도 사전 통보 없이 답변되지 않을 수 있으며, 등록된 의견은 수정이 불가하오니 이 점 양지하여 주시기 바랍니다.<br>
                - 공정거래위원회에서 고지한 소비자분쟁해결 기준에 의거하여 소비자 피해에 대해 교환 또는 환불 처리해드립니다.
            </div>

            <div class="submit-button">
                <button type="submit" class="btn btn-primary">제출하기</button>
                <button type="button" class="btn btn-secondary ml-2" onclick="goHome()">홈으로</button>
            </div>
        </form>
    </div>
</div>
</div>
</body>
</html>
