<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MP4와 유사한 지도 검색 기능</title>
    <style>
        #map {
            width: 600px;
            height: 500px;
            border: 2px solid darkred;
        }
        #placesList li {
            list-style: none;
            padding: 10px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }
        #menu_wrap {
            width: 300px;
            height: 500px;
            overflow-y: auto;
            border: 1px solid #ddd;
        }
        #pagination a {
            margin-right: 5px;
            text-decoration: none;
            color: #333;
        }
        #pagination .on {
            font-weight: bold;
            color: red;
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=34ef119f6c4fe255f8d934008bf8a121"></script>
</head>
<body>
<h2>MP4 Map Page</h2>
<input type="text" id="keyword" placeholder="검색할 장소">
<button onclick="searchPlaces()">검색</button>
<button id="sbtn">Seoul</button>
<button id="bbtn">Busan</button>
<button id="jbtn">Jeju</button>

<div id="map" style="width:600px;height:500px;"></div>
<div id="menu_wrap">
    <ul id="placesList"></ul>
    <div id="pagination"></div>
</div>

<script>
    var markers = [];

    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 3
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    function searchPlaces() {
        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
            displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }

    function displayPlaces(places) {
        var listEl = document.getElementById('placesList'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        removeAllChildNods(listEl);
        removeMarker();

        for (var i = 0; i < places.length; i++) {
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]);

            bounds.extend(placePosition);

            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
                itemEl.onmouseover = function() {
                    displayInfowindow(marker, title);
                };
                itemEl.onmouseout = function() {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        listEl.appendChild(fragment);
        map.setBounds(bounds);
    }

    function getListItem(index, places) {
        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' + places.address_name + '</span>';
        } else {
            itemStr += '    <span>' + places.address_name + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    function addMarker(position, idx) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
            imageSize = new kakao.maps.Size(36, 37),
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691),
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
                offset: new kakao.maps.Point(13, 37)
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position,
                image: markerImage
            });

        marker.setMap(map);
        markers.push(marker);

        return marker;
    }

    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }

    document.getElementById('sbtn').addEventListener('click', function() {
        map.setCenter(new kakao.maps.LatLng(37.566826, 126.9786567));
        map.setLevel(3);
    });

    document.getElementById('bbtn').addEventListener('click', function() {
        map.setCenter(new kakao.maps.LatLng(35.1795543, 129.0756416));
        map.setLevel(3);
    });

    document.getElementById('jbtn').addEventListener('click', function() {
        map.setCenter(new kakao.maps.LatLng(33.4996213, 126.5311884));
        map.setLevel(3);
    });
</script>
</body>
</html>
