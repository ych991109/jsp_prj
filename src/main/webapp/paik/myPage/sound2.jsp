<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 로그인화면"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>문의하기</title>
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
                if (selectedDomain) {
                    $('#customDomain').val(selectedDomain);
                } else {
                    $('#customDomain').val('');
                }
            });
        });
    </script>
    <style>
        .form-container {
            max-width: 1000px;
            margin: auto;
            margin-bottom: 30px;
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .section-divider {
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
        .form-control {
            width: 300px;
            max-width: 100%;
        }
        #content {
            width: 1000px;
            height: 200px;
            max-width: 100%;
        }
        .submit-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .agreement {
            max-height: 150px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #fff;
            font-size: 15px;
        }
        .agreement-label {
            margin-top: 10px;
        }
        .additional-info {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
    
        <h2 style="margin-bottom: 30px;">문의하기</h2>
        
        <form action="submit_form.jsp" method="post">
            <div class="form-group">
                <label for="inquiryType">문의 종류</label>
                <select class="form-control" id="inquiryType" name="inquiryType" required>
                    <option value="">--선택--</option>
                    <option value="질문">질문</option>
                    <option value="상담">상담</option>
                    <option value="신청">신청</option>
                    <option value="기타">기타</option>
                </select>
            </div>
            <div class="section-divider"></div>

            <div class="form-group">
                <label>방문 경로</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="usagePath" id="storeVisit" value="매장 방문" required>
                    <label class="form-check-label" for="storeVisit">매장 방문</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="usagePath" id="otherVisit" value="기타 방문" required>
                    <label class="form-check-label" for="otherVisit">기타 방문</label>
                </div>
            </div>
            <div class="section-divider"></div>

            <div class="form-group">
                <label for="visitDate">방문일</label>
                <input type="text" class="form-control" id="visitDate" name="visitDate" required>
            </div>

            <div class="section-divider"></div>

            <div class="form-group">
                <label>알림 수신 여부</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="notification" id="notifyYes" value="예" required>
                    <label class="form-check-label" for="notifyYes">예</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="notification" id="notifyNo" value="아니오" required>
                    <label class="form-check-label" for="notifyNo">아니오</label>
                </div>
            </div>
            <div class="section-divider"></div>

            <div class="form-group">
                <label for="name">성명</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="section-divider"></div>

            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="section-divider"></div>

            <div class="form-group">
                <label for="email">이메일</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="emailInput" name="emailInput" placeholder="이메일" required>
                    <span>@</span>
                    <input type="text" class="form-control" id="customDomain" name="customDomain" placeholder="직접 입력" />
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
                <small class="form-text text-muted">최대 1000자까지 입력 가능합니다.</small>
            </div>

            <div class="agreement">
                <div>
     	<p class="tit">더본 코리아의 [개인정보처리방침]을 안내합니다.</p>
<div class="new">2024.09.19  ~ 현재까지 적용 (Ver. 2.0)<br><br>
       		<select class="agm_ver" onchange="window.open(value,'_blank');">
             <option value="https://www.theborn.co.kr/agreement">버전보기</option>
             <option value="https://www.theborn.co.kr/agreement-240919">2024.07.03</option>
             <option value="https://www.theborn.co.kr/agreement-240703">2024.06.18</option>
             <option value="https://www.theborn.co.kr/agreement-240618">2024.03.25</option>
             <option value="https://www.theborn.co.kr/agreement-240324">2024.02.01</option>
             <option value="https://www.theborn.co.kr/agreement-240131">2023.11.22</option>
             <option value="https://www.theborn.co.kr/agreement-231122">2023.05.15</option>
             <option value="https://www.theborn.co.kr/agreement-230515">2023.04.14</option>
             <option value="https://www.theborn.co.kr/agreement-230414">2022.11.15</option>
             <option value="https://www.theborn.co.kr/agreement-1115">2022.07.15</option>
             <option value="https://www.theborn.co.kr/agreement-714">2021.09.29</option>
             <option value="https://www.theborn.co.kr/agreement-09-29">2021.08.27</option>
             <option value="https://www.theborn.co.kr/agreement-08-27">2021.03.09</option>
             <option value="https://www.theborn.co.kr/agreement3">2020.12.01</option>
           </select>
           <br><br>
           <p class="cont">㈜더본코리아는 고객의 개인정보보호를 소중하게 생각하고, 고객의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다.</p>
           <p class="cont">㈜더본코리아는 개인정보보호 관련 주요 법률인 “개인정보보호법”을 비롯한 모든 개인정보보호 관련 법률 규정을 준수하고 있습니다.</p>
           <p class="cont">㈜더본코리아는 고객의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원할하게 처리할 수 있도록 개인정보처리방침을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 첫 화면 하단 및 모바일 어플리케이션에 공개하여 고객님께서 쉽게 찾아보실 수 있도록 하고 있습니다.</p>
           <br><br>
           <p class="tit"><span style="font-size: medium; color: #ff0000;"> 1. 총칙</span></p>
<p class="cont">개인정보란 생존하는 개인에 관한 정보로서 성명, 주민등록번호 등의 사항에 의하여 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.<br><br>
㈜더본코리아는 이용하는 서비스의 형태에 따라 개인정보를 수집 및 이용, 제공, 파기하고 있습니다. 또한 ㈜더본코리아는 고객의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 동의를 받고 있습니다. 단, 동의를 거부하는 경우 ㈜더본코리아 서비스의 전부 또는 일부 이용이 제한될 수 있습니다.<br><br>
㈜더본코리아는 관련 법률 및 지침의 변경, 또는 내부 개인정보 운영방침의 변경에 따라 개인정보처리방침을 개정할 수 있으며, 개정하는 경우 시행일자 등을 부여하여 개정된 내용을 확인할 수 있도록 하고 있습니다. ㈜더본코리아의 개인정보처리방침이 변경되는 경우에는 그 내용을 홈페이지를 통하여 공지합니다.</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 2. 수집하는 개인정보의 항목</span></p>
<p class="cont">㈜더본코리아는 다양한 서비스 제공을 위하여, 적법한 수단을 통하여 아래와 같은 고객 정보를 수집하고 있습니다. 만 14세 미만 아동은 법정대리인(부모 등)의 동의를 받아야 회원 가입이 가능하며, ㈜더본코리아는 법정대리인의 동의를 얻기 위하여 법정대리인의 성명, 이메일 등 필요한 최소한의 정보를 요구할 수 있습니다. 이 경우 개인정보의 수집ㆍ이용 또는 제공 목적 및 법정대리인의 동의가 필요하다는 취지를 아동이 쉽게 이해 할 수 있는 평이한 표현으로 아동에게 고지합니다. 이때, 수집된 법정대리인의 개인정보는 법정대리인의 동의여부를 확인하는 목적 외의 용도로 이를 이용하거나 제3자에게 제공되지 않습니다.</p>
<br>
<table style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
 	<tr>
   	<td style="width: 12%; text-align: center;"></td>
     <td style="width: 36%; text-align: center;" colspan="2">구분</td>
     <td style="width: 52%; text-align: center;">수집항목</td>
   </tr>
   <tr>
   	<td style="text-align: center;">더본코리아</td>
   	<td>  고객의 소리</td>
   	<td>  필수항목</td>
    	<td>  이름, 휴대폰번호, 이메일, 고객 상담을 위해 제공한 정보</td>
   </tr>
   <tr>
   	<td style="text-align: center;" rowspan="2">창업센터</td>
   	<td rowspan="2">  창업문의 / 설명회 신청</td>
   	<td>  필수항목</td>
   	<td>  이름, 휴대폰번호, 이메일, 창업희망지역, 점포소유여부(보유 시 점포주소지)</td>
   </tr>
   <tr>
   	<td>  마케팅정보 활용 동의 (선택정보)</td>
   	<td>  이름, 휴대폰번호, 이메일<br>
   	※ 동의하지 않을 경우, 수집한 개인정보를 광고성 정보 전송 목적으로 활용하지 않습니다.</td>
   </tr>
   <tr>
   	<td style="text-align: center;" rowspan="3">호텔더본</td>
    	<td>  예약문의</td>
    	<td>  필수항목</td>
    	<td>  이름, 연락처, 이메일</td>
    </tr>
    <tr>
    	<td>  불편사항 / 제휴·제안</td>
    	<td>  필수항목</td>
    	<td>  이름, 연락처, 이메일</td>
    </tr>
    <tr>
    	<td>  실시간 객실예약</td>
    	<td>  필수항목</td>
    	<td>  이름, 연락처, 이메일, 예약 비밀번호, 신용카드번호(유효기간 포함)</td>
    </tr>
  </tbody>
</table>
<br><br>
<table style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
 	<tr>
   	<td style="width: 12%; text-align: center;" rowspan="5">더본몰</td>
     <td style="width: 36%; text-align: center;" colspan="2">구분</td>
   	<td style="width: 52%; text-align: center;">수집항목</td>
   </tr>
   <tr>
   	<td style="text-align: center;" colspan="2">  필수항목</td>
    	<td>  성명, 생년월일, 성별, 아이디, 비밀번호, 휴대폰번호, 이메일, CI, DI</td>
    </tr>
    <tr>
    	<td>  선택정보</td>
    	<td>  환불 주문배송 현금영수증</td>
    	<td>  수령인 주소, 전화번호, 계좌정보, 현금영수증정보</td>
    </tr>
     <tr>
    	<td colspan="2">  서비스 이용 또는 사업처리 과정에서 생성/수집되는 정보</td>
    	<td>  서비스 이용기록, 접속로그, 쿠키, 접속IP정보, 결제기록</td>
    </tr>
    <tr>
    	<td colspan="2">  마케팅 정보 활용 동의 시 (선택동의)</td>
    	<td>  휴대폰번호, 생년월일, 성별, 이메일<br>
    	※ 동의하지 않을 경우, 회원가입 시 수집한 개인정보를광고성 정보 전송 목적으로 활용하지 않습니다.</td>
    </tr>
  </tbody>
</table>
<br><br>
<table style="border-collapse: collapse; width: 100%;" border="1">
 <tbody>
   <tr>
   	<td style="width: 12%; text-align: center;" rowspan="5">빽다방 멤버십 App</td>
   	<td style="width: 36%; text-align: center;" colspan="2">구분</td>
   	<td style="width: 52%; text-align: center;">수집항목</td>
    </tr>
    <tr>
    	<td>  회원가입</td>
    	<td>  필수항목</td>
    	<td>  성명, 휴대폰번호, 생년월일, 성별, 아이디, 비밀번호, 이메일, 닉네임<br>
    	※ 만 14세 미만의 경우 법정대리인의 성명, 생년월일, 성별, 휴대폰번호<br>
    	※ 비회원의 경우 휴대폰번호<br>
    	※ 쿠폰, 교환권, 금액권 선물의 경우 수령인 성명, 수령인 휴대폰번호<br>
    	※ SNS 계정연동 (카카오, 페이코, 페이스북) 이메일(아이디), 휴대폰번호</td>
    </tr>
    <tr>
    	<td>  현 위치 기반 근처매장 정보 제공</td>
    	<td>  선택항목</td>
    	<td>  앱푸쉬 수신동의여부, 위치정보 수집동의여부</td>
    </tr>
    <tr>
    	<td>  이벤트 및 서비스 정보 제공</td>
    	<td>  마케팅 정보 활용 동의 시 (선택동의)</td>
    	<td>  휴대폰번호, 생년월일, 성별, 이메일
    	※ 동의하지 않을 경우, 회원가입 시 수집한 개인정보를 광고성 정보 전송 목적으로 활용하지 않습니다.</td>
    </tr>
    <tr>
    	<td colspan="2">  서비스 이용 또는 사업처리 과정에서 생성/수집되는 정보</td>
    	<td>  서비스 이용기록, 접속로그, 쿠키, 접속IP정보, 결제기록, 이용정지기록,
    	스탬프 적립기록, 단말기 제조사, 모델명, OS버전정보, push 수신 기록</td>
    </tr>
  </tbody>
</table>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 3. 개인정보의 처리 목적</span></p>
<p class="cont">㈜더본코리아는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 고객이 제공한 모든 정보는 아래 목적에 필요한 용도 이외로는 사용되지 않으며, 변경될 경우 사전 동의를 구하도록 할 것입니다.</p><br>
<p class="cont">
	1. 회원 가입 및 관리<br>
	- 회원 서비스 이용에 따른 본인 식별 및 실명 여부, 중복 가입 여부 확인<br>
	- 고객 편의를 위한 간편로그인 서비스 제공<br>
	- 만 14세 미만 아동에 개인정보 수집에 대한 법정대리인 동의 확인<br>
	- 부정이용방지 및 비인가 사용방지<br>
	- 개인정보 이용내역 통지<br>
	- 회원가입(빽다방 멤버십 서비스 이용), 본인확인(본인 식별, 실명여부 확인)<br><br>

	2. 재화 또는 서비스 제공<br>
	- 물품배송 및 불만처리<br>
	- 취소/반품 시 환불 처리<br>
	- 개인소득공제용 현금영수증 신청<br>
	- 호텔 객실 예약, 카드결제정보 확인<br>
	- 고객 고충 및 불만에 대한 처리<br>
	- 창업 상담, 당사 창업관련 정보제공, 창업설명회 참가신청<br>
	- 현 위치 기반 근처매장 정보 제공<br>
	- 빽다방 멤버십 서비스 맞춤정보 제공<br><br>

	3. 상품 및 서비스 홍보 및 판매 권유<br>
	- 마케팅, 홍보 등을 위한 고객분석, 편의성제공<br>
	- 상품 구매에 대한 결제, 신규 서비스 개발 및 맞춤 서비스 제공<br>
	- 통계 데이터 분석에 따른 추천 서비스 제공<br>
	- 새로운 서비스 및 신상품이나 이벤트 정보제공
</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 4. 개인정보의 처리 및 보유기간 </span></p>
<p class="cont">㈜더본코리아는 고객의 개인정보를 원칙적으로 개인정보의 수집 및 이용목적이 달성하게 되는 경우 즉시 삭제합니다.<br> 
단, 정보주체로부터 사전에 동의를 받은 경우 또는 상법 등 관련 법령에 의하여 보존할 필요성이 있는 경우 다음의 경우에는 개인정보를 일정기간 동안 보유 하며 무분별한 회원탈퇴와 재가입으로 인한 피해 최소화, 회원탈퇴 후 변심에 의한 민원처리 등을 처리하기 위하여 회원탈퇴 후 30일간 회원정보 보유합니다.</p><br>
<p class="cont">1) 상법 및 전자상거래 등에서 소비자보호에 관한 법률 등 관련 법령의 규정에 의하여 일정기간 보유해야 할 필요가 있는 경우<br>
(관련 법률이 정한 기간 또는 다음에서 정산 기간 동안 회원 및 거래정보 보유)
<br><br>
· 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br>
- 보관 사유 : 전자상거래 등에서의 소비자보호에 관한 법률<br><br>

· 회원의 불만 및 분쟁처리에 관한 기록 : 3년<br>
- 보관 사유 : 전자상거래 등에서의 소비자보호에 관한 법률<br><br>

· 표시/광고에 관한 기록 : 6개월<br>
- 보관 사유 : 전자상거래 등에서의 소비자보호에 관한 법률<br><br>

· 신용정보의 수집/처리 및 이용등에 관한 기록 : 3년<br>
- 보관 사유 : 신용정보의 이용 및 보호에 관한 법률</p>
<br>
<p class="cont">2) ㈜더본코리아 및 제휴사가 필요에 의하여 별도로 동의를 득한 경우 : 별도로 동의를 득한 범위 및 이용 기간 내 보관</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 5. 개인정보 수집 동의 거부 </span></p>
<p class="cont">고객은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 동의를 거부할 경우 받는 별도의 불이익은 없습니다.<br>
단, 필수동의 사항에 동의를 거부할 경우, 서비스 이용이 불가능하거나, 서비스 이용 목적에 따른 서비스 제공에 제한이 따르게 됩니다.<br>
또한, 선택동의 사항에 동의를 거부할 경우, 선택동의 개인정보 항목을 이용하여야 제공받을 수 있는 서비스의 전부 또는 일부 이용이 제한될 수 있습니다.</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 6. 회원 및 법정대리인의 권리와 그 행사 방법 </span></p>
<p class="cont">1. 정보주체는 ㈜더본코리아에 언제든지 자신의 개인정보 열람·정정·삭제·처리정지 요구·동의 철회 등의 권리를 행사할 수 있습니다.<br><br>
1) 정보주체 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며, ㈜더본코리아의 개인정보 처리에 동의하지 않는 경우 동의를 거부하거나 가입해지(회원탈퇴)를 요청하실 수 있습니다.<br>
다만, 그러한 경우 원활한 서비스 이용이 불가능 할 수 있습니다.<br><br>
2) 회원 혹은 만 14세 미만 아동의 개인정보 조회, 수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.<br><br>
3) 혹은 개인정보보호 담당자 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.<br><br>
4) 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.<br>
또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.<br><br>
5) ㈜더본코리아는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.<br><br>
6) 동의철회, 가입해지(회원탈퇴) 처리 방법<br>
① 개인정보 열람 등 청구 접수·처리 부서<br>
* 부서명 : IT기획팀<br>
* 전자메일 : Itplanning@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-549-0636<br><br>

