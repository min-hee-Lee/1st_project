<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand" style="background-color: #e3f2fd;">


	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" class="nav-link" href="${pageContext.request.contextPath}/home.do">
			
			<!-- 이미지가 홈에서는 깨져서 path를 사용해서 경로를 맞춰줌 -->
			<img src="${contextPath}/resources/images/logo2.png" width="150px" height="60px"></a>
		</div>
	</div>

	<div>
		<ul class="navbar-nav mr-auto">
		<c:choose>
			<c:when test="${sessionScope.authInfo == null}">
			
			<!-- 여행 테마 -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/easyuser/login.do">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/easyuser/signup.do">회원가입</a></li>
			</c:when>
			
			<c:otherwise>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/easyuser/logout.do">${sessionScope.authInfo.easyuser_name}님 로그아웃</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/easyuser/editmember.do">마이페이지</a></li>
			
			</c:otherwise>
		</c:choose>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user.do">공지사항</a></li>
		</ul>
	</div>

</nav>