<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">
  <h2>Car Add Page</h2>
  <!-- 동적으로 서버에서 전달된 날짜 출력 -->
  <h5>Title description, <fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd" /></h5>
</div>
