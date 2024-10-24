<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>Item List</h2>

<table class="table">
  <thead>
  <tr>
    <th>Image</th>
    <th>Id</th>
    <th>Name</th>
    <th>Price</th>
    <th>RegDate</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="item" items="${items}">
    <tr>
      <td><img src="<c:url value='/img/${item.imgname}'/>" alt="${item.name}" width="50"></td>
      <td>${item.id}</td>
      <td>${item.name}</td>
      <td>${item.price}</td>
      <td>${item.regdate}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- 페이지네이션 -->
<div class="pagination">
  <c:if test="${currentPage > 1}">
    <a href="?pageNo=${currentPage - 1}">Previous</a>
  </c:if>

  <c:forEach begin="1" end="${totalItems / itemsPerPage + 1}" var="i">
    <c:choose>
      <c:when test="${i == currentPage}">
        <strong>${i}</strong>
      </c:when>
      <c:otherwise>
        <a href="?pageNo=${i}">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>

  <c:if test="${currentPage * itemsPerPage < totalItems}">
    <a href="?pageNo=${currentPage + 1}">Next</a>
  </c:if>
</div>