② 빽다방APP : 서비스접속 → 회원로그인 → My Page → 개인정보 변경 → 회원탈퇴 버튼</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 7. 개인정보 열람 및 정정, 수집 및 이용에 대한 동의 철회 </span></p>
<p class="cont">고객(만 14세 미만 아동 회원의 경우 법정대리인)은 언제든지 홈페이지 및 모바일 어플리케이션에 등록되어 있는 본인의 개인정보(회원정보, 이용·제공 내역, 동의 내역)를 열람하거나 정정하실 수 있으며, 탈퇴를 요청할 수 있습니다.</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 8. 개인정보 파기절차 및 방법 </span></p>
<p class="cont">고객의 개인정보는 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
㈜더본코리아의 개인정보 파기절차 및 방법은 다음과 같습니다.<br><br>
1) 파기절차<br>
고객이 서비스 이용 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기 합니다.<br>
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br><br>

2) 파기방법<br>
- 종이에 출력된 개인정보 : 분쇄기로 분쇄하거나 소각<br>
- 전자적 파일 형태로 저장된 개인정보 : 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 9. 개인정보 자동수집 장치설치/운영 및 거부에 관한 사항 </span></p>
<p class="cont">
&lt; 설치・운영하는 개인정보 자동 수집 장치 &gt;<br>
㈜더본코리아는 고객님의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’를 운용합니다.
쿠키란 ㈜더본코리아의 홈페이지를 운영하는데 이용되는 서버가 고객님의 브라우저에 보내는 아주 작은 텍스트 파일로서 컴퓨터 하드디스크에 저장됩니다.
㈜더본코리아의 홈페이지는 다음과 같은 목적을 위해 쿠키를 사용합니다.<br><br>
1) 쿠키 등 운영<br>
회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심 분야 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br><br>

