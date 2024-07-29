<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>지역 선택</title>
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
            overflow: hidden;
        }
        .container {
            width: 85%; /* width를 85%로 설정 */
            max-width: 360px;
            height: 100%;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center; /* 중앙 정렬 */
            justify-content: space-between;
            overflow-y: auto;
        }
        .container img {
            width: 85%;
            height: auto;
        }
        .container p {
            margin: 10px 0 10px 0; /* 상단과 하단 여백 조정 */
            color: #333;
            font-size: 14px;
            text-align: center; /* 텍스트 중앙 정렬 */
        }
        .container .bold {
            font-weight: bold;
        }
        .container select {
            width: 85%;
            height: 40px;
            margin-bottom: 20px;
            font-size: 16px;
            padding: 5px;
        }
        .container button {
            width: 85%;
            height: 40px;
            background-color: #333;
            color: #fff;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <br>
        <br>
        
        <img src="https://mblogthumb-phinf.pstatic.net/MjAyMzA3MDRfMjc5/MDAxNjg4NDc5MzIxNTE1.Yfgbc73pBoa4ZiCYRhauaBAxEI-EwcNCxznmheNDrUsg.z66vw6kf-1H_5mJwFdMpN_lL06QHPx19W7806KozNcEg.GIF.amazonian3/%EB%AA%A9%ED%8F%AC.gif?type=w800" alt="여행 이미지">
        <p><span class="bold">플랜잇</span>을 통해 인기있는 여행지를 가장 빠르게 떠나세요.</p>
        <select id="regionSelect">
            <option value="" disabled selected>어디로 여행을 떠나시나요?</option>
            <option value="Seoul">서울</option>
            <option value="Busan">부산</option>
            <option value="Jeju">제주</option>
            <option value="Mokpo">목포</option>
            <!-- 추가 지역을 여기에 추가할 수 있습니다 -->
        </select>
        <button onclick="goToMap()">여행 시작</button>
    </div>
    <script>
        function goToMap() {
            const selectedRegion = document.getElementById('regionSelect').value;
            if (selectedRegion) {
                window.location.href = `page9.jsp?region=${selectedRegion}`;
            } else {
                alert('지역을 선택해주세요.');
            }
        }
    </script>
</body>
</html>
