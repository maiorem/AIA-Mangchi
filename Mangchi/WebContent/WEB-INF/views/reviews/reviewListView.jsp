<%@page import="review.dao.ReviewDao"%>
<%@page import="review.service.ReviewServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="review.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<table border="3">

<c:forEach items="${reviewList}" var="review">

	<tr>
		<td>${review}</td>
		
		</tr>
		
		
</c:forEach>

 
</table>

평점
<c:out value="${score+((score%1>0.5)?(1-(score%1))%1:-(score%1)) }"/>


<<<<<<< HEAD
<table >
	<tr>
	<%-- <td>${reviewList }</td> --%>
		<td>${review.review_idx}</td>
		<td>${review.req_idx}</td>
		<td>${review.review_writer}</td>
		
	</tr>
=======
>>>>>>> 3ef81ace8fc6825ad71f1a324972e151b01ed899

<br><br>
내가쓴리뷰들
<br>

<table border="3">
<c:forEach items="${writerList}" var="wr">
	
		<tr>
	<td>${wr}</td>
		</tr>
		
	
</c:forEach>
</table>


</body>
</html>