2) 쿠키 등 설치<br>
귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br><br>

3) 쿠키 설정 거부 방법<br>
쿠키 설정을 거부하는 방법으로는 고객님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나,모든 쿠키의 저장을 거부할 수 있습니다.<br>
(인터넷 익스플로어의 경우: 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보에서 수정)<br>
단, 귀하께서 쿠키 설치를 거부하였을 경우 쿠키를 이용한 서비스 제공에 어려움이 있을 수 있습니다.<br>

&lt; 행태정보의 수집・이용・제공 및 거부 등에 관한 사항 &gt;<br>

㈜더본코리아는 상품·서비스 개발 및 고객 분석, 마케팅 등에 활용하기 위해 온라인 행태정보를 수집·이용하고 있습니다. <br>
행태정보란 웹 사이트 방문 이력, 앱 사용 이력, 구매 및 검색 이력 등 이용자의 관심, 흥미, 기호 및 성향 등을 파악하고 분석할 수 있는 온라인상의 이용자 활동정보를 말합니다.<br>

㈜더본코리아는 사이트의 이용 분석 및 마케팅 활용 목적으로 필요한 최소한의 행태정보만을 수집하며, 사상, 신념, 가족 및 친인척관계, 학력, 병력, 기타 사회활동 경력 등 개인의 권리이익이나 사생활을 뚜렷하게 침해할 우려가 있는 민감한 행태정보를 수집하지 않습니다.<br><br>

