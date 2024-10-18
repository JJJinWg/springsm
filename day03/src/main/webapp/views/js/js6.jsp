<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
    <h2>회원가입 페이지</h2>
    <form id="register_form" action="/register" method="post">
        <!-- 사용자 이름 입력 -->
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" class="form-control" placeholder="Enter first name" id="firstName" name="firstName" required>
        </div>

        <!-- 성 입력 -->
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" class="form-control" placeholder="Enter last name" id="lastName" name="lastName" required>
        </div>

        <!-- 이메일 입력 -->
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" placeholder="Enter email" id="email" name="email" required>
        </div>

        <!-- 비밀번호 입력 -->
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="password" name="password" required>
        </div>

        <!-- 비밀번호 확인 입력 -->
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" class="form-control" placeholder="Re-enter password" id="confirmPassword" name="confirmPassword" required>
        </div>

        <!-- 성별 선택 (radio 버튼) -->
        <div class="form-group">
            <label for="gender">Gender:</label><br>
            <input type="radio" id="male" name="gender" value="male" required> Male
            <input type="radio" id="female" name="gender" value="female"> Female
        </div>

        <!-- 관심 분야 선택 (checkbox) -->
        <div class="form-group">
            <label for="interests">Interests:</label><br>
            <input type="checkbox" name="interests" value="coding"> Coding
            <input type="checkbox" name="interests" value="sports"> Sports
            <input type="checkbox" name="interests" value="music"> Music
        </div>

        <!-- 국가 선택 (select) -->
        <div class="form-group">
            <label for="country">Country:</label>
            <select class="form-control" id="country" name="country">
                <option value="korea">Korea</option>
                <option value="usa">USA</option>
                <option value="japan">Japan</option>
                <option value="china">China</option>
            </select>
        </div>

        <!-- 설명 추가 (textarea) -->
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Write something about yourself..."></textarea>
        </div>

        <!-- 파일 업로드 -->
        <div class="form-group">
            <label for="profilePic">Upload Profile Picture:</label>
            <input type="file" class="form-control-file" id="profilePic" name="profilePic">
        </div>

        <!-- 제출 버튼 -->
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
