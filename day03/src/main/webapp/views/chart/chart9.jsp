<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    #container {
        width: 700px;
        height: 500px;
        border: 2px solid olive;
        overflow-y: scroll;
        padding: 10px;
    }
</style>

<script>
    let chart9 = {
        init: function () {
        }
    }
    $(function () {
        chart9.init();
    });
</script>

<div class="col-sm-10">
    <h2>CHART 9 PAGE</h2>
    <div id="container">
        <ul>
            <c:forEach var="log" items="${logData}">
                <li>${fn:split(log, ':')[3].trim()}</li>
            </c:forEach>
        </ul>
    </div>
</div>