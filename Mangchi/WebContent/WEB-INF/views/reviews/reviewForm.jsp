<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>리뷰 글쓰기폼</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>


<form id="reviewForm" action="review.do"  method="post" enctype="multipart/form-data">


<table>

				<tr>
					<td>글쓴이</td>
				
				</tr>
				
				<tr>
					<td>제목</td>
					<td> <input type="text" name="review_title" id="review_title"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td> <input type="text" name="review_body" id="review_body"></td>
				</tr>
				
				<tr>
					<td>평점</td>
					<td><select name="reivew_score">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select></td>
				</tr>
				
				<tr>
					<td> <input type="submit" name="등록">	</td>
				</tr>



</table>
</form>


</body>
</html>