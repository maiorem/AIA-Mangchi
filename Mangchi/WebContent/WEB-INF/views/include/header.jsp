<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <header>
  <nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: #d9e1e8;">
    <a class="navbar-brand" href="<c:url value='/index.do'/>"><img src="<c:url value='/img/logo11.png'/>" class="logo_img" style="width: 100px; height: 50px;" ></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
      <c:if test="${empty loginInfo}">
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value='/member/loginForm.do'/>">LOGIN</a>
        </li>
       </c:if>
       <c:if test="${not empty loginInfo}">
        <li class="nav-item active">
          <a class="nav-link" id="logout" href="<c:url value='/member/logout.do'/>">LOGOUT</a>
          
        </li>
       </c:if>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/board/boarding.do'/>">BOARD</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="<c:url value="/board/posting.do"/>">WRITING</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/message/messageBox.do"/>">MESSAGE BOX</a>
        </li>
        <c:if test="${not empty loginInfo}">
        <li class="nav-item"><a class="nav-link"
					href="<c:url value='/member/mypage.do'/>">MY PAGE</a></li>
		</c:if>
      </ul>
      <form class="form-inline mt-2 mt-md-0"
				action="${pageContext.request.contextPath}/board/searchrequest.do"
				method="get" >
				<input class="form-control mr-sm-2" type="text" name="Search" 
					placeholder="Search" aria-label="SEARCH">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">SEARCH</button>
			</form>
    </div>
  </nav>
</header>
