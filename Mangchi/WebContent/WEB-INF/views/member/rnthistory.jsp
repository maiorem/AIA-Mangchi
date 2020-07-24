<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>대여 내역</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<link rel='stylesheet' href='<c:url value="/css/default.css"/>'> 
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
  </head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
				<a class="nav-link" href="${pageContext.request.contextPath}/member/reqhistory.do">요청 내역</a> 
				<a class="nav-link" href="${pageContext.request.contextPath}/member/rnthistory.do">대여 내역</a>
			</nav>
		</div>
		<h1>대여 내역</h1>
		
		<c:if test="${not empty rentalhistory}">

		<table border=1>
			<th>게시물 번호</th>
			<th>게시글 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>렌탈 기간</th>
			<th>지역</th>
			<c:forEach items="${rentalhistory}" var="rental">
				<tr>
					<td>${rental.req_idx}</td>
					<td>${rental.req_title}</td>
					<td>${rental.req_price}</td>
					<td>${rental.req_regdate}</td>
					<td>${rental.req_term}</td>
					<td>${rental.req_loc}</td> 
				</tr>
			</c:forEach>

		</table>
	</c:if>
		
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>
