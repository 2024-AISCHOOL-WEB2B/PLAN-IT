<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�α���</title>
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
        <h2>AI ���� �����ٸ� �÷���, �÷���</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="id" placeholder="�̸���" required>
            <input type="password" name="pw" placeholder="��й�ȣ" required>
            <a href="#">��й�ȣ�� �����̳���?</a>
            <input type="submit" value="�α���">
        </form>
        <a href="register.jsp">���� ȸ���� �ƴϼ���? �̸���ȸ������</a>
    </div>
    
</body>
</html>
