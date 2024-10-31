<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 수정화면"
%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
    <link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">
    <link rel='stylesheet' href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

    <title>빽다방 | 개인정보수정</title>

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
            background-image: url('http://localhost/paik_prj/common/images/your-background-image.jpg'); /* 배경 이미지 추가 */
            background-size: cover;
            background-position: center;
            padding: 60px 0;
            text-align: center;
            color: white;
        }
        .modify-container {
            max-width: 800px; /* 너비 조정 */
            margin: 30px auto;
            padding: 30px; /* 패딩 조정 */
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 30px;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-size: 16px;
        }
        .inputBox {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 5px;
            margin-bottom: 10px;
        }
        button {
            cursor: pointer;
            background-color: #FFE800;
            color: black; /* 버튼 글씨 색상 변경 */
            border: none;
            height: 50px;
            width: 48%;
            margin-top: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #FFC300;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        .zipcode-container {
            display: flex;
            align-items: center;
        }
        .zipcode-container button {
            margin-left: 10px;
            margin-top: -5px;
        }
    </style>
    
    <script>
        function searchZipcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('zipcode').value = data.zonecode; // 우편번호
                    document.getElementById('address').value = data.roadAddress; // 도로명 주소
                    document.getElementById('address2').focus(); // 상세주소 입력으로 포커스 이동
                }
            }).open();
        }

        function goHome() {
            window.location.href = 'https://paikdabang.com/';
        }

        function validatePasswords() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
            return true;
        }

        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password === confirmPassword) {
                alert('비밀번호가 일치합니다.');
            } else {
                alert('비밀번호가 일치하지 않습니다.');
            }
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
                    <h1>개인정보수정</h1>
                </div>
            </div>

            <div class="modify-container">
                <form action="modify_process.jsp" id="updateForm" method="post" onsubmit="return validatePasswords()">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" class="inputBox" required />

                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" class="inputBox" required />

                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="inputBox" required />

                    <button type="button" onclick="checkPasswordMatch()">비밀번호 확인</button>

                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" class="inputBox" required />

                    <label for="zipcode">우편번호</label>
                    <div class="zipcode-container">
                        <input type="text" id="zipcode" name="zipcode" class="inputBox" required />
                        <button type="button" onclick="searchZipcode()">우편번호 조회</button>
                    </div>

                    <label for="address">상세주소</label>
                    <input type="text" id="address" name="address" class="inputBox" required />
                    <input type="text" id="address2" name="address2" class="inputBox" />

                    <div class="button-container">
                        <button type="submit">수정하기</button>
                        <button type="button" onclick="goHome()">홈으로</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</body>
</html>
