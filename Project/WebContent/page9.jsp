<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
            height: 500px; /* 지도 높이 설정 */
            margin-top: 30px; /* 상단 마진 추가 */
            flex-shrink: 0;
        }
        .content {
            width: 100%;
            padding: 20px;
            overflow-y: auto;
            
        }
        .custom-overlay {
            font-weight: bold;
            font-size: 16px;
            color: black;
            transform: translateY(-7px); /* 마커 숫자를 위로 이동 */
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be712d0b2346430fa142e10072ba09b9"></script>
</head>
<body>
    <div class="container">
        <div id="map"></div>
        <div class="content">
            <h1>플랜잇 여행 일정</h1>
            <div id="places"></div>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>

    <script>
        let map;

        function initMap() {
            const mapContainer = document.getElementById('map');
            const mapOption = {
                center: new kakao.maps.LatLng(37.5665, 126.9780),
                level: 13
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            fetch('places.json')
                .then(response => response.json())
                .then(data => {
                    const locations = data.locations;

                    // 장소 정보 표시
                    let placesHtml = '';
                    locations.forEach((location, index) => {
                        placesHtml += `<p>${index + 1}: ${location.name} (${location.latitude}, ${location.longitude})</p>`;
                        const markerPosition = new kakao.maps.LatLng(location.latitude, location.longitude);

                        // 마커 생성
                        const marker = new kakao.maps.Marker({
                            map: map,
                            position: markerPosition,
                            title: location.name
                        });

                        // 번호 표시 커스텀 오버레이 생성
                        const content = `<div class="custom-overlay">${index + 1}</div>`;
                        const customOverlay = new kakao.maps.CustomOverlay({
                            map: map,
                            position: markerPosition,
                            content: content,
                            yAnchor: 1.5
                        });
                    });
                    document.getElementById('places').innerHTML = placesHtml;

                    // 경로 정보 가져오기
                    let allPaths = [];
                    let promises = [];
                    for (let i = 1; i < locations.length; i++) {
                        promises.push(
                            fetch(`directions${i}.json`)
                                .then(response => response.json())
                                .then(data => {
                                    if (data.routes && data.routes.length > 0) {
                                        const sections = data.routes[0].sections;
                                        let linePath = [];
                                        sections.forEach(section => {
                                            section.roads.forEach(road => {
                                                for (let j = 0; j < road.vertexes.length; j += 2) {
                                                    linePath.push(new kakao.maps.LatLng(road.vertexes[j + 1], road.vertexes[j]));
                                                }
                                            });
                                        });
                                        allPaths.push(linePath);
                                    } else {
                                        alert(`경로를 찾을 수 없습니다: ${i}번째 경로`);
                                    }
                                })
                                .catch(error => console.error(`Error: ${i}번째 경로`, error))
                        );
                    }

                    Promise.all(promises).then(() => {
                        allPaths.forEach((linePath, index) => {
                            new kakao.maps.Polyline({
                                map: map,
                                path: linePath,
                                strokeColor: index % 2 === 0 ? '#FF0000' : '#0000FF',
                                strokeWeight: 5,
                                strokeOpacity: 0.7,
                                strokeStyle: 'solid'
                            });

                            // 지도 범위 설정
                            const bounds = new kakao.maps.LatLngBounds();
                            linePath.forEach(point => bounds.extend(point));
                            map.setBounds(bounds);
                        });
                    });
                });
        }

        window.onload = initMap;
    </script>
</body>
</html>
    