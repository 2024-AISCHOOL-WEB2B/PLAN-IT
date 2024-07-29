<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
</head>
<body>
	
	<script>
		$.ajax({
			method: "GET",
			url: "http://127.0.0.1:8080/plus",
			data:{ x: "2", y: "3"}
		})
			.done(function(msg){
				alert("Data Saved: "+msg.result)
			})
		
	</script>
</body>
</html>