1. 법적근거<br>
- 개인정보 보호법 제15조 제1항 제1호<br><br>

2. 수집하는 행태정보의 항목<br>
- 이용자의 웹사이트 방문이력, 이용자의 앱 사용 이력<br><br>

3. 행태정보 수집방법<br>
- 이용자의 서비스 이용 시 자동 수집<br><br>

4. 행태정보 수집목적<br>
- 이용자의 관심, 성향에 기반한 개인 서비스의 속도 및 상태 개선, 고객 서비스 이용 통계를 활용한 신상품·서비스 개발, 사용자 행태 정보 기반 맞춤형 광고 제공.<br><br>

5. 행태정보 보유·이용기간 및 이후 정보처리방법<br>
- 회사는 회원 탈퇴 시 행태정보를 비식별화 조치 후 통계 업무 목적만을 위하여 보유하고 이용합니다.<br><br>

6. 이용자 통제권 행사 방법<br>
①웹브라우저<br>
- 인터넷익스플로러 : 도구→인터넷옵션→개인정보 탭→고급→쿠키 차단 또는 처리안함<br>
- Microsoft Edge : 오른쪽 상단 ‘…’ 표시 선택→설정→개인정보 검색 및 서비스→추적방지 섹션에서 「엄격」 선택→개인정보 섹션에서 「추적안함 요청보내기」 선택<br>
- 크롬 브라우저 : 오른쪽 상단 : 표시 선택→설정→「고급설정 표시」→개인정보 섹션 「콘텐츠 설정」→쿠키섹션 「타사 쿠키 및 사이트 데이터 차단」 체크박스 선택<br>
②스마트폰<br>
- 안드로이드폰 : 설정→광고→광고 맞춤설정 선택 또는 해제<br>
- 아이폰 : 설정→개인정보보호→Apple광고→맞춤형 광고 선택 또는 해제<br>
* OS버전에 따라 방법이 다소 상이할 수 있습니다.<br><br>

