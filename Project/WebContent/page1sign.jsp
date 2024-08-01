<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>ȸ������</title>
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
           	color: #8ab7ff;
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
            <h1>�÷���</h1>
        </div>
        <form id="signup-form" action="page1survey2.jsp" method="POST" onsubmit="saveSignupData()">
            <div class="form-container">
                <input type="text" id="username" name="id" placeholder="���̵�" required>
                <input type="password" id="password" name="pw" placeholder="��й�ȣ" required>
                <input type="text" id="name" name="name" placeholder="�̸�" required>
                <input type="text" id="birthdate" name="birth" placeholder="������� 8�ڸ�" required>
                <input type="text" id="phone" name="phone" placeholder="�޴���ȭ��ȣ" required>
                
                <div class="radio-container">
                    <input type="radio" id="male" name="gender" value="male" required>
                    <label for="male">����</label>
                    <input type="radio" id="female" name="gender" value="female" required>
                    <label for="female">����</label>
                </div>
                <div class="radio-container">
                    <input type="radio" id="domestic" name="kf" value="domestic" required>
                    <label for="domestic">������</label>
                    <input type="radio" id="foreign" name="kf" value="foreign" required>
                    <label for="foreign">�ܱ���</label>
                </div>
            
        
                <div class="radio-container">
                    <input type="radio" id="single" name="marry" value="single" required>
                    <label for="single">��ȥ</label>
                    <input type="radio" id="married" name="marry" value="married" required>
                    <label for="married">��ȥ</label>
                </div>
                
                <button type="submit">��ȣ�� �����ϱ�</button>
            </div>
            
            <div class="footer">

                <p>&copy; Team PlanIt. All Rights Reserved.</p>

            </div>
        </form>
    </div>

</body>

</html>
