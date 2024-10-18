<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ajax2 = {
        init:function(){
            setInterval(()=>{this.getData();},5000); // 5초마다 서버에 데이터 요청
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getRanking"/>', // 서버의 랜덤 인기 순위 데이터를 요청
                success:(result)=>{
                    this.display(result);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching data:', error);
                }
            });
        },
        display:function(result){
            // 표의 헤더 부분을 생성
            let tableHtml = "<table class='table table-bordered'><thead><tr><th>Rank</th><th>Product Name</th></tr></thead><tbody>";

            // 서버에서 받은 데이터를 표의 행으로 변환
            result.forEach(function(rank) {
                tableHtml += "<tr><td>" + rank.rank + "위</td><td>" + rank.product + "</td></tr>";
            });

            tableHtml += "</tbody></table>"; // 테이블 종료 태그
            $('#rankings').html(tableHtml);  // 데이터를 DOM에 출력
        }
    };

    $(function(){
        ajax2.init(); // 페이지 로드 시 AJAX 호출 초기화
    });
</script>

<div class="col-sm-10">
    <h2>AJAX2 Page</h2>
    <h5>Popular Rankings (Updated every 5 seconds)</h5>
    <div id="rankings"></div> <!-- 서버에서 받은 인기 순위 데이터가 출력될 부분 -->
</div>
