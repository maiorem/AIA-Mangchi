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
	<br><br><br><br><br><br><br><br>
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
				<td id="selectHelper">
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
		<input type="button" value="쪽지 보내기" id="sendNote">
		<input type="button" value="렌탈완료" id="helpEnd">
		<input type="hidden">
		</div>
		
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	
	$(document).ready(function(){
		//현재 게시글을 통해 나에게 메세지 보낸 사람의 배열 
		var arr = new Array();

		//select 태그 동적생성
		var selectTag=$('<select></select>');
		selectTag.attr('name','helpers');
		selectTag.attr('id','helpers');
		$('#selectHelper').append(selectTag);
		selectTag.append('<option value="-1" id="wait">(대기중)</option>');
		<c:forEach items="${requestHelpers}" var="rh">
			arr.push({
				idx:"${rh.idx}",
				nick:"${rh.nick}"
			});
			var op= $('<option value="'+${rh.idx}+'" id="'+'${rh.nick}'+'">'+'${rh.nick}'+'</option>');
			selectTag.append(op);
		</c:forEach>
		$('#selectHelper').append('<input type="button" value="선택완료" id="helper_selector_btn">');
		
		//로그인한 사용자
		const loginIdx= ${loginInfo.idx};
		//게시글 제목(리뷰)
		const title='${choiceRequest.req_title}';
		//게시글 인덱스
		const idx = ${choiceRequest.req_idx}; 
		//게시글의 글쓴이
		const writer = ${choiceRequest.req_writer};
		//게시글의 헬퍼
		const helper = ${choiceRequest.req_helper};
		//상태표시하는 td				
		const status_td = $('#status_req');
		//헬퍼표시하는 select value
		const helperVal=$('#helpers').val();
		//헬퍼 선택 완료 버튼
		const helperSelectBtn=$('#helper_selector_btn');
		
		//상세내용 "호출"시 
		//헬퍼상태에 따라 렌탈대기 렌탈중 렌탈완료
		//호출된 글의 status 입력
		//status에 따라 렌탈완료버튼 보이기
		const helperStatus=${choiceRequest.req_status};
		if(helperStatus==0){
			status_td.text('렌탈대기');
			$('#helpEnd').hide();
		}else if(helperStatus==1){
			status_td.text('렌탈중');
			$('#helpEnd').show();
		}else if(helperStatus==2){
			status_td.text('렌탈완료');
			$('#helpEnd').hide();
			//렌탈 완료이면 셀렉트 태그 비활성화
			selectTag.attr('disabled','disabled');
		}
				
		//select태그 선택시켜놓기
		if(helperStatus!=0){
			for(var i=0;i<arr.length;i++){
				if(helper==arr[i].idx){
					$('#'+arr[i].nick).attr('selected','selected');
				}
			}
		}
		
		//로그인사용자와 해당 글의 글쓴이가 같은경우 다른경우 분기처리 
		if(loginIdx==writer){
			console.log('같은');	
			$('#sendNote').hide();
		}else{			
			console.log('다른');	
			$('#helpEnd').hide();
			selectTag.attr('disabled','disabled');
		}
		 
		//헬퍼가 바뀌면 선택완료버튼 보이기
		//헬퍼가 바뀌면 선택이 완료되기 전에는 렌탈완료버튼 숨기기
		var val = $('#helpers').val();
		helperSelectBtn.hide(); //버튼은 기본 hide
		$('#helpers').on('change',function(){
			
			$('#helpEnd').hide();
			if(val == $(this).val() ){	
				helperSelectBtn.hide();
			}else{
				helperSelectBtn.show();				
			}
		});
		
		//헬퍼 선택버튼 클릭 이벤트
		helperSelectBtn.on('click',function(){
			$.ajax({
				url: 'chooseHelper.do',
				type : 'post',
				data : {
					req_idx: idx,
					req_helper: $('#helpers').val()
					},
				success : function(data){
					if(data==1){
						alert('렌탈을 시작합니다');
						status_td.text('렌탈중');
						location.reload();
					}else if(data==0){
						alert('대기중으로 전환합니다');
						status_td.text('렌탈대기');
						location.reload();
					}
				}
			});
		});
				
		//렌탈 완료버튼클릭 이벤트
		//보낼 파라미터값 req_idx / req_title / req_helper
		$('#helpEnd').on('click',function(){
			console.log(helper);
			console.log(idx);
			console.log(title);
			var nick;
			for(var i=0;i<arr.length;i++){
				if(helper==arr[i].idx){
					nick=arr[i].nick;
				}
			}
			var action='<c:url value="/reviews/reviewForm.do"/>';
			
			var form =$('<form></form>');
			form.attr('charset','utf-8');
			form.attr('method','post');
			form.attr('action',action);
			form.appendTo('body');
			
			var inputIdx =$('<input type="hidden" value="'+idx+'" name="req_idx">');
			var inputHelper =$('<input type="hidden" value="'+helper+'" name="req_helper">');
			var inputTitle =$('<input type="hidden" value="'+title+'" name="req_title">');
			var inputNick =$('<input type="hidden" value="'+nick+'" name="helper_nick">');
			form.append(inputIdx).append(inputHelper).append(inputTitle).append(inputNick);
			form.submit();
		});
		
		//내가 쓴글, 남이 쓴 글 구분
		//로그인한 사용자와 글쓴이가 같을 때
		
		
		//쪽지 보내기
		//족지 보내기 버튼 클릭 이벤트
		//form태그 만들어서 보냄
		$('#sendNote').on('click',function(){
			var action='<c:url value="/message/sendNote.do"/>';
			
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
	});
			/* 
			console.log($('#helpers').val());
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "chooseHelper.do");
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "req_idx");
			hiddenField.setAttribute("value", ${choiceRequest.req_idx});
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "req_helper");
			hiddenField.setAttribute("value", $('#helpers').val());
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
			 */
		
	
		
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