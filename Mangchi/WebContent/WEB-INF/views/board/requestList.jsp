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
<title>대여 요청 게시판</title>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link href='<c:url value="/css/map.css"/>' rel="stylesheet">



</head>


<body>

<!-- <div id="map" style="width: 100%; height: 350px; "></div> -->
<div id="map" style="width: 100%; height: 350px; display: none;"></div>



	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	
	
	<br>
	<br>
	<br>
	<h1>게시판 들어갈 자리</h1>
	
	
	

	<c:if test="${empty requestWritingList}">
		<h1>게시물 없음</h1>
	</c:if>

	<table border="1" id="tab">
		<tr>
			<th>작성자 이름</th>
			<th>게시물 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>렌탈 기간</th>
			<th>지역</th>
			<th>상세내용</th>
			<th>조회수</th>
			<th>현재 상태</th>
			<th>이미지?</th>
			<th>나와 사용자 사이의 거리</th>
		</tr>

		<c:forEach var="requestList"
			items="${requestWritingList.requestWriting}">
			 <tbody id='tbd'>
			
			<tr >
				<td>${requestList.req_writer}</td>
				<td><a
					href=" <c:url value="/board/detailrequestinfo.do?req_idx=${requestList.req_idx}"/>">${requestList.req_title}</a></td>
				<td>${requestList.req_price}</td>
				<td>${requestList.req_regdate}</td>
				<td>${requestList.req_term}</td>
				<td>${requestList.req_loc}</td>
				<td>${requestList.req_text}</td>
				<td>${requestList.req_readcnt}</td>
				<td>${requestList.req_status}</td>
				<td>${requestList.req_img}</td>
			</tr>
			
			</tbody>
		</c:forEach>

	</table>

	
	<div class="paging">
		<c:if test="${requestWritingList.pageTotalCount > 0}">
			<c:forEach begin="1" end="${requestWritingList.pageTotalCount}"
				var="num">
				<a href=" <c:url value="/board/boarding.do?page=${num}" />"<%-- class="${requuestWrtingList.currentPageNumber eq num ? 'currentPage' : ''}" --%>
					>[${num}]</a>
			</c:forEach>
		</c:if>
	</div>
	
	
	<!-- <p id="result" style="display: none;"></p> -->
	<p id="result"></p>
	<script>
	
	var userAddr= '${loginInfo.addr}';
	var locationList = new Array();

	<c:forEach var="requestList" items="${requestWritingList.requestWriting}">
	locationList.push("${requestList.req_loc}");

	</c:forEach>
</script>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8&libraries=services"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8"></script>
	<script src="<c:url value="/js/map.js" />"></script>
	
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
