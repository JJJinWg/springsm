<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="item-detail">
  <h2>${item.name}</h2>
  <img src="<c:url value='/img/${item.imgname}'/>" alt="${item.name}">
  <p>Price: <fmt:formatNumber value="${item.price}" pattern="###,###원" /></p>
  <p>RegDate: <fmt:formatDate value="${item.regdate}" pattern="yyyy년 MM월 dd일" /></p>

  <form action="${pageContext.request.contextPath}/cart/add" method="post">
    <input type="hidden" name="itemId" value="${item.id}">
    <button type="submit">Add to Cart</button>
  </form>
</div>
