<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>카카오 경로 정보</title>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
            overflow: hidden;
        }
        .container {
            width: 360px;
            height: 740px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }
        #map {
            width: 100%;
            height: 400px;
            margin-top: 30px;
            flex-shrink: 0;
        }
        .content {
            width: 100%;
            padding: 5px;
            overflow-y: auto;
        }
        .custom-overlay {
            font-weight: bold;
            font-size: 16px;
            color: black;
            transform: translateY(-7px);
        }
        .place-button-container {
            position: relative;
            width: 100%;
        }
        .place-button {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            background-color: #8ab7ff;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: left;
            font-size: 16px;
            font-weight: bold;
        }
        .place-button span {
            font-size: 8pt;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 0 10px;
        }
        .reinitialize-button {
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 100%;
        }
        .dropdown-menu a {
            display: block;
            padding: 10px;
            color: black;
            text-decoration: none;
        }
        .dropdown-menu a:hover {
            background-color: #f0f0f0;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be712d0b2346430fa142e10072ba09b9"></script>
</head>
<body>
    <div class="container">
        <div id="map"></div>
        <div class="content">
            <div class="header">
                <h1>플랜잇 여행 일정</h1>
                <button class="reinitialize-button" onclick="reinitializeData()">일정 재생성</button>
            </div>
            <div id="places"></div>
        </div>
    </div>

    <script>
        let map;
        let markers = [];
        let places = {};
        let allPlaces = {};

        function initMap(locations, directions) {
            if (!locations || !Array.isArray(locations) || locations.length === 0) {
                console.error('유효하지 않은 장소 데이터:', locations);
                alert('유효하지 않은 장소 데이터입니다.');
                return;
            }

            if (!directions || !Array.isArray(directions) || directions.length === 0) {
                console.error('유효하지 않은 경로 데이터:', directions);
                alert('유효하지 않은 경로 데이터입니다.');
                return;
            }

            places.locations = locations;

            const firstLocation = locations[0];
            const mapContainer = document.getElementById('map');
            const mapOption = {
                center: new kakao.maps.LatLng(firstLocation.latitude, firstLocation.longitude),
                level: 9
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            markers.forEach(marker => marker.setMap(null));
            markers = [];

            let placesHtml = '';
            let bounds = new kakao.maps.LatLngBounds();
            const infoWindow = new kakao.maps.InfoWindow({ zIndex: 1 });

            locations.forEach(function(location, index) {
                placesHtml += '<div class="place-button-container">' +
                    '<button class="place-button" onclick="toggleDropdown(' + index + ')">' +
                    (index + 1) + ': ' + location.name + ' <br><span>(' + location.Address + '<span> / </span>' + location.Category + ')</span>' +
                    '</button>' +
                    '<div class="dropdown-menu" id="dropdown-' + index + '">' +
                    '<a href="#" onclick="showPlaceOptions(' + index + ', \'' + location.Category + '\')">장소 변경</a>' +
                    '</div>' +
                    '</div>';
                const markerPosition = new kakao.maps.LatLng(location.latitude, location.longitude);

                const marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title: location.name
                });

                markers.push(marker);

                const content = '<div class="custom-overlay">' + (index + 1) + '</div>';
                const customOverlay = new kakao.maps.CustomOverlay({
                    map: map,
                    position: markerPosition,
                    content: content,
                    yAnchor: 1.5
                });

                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    infoWindow.setContent('<div style="padding:5px;font-size:12px;">' + '<b>'+ location.name +'</b>' + '<br>' + location.Address + '</div>');
                    infoWindow.open(map, marker);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infoWindow.close();
                });

                bounds.extend(markerPosition);
            });
            document.getElementById('places').innerHTML = placesHtml;

            directions.forEach(function(direction, i) {
                if (direction.routes && direction.routes.length > 0) {
                    const sections = direction.routes[0].sections;
                    sections.forEach(function(section) {
                        const path = [];
                        section.roads.forEach(function(road) {
                            for (let j = 0; j < road.vertexes.length; j += 2) {
                                path.push(new kakao.maps.LatLng(road.vertexes[j + 1], road.vertexes[j]));
                            }
                        });

                        const polyline = new kakao.maps.Polyline({
                            map: map,
                            path: path,
                            strokeColor: i % 2 === 0 ? '#FF0000' : '#0000FF',
                            strokeWeight: 5,
                            strokeOpacity: 0.7,
                            strokeStyle: 'solid'
                        });

                        path.forEach(function(point) {
                            bounds.extend(point);
                        });
                    });
                } else {
                    console.error('경로를 찾을 수 없습니다: ', direction);
                }
            });

            map.setBounds(bounds);
        }

        function toggleDropdown(index) {
            const dropdown = document.getElementById('dropdown-' + index);
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        }

        function showPlaceOptions(index, category) {
            const categoryPlaces = allPlaces[category];
            let dropdownHtml = '';
            categoryPlaces.forEach(function(place) {
                dropdownHtml += '<a href="#" onclick="updatePlace(' + index + ', \'' + place.name + '\', ' + place.latitude + ', ' + place.longitude + ', \'' + place.Address + '\')">' + place.name + '</a>';
            });

            const dropdown = document.getElementById('dropdown-' + index);
            dropdown.innerHTML = dropdownHtml;
            dropdown.style.display = 'block';
        }

        function updatePlace(index, name, latitude, longitude, address) {
            places.locations[index] = {
                "name": name,
                "latitude": latitude,
                "longitude": longitude,
                "Address": address,
                "Category": places.locations[index].Category
            };

            updateMap();
        }

        function updateMap() {
            const locations = places.locations;
            let directions = [];
            const REST_API_KEY = "ee5fb980226afa1ab1e4e36e16465ad7";

            for (let i = 0; i < locations.length - 1; i++) {
                const origin = [locations[i].longitude, locations[i].latitude];
                const destination = [locations[i + 1].longitude, locations[i + 1].latitude];
                $.ajax({
                    url: "https://apis-navi.kakaomobility.com/v1/directions",
                    headers: {
                        "Authorization": `KakaoAK ${REST_API_KEY}`,
                        "Content-Type": "application/json"
                    },
                    data: {
                        "origin": `${origin[0]},${origin[1]}`,
                        "destination": `${destination[0]},${destination[1]}`,
                        "priority": "TIME"
                    },
                    async: false,
                    success: function(result) {
                        directions.push(result);
                    },
                    error: function(xhr) {
                        console.error('경로를 찾을 수 없습니다.', xhr.status, xhr.statusText);
                    }
                });
            }

            initMap(locations, directions);
        }

        function reinitializeData() {
            $.ajax({
                url: 'http://192.168.20.111:5000/reinitialize',
                headers: {
                    'Accept': 'application/json;charset=UTF-8',
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                type: 'POST',
                dataType: 'json',
                success: function(response){
                    if (response.places && response.directions) {
                        initMap(response.places.locations, response.directions);
                    } else {
                        console.error('응답 데이터에 문제가 있습니다: ', response);
                        alert('서버로부터 유효한 데이터를 받지 못했습니다.');
                    }
                },
                error: function(e){
                    console.log(e);
                    alert('데이터를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        $(document).ready(function(){
            $.ajax({
                url: 'http://192.168.20.111:5000/search',
                headers: {
                    'Accept': 'application/json;charset=UTF-8',
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                type: 'GET',
                data: {'loc': 'some_location'},
                dataType: 'json',
                success: function(response){
                    if (response.places && response.directions) {
                        places = response.places;
                        allPlaces = response.all_places;
                        initMap(response.places.locations, response.directions);
                    } else {
                        console.error('응답 데이터에 문제가 있습니다: ', response);
                        alert('서버로부터 유효한 데이터를 받지 못했습니다.');
                    }
                },
                error: function(e){
                    console.log(e);
                    alert('데이터를 불러오는 중 오류가 발생했습니다.');
                }
            });
        });
    </script>
</body>
</html>
