<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:if test="${note!=null}">
		<script>
			alert('성공적으로 메시지를 보냈습니다.');
		</script>
		<c:redirect url="/index.do"/>

	</c:if>
	<c:if test="${note==null }">
		<script>
			alert('메시지 보내기에 실패하였습니다.');
		</script>
		<c:redirect url="/message/messageBox.do"/>
	</c:if>

</body>
</html>