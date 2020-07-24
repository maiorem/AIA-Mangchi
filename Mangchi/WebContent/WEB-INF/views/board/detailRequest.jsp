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
.req_img_view{
	width: 200px;
}
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
				<td>제목</td>
				<td>${choiceRequest.req_title}</td>
			</tr>
			<tr>
				<td>요청자</td>
				<td>${choiceRequest.writer_nick}</td>
			</tr>
			<tr>
				<td>수행자</td>
				<%-- <c:if test="${choiceRequest.req_status==0}">
				</c:if> --%>
				<td id="selectHelper">
					<select name="helpers" id="helpers">
						<option value=-1 id="aa">(대기중)</option>
						<c:forEach items="${requestHelpers}" var="rh">
							<option value="${rh.idx}" id="${rh.nick}">${rh.nick}</option>
						</c:forEach>
					</select>
					<input type="button" value="선택완료" id="helper_selector_btn">
				</td>
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
				<td id="status_req">
				</td>
			</tr>
			<tr>
				<td>참고이미지</td>
				<c:if test="${not empty choiceRequest.req_img}">
				<td><img class="req_img_view" src="<c:url value="${choiceRequest.req_img}"/>"/></td>
				</c:if>
				<c:if test="${empty choiceRequest.req_img}">
				<td>(사진없음)</td>
				</c:if>
			</tr>
		</table>
		<div id="button_field">
		<input type="button" value="쪽지 보내기" id="send_Note">
		</div>
		
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$('#helper_selector_btn').on('click',function(){
		//selectHelper > td
		console.log($('#helpers').val());
		$.ajax({
			url: 'chooseHelper.do',
			type : 'Post', //GET,POST,PUT,DELETE
			data : {uid: $(this).val()},
			success : function(data){
				
			}
		});
	});
	var e = '${requestHelpers}';
	
	//쪽지 보내기버튼 클릭시 파라미터값 전달
	const action='<c:url value="/message/sendNote.do"/>';
	const req_idx = ${choiceRequest.req_idx};
	const req_writer = ${choiceRequest.req_writer};
	
	console.log('req_idx : '+req_idx);
	console.log('req_writer: '+req_writer);
	
	$('#send_Note').on('click',function(){
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", action);
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "req_idx");
		hiddenField.setAttribute("value", req_idx);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "uid");
		hiddenField.setAttribute("value", req_writer);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	});
	
	$(document).ready(function(){
		var loginUser='${loginInfo.nick}';
		var writerUser='${choiceRequest.writer_nick}';
		var req_status =${choiceRequest.req_status};
		if(req_status==0){
			/* $('#selectHelper').text('(대기중)'); */
			$('#status_req').text('대기');
		}else if (req_status==1){
			/* $('#selectHelper').text('${choiceRequest.req_helper}'); */
			$('#status_req').text('렌탈중');

			const status_area= document.querySelector('#button_field');
			comp = document.createElement("input");
			comp.setAttribute("type", "button");
			comp.setAttribute("id", "compBtn");
			comp.setAttribute("value", "렌탈완료하기");
			status_area.appendChild(comp);
			
		}else if (req_status==2){
			/* $('#selectHelper').text('${choiceRequest.req_helper}'); */
			$('#status_req').text('렌탈완료');
		}
		if(loginUser!=writerUser){
			$('#send_Note').css('display','block');
		}else{
			$('#send_Note').css('display','none');
		}
		
		$('#helper_selector_btn').hide();
		
		var val = $('#aa').val();
		$('#helpers').on('change',function(){
			var changeVal = $('#${requestHelpers.nick}').val();
			
			
			if(val == changeVal ){
				
				//$('#helper_selector_btn').css('display','none');	
				$('#helper_selector_btn').hide();
			}
			$('#helper_selector_btn').show();
				
		});
		
	});
		
		/* if(status==0){
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
		} */
		
		
</script>
</body>
</html>