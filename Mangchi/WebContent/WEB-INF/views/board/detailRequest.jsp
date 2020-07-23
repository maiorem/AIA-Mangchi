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
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br><br><br><br><br><br><br>
	<main>
		<div class="write_result">
		<table border="1">
			<tr>
				<td>idx</td>
				<td>${choiceRequest.req_idx}</td>
			</tr>
			<tr>
				<td>요청자</td>
				<td>${choiceRequest.writer_nick}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${choiceRequest.req_title}</td>
			</tr>
			<tr>
				<td>수행자</td>
			<c:if test="${choiceRequest.req_status==0}">
				<td>(대기중)</td>
			</c:if>
			<c:if test="${choiceRequest.req_status>0}">
				<td>${choiceRequest.req_helper}</td>
			</c:if>
			</tr>
			<tr>
				<td>가격</td>
				<td>${choiceRequest.req_price}</td>
			</tr>
			<tr>
				<td>등록일시</td>
				<td>${choiceRequest.req_regdate}</td>
			</tr>
			<tr>
				<td>반납일시</td>
				<td>${choiceRequest.req_term}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${choiceRequest.req_loc}</td>
			</tr>
			<tr>
				<td>상세</td>
				<td>${choiceRequest.req_text}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${choiceRequest.req_readcnt}</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>
				<select name="status_req">
					<option value="0" id="zero">0</option>
					<option value="1" id="one">1</option>
					<option value="2" id="two" selected="selected">2</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>참고이미지</td>
				<td><img class="req_img_view" src="<c:url value="${choiceRequest.req_img}"/>"/></td>
			</tr>
		</table>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document).ready(function(){
		var status=${choiceRequest.req_status};
		
		if(status==0){
			$('select #zero').attr('selected','selected');
			$('select #one').removeAttr('selected');
			$('select #two').removeAttr('selected');
		}
		if(status==1){
			$('select #zero').removeAttr('selected');
			$('select #one').attr('selected','selected');
			$('select #two').removeAttr('selected');
		}
		if(status==2){
			$('select #zero').removeAttr('selected');
			$('select #one').removeAttr('selected');
			$('select #two').attr('selected','selected');
		}
		
	})
</script>
</body>
</html>