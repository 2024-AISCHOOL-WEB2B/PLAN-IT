<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>선택한 날짜</title>
</head>
<body>
    <h2>선택한 날짜</h2>
    <p>선택한 날짜: <%= request.getParameter("selectedDate") %></p>
    <p>다음 날: <%= request.getParameter("nextSelectedDate") %></p>
</body>
</html>
