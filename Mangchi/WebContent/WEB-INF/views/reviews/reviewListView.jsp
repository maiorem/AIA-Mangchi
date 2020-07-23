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

<table >
	<tr>
	<%-- <td>${reviewList }</td> --%>
		<td>${review.review_idx}</td>
		<td>${review.req_idx}</td>
		<td>${review.review_writer}</td>
		
	</tr>


</table>




</body>
</html>