7. 이용자 피해구제 방법 관련 부서 및 고객문의<br>
이용자는 아래의 연락처로 행태정보와 관련하여 궁금한 사항과 거부권행사, 피해 신고 접수 등을 문의할 수 있습니다.<br>
&lt;개인정보보호책임자&gt;<br>
*이름 : 이유선<br>
* 부서명 : IT기획팀<br>
* 전자메일 : Itplanning@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-549-0636</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 10. 개인정보 처리위탁 </span></p>
<p class="cont">㈜더본코리아는 수집된 개인정보의 처리 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 원활한 업무 처리를 위해 필요한 경우 업무의 일부 또는 전부를 ㈜더본코리아가 선정한 업체에 위탁할 수 있습니다. 위탁업체가 추가 또는 변경되는 경우에 ㈜더본코리아는 이를 고객에게 고지합니다.<br>
㈜더본코리아는 위탁계약 체결시 개인정보보호법 제 26조, 제 39조의12에 따라 위탁업무 수행목적 외 개인정보 처리금지,기술적⋅관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리⋅감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>
현재 ㈜더본코리아의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.<br><br>

- 수탁업체 : ㈜엔에이치엔페이코<br>
- 위탁업무내용 : 개인정보 보관 및 유지, 스탬프 적립 및 사용, 멤버십 관련 서비스<br>
- 위탁업무내용 : 마케팅 정보 발송 (PUSH, SMS, LMS, E-mail)<br>
- 위탁업무내용 : 카카오톡 비즈메세지 발송 대행<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜NHN한국사이버결제<br>
- 위탁업무내용 : 실명인증, 본인확인, SMS 전송<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜DSI시스템<br>
- 위탁업무내용 : 결제, 적립, 쿠폰사용 등<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜엘지유플러스<br>
- 위탁업무내용 : 결제, 적립, 쿠폰사용 등<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜웹코리아<br>
- 위탁업무내용 : 홈페이지 창업문의, 창업설명회 신청 정보, 더본몰 등 브랜드홈페이지 관리<br>
- 보유 및 이용기간 : 회원 탈퇴 후 30일 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : 주식회사 티사이언티픽<br>
- 위탁업무내용 : 선불카드 및 교환권 발행<br>
- 보유 및 이용기간 : 회원 탈퇴 후 30일 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : 비엔에프로지스틱스, 근해통발수산업협동조합경제사업부, 농업회사법인돈마루㈜, 주식회사 마이셰프, 안동농협농산물유통센터, 오뚜기물류서비스 주식회사,<br>
참바다영어조합법인, 주식회사 한국초저온<br>
- 위탁업무내용 : 온라인 주문 건에 대한 제품 배송관리<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : 엔에이치엔커머스㈜<br>
- 위탁업무내용 : 개인정보 보관 및 유지, 이메일, 문자 발송<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : 농업회사법인 우리도가<br>
- 위탁업무내용 : 온라인 주문 건에 대한 제품 배송, 반품, 교환서비스 제공<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : 유세스파트너스<br>
- 위탁업무내용 : 서비스 문의 응대 및 상담 업무<br>
- 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜누리호스팅<br>
- 위탁업무내용 : 홈페이지 운영을 위한 서버 호스팅<br>
- 보유 및 이용기간 : 위탁계약 종료 시까지<br><br>

