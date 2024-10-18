<%--
  Created by IntelliJ IDEA.
  User: jin14
  Date: 2024-10-07
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="/css/next.css" rel="stylesheet">
    <script src="/js/next.js"/></script>
</head>
<body>
    <h1>Next Page</h1>
    <h3>Header3</h3>
    <h4>Header4</h4>
    <img src="/img/p1.jpg" alt="엔드게임" width="300" height="300">
    <ul>
        <li>사과</li>
        <li>바나나</li>
        <li>체리</li>
    </ul>

    <ol>
        <li>첫 번째 항목</li>
        <li>두 번째 항목</li>
        <li>세 번째 항목</li>
    </ol>

    <table>
        <tr>
            <th>이름</th>
            <th>나이</th>
            <th>직업</th>
        </tr>
        <tr>
            <td>홍길동</td>
            <td>30</td>
            <td>개발자</td>
        </tr>
    </table>

    <form action="/submit" method="post">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name">
        <input type="submit" value="제출">
    </form>

    <button>클릭하세요</button>

    <p id="intro" class="highlight">이것은 중요한 문장입니다.</p>

    <header>
        <h1>사이트 제목</h1>
    </header>
    <nav>
        <a href="#home">홈</a>
        <a href="#about">소개</a>
    </nav>
    <section>
        <h2>게시글 제목</h2>
        <p>게시글 내용...</p>
    </section>
    <footer>
        <p>저작권 &copy; 2024</p>
    </footer>

    <input type="email" placeholder="이메일을 입력하세요">
    <input type="date">

    <video width="400" controls>
        <source src="movie.mp4" type="video/mp4">
        브라우저가 비디오 태그를 지원하지 않습니다.
    </video>

    <audio controls>
        <source src="audio.mp3" type="audio/mpeg">
        브라우저가 오디오 태그를 지원하지 않습니다.
    </audio>

    <canvas id="myCanvas" width="200" height="100"></canvas>

    <div>
        <h1>제목입니다</h1>
        <p>이것은 블록 요소인 문단입니다.</p>
    </div>

    <p>이 문장에서 <a href="#">이 링크</a>는 인라인 요소입니다.</p>

    <p style="border: 20px dashed red;">이 문장은 검은색 테두리가 있습니다.</p>

    <p>이 문장에는 <span style="color: red;">빨간 글씨</span>가 포함되어 있습니다.</p>

    <a href="https://www.naver.com">
        <button>사이트로 이동</button>
    </a>

</body>
</html>
