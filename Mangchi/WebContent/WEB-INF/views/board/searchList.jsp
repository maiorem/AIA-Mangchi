<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>서치 게시판</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/list.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.blue-orange.min.css">
<!-- Material Design icon font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<br>
		<h1>서치</h1>

		<%-- 		<c:if test="${not empty searchView.requestList}">
		<table border=1>
			<th>게시물 번호</th>
			<th>작성자</th>
			<th>게시글 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>렌탈 기간</th>
			<th>지역</th>
			<c:forEach items="${searchView.requestList}" var="request">
				<tr>
					<td>${request.req_idx}</td>
					<td>${request.req_writer}</td>
					<td>${request.req_title}</td>
					<td>${request.req_price}</td>
					<td>${request.req_regdate}</td>
					<td>${request.req_term}</td>
					<td>${request.req_loc}</td> 
				</tr>
			</c:forEach>

		</table>
	</c:if>
		<c:if test="${searchView.pageTotalCount > 0}">

		<div class="paging">
			<c:forEach begin="1" end="${searchView.pageTotalCount}" var="num">
				<a href="searchrequest.do?page=${num}&Search=${sch}"
					${searchView.currentPageNumber eq num? 'class="currentPage"':''}>[
					${num} ]</a>
			</c:forEach>
		</div>

	</c:if> --%>
		<c:if test="${not empty searchView.requestList}">
			<c:forEach items="${searchView.requestList}" var="request">
				<article class="horizontal card">

					<div class="card__content">
						<div class="card__title">
							<p id="p1">게시물 번호 : ${request.req_idx} 요청자 :
								${request.member_nick} 게시물 제목 : ${request.req_title}</p>
						</div>
						<div class="card__date">${request.req_regdate}&middot;
							<span class="card__time-to-read">${request.req_price}</span>
						</div>
						<div class="card__excerpt">
							<p id="p2">게시물 대여 기간 : ${request.req_term} 게시물 지역 :
								${request.req_loc}</p>
						</div>
						<div class="card__tags">

							<a href="#" class="stretched-link"></a>
						</div>
					</div>
				</article>
				<br>
			</c:forEach>
		</c:if>
		<c:if test="${searchView.pageTotalCount > 0}">

		<div class="paging">
			<c:forEach begin="1" end="${searchView.pageTotalCount}" var="num">
				<a href="searchrequest.do?page=${num}&Search=${sch}"
					${searchView.currentPageNumber eq num? 'class="currentPage"':''}>[
					${num} ]</a>
			</c:forEach>
		</div>

	</c:if>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
