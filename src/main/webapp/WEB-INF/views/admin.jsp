<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
</head>
<body>
	<h1>
		관리자 페이지
	</h1>
<%-- 	<c:choose> --%>
<%-- 		<when test="${ sessionScope.user.status == 1}"> --%>
<%-- 			${sessionScope.user.userName} 님 로그인햇다~~ --%>
<!-- 			<a href="logout">로그아웃</a> -->
<!-- 		</when> -->
<%-- 		<when test="${sessionScope.user.status == 0}"> --%>
<!-- 			<a href="login">로그인</a> -->
<!-- 			<a href="user">회원가입</a><br> -->
<!-- 			가입안함 -->
<!-- 		</when> -->
<!-- 		<otherwise> -->
<!-- 			<a href="login">로그인</a> -->
<!-- 			<a href="user">회원가입</a><br> -->
<!-- 		</otherwise> -->
<%-- 	</c:choose> --%>

	<c:if test="${empty sessionScope.user}">
		<a href="login">로그인</a>
	</c:if>
	<c:if test="${sessionScope.user.status == 1}" >
		${sessionScope.user.userName} 님 안녕하세요.
		<a href="logout">로그아웃</a>
		<br>
		<a href="boardM">게시글 관리</a>
		<a href="userM">사용자 관리</a>
	</c:if>
	<c:if test="${sessionScope.user.status==0}">
	<a href="login">로그인</a> 
	<a href="user">회원가입</a><br>
		가입안함
	</c:if>
	<Br>
	<a href="index">홈페이지로</a> 
	<br>
</body>
</html>