- 수탁업체 : ㈜다올비젼<br>
- 위탁업무내용 : 호텔 더본 제주 객실 실시간 예약 서비스 및 유지보수 등<br>
- 보유 및 이용기간 : 위탁계약 종료 시까지<br><br>

- 수탁업체 : 주식회사 즐거운<br>
- 위탁업무내용 : 선불카드 및 교환권 발행 <br>
- 보유 및 이용기간 : 위탁계약 종료 시까지<br><br>

- 수탁업체 : 주식회사 쿠프마케팅<br>
- 위탁업무내용 : 선불카드 및 교환권 발행 <br>
- 보유 및 이용기간 : 위탁계약 종료 시까지</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 11. 개인정보보호 담당자의 연락처 </span></p>
<p class="cont">㈜더본코리아는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호 담당자를 지정하고 있습니다.<br><br>

&lt;개인정보보호책임자&gt;<br>
* 성명 : 이유선<br>
* 부서 : IT기획팀<br>
* 직위 : 수석부장<br>
* 전자메일 : yousun@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-512-3864<br><br>

&lt;개인정보보호담당자&gt;<br>
* 성명 : 이지훈<br>
* 부서 : IT기획팀<br>
* 직위 : 과장<br>
* 전자메일 : 2ghun@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-512-3864<br><br>

* 성명 : 김호준<br>
* 부서 : IT기획팀<br>
* 직위 : 대리<br>
* 전자메일 : hjkim9109@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-512-3864<br><br>

