<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            margin: 20px 0;
            font-size: 1.2em;
            color: #333;
        }
        .container input[type="text"], .container input[type="password"], .container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3b9eff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="JoinService" method="post">
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="pw" placeholder="비밀번호" required>
            <input type="email" name="email" placeholder="이메일" required>
            <input type="text" name="addr" placeholder="주소" required>
            <input type="text" name="name" placeholder="이름" required>
            <input type="text" name="birth" placeholder="생년월일" required>
             <div class="radio-group">
                <label>성별:</label>
                <label><input type="radio" name="gender" value="남성" required> 남성</label>
                <label><input type="radio" name="gender" value="여성" required> 여성</label>
            </div>
            
            <div class="radio-group">
                <label>결혼 여부:</label>
                <label><input type="radio" name="marry" value="기혼" required> 기혼</label>
                <label><input type="radio" name="marry" value="미혼" required> 미혼</label>
            </div>
            <input type="submit" value="회원가입">
        </form>
    </div>
</body>
</html>
