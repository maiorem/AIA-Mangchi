<%@page import="request.service.MemberReqHistoryFormServiceImpl"%>
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
<title>요청 내역</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/list.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
				<a class="nav-link" href="${pageContext.request.contextPath}/request/reqhistory.do">요청 내역</a> 
				<a class="nav-link" href="${pageContext.request.contextPath}/request/rnthistory.do">대여내역</a>
			</nav>
		</div>
		<h1>요청 내역</h1>

<%-- 		<c:if test="${not empty listView.requestList}">

		<table border=1>
			<th>게시물 번호</th>
			<th>게시글 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>렌탈 기간</th>
			<th>지역</th>
			<c:forEach items="${listView.requestList}" var="request">
				<tr>
					<td>${request.req_idx}</td>
					<td>${request.req_title}</td>
					<td>${request.req_price}</td>
					<td>${request.req_regdate}</td>
					<td>${request.req_term}</td>
					<td>${request.req_loc}</td> 
				</tr>
			</c:forEach>

		</table>
	</c:if>
		<c:if test="${listView.pageTotalCount > 0}">

		<div class="paging">
			<c:forEach begin="1" end="${listView.pageTotalCount}" var="num">
				<a href="reqhistory.do?page=${num}"
					${listView.currentPageNumber eq num? 'class="currentPage"':''}>[
					${num} ]</a>
			</c:forEach>
		</div>

	</c:if> --%>
	<c:if test="${not empty listView.requestList}">
			<c:forEach items="${listView.requestList}" var="request">
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
						</div>
					</div>
					<a href="#" class="stretched-link" id="move"></a>
				</article>
				<br>
			</c:forEach>
		</c:if>
		<c:if test="${listView.pageTotalCount > 0}">

		<div class="paging">
			<c:forEach begin="1" end="${listView.pageTotalCount}" var="num">
				<a href="reqhistory.do?page=${num}"
					${listView.currentPageNumber eq num? 'class="currentPage"':''}>[
					${num} ]</a>
			</c:forEach>
		</div>

	</c:if>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script>
/*  	$('#move').click(function(){
var test = '${listView.requestList}';
var testval = test.substr(18,2);
console.log(test);
console.log(testval); //req_idx=xx

//location.href='${pageContext.request.contextPath}/board/detailRequestInfo.do?'+testval;
});    */
 $('a').click(function(e) {

		var req_idx = $(this).children('input').val();

		var action = '${pageContext.request.contextPath}/board/detailRequestInfo.do';

		var form = $('<form></form>');
		form.attr('charset', 'utf-8');
		form.attr('method', 'post');
		form.attr('action', action);
		form.appendTo('body');

		var inputIdx = $('<input type="hidden" value="'+req_idx+'" name="req_idx">');
		form.append(inputIdx);
		form.submit();
			});   
</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