&lt;개인정보보호담당부서&gt;<br>
* 부서명 : IT기획팀<br>
* 전자메일 : Itplanning@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-549-0636</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 12. 의견수렴 및 불만처리 </span></p>
<p class="cont">고객님께서는 ㈜더본코리아의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호 담당자 혹은 담당부서로 신고하실 수 있습니다.<br>
㈜더본코리아는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br>
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br><br>

* 개인정보침해신고센터<br>
- 전화 : (국번없이) 118<br>
- URL : http://privacy.kisa.or.kr<br><br>

* 개인정보분쟁조정위원회<br>
- 전화 : (국번없이) 1833-6972<br>
- URL : https://www.kopico.go.kr<br><br>

* 대검찰청 사이버수사과<br>
- 전화 : (국번없이) 1301<br>
- URL : http://www.spo.go.kr<br><br>

* 경찰청<br>
- 전화 : (국번없이) 182<br>
- URL : ecrm.cyber.go.kr</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 13. 개인정보의 안전성 확보조치에 관한 사항</span></p>
<p class="cont">㈜더본코리아는 개인정보를 처리함에 있어 도난, 분실, 변조, 유출 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적, 관리적 대책을 강구하고 있습니다.<br><br>

(1) 기술적 대책<br>
1) 개인정보는 그 종류에 따라 관련 법령이 요구하는 수준의 암호화 저장 또는 전송 시 암호화 기술 적용하여 관리합니다.<br>
2) 백신프로그램을 이용하여 컴퓨터 바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있으며, 백신프로그램을 주기적으로 업데이트하고 갑작스러운 바이러스 출현 시에 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.<br>
3) 암호알고리즘을 이용하여 네트워크상 개인정보를 안전하게 전송하는 보안장치(SSL 등)를 채택하고 있습니다.<br>
4) 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.<br><br>

(2) 관리적 대책<br>
1) ㈜더본코리아는 개인정보 보호에 관한 내부관리계획을 수립, 시행하고 있습니다.<br>
2) ㈜더본코리아는 개인정보에 대한 접근권한을 필요 • 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.<br>
① 고객을 직접 상대하여 상담하거나, CRM(마케팅 등) 업무를 수행하는 자<br>
② 개인정보처리책임자 및 그 담당자 등 개인정보관리업무를 수행하는 자<br>
③ 기타 업무상 개인정보의 처리가 불가피한 자<br><br>

3) ㈜더본코리아는 개인정보를 처리하는 직원을 대상으로 보안기술 습득 및 개인정보 보호의무 등에 관해 정기적인 사내 교육 및 외부 위탁 교육을 실시합니다.<br>
4) ㈜더본코리아는 직원 입사 시 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보처리방침에 대한 이행사항 및 직원의 준수 여부를 감사하기 위한 내부절차를 마련하고 있습니다.<br><br>
5) 개인정보 처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이루어지도록 하며 입사 및 퇴사 후 개인정보 사고에 관한 책임을 명확히 합니다.<br><br>

6) ㈜더본코리아는 고객의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. 고객 스스로가 본인의 개인정보를 보호하기 위해서 자신의 아이디와 비밀번호를 적절하게 관리하고 스스로 책임을 져야 합니다.</span></p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 14. 개인위치정보의 처리</span></p>
<p class="cont">㈜더본코리아는 위치정보의 보호 및 이용 등에 관한 법률에 따라 다음과 같이 개인위치정보를 처리합니다.<br><br>

1) 개인위치정보의 처리목적 및 보유기간<br>
① 보유목적 : 빽다방App 오더 서비스, 내 주변 매장찾기(개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 근처 매장 검색결과) 제공<br>
② 이용기간 : 이용목적 달성 시, 복구 및 재생이 불가능한 방법으로 즉시 파기(위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용 후 지체없이 파기합니다.)<br><br>

2) 개인위치정보 수집ㆍ이용ㆍ제공사실 확인자료의 보유근거 및 보유기간<br>
㈜더본코리아는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 보관합니다.<br><br>

3) 개인위치정보의 제3자 제공 및 통보에 관한 사항<br>
㈜더본코리아는 정보주체의 동의 없이 개인위치정보를 제3자에게 제공하지 아니하며, 제3자에게 이용자의 개인위치정보를 제공하는 경우에는 제공받는 자, 제공일시 및 제공 목적을 개인위치정보주체에게 고지하는 등 관련 법령에서 정하는 바를 따릅니다.<br><br>

