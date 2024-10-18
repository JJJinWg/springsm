<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-10">
  <h2>남자/여자 월별 매출 차트 (5초마다 랜덤 데이터 갱신)</h2>

  <!-- 연도와 성별을 선택하는 form -->
  <form id="salesForm">
    <label for="year">연도 선택:</label>
    <select id="year" name="year">
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023">2023</option>
      <option value="2024">2024</option>
    </select>

    <button type="button" onclick="fetchRandomData()">차트 업데이트</button>
  </form>

  <div id="container" style="width: 100%; height: 400px;"></div>
</div>

<script>
  var chart;

  // 차트를 생성하고 랜덤 데이터를 갱신하는 함수// 차트를 생성하고 랜덤 데이터를 갱신하는 함수
  function createChart() {
    chart = Highcharts.chart('container', {
      chart: {
        type: 'area'
      },
      title: {
        text: '남자/여자 월별 매출'
      },
      subtitle: {
        text: '5초마다 랜덤 데이터로 갱신됩니다.'
      },
      xAxis: {
        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        tickmarkPlacement: 'on',
        title: {
          text: '월'
        }
      },
      yAxis: {
        title: {
          text: '매출 금액 (단위: 만 원)'
        }
      },
      tooltip: {
        split: true,
        valueSuffix: ' 만 원'
      },
      plotOptions: {
        area: {
          stacking: null,  // 누적을 해제하여 각 데이터가 독립적으로 표시되게 합니다.
          lineColor: '#666666',
          lineWidth: 1,
          marker: {
            lineWidth: 1,
            lineColor: '#666666'
          }
        }
      },
      series: [{
        name: '남자',
        data: generateRandomSalesData()  // 남자 데이터 초기화
      }, {
        name: '여자',
        data: generateRandomSalesData()  // 여자 데이터 초기화
      }]
    });

    // 5초마다 랜덤 데이터로 갱신
    setInterval(function() {
      updateRandomData();
    }, 5000);  // 5000ms = 5초
  }


  // 차트를 랜덤 데이터로 업데이트하는 함수
  function updateRandomData() {
    var maleRandomData = generateRandomSalesData();
    var femaleRandomData = generateRandomSalesData();

    chart.series[0].setData(maleRandomData);  // 남자 데이터 업데이트
    chart.series[1].setData(femaleRandomData);  // 여자 데이터 업데이트
  }

  // 랜덤 데이터를 생성하는 함수
  function generateRandomSalesData() {
    var data = [];
    for (var i = 0; i < 12; i++) {
      data.push(Math.floor(Math.random() * 100) + 50);  // 50~150 사이의 랜덤 값
    }
    return data;
  }

  // 페이지가 로드되었을 때 처음 랜덤 데이터를 적용하여 차트를 생성
  $(document).ready(function() {
    createChart();  // 처음부터 랜덤 데이터를 사용한 차트 생성
  });

  // 사용자가 연도를 선택하고 버튼을 클릭하면 랜덤 데이터를 적용하는 함수
  function fetchRandomData() {
    var selectedYear = $('#year').val();  // 선택한 연도
    updateRandomData();  // 차트를 랜덤 데이터로 업데이트
  }
</script>

