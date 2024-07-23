<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>로그인</title>
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
        .container img {
            width: 100px;
        }
        .container h2 {
            margin: 20px 0;
            font-size: 1.2em;
            color: #333;
        }
        .container input[type="text"], .container input[type="password"] {
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
        .container a {
            display: block;
            margin: 10px 0;
            color: #3b9eff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>AI 여행 스케줄링 플래너, 플랜잇</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="id" placeholder="이메일" required>
            <input type="password" name="pw" placeholder="비밀번호" required>
            <a href="#">비밀번호를 잊으셨나요?</a>
            <input type="submit" value="로그인">
        </form>
        <a href="register.jsp">아직 회원이 아니세요? 이메일회원가입</a>
    </div>
    
</body>
</html>
