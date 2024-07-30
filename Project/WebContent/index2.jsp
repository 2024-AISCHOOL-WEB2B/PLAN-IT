<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flask-JS Example</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <input type="text" id="text">
    <button id="flaskTest">눌러봐!</button>

    <script type="text/javascript">
        $('#flaskTest').on('click', function(){
            var loc = $("#text").val();

            $.ajax({
                url: "http://192.168.20.156:8010/search",
                headers: {
                    'Accept': 'application/json;charset=UTF-8',
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                type: "get",
                data: {"loc": loc},
                dataType: "json",
                success: function(data){
                    console.log(data);
                },
                error: function(e){
                    console.log(e);
                }
            });
        });
        
        be712d0b2346430fa142e10072ba09b9
        http://192.168.20.156:5000/places.json
    </script>
</body>
</html>
