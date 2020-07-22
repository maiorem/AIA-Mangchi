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

${param.review_idx }
${param.req_idx }
${param.review_receiver }
${param.review_writer }
${param.review_score }
${param.review_text }
${param.review_regdate }
--------------------------
<c:out value="${param.review_idx }"></c:out>
<c:out value="${param.req_idx }"></c:out>
<c:out value="${param.review_receiver }"></c:out>
<c:out value="${param.review_writer }"></c:out>
<c:out value="${param.review_score }"></c:out>
<c:out value="${param.review_text }"></c:out>
<c:out value="${param.review_regdate }"></c:out>
--------------------------
<%
out.println(request.getParameter("review_idx"));
out.println(request.getParameter("req_idx"));
out.println(request.getParameter("review_receiver"));
out.println(request.getParameter("review_writer"));
out.println(request.getParameter("review_score"));
out.println(request.getParameter("review_text"));
out.println(request.getParameter("review_regdate"));

%>
--------------------------
<% Review rs=new Review(); %>

<%= rs.getReq_idx()%>
<%= rs.getReview_idx()%>
<%= rs.getReview_receiver()%>
<%= rs.getReview_score()%>

--------------------------

</body>
</html>