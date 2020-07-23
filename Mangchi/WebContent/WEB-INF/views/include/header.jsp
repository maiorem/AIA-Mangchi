<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="<c:url value='/index.do'/>"><img src="<c:url value='/img/logo.png'/>" class="logo_img" style="width: 50px; height: 50px;" ></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value='/member/loginForm.do'/>">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/board/boarding.do'/>">대여게시판</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="<c:url value="/board/posting.do"/>">글쓰기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/message/messageBox.do"/>">쪽지함</a>
        </li>
      </ul>
      <form class="form-inline mt-2 mt-md-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
</header>