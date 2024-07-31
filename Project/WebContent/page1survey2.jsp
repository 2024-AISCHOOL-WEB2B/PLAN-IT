<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>���� ��ȣ�� ����</title>
    <style>
        html, body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 360px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            overflow-y: auto;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .question {
            margin-bottom: 20px;
            text-align: left;
        }
        .question label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .question select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container button {
            background-color: #8ab7ff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
        }
    </style>
</head>
<body>

        <% String id = request.getParameter("id");
           String pw = request.getParameter("pw");            
           String name = request.getParameter("name");            
           String birth = request.getParameter("birth");            
           String phone = request.getParameter("phone");            
           String gender = request.getParameter("gender");            
           String kf = request.getParameter("kf");            
           String marry = request.getParameter("marry");
        %>
    <div class="container">
        <h1>���� ��ȣ�� ����</h1> <!-- id="survey-form" -->
        <form  action="JoinService" method="get">
        	<input type="hidden" name="id" value="<%= id %>">
        	<input type="hidden" name="pw" value="<%= pw %>">
        	<input type="hidden" name="name" value="<%= name %>">
        	<input type="hidden" name="birth" value="<%= birth %>">
        	<input type="hidden" name="phone" value="<%= phone %>">
        	<input type="hidden" name="gender" value="<%= gender %>">
        	<input type="hidden" name="kf" value="<%= kf %>">
        	<input type="hidden" name="marry" value="<%= marry %>">
        
          <div class="question">
                <label for="q1">1. ��� ȯ���� �� ��ȣ�Ͻó���?</label>
                <select id="q1" name="q1">
                    <option value="mountain">��</option>
                    <option value="sea">�ٴ�</option>
                </select>
            </div> 
            <div class="question">
                <label for="q2">2. ��� Ȱ�� ������ ��� ���� �Դϱ�?</label>
                <select id="q2" name="q2">
                    <option value="high">���� Ȱ��(������, ����)</option>
                    <option value="medium">�߰� ���� Ȱ��</option>
                    <option value="low">������ Ȱ��(�޽�, ����)</option>
                </select>
            </div>
            <div class="question">
                <label for="q3">3. �ַ� ������ �Բ� �����Ͻó���?</label>
                <select id="q3" name="q3">
                    <option value="alone">ȥ��</option>
                    <option value="friends">ģ��</option>
                    <option value="partner">����</option>
                    <option value="family">����</option>
                </select>
            </div>
            <div class="question">
                <label for="q4">4. �ַ� ���� �ϴ� ����� �����Դϱ�?</label>
                <select id="q4" name="q4">
                    <option value="public_transport">����, ���߱���</option>
                    <option value="car">�ڵ���</option>
                </select>
            </div>
            <div class="question">
                <label for="q5">5. ���� �� �� ���� �߿��ϰ� �����ϴ� ����?</label>
                <select id="q5" name="q5">
                    <option value="cost">���</option>
                    <option value="accommodation">����</option>
                    <option value="food">����</option>
                    <option value="experiences">ü��</option>
                    <option value="relaxation">�޽�</option>
                </select>
            </div>
            <div class="button-container">
                <button type="submit">ȸ������</button>
            </div>
        </form>
    </div>
    
    <script>
       /*  document.getElementById('survey-form').addEventListener('submit', function(event) {
            // event.preventDefault();
            
            // �� ������ ����
            const formData = {
                q1: document.getElementById('q1').value,
                q2: document.getElementById('q2').value,
                q3: document.getElementById('q3').value,
                q4: document.getElementById('q4').value,
                q5: document.getElementById('q5').value
            };

            localStorage.setItem('surveyData', JSON.stringify(formData));

            alert('��ȣ���� ���������� �ݿ����Դϴ�...ing 'formData[0]);

            // location.href = 'page1sign.jsp';
        }); */
    </script>
</body>
</html>
