<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>ȸ������</title>
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
        <h2>ȸ������</h2>
        <form action="JoinService" method="post">
            <input type="text" name="id" placeholder="���̵�" required>
            <input type="password" name="pw" placeholder="��й�ȣ" required>
            <input type="email" name="email" placeholder="�̸���" required>
            <input type="text" name="addr" placeholder="�ּ�" required>
            <input type="text" name="name" placeholder="�̸�" required>
            <input type="text" name="birth" placeholder="�������" required>
             <div class="radio-group">
                <label>����:</label>
                <label><input type="radio" name="gender" value="����" required> ����</label>
                <label><input type="radio" name="gender" value="����" required> ����</label>
            </div>
            
            <div class="radio-group">
                <label>��ȥ ����:</label>
                <label><input type="radio" name="marry" value="��ȥ" required> ��ȥ</label>
                <label><input type="radio" name="marry" value="��ȥ" required> ��ȥ</label>
            </div>
            <input type="submit" value="ȸ������">
        </form>
    </div>
</body>
</html>