4) 보호의무자의 권리ㆍ의무와 그 행사방법에 관한 사항<br>
① ㈜더본코리아는 만 14세 미만의 아동에 대해서는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의를 만 14세 미만의 아동과 그 법정대리인으로부터 받아야 합니다.<br>
② ㈜더본코리아는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.<br>
- 8세 이하의 아동<br>
- 금치산자<br>
- 피성년후견인<br>
-「장애인복지법」 제2조제2항제2호에 따른 정신적 장애를 가진 사람으로서 「장애인고용촉진 및 직업재활법」 제2조제2호에 따른 중증장애인에 해당하는 사람 (「장애인복지법」 제32조에 따라 장애인 등록을 한 사람만 해당한다.)<br>
③ 당사는 만 14세 미만의 아동의 개인위치정보 또는 위치정보 이용, 제공사실 확인자료를 이용약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 만 14세 미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.<br>
- 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우<br>
- 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우<br><br>

5) 위치정보 관리책임자 정보<br>
㈜더본코리아는 고객의 개인위치정보를 보호하고, 위치정보와 관련한 불만을 처리하기 위하여 아래와 같이 위치정보보호책임자 및 담당자를 지정하고 있습니다.<br><br>

&lt;개인위치정보 책임자&gt;<br>
* 성명 : 이유선 (CISO)<br>
* 부서 : IT기획팀<br>
* 직위 : 수석부장<br>
* 전자메일 : yousun@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-512-3864<br><br>

&lt;개인위치정보 담당자&gt;<br>
* 성명 : 이지훈<br>
* 부서 : IT기획팀<br>
* 직위 : 과장<br>
* 전자메일 : 2ghun@theborn.co.kr<br>
* 전화번호 : 02-549-3864<br>
* 팩스번호 : 02-512-3864</p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 15. 고정형 영상정보처리기기 설치.운영</span></p>
<p class="cont">㈜더본코리아는 아래와 같이 영상정보처리기기를 설치․운영하고 있습니다.<br><br>

1. 고정형 영상정보처리기기 설치근거․목적 : ㈜더본코리아의 시설안전․화재예방<br>
2. 설치 대수, 설치 위치, 촬영 범위 : 고정형 영상처리기기 본사(5F) 2대, 본사(6F) 2대, 별관(1F)11대, 별관(2F) 8대, 별관(3F) 4대, 수암B/D(B1) 6대, 수암빌딩(2F) 4대, 라파엘B/D(2F) 8대, 창업설명회장(2F) 2대, 신곡빌딩(3F) 4대, <br>
베이커리교육장(B1F) 4대, 빽다방3교육장 8대, 부산교육장 4대, 백석공장 16대, 예산공장 16대, 외식산업개발원(문경) 24대, 외식산업개발원(예산) 4대 등 직영매장 내 외부 등 주요시설물에 설치, 촬영범위는 주요시설물의 전 공간을 촬영<br>
3. 관리책임자, 담당부서 및 영상정보에 대한 접근권한자 : 인사팀 이미희 수석 / 인사팀, IT기획팀, 직영관리부서장(부서장 및 매장점장)<br>
4. 영상정보 촬영시간, 보관기간, 보관장소, 처리방법<br>
- 촬영시간 : 24시간 촬영<br>
- 보관기간 : 촬영시부터 30일<br>
- 보관장소 및 처리방법 : IT기획팀 영상정보처리기기 통제실에 보관․처리<br>
5. 영상정보 확인 방법 및 장소 : 관리책임자에 요구 (인사팀)<br>
6. 정보주체의 영상정보 열람 등 요구에 대한 조치 : 개인영상정보 열람․존재확인 청구서로 신청하여야 하며, 정보주체 자신이 촬영된 경우 또는 명백히 정보주체의 생명․신체․재산 이익을 위해 필요한 경우에 한해 열람을 허용함<br>
7. 영상정보 보호를 위한 기술적․관리적․물리적 조치 : 내부관리계획 수립, 접근통제 및 접근권한 제한, 영상정보의 안전한 저장․전송기술 적용, 처리기록 보관 및 위․변조 방지조치, 보관시설 마련 및 잠금장치 설치 등</span></p>
<br><br>
<p class="tit"><span style="font-size: medium; color: #ff0000;"> 16. 시행일자</span></p>
      <p class="cont">  - 시행일 : 2024년 09월 19일</p><br>
      <p class="to_top"><img src="/wp-content/themes/theborn/images/top_icon.png" alt="" /></p>
    </div>
  </div>
                
                
                
                
                
                
                
            </div>

            <div class="agreement-label">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="agree" name="agree" required>
                    <label class="form-check-label" for="agree" style="font-weight: bold;">개인정보 수집 및 이용에 관한 동의(필수)</label>
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
                <button type="submit" class="btn btn-primary" style="width: 80px">제출</button>
                <a href="https://paikdabang.com/" class="btn btn-secondary" style="width: 80px; margin-left: 10px;">취소</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
