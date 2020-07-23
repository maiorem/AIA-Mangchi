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
<title>M A N G C H | 쪽지함</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<style>
div.wrap {
	margin: 50px;
	height: 500px;
}

div.noteBox {
	height: 100px;
	display:none;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function(){
		
		$('#reBox').click(function(){
			$('div.ReNoteArea').css('display', 'block');			
			$('div.SendNoteArea').css('display', 'none');

		});
		
		$('#seBox').click(function(){
			$('div.ReNoteArea').css('display', 'none');
			$('div.SendNoteArea').css('display', 'block');
		});
		
	});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap">

		<div class="boxarea" id="noteBoxArea">
			<button class="btn btn-outline-success my-2 my-sm-0" id="reBox" type="button">받은
				쪽지함</button>
			<button class="btn btn-outline-success my-2 my-sm-0" id="seBox" type="button">보낸
				쪽지함</button>

		</div>
		<hr>
		<div class="contentsArea">
			<div class="noteBox ReNoteArea">
				<c:if test="${noteList.messageList != null}">
					<table border="1">
						<tr>
							<th>보낸이</th>
							<th>메시지</th>
							<th>날짜</th>
							<th>답장하기</th>
							<th>삭제</th>
						</tr>
						<c:forEach items="${noteList.messageList}" var="notes">
							<c:if test="${loginInfo.member_id eq notes.msg_receiver}">
								<tr>
									<td>${notes.msg_writerId}</td>
									<td><a href="/message/noteview.do?idx=${notes.msg_idx}">${notes.msg_title}</a></td>
									<td>${notes.msg_date}</td>
									<td><a href="repMessage.do?toPerson=${notes.msg_writerId}?req=${notes.req_idx}">답장</a></td>
									<td><a href="">삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:if>

				<c:if test="${noteList.messageList==null}">

					<h3>받은 쪽지가 존재하지 않습니다.</h3>

				</c:if>
				<div class="paging">
					<c:forEach begin="1" end="${noteList.pageTotalCount}" var="num">
						<a href="messageList.do?page=${num}"
							${noteList.currentPageNumber eq num ? 'class="currentPage"' : '' }>[${num}]</a>
					</c:forEach>
				</div>

			</div>
			<div class="noteBox SendNoteArea">
				<c:if test="${noteList.messageList != null}">
					<table border="1">
						<tr>
							<th>받는이</th>
							<th>메시지</th>
							<th>날짜</th>
							<th>읽음여부</th>
							<th>삭제</th>
						</tr>
						<c:forEach items="${noteList.messageList}" var="notes">
							<c:if test="${loginInfo.member_idx eq notes.msg_writer}">
								<tr>
									<td>${notes.msg_receiverId}</td>
									<td><a href="/message/noteview.do?idx=${notes.msg_idx}">${notes.msg_title}</a></td>
									<td>${notes.msg_date}</td>
									<td>${notes.readcheck}</td>
									<td><a href="">삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:if>

				<c:if test="${noteList.messageList==null}">

					<h3>보낸 쪽지가 존재하지 않습니다.</h3>

				</c:if>
				<div class="paging">
					<c:forEach begin="1" end="${noteList.pageTotalCount}" var="num">
						<a href="messageList.do?page=${num}"
							${noteList.currentPageNumber eq num ? 'class="currentPage"' : '' }>[${num}]</a>
					</c:forEach>
				</div>
			
			
			
			</div>
		</div>
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
