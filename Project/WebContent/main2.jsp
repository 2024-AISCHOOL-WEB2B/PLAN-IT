<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }
        .container {
            width: 360px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
            height: 100vh;
            overflow-y: auto;
        }
        .logo {
            margin-bottom: 20px;
        }
        .logo img {
            width: 100px;
        }
        .form-container {
            text-align: left;
        }
        .form-container input, .form-container select, .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .checkbox-container {
            text-align: left;
        }
        .checkbox-container label {
            display: block;
            margin-bottom: 5px;
        }
        .radio-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .radio-container label {
            flex: 1;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px 0;
            margin-right: 5px;
            cursor: pointer;
        }
        .radio-container label:last-child {
            margin-right: 0;
        }
        .radio-container input {
            display: none;
        }
        .radio-container input:checked + label {
            background-color: #8ab7ff;
            color: white;
            border-color: #8ab7ff;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Naver_Logotype.svg/1024px-Naver_Logotype.svg.png" alt="Naver Logo">
        </div>
        <form id="signup-form"></form>
            <div class="form-container">
                <input type="text" id="username" name="username" placeholder="아이디">
                <input type="password" id="password" name="password" placeholder="비밀번호">
                <input type="text" id="name" name="name" placeholder="이름">
                <input type="text" id="birthdate" name="birthdate" placeholder="생년월일 8자리">
                <input type="text" id="phone" name="phone" placeholder="휴대전화번호">
                
                <div class="radio-container">
                    <input type="radio" id="male" name="gender" value="male" checked>
                    <label for="male">남자</label>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female">여자</label>
                </div>
                <div class="radio-container">
                    <input type="radio" id="domestic" name="nationality" value="domestic" checked>
                    <label for="domestic">내국인</label>
                    <input type="radio" id="foreign" name="nationality" value="foreign">
                    <label for="foreign">외국인</label>
                </div>
        
                <div class="radio-container">
                    <input type="radio" id="single" name="marital_status" value="single" checked>
                    <label for="single">미혼</label>
                    <input type="radio" id="married" name="marital_status" value="married">
                    <label for="married">기혼</label>
                </div>
                
                <button onclick="location.href='page1survey.html'">선호도 조사하기</button>
                <button type="submit" onclick="location.href='page1login.html'">회원가입 완료</button>
            </div>
            <div class="footer">
                <p>&copy; Team 진심으로 한대유 . All Rights Reserved.</p>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault();
            alert('회원가입이 완료되었습니다.');
            
        });
    </script>
</body>
</html>
