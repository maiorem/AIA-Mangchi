<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<title>M A N G C H | 우리 동네 대여 서비스</title>
<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<style>
.write_result{
	margin-top: 150px;
}
.req_img_view{
	width : 200px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<main>
		<div class="write_result">
		<table border="1">
			<tr>
				<td>idx</td>
				<td>${currentWriting.req_idx}</td>
			</tr>
			<tr>
				<td>요청자</td>
				<td>${currentWriting.writer_nick}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${currentWriting.req_title}</td>
			</tr>
			<tr>
				<td>수행자</td>
			<c:if test="${currentWriting.req_helper==0}">
				<td>(대기중)</td>
			</c:if>
			</tr>
			<tr>
				<td>가격</td>
				<td>${currentWriting.req_price}</td>
			</tr>
			<tr>
				<td>등록일시</td>
				<td>${currentWriting.req_regdate}</td>
			</tr>
			<tr>
				<td>반납일시</td>
				<td>${currentWriting.req_term}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${currentWriting.req_loc}</td>
			</tr>
			<tr>
				<td>상세</td>
				<td>${currentWriting.req_text}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${currentWriting.req_readcnt}</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>
				<select>
				
				</select>
				</td>
			</tr>
			<tr>
				<td>참고이미지</td>
				<td><img class="req_img_view" src="<c:url value="${currentWriting.req_img}"/>"/></td>
			</tr>
		</table>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>