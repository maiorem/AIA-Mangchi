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
				<%-- <c:if test="${choiceRequest.req_status==0}">
				</c:if> --%>
				<td id="selectHelper"></td>
				<td><input type="button" value="수행자선택" id="helper_selector">
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
				<td><img class="req_img_view" src="<c:url value="${choiceRequest.req_img}"/>"/></td>
			</tr>
		</table>
		<a href="/message/sendNote.do?id=" id="sendNoteLink">쪽지보내기</a>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document).ready(function(){
		//상태에 따라서 셀렉트를 셀렉티드로 변경
		var loginUser='${loginInfo.nick}';
		var writerUser='${choiceRequest.writer_nick}';
		var req_status =${choiceRequest.req_status};
		if(req_status==0){
			$('#selectHelper').text('(대기중)');
			$('#status_req').text('대기');
		}else if (req_status==1){
			$('#selectHelper').text('${choiceRequest.req_helper}');
			$('#status_req').text('렌탈중');
		}else if (req_status==2){
			$('#selectHelper').text('${choiceRequest.req_helper}');
			$('#status_req').text('렌탈완료');
		}
		if(loginUser!=writerUser){
			$('#helper_selector').css('display','none');
		}else{
			$('#helper_selector').css('display','block');
		}
		const action='<c:url value="/message/sendNote.do"/>';
		const req_idx = ${choiceRequest.req_idx};
		const req_writer = ${choiceRequest.req_writer};
		
		console.log('req_idx : '+req_idx);
		console.log('req_writer: '+req_writer);
		
		$('#helper_selector').on('click',function(){
			const form = document.createElement("form");
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
			window.open(action,"selecthelper",'width=400, height=600, menubar=no, status=no, toolbar=no');
			form.target="selecthelper";
			document.body.appendChild(form);
			form.submit();
		});
	});
		/* 
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
		 */
		
		/* 
		//상태 select가 변경됐을때 
		//0이면 #selectHelper ==> (대기중)
		//1이나 2면 #selectHelper ==> 헬퍼닉네임
		//1일때는 쪽지나눈 사람중 선택
		//2일때는 헬퍼에게 리뷰작성하도록 함
		$('#status_req').on('change',function(){
			console.log($(this).val());
			if($(this).val()==0){
				$('#selectHelper').html('(대기중)');
			}else if ($(this).val()==1){
				//헬퍼 닉네임적어주고
				//선택하는 화면
				$('#selectHelper').text('헬퍼1');
				
				
				$.ajax({
					url: 'statusChange.do',
					type : 'get',
					data : {status_req: z},
					success : function(data){
						console.log('데이터타입 : ');
						console.log(typeof data);
						console.log('데이터 : ');
						console.log(data);
						$('#selectHelper').html(data);
					}
				});
				//sendNote.do
			}else if ($(this).val()==2){
				//헬퍼에게 리뷰작성창
				$('#selectHelper').text('리뷰작성해주세요');
			} 
		});*/
</script>
</body>
</html>